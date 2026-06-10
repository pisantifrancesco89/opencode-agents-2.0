# Architecture Decisions

## Decision 1: Auto-Delegation (v3.1)
- **Why**: Users shouldn't need to manually select agents
- **Result**: Orchestrator automatically determines needed specialists and delegates via `task` tool
- **Benefit**: Seamless experience, no manual agent selection

## Decision 2: Standardized -specialist Suffix (v3.1)
- **Why**: Duplicate naming caused confusion (backend.md vs backend-specialist.md)
- **Result**: All specialized agents use `-specialist` suffix
- **Benefit**: Clear naming convention, no duplicates

## Decision 3: Frontmatter on All Agents (v3.1)
- **Why**: OpenCode auto-detects agents via YAML frontmatter
- **Result**: Every agent has `name`, `description`, `mode: subagent`
- **Benefit**: OpenCode can auto-load all agents as available sub-agents

## Decision 4: English Only (v3.1)
- **Why**: Previous files were mixed Italian/English
- **Result**: All agent files are in English
- **Benefit**: Universal accessibility, international contributors

## Decision 5: Permanent Memory System (v3.0)
- **Why**: Token efficiency (~93% savings), context persistence
- **Result**: 5 memory files (project, errors, successes, progress, decisions)
- **Benefit**: No re-analysis needed across sessions
