# Advanced Guide - OpenCode Agents 3.0

## Memory System

The memory system is the core innovation of v3.0. It stores project context permanently, reducing token consumption by ~93%.

### Memory Structure

```
.opencode/memory/
├── project.md      # Stack, structure, conventions
├── errors.md       # Mistakes to avoid
├── successes.md    # What works well
├── progress.md     # Current status
└── decisions.md    # Architecture decisions
```

### How Memory Works

#### Session Start
1. Orchestrator checks if `.opencode/memory/` exists
2. If exists, loads all memory files
3. If not exists, creates memory structure and analyzes project

#### During Work
1. Builder checks `errors.md` before writing code
2. Builder follows patterns from `successes.md`
3. Reviewer adds new errors to `errors.md`
4. Orchestrator updates `progress.md` after each task

#### Session End
1. Orchestrator updates all memory files
2. Saves progress, decisions, errors, successes
3. Next session starts with full context

### Memory Files Format

#### project.md
Stores the complete project context:

```markdown
# Project Context

## Stack
- Frontend: Next.js 16 + TypeScript + Tailwind + shadcn/ui
- Backend: tRPC + NextAuth v5
- Database: PostgreSQL + Prisma 7
- Deploy: Vercel + Railway

## Structure
- app/(auth)/ - Login, Register
- app/(dashboard)/ - Dashboard, Workout, Nutrition, Habits
- server/routers/ - 13 tRPC routers

## Key Files
- lib/auth.ts - NextAuth config (JWT strategy)
- lib/prisma.ts - Prisma with adapter-pg

## Conventions
- buttonVariants pattern (no asChild)
- Import from @/app/generated/prisma/client
```

#### errors.md
Stores mistakes to avoid:

```markdown
# Errors to Avoid

## Prisma 7
- Wrong: new PrismaClient()
- Right: new PrismaClient({ adapter })
- Wrong: Import from @prisma/client
- Right: Import from @/app/generated/prisma/client

## NextAuth v5
- Wrong: import { getServerSession } from 'next-auth'
- Right: import { auth } from '@/lib/auth'
```

#### successes.md
Stores patterns that work:

```markdown
# What Works Well

## Auth Flow
- CredentialsProvider + JWT strategy
- getToken() in middleware (Edge Runtime compatible)

## UI
- Colorful gradients (purple/pink/orange)
- Sidebar + Header layout pattern
```

#### progress.md
Stores current status:

```markdown
# Project Progress

## Completed
- [x] Database schema (35+ models)
- [x] Auth (NextAuth v5)
- [x] Landing page
- [x] Login/Register

## In Progress
- [ ] Workout CRUD
- [ ] Nutrition tracking

## Not Started
- [ ] Payment integration
- [ ] AI microservice
```

#### decisions.md
Stores architecture decisions:

```markdown
# Architecture Decisions

## Decision 1: JWT Strategy Only
- Why: Edge Runtime incompatible with Prisma
- Result: Fast, no database sessions overhead

## Decision 2: adapter-pg for Prisma
- Why: Prisma 7 requires explicit adapter
- Result: Works with PostgreSQL
```

## Agent System

### Core Team (always present)

| Agent | Role | File |
|-------|------|------|
| orchestrator | CEO, manages lifecycle | agents/orchestrator.md |
| planner | Analysis and planning | agents/planner.md |
| builder | Code execution | agents/builder.md |
| reviewer | QA and code review | agents/reviewer.md |
| documenter | Documentation | agents/documenter.md |

### Specialized Teams (created as needed)

#### Frontend Team
| Agent | Specialization |
|-------|---------------|
| ui-specialist | Tailwind, shadcn/ui, CSS |
| frontend-specialist | React, Next.js, Server Components |
| mobile-specialist | React Native, Flutter |

#### Backend Team
| Agent | Specialization |
|-------|---------------|
| backend-specialist | APIs, tRPC, routes |
| database-specialist | Prisma, SQL, migrations |
| auth-specialist | NextAuth, security |

#### Feature Team
| Agent | Specialization |
|-------|---------------|
| payment-specialist | Stripe, PayPal |
| ai-engineer | PyTorch, ML models |
| realtime-specialist | WebSocket, Socket.io |
| integration-specialist | Third-party APIs |

#### Quality Team
| Agent | Specialization |
|-------|---------------|
| testing-specialist | Unit, E2E, integration tests |
| performance-specialist | Optimization, caching |
| security-specialist | Audit, OWASP |

#### Operations Team
| Agent | Specialization |
|-------|---------------|
| devops-specialist | Deploy, CI/CD |
| data-specialist | Analytics, reporting |

### Agent Selection Logic

The orchestrator selects agents based on project analysis:

- **Simple project (blog, portfolio)**: 5-6 agents
- **Standard project (SaaS, e-commerce)**: 8-12 agents
- **Complex project (enterprise, marketplace)**: 15-20 agents

## Advanced Workflows

### Multi-Project Management

Manage multiple projects simultaneously:

```bash
# Project 1: SaaS
cd ~/projects/saas-app
# Orchestrator loads project-specific memory

# Project 2: Mobile
cd ~/projects/mobile-app
# Orchestrator loads different memory
```

### Custom Agent Templates

Create project-specific agents:

```markdown
# my-company-frontend.md

## Role
Frontend developer following MyCompany design system.

## Stack
- React 18
- Next.js 14
- Tailwind CSS
- MyCompany UI library

## Conventions
- Use MyCompany components only
- Follow design-system.md
- Test coverage min 85%

## Output
Report: components created, tests written, design compliance
```

### Memory Sharing

Share memory across team members:

```bash
# Commit memory to git
git add .opencode/memory/
git commit -m "chore: update project memory"

# Team members pull memory
git pull
# Next session uses shared memory
```

### Conditional Agent Creation

Agents are created based on project needs:

```
IF project has payments:
  CREATE payment-specialist

IF project has AI features:
  CREATE ai-engineer

IF project has real-time:
  CREATE realtime-specialist

IF project is mobile:
  CREATE mobile-specialist
```

## Performance Optimization

### Token Reduction

| Operation | Without Memory | With Memory |
|-----------|---------------|-------------|
| Session start | 5000 tokens | 500 tokens |
| Project analysis | 3000 tokens | 0 tokens |
| Error context | 2000 tokens | 200 tokens |
| Convention check | 1000 tokens | 100 tokens |
| **Total** | **11000 tokens** | **800 tokens** |

**Savings: ~93%**

### Parallel Execution

Multiple agents work simultaneously:

```
Orchestrator delegates:
  @frontend-specialist: Create workout page
  @backend-specialist: Create workout API
  @database-specialist: Create workout schema

All three work in parallel.
Orchestrator integrates results.
```

### Incremental Updates

Memory is updated incrementally, not rebuilt:

```
After each task:
  - Update progress.md (add completed task)
  - Update errors.md (if new error found)
  - Update successes.md (if new pattern works)

Full rebuild only on major changes.
```

## Security Best Practices

### Secrets Management

Never store secrets in memory:

```markdown
# Wrong
DATABASE_URL=postgresql://user:password@host/db

# Right
DATABASE_URL=<stored in .env, not in memory>
```

### Agent Permissions

Control what agents can access:

```markdown
# agents/builder.md
## Permissions
- Read: *
- Write: src/, lib/
- Deny: .env, secrets/
```

### Code Review

Always review before merging:

```
1. Builder writes code
2. Reviewer checks code
3. Security specialist audits
4. Orchestrator approves
5. Merge to main
```

## Troubleshooting

### Memory Not Loading

Check if `.opencode/memory/` exists:

```bash
ls -la .opencode/memory/
# Should show 5 .md files
```

### Agent Not Found

Verify agent file exists:

```bash
ls -la .opencode/agents/
# Should show project-specific agents
```

### High Token Usage

Check if memory is being used:

```bash
# First session (no memory): ~10000 tokens
# Subsequent sessions (with memory): ~800 tokens
```

### Build Failing

Check memory for known errors:

```bash
cat .opencode/memory/errors.md
# Look for similar errors and fixes
```

## Best Practices

1. **Always commit memory** - Share with team
2. **Update after each session** - Keep memory fresh
3. **Review errors regularly** - Learn from mistakes
4. **Document decisions** - Maintain rationale
5. **Clean stale entries** - Remove outdated info

## Migration from v2.0

### Step 1: Backup
```bash
cp -r .opencode .opencode.backup
```

### Step 2: Create Memory
```bash
mkdir -p .opencode/memory
# Create initial memory files
```

### Step 3: Analyze Project
```bash
# Orchestrator analyzes existing codebase
# Generates memory from current state
```

### Step 4: Test
```bash
# Run orchestrator
# Verify memory loads correctly
# Check agent creation
```

## Support

- Documentation: README.md
- Issues: GitHub Issues
- Discussions: GitHub Discussions

---

**Ready for advanced usage? Start building!**
