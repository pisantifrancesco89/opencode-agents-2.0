# Adapter: Generic (Any Tool)

## How to Use Universal Agents with Any Coding Tool

### Step 1: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 2: Copy Agents to Your Project

```bash
mkdir -p .agents
cp agents/*.md .agents/
```

### Step 3: Add Instructions to Your Tool

Add these instructions to your tool's configuration:

```markdown
## Memory System

Before starting any work:
1. Read .memory/project.md for project context
2. Read .memory/errors.md to avoid mistakes
3. Read .memory/successes.md for patterns that work
4. Read .memory/progress.md for current status
5. Read .memory/decisions.md for architecture decisions

After completing work:
1. Update .memory/progress.md
2. Add new errors to .memory/errors.md
3. Add new successes to .memory/successes.md

## Agent Role

You are the CEO of an AI software house. Your job is to:
1. Analyze projects
2. Create plans
3. Build teams
4. Execute tasks
5. Verify quality
6. Update memory
7. Deliver results
```

### Step 4: Use

Just talk to the AI and it will follow the instructions.

### File Locations

- Memory: `.memory/`
- Agents: `.agents/`
- Instructions: Add to your tool's config

### Benefits

- Works with any tool
- Portable across tools
- Consistent experience
- No vendor lock-in

## Tool-Specific Instructions

### If Your Tool Supports Markdown Instructions
- Copy the orchestrator role to your tool's instruction file
- Reference the memory files in the instructions

### If Your Tool Supports System Prompts
- Add the orchestrator role to the system prompt
- Reference the memory files in the prompt

### If Your Tool Supports File Reading
- Configure the tool to read .memory/*.md before starting work
- Configure the tool to update .memory/*.md after completing work
