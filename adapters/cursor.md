# Adapter: Cursor

## How to Use Universal Agents with Cursor

### Step 1: Create .cursorrules

Create a `.cursorrules` file in your project root:

```markdown
# AI Software House Rules

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

## Agent Roles

You are the CEO of an AI software house. Your job is to:
1. Analyze projects
2. Create plans
3. Build teams
4. Execute tasks
5. Verify quality
6. Update memory
7. Deliver results
```

### Step 2: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 3: Copy Agents to .cursor/agents/

```bash
mkdir -p .cursor/agents
cp agents/*.md .cursor/agents/
```

### Step 4: Use

```
You: "I want to create a SaaS"
AI: [Reads .cursorrules] -> [Reads memory] -> Plans -> Executes -> Updates memory
```

### File Locations

- Memory: `.memory/`
- Rules: `.cursorrules`
- Agents: `.cursor/agents/`

### Benefits

- Automatic rule loading
- Persistent context
- Consistent decisions
