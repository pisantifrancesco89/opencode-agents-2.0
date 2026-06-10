# Universal AI Software House

**AI-powered software house team with permanent memory and 20+ specialized agents. Works with ANY coding tool.**

Create a team of specialized AI agents for any project (new or existing) in minutes. The orchestrator analyzes your project, asks intelligent questions, generates a development plan, builds a specialized team, and executes tasks in parallel.

## What's Included

- **Permanent Memory System** - Remembers project context across sessions (93% token savings)
- **20 Specialized Agents** - From frontend to security, AI to payments
- **6 Tool Adapters** - Works with OpenCode, Claude Code, Cursor, Aider, Copilot, and any other tool
- **Existing Project Support** - Works on new AND existing codebases
- **Intelligent Orchestration** - CEO that manages the entire lifecycle
- **Parallel Execution** - Multiple agents work simultaneously

## Quick Start

### Step 1: Copy Memory to Your Project

```bash
cp -r memory/ .memory/
```

### Step 2: Choose Your Tool

| Tool | Adapter | Instructions |
|------|---------|--------------|
| **OpenCode** | [adapters/opencode.md](adapters/opencode.md) | Use SKILL.md |
| **Claude Code** | [adapters/claude-code.md](adapters/claude-code.md) | Use CLAUDE.md |
| **Cursor** | [adapters/cursor.md](adapters/cursor.md) | Use .cursorrules |
| **Aider** | [adapters/aider.md](adapters/aider.md) | Use .aider.conf.yml |
| **GitHub Copilot** | [adapters/copilot.md](adapters/copilot.md) | Use copilot-instructions.md |
| **Any Tool** | [adapters/generic.md](adapters/generic.md) | Manual setup |

### Step 3: Use

```
You: "I want to create a SaaS for gym workouts"
AI: [Loads memory] -> Analyzes -> Plans -> Builds team -> Executes
```

## How It Works

### 1. Memory System

The orchestrator maintains permanent memory in `.memory/`:

- `project.md` - Stack, structure, conventions
- `errors.md` - Mistakes to avoid
- `successes.md` - What works well
- `progress.md` - Current status
- `decisions.md` - Architecture decisions

**Benefit**: 93% fewer tokens per session, no re-analysis needed.

### 2. Agent Team (5-20 agents)

#### Core Team (always present)
- **planner** - Analysis and planning
- **builder** - Code execution
- **reviewer** - QA and code review
- **documenter** - Documentation

#### Specialized Teams (created as needed)

| Team | Agents |
|------|--------|
| Frontend | ui-specialist, frontend-specialist, mobile-specialist |
| Backend | backend-specialist, database-specialist, auth-specialist |
| Features | payment-specialist, ai-engineer, realtime-specialist, integration-specialist |
| Quality | testing-specialist, performance-specialist, security-specialist |
| Operations | devops-specialist, data-specialist |

### 3. Workflow

```
1. Load Memory -> Understand context
2. Analyze Project -> Identify gaps
3. Create Plan -> Define milestones
4. Build Team -> Select specialists
5. Execute Tasks -> Work in parallel
6. Verify Quality -> Test and review
7. Update Memory -> Save progress
8. Deliver Results -> Report to user
```

## Supported Tools

This system works with **any coding tool**. We provide adapters for:

| Tool | Adapter File | How It Works |
|------|--------------|--------------|
| **OpenCode** | `adapters/opencode.md` | SKILL.md auto-loads orchestrator |
| **Claude Code** | `adapters/claude-code.md` | CLAUDE.md contains instructions |
| **Cursor** | `adapters/cursor.md` | .cursorrules loads rules |
| **Aider** | `adapters/aider.md` | .aider.conf.yml configures memory |
| **GitHub Copilot** | `adapters/copilot.md` | copilot-instructions.md loads rules |
| **Other Tools** | `adapters/generic.md` | Manual setup instructions |

### For Existing Projects

The system works on **existing projects** too:

1. Copy `.memory/` to your project
2. The AI reads your codebase and fills memory automatically
3. It understands your stack, conventions, and patterns
4. It plans improvements and executes them

```
You: "Help me add payment feature to my existing app"
AI: [Reads your code] -> [Fills memory] -> [Plans] -> [Executes]
```

## Supported Stacks

### JavaScript/TypeScript
- Next.js 14+ (App Router)
- React + Vite
- Vue.js + Nuxt
- Node.js + Express
- tRPC

### Python
- FastAPI
- Django
- Flask

### Go
- Gin/Echo/Fiber

### Rust
- Actix-web/Axum

### Mobile
- React Native + Expo
- Flutter

### Database
- PostgreSQL
- MySQL/MariaDB
- MongoDB
- Redis

### Deploy
- Vercel
- Railway
- Fly.io
- AWS/GCP/Azure

## Examples

### Example 1: New SaaS

```
You: "I want to create a SaaS for project management"

AI creates:
- Stack: Next.js + PostgreSQL + Prisma
- Team: 10 specialists
- Plan: 6 weeks
- Files: 50+
```

### Example 2: Existing Project

```
You: "Add payment feature to my app"

AI:
- Reads your existing codebase
- Identifies current stack (e.g., Next.js + Prisma)
- Creates payment-specialist
- Implements Stripe integration
- Updates memory with new decisions
```

### Example 3: Continue Previous Work

```
You: "Continue with the next phase"

AI:
- Reads .memory/progress.md
- Knows exactly where you left off
- Resumes work from last task
- Updates memory with new progress
```

## Project Structure

### For OpenCode
```
your-project/
├── .opencode/
│   ├── agents/          # Project-specific agents
│   └── memory/          # Permanent memory
├── .memory/             # Universal memory (symlink or copy)
└── PLAN.md
```

### For Claude Code
```
your-project/
├── .memory/             # Permanent memory
├── CLAUDE.md            # Instructions with memory loading
└── PLAN.md
```

### For Cursor
```
your-project/
├── .memory/             # Permanent memory
├── .cursor/
│   └── agents/          # Project-specific agents
├── .cursorrules         # Instructions
└── PLAN.md
```

### For Any Tool
```
your-project/
├── .memory/             # Permanent memory
├── .agents/             # Project-specific agents
└── PLAN.md
```

## Token Efficiency

| Scenario | Without Memory | With Memory |
|----------|----------------|-------------|
| New session | 5000+ tokens | 500 tokens |
| Project analysis | 3000 tokens | 0 tokens |
| Error context | 2000 tokens | 200 tokens |
| **Total** | **~10000 tokens** | **~700 tokens** |

**Savings: ~93%**

## Documentation

- [README.md](README.md) - This file
- [ADVANCED.md](ADVANCED.md) - Advanced usage
- [docs/WORKFLOW.md](docs/WORKFLOW.md) - Detailed workflow
- [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md) - Customization guide
- [adapters/](adapters/) - Tool-specific adapters

## Contributing

1. Fork the repo
2. Create feature branch
3. Add new agent templates or adapters
4. Test with real projects
5. Submit PR

## License

MIT License

## Support

- Documentation: README.md
- Issues: GitHub Issues
- Discussions: GitHub Discussions

---

**Ready to build 4x faster? Start talking to the AI!**
