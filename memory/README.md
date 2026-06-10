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

## How It Works

1. **Session Start**: AI reads all memory files
2. **During Work**: AI references memory to avoid mistakes
3. **Session End**: AI updates memory with new learnings

## Benefits

- 93% fewer tokens per session
- No re-analyzing codebase
- Consistent decisions across sessions
- Permanent learning from mistakes
