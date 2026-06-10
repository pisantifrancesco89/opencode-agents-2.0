# Adapter: Claude Code

## How to Use Universal Agents with Claude Code

### Step 1: Create CLAUDE.md

Copy the orchestrator instructions to your project's CLAUDE.md:

```bash
# Copy orchestrator role to CLAUDE.md
echo "# AI Software House" > CLAUDE.md
echo "" >> CLAUDE.md
cat agents/orchestrator.md >> CLAUDE.md
```

### Step 2: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 3: Add Memory Instructions to CLAUDE.md

Append this to your CLAUDE.md:

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
4. Update .memory/decisions.md if needed
```

### Step 4: Use

```
You: "Help me add payment feature"
AI: [Reads CLAUDE.md] -> [Reads memory] -> Plans -> Executes -> Updates memory
```

### File Locations

- Memory: `.memory/`
- Instructions: `CLAUDE.md`
- Agents: Reference in CLAUDE.md

### Benefits

- Automatic memory loading via CLAUDE.md
- Persistent context across sessions
- Consistent decisions
