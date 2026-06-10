# Workflow Guide - Universal AI Software House

## Overview

This document describes the complete workflow of the AI Software House system, from initial request to final delivery. This system works with **any coding tool**.

## The Complete Flow

```
User Request
    |
    v
+-------------------+
| 1. LOAD CONTEXT   |  <- Read tool-specific config (SKILL.md, CLAUDE.md, etc.)
+-------------------+
    |
    v
+-------------------+
| 2. LOAD MEMORY    |  <- Read .memory/*.md
+-------------------+
    |
    v
+-------------------+
| 3. ANALYZE        |  <- Understand project state
+-------------------+
    |
    v
+-------------------+
| 4. PLAN           |  <- Create PLAN.md (if needed)
+-------------------+
    |
    v
+-------------------+
| 5. BUILD TEAM     |  <- Create 5-20 specialized agents
+-------------------+
    |
    v
+-------------------+
| 6. EXECUTE        |  <- Work in parallel
+-------------------+
    |
    v
+-------------------+
| 7. VERIFY         |  <- Test and review
+-------------------+
    |
    v
+-------------------+
| 8. UPDATE MEMORY  |  <- Save progress
+-------------------+
    |
    v
+-------------------+
| 9. DELIVER        |  <- Report to user
+-------------------+
```

## Phase 1: Context Loading

### What Happens
1. User makes a request
2. Tool-specific config is loaded:
   - **OpenCode**: SKILL.md loads orchestrator
   - **Claude Code**: CLAUDE.md contains instructions
   - **Cursor**: .cursorrules loads rules
   - **Aider**: .aider.conf.yml configures memory
   - **Copilot**: copilot-instructions.md loads rules
   - **Other**: Manual config
3. Orchestrator agent is activated
4. Memory files are read

### Memory Loading Sequence
```
Check .memory/ exists?
  |
  +--> YES: Load all 5 memory files
  |         - project.md
  |         - errors.md
  |         - successes.md
  |         - progress.md
  |         - decisions.md
  |
  +--> NO: Analyze project from scratch
            - Read package.json
            - Scan directory structure
            - Detect stack
            - Create memory files
```

### Token Impact
- With memory: ~500 tokens
- Without memory: ~5000 tokens
- **Savings: 90%**

## Phase 2: Analysis

### For New Projects
1. Ask user what to build
2. Suggest optimal stack
3. Define features
4. Estimate timeline

### For Existing Projects
1. Read current codebase
2. Identify what exists
3. Find gaps and opportunities
4. Plan next steps

### Analysis Checklist
- [ ] Framework detected (Next.js, Django, etc.)
- [ ] Database detected (Prisma, SQLAlchemy, etc.)
- [ ] Auth system detected
- [ ] Deployment config detected
- [ ] Key files identified
- [ ] Conventions understood

## Phase 3: Planning

### PLAN.md Structure
```markdown
# Project Plan

## Current State
- Stack: [detected]
- Status: [what exists]
- Quality: [assessment]

## Goals
1. [Goal 1]
2. [Goal 2]
3. [Goal 3]

## Milestones

### Milestone 1: [Name]
- Task 1.1: [description]
- Task 1.2: [description]
- Timeline: [X days]

### Milestone 2: [Name]
- Task 2.1: [description]
- Timeline: [X days]

## Success Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Risks
- [Risk 1] -> [Mitigation]
```

### When to Create Plan
- New project: Always
- Existing project, new feature: Yes
- Existing project, bug fix: No
- Existing project, refactor: Yes

## Phase 4: Team Building

### Agent Selection Algorithm
```
Start with Core Team (4 agents):
  - planner
  - builder
  - reviewer
  - documenter

Analyze project needs:
  IF frontend needed:
    ADD ui-specialist
    ADD frontend-specialist
  IF mobile needed:
    ADD mobile-specialist
  IF backend needed:
    ADD backend-specialist
    ADD database-specialist
  IF auth needed:
    ADD auth-specialist
  IF payments needed:
    ADD payment-specialist
  IF AI needed:
    ADD ai-engineer
  IF real-time needed:
    ADD realtime-specialist
  IF integrations needed:
    ADD integration-specialist
  IF testing needed:
    ADD testing-specialist
  IF optimization needed:
    ADD performance-specialist
  IF security audit needed:
    ADD security-specialist
  IF deployment needed:
    ADD devops-specialist
  IF analytics needed:
    ADD data-specialist

Return team (5-20 agents)
```

### Agent File Format
Each agent is created in `.agents/` (or tool-specific location):

```markdown
# [Agent Name] Specialist

## Role
You are a specialist in [DOMAIN].

## Stack
- [Technologies]

## Responsibilities
- [Tasks]

## Conventions
- [Rules]

## Output
When complete, report:
1. [What to report]
```

## Phase 5: Execution

### Parallel Execution Model
```
Orchestrator
    |
    +--> @frontend-specialist: Create workout page
    |
    +--> @backend-specialist: Create workout API
    |
    +--> @database-specialist: Create workout schema
    
All three work simultaneously.
Orchestrator monitors progress.
```

### Task Delegation Format
```
@agent-name: [Task description]

Requirements:
- [Requirement 1]
- [Requirement 2]

Constraints:
- [Constraint 1]

Expected output:
- [Output 1]
```

### Progress Monitoring
Orchestrator tracks:
- Tasks completed
- Tasks in progress
- Blockers encountered
- Quality metrics

## Phase 6: Verification

### Verification Checklist
```
1. Build Check
   - Run: npm run build
   - Expected: No errors

2. Lint Check
   - Run: npm run lint
   - Expected: No errors

3. Test Check
   - Run: npm test
   - Expected: All tests pass

4. Code Review
   - Reviewer checks code
   - Expected: Approved

5. Security Audit
   - Security specialist checks
   - Expected: No vulnerabilities
```

### Quality Gates
- Build must pass
- Lint must pass
- Tests must pass
- Code review approved
- Security audit passed

## Phase 7: Memory Update

### What Gets Updated
```
After completing work:

1. progress.md
   - Add completed tasks
   - Update current status
   - Add next steps

2. errors.md
   - Add any errors found
   - Add fixes that worked

3. successes.md
   - Add patterns that worked
   - Add good decisions

4. decisions.md
   - Add architecture decisions
   - Add rationale

5. project.md
   - Update if stack changed
   - Update if structure changed
```

### Update Frequency
- After each task: Update progress.md
- After each session: Update all files
- After major changes: Full rebuild

## Phase 8: Delivery

### Delivery Report Format
```markdown
## Task Completed: [Task Name]

### What Was Done
- [Description 1]
- [Description 2]

### Files Created/Modified
- path/to/file1.ts
- path/to/file2.ts

### Test Results
- Build: PASS
- Lint: PASS
- Tests: PASS

### Next Steps
1. [Next step 1]
2. [Next step 2]

### How to Continue
Say: "Continue with [next task]"
```

## Error Handling

### Common Errors and Fixes

#### Build Fails
```
1. Check errors.md for known issues
2. Run: npm run build
3. Read error message
4. Fix based on memory or analysis
5. Re-run build
```

#### Tests Fail
```
1. Check which tests failed
2. Read test error messages
3. Fix code or update tests
4. Re-run tests
```

#### Agent Conflict
```
1. Check if agents modified same files
2. Review changes from each agent
3. Merge manually if needed
4. Update conventions in memory
```

## Performance Metrics

### Token Usage
- Session start: ~500 tokens (with memory)
- Task execution: ~2000 tokens
- Verification: ~500 tokens
- Total per task: ~3000 tokens

### Time Savings
- Manual development: 8-16 hours per feature
- With AI agents: 1-2 hours per feature
- **Savings: 75-90%**

## Best Practices

1. **Always load memory first** - Saves tokens
2. **Ask minimal questions** - Only what's unknown
3. **Work in parallel** - Multiple agents simultaneously
4. **Verify before delivery** - Ensure quality
5. **Update memory after work** - Keep context fresh
6. **Report clearly** - User always knows status

## Troubleshooting

### Orchestrator Not Loading
- Check tool-specific config exists
- Verify memory directory exists
- Check permissions

### Memory Not Found
- Create .memory/ directory
- Create initial memory files
- Run orchestrator to populate

### Agents Not Created
- Check .agents/ directory
- Verify orchestrator has permission
- Check disk space

### Build Always Fails
- Check memory for known errors
- Verify package.json dependencies
- Check TypeScript configuration
