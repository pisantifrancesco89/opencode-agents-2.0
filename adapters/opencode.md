# OpenCode Integration Guide

## How It Works

The Universal AI Software House integrates with OpenCode through SKILL.md, which auto-loads the orchestrator agent and manages delegation to specialist agents.

## SKILL.md Auto-Loads the Orchestrator

The [SKILL.md](../SKILL.md) file is placed in `.opencode/skills/` and is automatically detected by OpenCode at session start. It references the orchestrator agent, which serves as the CEO of your AI software house team.

When OpenCode loads, it reads SKILL.md and:
1. Loads the orchestrator prompt
2. Scans for available agents
3. Prepares the memory system
4. Waits for your task request

## Agent Detection from `.opencode/agents/`

Specialist agents are stored in `.opencode/agents/` as markdown files with YAML frontmatter:

```yaml
---
name: frontend-specialist
role: Frontend Developer
description: Specializes in building UI components and frontend architecture
---
```

OpenCode automatically detects these agents and makes them available to the orchestrator for delegation.

## Installation via setup.sh

Run the setup script to install all agents globally:

```bash
# From the opencode-agents-2.0 root
bash setup.sh
```

This will:
- Copy all core and specialized agents to `~/.config/opencode/agents/`
- Install SKILL.md for auto-detection
- Configure the orchestrator as the default entry point

## Auto-Delegation

The orchestrator automatically delegates tasks to specialist agents:

1. **Analyze** - The orchestrator reads your request and determines required expertise
2. **Select** - It picks the right specialist agents from `.opencode/agents/`
3. **Assign** - Tasks are delegated to selected specialists with clear context
4. **Review** - Output is reviewed and integrated
5. **Update** - Memory is updated with new learnings

This means you only need to talk to the orchestrator — it handles the rest.

## Manual Usage

If you prefer to call agents directly:

```
@orchestrator I need a full-stack feature
@frontend-specialist Build the login page UI
@backend-specialist Create the auth API endpoints
```

## Directory Structure for OpenCode

```
your-project/
├── .opencode/
│   ├── agents/
│   │   ├── orchestrator.md
│   │   ├── planner.md
│   │   ├── builder.md
│   │   ├── reviewer.md
│   │   ├── documenter.md
│   │   ├── frontend-specialist.md
│   │   ├── backend-specialist.md
│   │   ├── database-specialist.md
│   │   ├── devops-specialist.md
│   │   └── ...
│   ├── skills/
│   │   └── SKILL.md
│   └── memory/
│       ├── project.md
│       ├── errors.md
│       ├── successes.md
│       ├── progress.md
│       └── decisions.md
└── PLAN.md
```
