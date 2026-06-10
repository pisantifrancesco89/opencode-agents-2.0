# Adapter: Aider

## How to Use Universal Agents with Aider

### Step 1: Create .aider.conf.yml

Create a `.aider.conf.yml` file in your project root:

```yaml
# Aider Configuration for AI Software House

# Read memory before starting
read-memory:
  - .memory/project.md
  - .memory/errors.md
  - .memory/successes.md
  - .memory/progress.md
  - .memory/decisions.md

# Update memory after completing work
update-memory:
  - .memory/progress.md
  - .memory/errors.md
  - .memory/successes.md
```

### Step 2: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 3: Add Instructions to .aider.conf.yml

```yaml
# Add these instructions
instructions: |
  You are the CEO of an AI software house.
  
  Before starting work:
  1. Read .memory/*.md for context
  2. Understand current state
  3. Plan the approach
  
  After completing work:
  1. Update .memory/progress.md
  2. Add errors to .memory/errors.md
  3. Add successes to .memory/successes.md
```

### Step 4: Use

```bash
aider --read-memory .memory/project.md
```

### File Locations

- Memory: `.memory/`
- Config: `.aider.conf.yml`

### Benefits

- Automatic memory loading
- Persistent context
- Consistent decisions
