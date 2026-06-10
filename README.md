# OpenCode Agents 3.0 - AI Software House

**AI-powered software house team with permanent memory and 20+ specialized agents.**

Create a team of specialized AI agents for any project (new or existing) in minutes. The orchestrator analyzes your project, asks intelligent questions, generates a development plan, builds a specialized team, and executes tasks in parallel.

## What's New in 3.0

- **Permanent Memory System** - Remembers project context across sessions (93% token savings)
- **20 Specialized Agents** - From frontend to security, AI to payments
- **Existing Project Support** - Works on new AND existing codebases
- **Intelligent Orchestration** - CEO that manages the entire lifecycle
- **Parallel Execution** - Multiple agents work simultaneously

## Quick Start

### No Installation Required

Just talk to the AI:

```
You: "I want to create a SaaS for gym workouts"
AI: [Loads orchestrator] -> Analyzes -> Plans -> Builds team -> Executes
```

### For Existing Projects

```
You: "Help me add payment feature to my project"
AI: [Loads memory] -> Understands context -> Plans -> Executes
```

### Continue Previous Work

```
You: "Continue with the next phase"
AI: [Loads progress] -> Resumes work -> Updates memory
```

## How It Works

### 1. Memory System

The orchestrator maintains permanent memory in `.opencode/memory/`:

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
- Loads existing memory
- Identifies current stack
- Creates payment-specialist
- Implements Stripe integration
- Updates memory
```

## Project Structure

```
your-project/
├── .opencode/
│   ├── agents/          # Project-specific agents
│   │   ├── workout-specialist.md
│   │   └── payment-specialist.md
│   └── memory/          # Permanent memory
│       ├── project.md
│       ├── errors.md
│       ├── successes.md
│       ├── progress.md
│       └── decisions.md
└── PLAN.md              # Development roadmap
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

## Contributing

1. Fork the repo
2. Create feature branch
3. Add new agent templates
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
