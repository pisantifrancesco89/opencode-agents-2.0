# Adapter: GitHub Copilot

## How to Use Universal Agents with GitHub Copilot

### Step 1: Create .github/copilot-instructions.md

Create this file in your project:

```markdown
# AI Software House Instructions

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

### Step 2: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 3: Use

GitHub Copilot will automatically read `.github/copilot-instructions.md` and follow the instructions.

### File Locations

- Memory: `.memory/`
- Instructions: `.github/copilot-instructions.md`

### Benefits

- Automatic instruction loading
- Persistent context
- Consistent decisions
