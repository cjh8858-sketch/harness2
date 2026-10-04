# Project Instructions

## Start every task here

Before doing any work in this project:

1. Read this `CLAUDE.md` first.
2. Read `output/project-context.md` for the current project overview.
3. Inspect the relevant source files in `context/` and `template/` before changing or producing related work.
4. If files or project goals have changed, update the project context based on the current files rather than relying on assumptions.
5. Follow the project-local Claude Code guardrails in `.claude/settings.json`; read `output/hooks-policy.md` for their scope and limitations.
6. Act as the project orchestrator and use the routing rules below to decide whether specialist subagents are needed.

## Deliverables

- Save all user-requested deliverables and generated project documents under `output/`.
- Project-local Claude Code configuration under `.claude/` is an operational exception required to install and maintain hooks.
- The root `index.html` is reserved for the GitHub Pages entrypoint that forwards visitors to `output/`; keep the actual site page and deliverable content in `output/`.
- Keep this `CLAUDE.md` at the project root so it can serve as the project startup instruction file.
- Treat `context/` and `template/` as source/reference material. Do not overwrite, move, or rename source materials unless explicitly requested.
- Use descriptive filenames and preserve the existing Korean language and Markdown style where appropriate.
- When a deliverable references source assets, use relative links so the files remain usable within the project.

## Project scope

- This is a Korean-language design/content workspace for 꾸미스튜디오 (Qoomee Studio).
- Existing material includes brand/business context, visual reference images, and reusable portfolio PPT, card-news, and YouTube thumbnail guidance.
- Use the source-grounded project facts and creative direction in `output/project-context.md`.

## Team routing and workflow

The main Claude Code session is the **총괄 에이전트 (orchestrator)**. It owns the brief, routes focused tasks to project subagents in `.claude/agents/`, resolves conflicts, applies changes, and delivers final files. Do not delegate by default when a task is small enough to complete directly.

### Routing rules

| Work type | Route to | Delegate when |
|---|---|---|
| New facts, sources, competitors, audience or project context | `researcher` | Claims need source verification or gathering evidence is a meaningful separate task |
| Story structure, campaign concept, copy, titles, CTA | `content-planner` | Multiple content units need a coherent narrative or a focused copy draft/revision |
| Visual direction, page/card/thumbnail layout, asset placement | `visual-designer` | A deliverable needs a reusable or multi-page visual specification |
| Claims, citations, brand voice, factual consistency | `fact-checker` | A draft or final deliverable needs independent evidence/brand review |
| Readability, sizing, layout consistency, crop/contrast, platform fit | `visual-qa` | A visual or document output needs an independent media/readability review |

### Default dependency order

1. **Brief (orchestrator):** confirm goal, audience, channel, deliverable, dimensions, deadline, source material and approval needs.
2. **Research (`researcher`):** return verified facts, interpretation, unknowns and sources. Skip only when the user supplied complete, trusted facts and no new research is needed.
3. **Content (`content-planner`):** draft the narrative and copy using approved evidence. The orchestrator resolves factual gaps and approves copy before design.
4. **Design (`visual-designer`):** turn approved copy and the relevant `template/` references into layout and asset instructions.
5. **Parallel review:** after a reviewable draft exists, run `fact-checker` and `visual-qa` independently when both kinds of review apply.
6. **Delivery (orchestrator):** reconcile findings, make all file edits, save final deliverables under `output/`, and report unresolved checks.

### Delegation rules

- Give each subagent one bounded objective, the relevant context, expected output shape, and explicit constraints; ask for a concise report rather than a broad dump.
- Pass upstream decisions and evidence to downstream agents. Do not start dependent work before its input is reviewed.
- Parallelize only independent research threads or independent review dimensions. Never have multiple agents edit the same file.
- Specialist agents are read-only. They return findings/specifications to the orchestrator; only the orchestrator writes or edits deliverable files.
- Files under `.claude/agents/` are reusable agent definitions, not running agents. A Claude Code orchestrator must discover a definition and delegate a task before a runtime subagent exists.
- If Claude Code does not discover newly added project agent definitions in the current session, restart Claude Code and retry.
- Spawn only the specialist(s) needed for the current task. Do not create a full team for a simple lookup, one-line copy, or self-contained small change.
- Keep `context/` and `template/` as read-only source materials. The orchestrator owns project changes and final output.
- Agent Teams are not the default. Use them only when independent specialists need direct discussion/shared task coordination and that benefit exceeds the added overhead; the Claude Code feature is experimental and must not be enabled without explicit user approval.

## Accuracy and design guidance

- Distinguish verified source facts from interpretation or recommendations.
- Do not invent clients, project dates, scope, results, or performance metrics. Mark unknown information for confirmation.
- Treat observed color values, typography, and visual patterns as approximations unless official brand assets or standards confirm them.
- Preserve each project's own visual identity; do not force one palette or style onto unrelated work.
- Check image, logo, font, and personal likeness usage rights before preparing material for external distribution.
- For promotional content, ensure claims and calls to action are accurate and supported.
- Hooks are guardrails, not an OS-level sandbox. Do not treat them as a substitute for user review or platform permissions.

## Before finishing

- Confirm all requested deliverables are saved under `output/`.
- Check Markdown structure, local relative links, filenames, and any referenced images.
- Report the deliverable paths and any important source limitations to the user.
