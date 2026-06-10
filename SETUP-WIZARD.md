# Universal Setup Wizard

## How to Use

This wizard works with **any coding tool**. When a user says "I want to create a new project" or "setup wizard", follow this process.

## Step 1: Detect if Existing Project

Before asking questions, check if this is an **existing project**:

```bash
# Check for these files
ls package.json requirements.txt go.mod Cargo.toml 2>/dev/null

# If exists → EXISTING PROJECT
# If not → NEW PROJECT
```

### For Existing Projects
Skip to Step 3 (Analyze Project) - the AI will analyze the codebase automatically.

### For New Projects
Continue with Step 2 (Ask Questions).

## Step 2: Ask Questions (One at a Time)

Ask these questions **ONE AT A TIME**, waiting for the answer before proceeding.

### Question 1: Project Type
```
What type of project do you want to create?

1. Web Application (SaaS) ← most common, recommended
2. E-commerce
3. Mobile App
4. API Backend
5. AI/ML Application
6. Marketplace
7. Social Network
8. Dashboard/Analytics
9. Desktop App
10. CLI Tool
```

### Question 2: Name and Description
```
What is the project name and what does it do? (describe in 1-2 sentences)
```

### Question 3: Target Users
```
Who are the target users? (e.g., "freelancers who want to manage clients")
```

### Question 4: Main Features
```
What are the 5-8 essential features for the MVP?

I'll suggest some based on the project type:
[suggest 10-15 relevant features for the chosen type]

Choose 5-8 or write your own.
```

### Question 5: Technical Preferences
```
Do you have technical preferences?

1. Suggest optimal stack ← recommended
2. JavaScript/TypeScript (Next.js, React, Node.js)
3. Python (FastAPI, Django)
4. Go
5. Rust
6. Java (Spring Boot)
7. PHP (Laravel)
8. Mobile (React Native, Flutter)
9. Custom (specify)
```

### Question 6: Budget
```
What is your monthly budget for deployment?

1. $0-50 (Free tier, hobby) ← to start
2. $50-100 (Startup, small project) ← recommended
3. $100-300 (Business, medium project)
4. $300-1000 (Enterprise)
```

### Question 7: Timeline
```
When do you want to launch the MVP?

1. 2-4 weeks (minimal MVP)
2. 1-2 months (complete MVP) ← recommended
3. 3-6 months (complete product)
4. 6+ months (enterprise)
```

### Question 8: Tool Choice
```
Which coding tool are you using?

1. OpenCode ← recommended
2. Claude Code
3. Cursor
4. Aider
5. GitHub Copilot
6. Other (specify)
```

## Step 3: Analyze Project

### For New Projects
After collecting answers:
1. Determine optimal stack based on:
   - Project type
   - Requested features
   - User preferences
   - Budget
2. Determine agents needed:
   - Core: planner, builder, reviewer, documenter
   - Specialized: based on features
3. Create summary

### For Existing Projects
1. Read project files (package.json, config files, etc.)
2. Detect stack and conventions
3. Identify gaps and opportunities
4. Plan improvements

## Step 4: Show Summary

```
Project Summary
━━━━━━━━━━━━━━━
Name: [name]
Type: [type]
Stack: [frontend] + [backend] + [database]
Deploy: [deploy]
Budget: $X/month
Timeline: X weeks
Tool: [tool]
Agents: 5-20 (based on needs)

Proceed with generation? (yes/no/modify)
```

## Step 5: Generate Files

If user confirms, generate ALL these files:

### 1. `.memory/project.md`
Contains:
- Project name and description
- Complete tech stack
- Directory structure
- Key files
- Conventions

### 2. `.memory/errors.md`
Contains:
- Common errors for this stack
- Framework-specific pitfalls
- How to avoid them

### 3. `.memory/successes.md`
Contains:
- Patterns that work well
- Best practices for this stack
- What to follow

### 4. `.memory/progress.md`
Contains:
- Milestone 1: Setup & Auth
- Milestone 2: Core Features
- Milestone 3: Advanced Features
- Milestone 4: Polish & Launch

### 5. `.memory/decisions.md`
Contains:
- Architecture decisions
- Technology choices
- Design patterns

### 6. Tool-Specific Files

Based on Step 2 Question 8:

#### For OpenCode
- `.opencode/orchestrator.md`
- `.opencode/agents/*.md`
- Copy `skills/opencode-agents/SKILL.md` to `~/.config/opencode/skills/`

#### For Claude Code
- `CLAUDE.md` with orchestrator instructions
- `.memory/` directory

#### For Cursor
- `.cursorrules` with orchestrator instructions
- `.cursor/agents/*.md`
- `.memory/` directory

#### For Aider
- `.aider.conf.yml` with memory config
- `.memory/` directory

#### For GitHub Copilot
- `.github/copilot-instructions.md`
- `.memory/` directory

#### For Other Tools
- `.memory/` directory
- `.agents/` directory
- Instructions for manual setup

### 7. `PLAN.md`
Contains:
- Timeline and budget
- Development phases (4-5 phases)
- Detailed tasks per phase
- Success metrics
- Next steps

### 8. `README.md`
Contains:
- Project description
- Quick start
- Features
- Tech stack
- AI team info
- Documentation links

## Step 6: Kickoff

After generation:
```
Project generated successfully!

Files created:
  .memory/project.md
  .memory/errors.md
  .memory/successes.md
  .memory/progress.md
  .memory/decisions.md
  [tool-specific files]
  PLAN.md
  README.md

To start:
  1. Read PLAN.md for the roadmap
  2. Say "Start with Phase 1" to begin
  3. I will call the necessary agents in parallel
```

## Stack Database

Use this table to determine the stack:

| Project Type | Frontend | Backend | Database | Deploy | Auth |
|--------------|----------|---------|----------|--------|------|
| SaaS | Next.js 14 + TS | Next.js API + tRPC | PostgreSQL + Prisma | Vercel + Railway | NextAuth |
| E-commerce | Next.js 14 + TS | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth + Stripe |
| Mobile | React Native + Expo | Node.js + Express | PostgreSQL + Prisma | Railway + Expo | Expo Auth |
| API Backend | N/A | FastAPI + Python | PostgreSQL + SQLAlchemy | Railway | JWT + OAuth2 |
| AI/ML | Next.js + TS | FastAPI + Python | PostgreSQL + pgvector | Railway + Modal | NextAuth |
| Marketplace | Next.js 14 + TS | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth + Stripe Connect |
| Social | Next.js 14 + TS | Next.js + Socket.io | PostgreSQL + Redis | Vercel + Railway | NextAuth |
| Dashboard | Next.js + Recharts | Next.js API | PostgreSQL + Prisma | Vercel + Railway | NextAuth |

## Important Rules

1. **ONE question at a time** - Never ask multiple questions together
2. **Always suggest** the best options (mark with ← recommended)
3. **Adapt features** suggested to the specific project type
4. **Show summary** before generating
5. **Ask for confirmation** before creating files
6. **Generate ALL files** at once
7. **Use project name** everywhere (not "TestProject")
8. **Be specific** in agents (not generic, but tailored to the project)
9. **Detect existing projects** and adapt workflow
10. **Ask about tool choice** to generate correct files
