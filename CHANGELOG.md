# Changelog

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
