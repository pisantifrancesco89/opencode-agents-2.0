# Changelog

## 3.2.0 (2026-06-10)
### Added
- **Interactive setup wizard**: `setup.sh new ~/project` and `setup.sh existing ~/project` — asks structured questions, pre-fills memory
- **One-liner installer**: `install.sh` — works via `curl | bash` or direct execution
- **First Contact Protocol** in orchestrator: structured onboarding interview for new vs existing projects
- **Auto-detection** of tech stack from project files (package.json, go.mod, etc.)
- opencode.jsonc template for new projects (auto-configured with orchestrator as default)
- **Per-agent model configuration**: each agent can have its own model, temperature, and top_p
- Global `~/.config/opencode/opencode.jsonc` with full per-agent config for ALL projects
- Model Configuration section in orchestrator.md explaining how to customize models

### Changed
- **Complete rewrite of setup.sh**: now 350+ lines with interactive wizard, pre-fills all memory files
- **Memory templates rewritten**: from empty brackets to guided templates with context-aware comments
- **SKILL.md updated** to v3.2 with structured onboarding flow
- **setup.sh now cleans up old agent files** during global install (removes old naming conventions)
- **Framework templates** (nextjs.md, go.md, etc.) no longer copied to global agents dir — only per-project

### Fixed
- setup.sh copied all templates/agents/*.md to global dir including non-agent framework files
- stack_suggestions.json had wrong agent names (payments→payment-specialist, etc.)
- stack_suggestions.json had Italian text mixed with English
- examples/habittracker-pro/README.md was in Italian with old agent names
- Empty planner/ and generator/ directories (removed)

## 3.1.0 (2026-06-10)
### Added
- Auto-delegation: orchestrator now automatically assigns tasks to specialist agents
- Frontmatter YAML on all agents for OpenCode auto-detection
- adapters/opencode.md for OpenCode integration guide
- Expanded specialist agents with detailed prompts, patterns, and code examples

### Changed
- Standardized agent naming: all specialists use `-specialist` suffix
- Translated backend.md, frontend.md, qa-engineer.md from Italian to English
- Updated setup.sh to install all agents globally (core + specialized)
- Enhanced orchestrator.md with auto-delegation protocol

### Fixed
- Broken path in SKILL.md reference to orchestrator agent
- Missing adapters/opencode.md file (was referenced in README but didn't exist)
- Duplicate agent files (backend.md vs backend-specialist.md, etc.)
- setup.sh not copying specialized agents during installation

### Removed
- Duplicate stub agent files (backend-specialist.md, frontend-specialist.md, database-specialist.md, devops-specialist.md)
