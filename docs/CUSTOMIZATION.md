# Customization Guide - Universal AI Software House

## Overview

This system is fully customizable. You can modify agents, templates, memory, and workflows to fit your needs. It works with **any coding tool**.

## Customization Levels

### Level 1: Project-Specific
Customize agents for a single project.

### Level 2: Team-Specific
Customize agents for your team's conventions.

### Level 3: Organization-Specific
Customize agents for your company's standards.

## Customizing Agents

### Modify Existing Agents

Edit agent files in `.agents/` (or tool-specific location):

```markdown
# backend-specialist.md

## Role
You are a backend specialist for our company.

## Stack
- Node.js 20
- TypeScript 5
- tRPC
- PostgreSQL

## Company Conventions
- Use our internal API library
- Follow REST naming conventions
- Write JSDoc for all functions
- Minimum 80% test coverage

## Code Style
- Use const, not let
- Prefer async/await
- Handle all errors
- Log with our logger
```

### Create New Agents

Create new agent files in `.agents/`:

```markdown
# stripe-specialist.md

## Role
You are a Stripe payment specialist.

## Stack
- Stripe.js
- Stripe Node SDK
- Webhooks

## Responsibilities
- Implement payment flows
- Handle webhooks
- Manage subscriptions
- Process refunds

## Conventions
- Use idempotency keys
- Handle all webhook events
- Log payment events
- Test with Stripe CLI

## Output
When complete, report:
1. Payment flow implemented
2. Webhook handlers created
3. Test transactions successful
```

## Customizing Memory

### Initial Memory Setup

Create initial memory files in `.memory/`:

#### project.md
```markdown
# Project Context

## Company
- Name: MyCompany
- Industry: SaaS
- Users: B2B

## Stack
- Frontend: Next.js 14
- Backend: tRPC
- Database: PostgreSQL
- Deploy: Vercel

## Conventions
- TypeScript strict mode
- ESLint + Prettier
- Conventional Commits
- 85% test coverage
```

#### errors.md
```markdown
# Errors to Avoid

## Company-Specific
- Never use console.log (use our logger)
- Never hardcode secrets
- Never skip tests
- Never merge without approval
```

#### successes.md
```markdown
# What Works Well

## Patterns
- Server Components for data fetching
- Client Components for interactivity
- Server Actions for mutations
- tRPC for type-safe APIs
```

### Memory Templates

Create memory templates for new projects:

```markdown
# memory-template/project.md

# Project Context

## Stack
- [To be filled by orchestrator]

## Structure
- [To be filled by orchestrator]

## Conventions
- TypeScript strict mode
- ESLint + Prettier
- Conventional Commits
```

## Customizing Workflow

### Modify Orchestrator

Edit `agents/orchestrator.md`:

```markdown
# Orchestrator Agent

## Custom Workflow

### Phase 1: Company Check
1. Check company standards
2. Load team conventions
3. Verify compliance

### Phase 2: Project Analysis
1. Read project files
2. Identify gaps
3. Plan improvements

### Phase 3: Execution
1. Delegate to specialists
2. Monitor progress
3. Ensure quality

### Phase 4: Company Review
1. Check compliance
2. Verify standards
3. Approve delivery
```

### Add Custom Phases

Add custom phases to the workflow:

```markdown
## Custom Phases

### Phase: Security Audit
1. Run security scanner
2. Check for vulnerabilities
3. Fix issues
4. Document findings

### Phase: Performance Check
1. Run lighthouse
2. Check bundle size
3. Optimize
4. Report improvements
```

## Customizing Team Structure

### Create Team Templates

Create team templates for different project types:

#### SaaS Template
```markdown
# saas-team.md

## Core Team
- planner
- builder
- reviewer
- documenter

## Frontend Team
- ui-specialist
- frontend-specialist

## Backend Team
- backend-specialist
- database-specialist
- auth-specialist

## Feature Team
- payment-specialist
- integration-specialist

## Quality Team
- testing-specialist
- security-specialist

## Operations Team
- devops-specialist
```

#### Mobile App Template
```markdown
# mobile-team.md

## Core Team
- planner
- builder
- reviewer
- documenter

## Mobile Team
- mobile-specialist
- ui-specialist

## Backend Team
- backend-specialist
- database-specialist

## Feature Team
- integration-specialist
- realtime-specialist

## Quality Team
- testing-specialist
- performance-specialist

## Operations Team
- devops-specialist
```

## Customizing Conventions

### Add Project Conventions

Create a conventions file:

```markdown
# CONVENTIONS.md

## Code Style
- Use TypeScript strict mode
- Follow ESLint rules
- Use Prettier for formatting
- Write meaningful commits

## File Structure
- Components in src/components/
- Pages in src/app/
- Utils in src/utils/
- Types in src/types/

## Testing
- Unit tests for utilities
- Integration tests for APIs
- E2E tests for critical paths
- Minimum 85% coverage

## Documentation
- README for each package
- JSDoc for public APIs
- CHANGELOG for releases
```

## Customizing Deploy

### Add Deploy Configuration

Create deploy configuration:

```markdown
# deploy.md

## Environments
- Development: localhost
- Staging: staging.mycompany.com
- Production: mycompany.com

## Deploy Process
1. Build project
2. Run tests
3. Deploy to staging
4. Verify staging
5. Deploy to production
6. Monitor

## Rollback Process
1. Identify issue
2. Revert to previous version
3. Verify rollback
4. Document issue
```

## Tool-Specific Customization

### For OpenCode
- Edit `.opencode/agents/*.md`
- Use SKILL.md for global config
- Memory in `.opencode/memory/`

### For Claude Code
- Edit CLAUDE.md
- Memory in `.memory/`
- Reference agents in CLAUDE.md

### For Cursor
- Edit `.cursorrules`
- Edit `.cursor/agents/*.md`
- Memory in `.memory/`

### For Aider
- Edit `.aider.conf.yml`
- Memory in `.memory/`

### For GitHub Copilot
- Edit `.github/copilot-instructions.md`
- Memory in `.memory/`

### For Any Tool
- Edit `.agents/*.md`
- Memory in `.memory/`
- Add instructions to your tool's config

## Best Practices

### 1. Start Simple
- Begin with default agents
- Add customization gradually
- Test each change

### 2. Document Changes
- Update README
- Add comments
- Create CHANGELOG

### 3. Share with Team
- Commit customizations
- Review changes
- Maintain consistency

### 4. Version Control
- Tag versions
- Track changes
- Maintain compatibility

### 5. Test Thoroughly
- Test each agent
- Verify workflow
- Check memory

## Troubleshooting

### Agent Not Found
- Check file exists in .agents/
- Verify file name matches reference
- Check permissions

### Memory Not Loading
- Verify .memory/ exists
- Check file permissions
- Verify file format

### Workflow Not Following Conventions
- Check orchestrator.md
- Verify conventions in memory
- Update agent instructions

### Build Failing After Customization
- Check agent changes
- Verify code quality
- Run tests

## Support

- Documentation: README.md
- Issues: GitHub Issues
- Discussions: GitHub Discussions

---

**Customize your AI software house!**
