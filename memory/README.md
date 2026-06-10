# Universal Memory System

This directory contains the universal memory system that works across all coding tools.

## Files

- `project.md` - Project context (stack, structure, conventions)
- `errors.md` - Mistakes to avoid
- `successes.md` - What works well
- `progress.md` - Current status and milestones
- `decisions.md` - Architecture decisions and rationale

## Usage

Copy the `.memory/` directory to your project root and let your AI tool read these files before starting work.

## How It Works (Auto-Delegation Flow)

1. **Session Start**: AI reads all memory files
2. **Orchestrator Loads**: Auto-delegation system loads the orchestrator and scans available specialist agents
3. **Task Received**: Orchestrator analyzes your request and determines required expertise
4. **Agent Selection**: Relevant specialists are selected from `.opencode/agents/`
5. **Parallel Execution**: Multiple agents work simultaneously on assigned subtasks
6. **During Work**: AI references memory to avoid mistakes
7. **Review & Integrate**: Output from specialists is reviewed and merged
8. **Session End**: AI updates memory with new learnings

## Benefits

- 93% fewer tokens per session
- No re-analyzing codebase
- Consistent decisions across sessions
- Permanent learning from mistakes
