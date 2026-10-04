$ErrorActionPreference = "Stop"

function Deny-ToolCall {
    param([string]$Reason)

    @{
        hookSpecificOutput = @{
            hookEventName = "PreToolUse"
            permissionDecision = "deny"
            permissionDecisionReason = $Reason
        }
    } | ConvertTo-Json -Depth 5 -Compress
    exit 0
}

try {
    $rawInput = [Console]::In.ReadToEnd()
    $event = $rawInput | ConvertFrom-Json
} catch {
    Deny-ToolCall "Project guard could not parse the hook input; the tool call was blocked."
}

$projectRoot = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($projectRoot)) {
    $projectRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
}
$projectRoot = [System.IO.Path]::GetFullPath($projectRoot).TrimEnd('\')
$toolName = [string]$event.tool_name
$toolInput = $event.tool_input

if ($toolName -in @("Write", "Edit", "MultiEdit", "NotebookEdit")) {
    $pathKeys = @("file_path", "notebook_path", "path")
    $targetPaths = @()
    foreach ($key in $pathKeys) {
        $property = $toolInput.PSObject.Properties[$key]
        if ($null -ne $property -and -not [string]::IsNullOrWhiteSpace([string]$property.Value)) {
            $targetPaths += [string]$property.Value
        }
    }

    if ($targetPaths.Count -eq 0) {
        Deny-ToolCall "Project guard could not identify the target file. Write operations must target output/, .claude/, or the root GitHub Pages entrypoint."
    }

    foreach ($target in $targetPaths) {
        if ([System.IO.Path]::IsPathRooted($target)) {
            $fullTarget = [System.IO.Path]::GetFullPath($target)
        } else {
            $fullTarget = [System.IO.Path]::GetFullPath((Join-Path $projectRoot $target))
        }

        $inOutput = $fullTarget.StartsWith(
            (Join-Path $projectRoot "output\"),
            [System.StringComparison]::OrdinalIgnoreCase
        ) -or $fullTarget.Equals(
            (Join-Path $projectRoot "output"),
            [System.StringComparison]::OrdinalIgnoreCase
        )
        $inClaudeConfig = $fullTarget.StartsWith(
            (Join-Path $projectRoot ".claude\"),
            [System.StringComparison]::OrdinalIgnoreCase
        )
        $isPagesEntrypoint = $fullTarget.Equals(
            (Join-Path $projectRoot "index.html"),
            [System.StringComparison]::OrdinalIgnoreCase
        )

        if (-not ($inOutput -or $inClaudeConfig -or $isPagesEntrypoint)) {
            Deny-ToolCall "Project guard blocked a write outside output/, .claude/, and the root GitHub Pages entrypoint. Source folders and project files are read-only."
        }
    }
}

if ($toolName -in @("Bash", "PowerShell")) {
    $command = [string]$toolInput.command
    if ([string]::IsNullOrWhiteSpace($command)) {
        Deny-ToolCall "Project guard could not inspect the shell command."
    }

    $destructivePattern = '(?i)\b(Remove-Item|rm|rmdir|rd|del|erase|git\s+(reset|clean|checkout|restore)|format)\b'
    if ($command -match $destructivePattern) {
        Deny-ToolCall "Project guard blocked a destructive shell command. Use a non-destructive alternative or ask the user."
    }

    $writePattern = '(?i)\b(Set-Content|Add-Content|Out-File|New-Item|Copy-Item|Move-Item|Clear-Content|touch|mkdir|tee)\b|(^|[;&|]\s*)(copy|move|md)\s|(^|[^<])>{1,2}\s*\S'
    if ($command -match $writePattern) {
        if ($command -match '(?i)(^|[\s''"=\\/])context([\\/]|$)|(^|[\s''"=\\/])template([\\/]|$)') {
            Deny-ToolCall "Project guard blocked a shell write that references context/ or template/."
        }

        if ($command -notmatch '(?i)(^|[\s''"=\\/])output[\\/]|(^|[\s''"=\\/])\.claude[\\/]') {
            Deny-ToolCall "Project guard blocked a shell write without an explicit output/ or .claude/ destination."
        }
    }
}

exit 0
