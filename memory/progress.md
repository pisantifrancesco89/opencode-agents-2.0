# Project Progress — opencode-agents-2.0

## Status
✅ **v3.2 Complete** — Interactive onboarding + setup wizard

## Completed
- [x] v3.0 Initial release with memory system and 20+ agents
- [x] v3.1 Auto-delegation overhaul
- [x] v3.2 Interactive wizard + onboarding

### v3.2 Specific
- [x] setup.sh complete rewrite — interactive wizard with 12+ questions
- [x] install.sh — one-liner installer (curl|bash compatible)
- [x] First Contact Protocol in orchestrator.md — structured interview
- [x] New project wizard (type, stack, features, timeline, budget)
- [x] Existing project wizard (state, stack, help needed, conventions)
- [x] Auto-detection of tech stack from project files
- [x] Memory templates rewritten with guiding questions
- [x] SKILL.md updated to v3.2
- [x] setup.sh generates opencode.jsonc per-project
- [x] Global cleanup: framework templates no longer in agents dir
- [x] Old agent file cleanup during install
- [x] stack_suggestions.json fixed (names + translated)
- [x] examples/habittracker-pro translated to English

## Current State
- Setup wizard: interactive, asks relevant questions, pre-fills memory
- Orchestrator: runs structured interview on first contact
- Global install: clean 21 agents (5 core + 16 specialist)
- Project install: all agents + framework templates + config files

## Next Steps
- [ ] Add CI/CD pipeline (GitHub Actions)
- [ ] Publish to npm as CLI tool
- [ ] Create showcase demos
- [ ] Get user feedback on onboarding flow
