# 프로젝트 작업 제한 Hooks

## 적용 파일

- Claude Code 프로젝트 설정: [`.claude/settings.json`](../.claude/settings.json)
- PreToolUse 검사 스크립트: [`.claude/hooks/project-guard.ps1`](../.claude/hooks/project-guard.ps1)

Claude Code는 `PreToolUse` 시점에 스크립트를 실행해 허용/차단 결정을 받습니다. 최초 사용 시 프로젝트 신뢰 및 로컬 설정 적용 여부를 Claude Code에서 확인해야 할 수 있습니다.

## 정책

| 작업 | 정책 |
|---|---|
| 파일 읽기/검색 | 허용 |
| `Write`, `Edit`, `MultiEdit`, `NotebookEdit` | `output/` 또는 `.claude/` 대상만 허용 |
| `context/`, `template/` 및 기타 프로젝트 파일 수정 | 차단 |
| Bash/PowerShell의 명시적 파일 쓰기 | 명령에 `output/` 또는 `.claude/` 대상이 드러날 때만 허용 |
| `context/` 또는 `template/`를 대상으로 하는 셸 쓰기 | 차단 |
| `rm`, `Remove-Item`, `del`, `rmdir`, `git reset`, `git clean`, `git checkout` 등 감지된 파괴 명령 | 차단 |

`.claude/` 허용은 훅 설정을 설치·유지하기 위한 운영 예외입니다. 사용자가 요청한 최종 문서, 디자인 자료 등은 계속 `output/`에 저장합니다.

## 중요 제한

이 스크립트는 Claude Code 도구 호출에 적용되는 프로젝트 가드레일이며 Windows 파일시스템 샌드박스가 아닙니다. 셸 스크립트나 임의 프로그램 내부의 파일 변경 등 명령 문자열만으로 판별할 수 없는 동작을 완전히 차단한다고 보장하지 않습니다. 중요한 원본은 별도 백업과 플랫폼 권한 설정으로 보호하고, 위험한 변경 전에는 사용자 승인을 받습니다.

## 변경/해제 방법

정책 변경은 `.claude/settings.json`의 `PreToolUse` 설정과 `project-guard.ps1` 검사 규칙을 함께 검토해 적용합니다. 훅을 해제하려면 해당 프로젝트 설정에서 `PreToolUse` 항목을 비활성화하거나 제거합니다. 설정 변경 후 새 Claude Code 세션에서 실제 차단 동작을 확인합니다.

