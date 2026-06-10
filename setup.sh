#!/bin/bash

# ─────────────────────────────────────────────────────────────
#  Universal AI Software House - Setup Wizard
#  Usage:
#    ./setup.sh                  → Install globally + interactive
#    ./setup.sh new ~/project    → New project wizard
#    ./setup.sh existing ~/app   → Existing project wizard
#    ./setup.sh ~/project        → Auto-detect: new or existing
# ─────────────────────────────────────────────────────────────

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCODE_SKILL_DIR="$HOME/.config/opencode/skills/opencode-agents"
OPENCODE_AGENTS_DIR="$HOME/.config/opencode/agents"

# ── Colors ──
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

print_header() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  🏢  Universal AI Software House - Setup Wizard${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

print_section() {
    echo ""
    echo -e "${CYAN}── $1 ──${NC}"
}

# ─────────────────────────────────────────────────────────────
#  GLOBAL INSTALL
# ─────────────────────────────────────────────────────────────
install_global() {
    print_section "Installing OpenCode Skill"
    mkdir -p "$OPENCODE_SKILL_DIR"
    cp "$REPO_DIR/skills/opencode-agents/SKILL.md" "$OPENCODE_SKILL_DIR/"
    echo -e "${GREEN}  ✅ Skill → ${OPENCODE_SKILL_DIR}${NC}"

    print_section "Installing Agents Globally"
    mkdir -p "$OPENCODE_AGENTS_DIR"
    
    # Core agents (5)
    cp "$REPO_DIR/agents/"*.md "$OPENCODE_AGENTS_DIR/"
    echo -e "${GREEN}  ✅ Core agents (5) → ${OPENCODE_AGENTS_DIR}${NC}"
    
    # Specialist agents only — no framework templates
    cp "$REPO_DIR/templates/agents/"*-specialist.md "$OPENCODE_AGENTS_DIR/"
    cp "$REPO_DIR/templates/agents/ai-engineer.md" "$OPENCODE_AGENTS_DIR/"
    cp "$REPO_DIR/templates/agents/qa-engineer.md" "$OPENCODE_AGENTS_DIR/"
    echo -e "${GREEN}  ✅ Specialist agents (16) → ${OPENCODE_AGENTS_DIR}${NC}"

    # Clean up old files if they exist (from previous versions)
    rm -f "$OPENCODE_AGENTS_DIR/backend.md" "$OPENCODE_AGENTS_DIR/database.md" \
          "$OPENCODE_AGENTS_DIR/devops.md" "$OPENCODE_AGENTS_DIR/frontend.md" \
          "$OPENCODE_AGENTS_DIR/go.md" "$OPENCODE_AGENTS_DIR/nextjs.md" \
          "$OPENCODE_AGENTS_DIR/rust.md" "$OPENCODE_AGENTS_DIR/python-django.md" \
          "$OPENCODE_AGENTS_DIR/python-fastapi.md" "$OPENCODE_AGENTS_DIR/php-laravel.md" \
          "$OPENCODE_AGENTS_DIR/java-spring-boot.md" "$OPENCODE_AGENTS_DIR/react-native.md"
    echo -e "${GREEN}  ✅ Cleaned up old files${NC}"
    
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  Global install complete!${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${BOLD}Next:${NC} Run ${BOLD}./setup.sh ~/my-project${NC} to configure a project"
    echo ""
}

# ─────────────────────────────────────────────────────────────
#  INTERACTIVE WIZARD — NEW PROJECT
# ─────────────────────────────────────────────────────────────
wizard_new() {
    local PROJECT_DIR="$1"
    
    echo ""
    echo -e "${BOLD}✨ Let's set up your NEW project!${NC}"
    echo -e "I'll ask a few questions to pre-fill the AI's memory."
    echo ""

    # ── Project Name ──
    read -r -p "Project name: " PROJECT_NAME
    PROJECT_NAME="${PROJECT_NAME:-My Project}"

    # ── Description ──
    read -r -p "Description: " PROJECT_DESC
    PROJECT_DESC="${PROJECT_DESC:-A new project}"

    # ── Project Type ──
    print_section "Project Type"
    echo "  1) Web Application (SaaS)"
    echo "  2) Mobile App"
    echo "  3) API Backend"
    echo "  4) AI/ML Application"
    echo "  5) E-commerce"
    echo "  6) Static Website / Landing Page"
    echo "  7) CLI / Developer Tool"
    echo "  8) Other"
    read -r -p "Choose (1-8): " TYPE_CHOICE
    case "$TYPE_CHOICE" in
        1) PROJECT_TYPE="Web Application (SaaS)" ;;
        2) PROJECT_TYPE="Mobile App" ;;
        3) PROJECT_TYPE="API Backend" ;;
        4) PROJECT_TYPE="AI/ML Application" ;;
        5) PROJECT_TYPE="E-commerce" ;;
        6) PROJECT_TYPE="Static Website" ;;
        7) PROJECT_TYPE="CLI / Developer Tool" ;;
        *) PROJECT_TYPE="Custom" ;;
    esac

    # ── Frontend ──
    print_section "Frontend"
    echo "  1) Next.js 14+ (React, SSR, most popular)"
    echo "  2) React + Vite (SPA)"
    echo "  3) Vue / Nuxt"
    echo "  4) None (API-only / CLI)"
    echo "  5) Other / Not sure"
    read -r -p "Choose (1-5): " FE_CHOICE
    case "$FE_CHOICE" in
        1) FRONTEND="Next.js 14+ with TypeScript" ;;
        2) FRONTEND="React + Vite with TypeScript" ;;
        3) FRONTEND="Vue/Nuxt 3" ;;
        4) FRONTEND="None (no frontend)" ;;
        *) FRONTEND="TBD" ;;
    esac

    # ── Backend ──
    print_section "Backend"
    echo "  1) Next.js API Routes + tRPC (full-stack Next.js)"
    echo "  2) Express + Node.js"
    echo "  3) FastAPI + Python"
    echo "  4) Django + Python"
    echo "  5) Go (Gin/Echo)"
    echo "  6) None (static site)"
    echo "  7) Other / Not sure"
    read -r -p "Choose (1-7): " BE_CHOICE
    case "$BE_CHOICE" in
        1) BACKEND="Next.js API Routes + tRPC" ;;
        2) BACKEND="Express + Node.js" ;;
        3) BACKEND="FastAPI + Python" ;;
        4) BACKEND="Django + Python" ;;
        5) BACKEND="Go (Gin/Echo)" ;;
        6) BACKEND="None" ;;
        *) BACKEND="TBD" ;;
    esac

    # ── Database ──
    print_section "Database"
    echo "  1) PostgreSQL (most versatile)"
    echo "  2) SQLite (simple, file-based)"
    echo "  3) MongoDB (document-based)"
    echo "  4) MySQL / MariaDB"
    echo "  5) None needed"
    echo "  6) Not sure"
    read -r -p "Choose (1-6): " DB_CHOICE
    case "$DB_CHOICE" in
        1) DATABASE="PostgreSQL" ;;
        2) DATABASE="SQLite" ;;
        3) DATABASE="MongoDB" ;;
        4) DATABASE="MySQL/MariaDB" ;;
        5) DATABASE="None" ;;
        *) DATABASE="TBD" ;;
    esac

    # ── Auth ──
    print_section "Authentication"
    echo "  1) NextAuth.js (best for Next.js)"
    echo "  2) JWT + manual auth"
    echo "  3) Clerk / Auth0 (managed)"
    echo "  4) Supabase Auth"
    echo "  5) None needed"
    echo "  6) Not sure"
    read -r -p "Choose (1-6): " AUTH_CHOICE
    case "$AUTH_CHOICE" in
        1) AUTH="NextAuth.js" ;;
        2) AUTH="JWT + manual" ;;
        3) AUTH="Clerk / Auth0" ;;
        4) AUTH="Supabase Auth" ;;
        5) AUTH="None" ;;
        *) AUTH="TBD" ;;
    esac

    # ── Payments ──
    print_section "Payments"
    echo "  1) Stripe"
    echo "  2) None needed"
    read -r -p "Choose (1-2): " PAY_CHOICE
    PAYMENTS="None"
    [ "$PAY_CHOICE" = "1" ] && PAYMENTS="Stripe"

    # ── Additional Features ──
    print_section "Additional Features"
    FEATURES=""
    echo "  Select features (comma-separated, e.g. 1,3,5):"
    echo "  1) AI / Machine Learning"
    echo "  2) Real-time (WebSockets, live updates)"
    echo "  3) File uploads / storage"
    echo "  4) Email notifications"
    echo "  5) Admin dashboard"
    echo "  6) Multi-tenancy"
    echo "  7) Mobile app (React Native)"
    echo "  8) None / basic features only"
    read -r -p "Features: " FEATURES_CHOICE
    if echo "$FEATURES_CHOICE" | grep -q "1"; then FEATURES="${FEATURES}AI, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "2"; then FEATURES="${FEATURES}Realtime, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "3"; then FEATURES="${FEATURES}File Uploads, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "4"; then FEATURES="${FEATURES}Email, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "5"; then FEATURES="${FEATURES}Admin Dashboard, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "6"; then FEATURES="${FEATURES}Multi-tenancy, "; fi
    if echo "$FEATURES_CHOICE" | grep -q "7"; then FEATURES="${FEATURES}Mobile App, "; fi
    if [ -z "$FEATURES" ]; then FEATURES="Basic features"; fi

    # ── Timeline ──
    print_section "Timeline"
    echo "  1) ASAP (2-4 weeks)"
    echo "  2) Standard (1-2 months)"
    echo "  3) Complete product (3-6 months)"
    echo "  4) Not sure"
    read -r -p "Choose (1-4): " TIME_CHOICE
    case "$TIME_CHOICE" in
        1) TIMELINE="2-4 weeks";;
        2) TIMELINE="1-2 months";;
        3) TIMELINE="3-6 months";;
        *) TIMELINE="TBD";;
    esac

    # ── Budget ──
    print_section "Monthly Budget"
    echo "  1) Free tier (\$0-20/mo)"
    echo "  2) Startup (\$50-100/mo)"
    echo "  3) Business (\$100-300/mo)"
    echo "  4) Enterprise (\$500+/mo)"
    echo "  5) Not sure"
    read -r -p "Choose (1-5): " BUDGET_CHOICE
    case "$BUDGET_CHOICE" in
        1) BUDGET="\$0-20/mo (free tier)";;
        2) BUDGET="\$50-100/mo (startup)";;
        3) BUDGET="\$100-300/mo (business)";;
        4) BUDGET="\$500+/mo (enterprise)";;
        *) BUDGET="TBD";;
    esac

    # ── Now pre-fill memory ──
    prefill_memory_new "$PROJECT_DIR" "$PROJECT_NAME" "$PROJECT_DESC" "$PROJECT_TYPE" \
        "$FRONTEND" "$BACKEND" "$DATABASE" "$AUTH" "$PAYMENTS" "$FEATURES" "$TIMELINE" "$BUDGET"
}

# ─────────────────────────────────────────────────────────────
#  INTERACTIVE WIZARD — EXISTING PROJECT
# ─────────────────────────────────────────────────────────────
wizard_existing() {
    local PROJECT_DIR="$1"
    
    echo ""
    echo -e "${BOLD}🔍 Let's analyze your EXISTING project!${NC}"
    echo -e "I'll ask a few questions so the AI knows what you're working on."
    echo ""

    # ── Project Name ──
    read -r -p "Project name (from folder): " PROJECT_NAME
    PROJECT_NAME="${PROJECT_NAME:-$(basename "$PROJECT_DIR")}"

    # ── Description ──
    read -r -p "What does your project do? " PROJECT_DESC
    PROJECT_DESC="${PROJECT_DESC:-A project}"

    # ── Tech Stack ──
    print_section "Tech Stack"
    echo "  What's your tech stack? (comma-separated)"
    echo "  Examples: 'Next.js, PostgreSQL, Prisma' or 'FastAPI, SQLite, React'"
    read -r -p "Stack: " STACK_INPUT
    STACK_INPUT="${STACK_INPUT:-TBD}"

    # ── Current State ──
    print_section "Current State"
    echo "  1) Just started  — basic setup, nothing built yet"
    echo "  2) Partially built — some features working"
    echo "  3) Needs features — core works, need to add functionality"
    echo "  4) Needs fixes — bugs, performance, or technical debt"
    echo "  5) Maintenance — ongoing improvements"
    read -r -p "Choose (1-5): " STATE_CHOICE
    case "$STATE_CHOICE" in
        1) STATE="Just started — basic setup";;
        2) STATE="Partially built — some features working";;
        3) STATE="Needs features — core works";;
        4) STATE="Needs fixes — bugs / tech debt";;
        *) STATE="Maintenance — ongoing";;
    esac

    # ── Package Manager / Build ──
    print_section "Build System"
    echo "  1) npm"
    echo "  2) yarn"
    echo "  3) pnpm"
    echo "  4) cargo (Rust)"
    echo "  5) pip/poetry (Python)"
    echo "  6) go build (Go)"
    echo "  7) Not sure / other"
    read -r -p "Choose (1-7): " BUILD_CHOICE
    case "$BUILD_CHOICE" in
        1) BUILD="npm";;
        2) BUILD="yarn";;
        3) BUILD="pnpm";;
        4) BUILD="cargo";;
        5) BUILD="pip/poetry";;
        6) BUILD="go build";;
        *) BUILD="unknown";;
    esac

    # ── What Help Needed ──
    print_section "What do you need?"
    echo "  1) Add new features"
    echo "  2) Fix bugs / issues"
    echo "  3) Improve architecture / refactor"
    echo "  4) Add tests"
    echo "  5) Setup CI/CD / DevOps"
    echo "  6) Performance optimization"
    echo "  7) Security audit"
    echo "  8) A mix of the above"
    read -r -p "Choose (1-8): " HELP_CHOICE
    case "$HELP_CHOICE" in
        1) HELP_NEEDED="Add new features";;
        2) HELP_NEEDED="Fix bugs / issues";;
        3) HELP_NEEDED="Architecture / refactoring";;
        4) HELP_NEEDED="Add tests";;
        5) HELP_NEEDED="DevOps / CI-CD";;
        6) HELP_NEEDED="Performance optimization";;
        7) HELP_NEEDED="Security audit";;
        *) HELP_NEEDED="General development";;
    esac

    # ── Conventions ──
    print_section "Conventions"
    echo "  Any specific conventions or patterns to follow?"
    echo "  (e.g. 'Atomic design', 'Feature-first folders', 'Clean architecture')"
    read -r -p "Conventions (optional): " CONVENTIONS
    CONVENTIONS="${CONVENTIONS:-Standard project conventions}"

    # ── Try to detect some things from the project ──
    detect_from_project "$PROJECT_DIR"

    # ── Pre-fill memory ──
    prefill_memory_existing "$PROJECT_DIR" "$PROJECT_NAME" "$PROJECT_DESC" \
        "$STACK_INPUT" "$STATE" "$BUILD" "$HELP_NEEDED" "$CONVENTIONS"
}

# ─────────────────────────────────────────────────────────────
#  AUTO-DETECT from project files
# ─────────────────────────────────────────────────────────────
detect_from_project() {
    local PROJECT_DIR="$1"
    DETECTED_FE=""
    DETECTED_BE=""
    DETECTED_DB=""
    DETECTED_BUILD=""

    # package.json → Node.js project
    if [ -f "$PROJECT_DIR/package.json" ]; then
        if grep -q '"next"' "$PROJECT_DIR/package.json" 2>/dev/null; then
            DETECTED_FE="Next.js"
            DETECTED_BE="Next.js API Routes"
        fi
        if grep -q '"express"' "$PROJECT_DIR/package.json" 2>/dev/null; then
            [ -z "$DETECTED_BE" ] && DETECTED_BE="Express"
        fi
        if grep -q '"vite"' "$PROJECT_DIR/package.json" 2>/dev/null; then
            DETECTED_FE="React + Vite"
        fi
        if grep -q '"prisma"' "$PROJECT_DIR/package.json" 2>/dev/null; then
            DETECTED_DB="PostgreSQL + Prisma"
        fi
        if grep -q '"typeorm"' "$PROJECT_DIR/package.json" 2>/dev/null; then
            [ -z "$DETECTED_DB" ] && DETECTED_DB="TypeORM"
        fi
        DETECTED_BUILD="npm"
        [ -f "$PROJECT_DIR/yarn.lock" ] && DETECTED_BUILD="yarn"
        [ -f "$PROJECT_DIR/pnpm-lock.yaml" ] && DETECTED_BUILD="pnpm"
    fi

    # Python projects
    if [ -f "$PROJECT_DIR/requirements.txt" ] || [ -f "$PROJECT_DIR/pyproject.toml" ]; then
        if grep -q "fastapi\|uvicorn" "$PROJECT_DIR/requirements.txt" 2>/dev/null || \
           grep -q "fastapi\|uvicorn" "$PROJECT_DIR/pyproject.toml" 2>/dev/null; then
            DETECTED_BE="FastAPI"
        fi
        if grep -q "django" "$PROJECT_DIR/requirements.txt" 2>/dev/null || \
           grep -q "django" "$PROJECT_DIR/pyproject.toml" 2>/dev/null; then
            DETECTED_BE="Django"
        fi
        if [ -z "$DETECTED_BUILD" ]; then
            DETECTED_BUILD="pip"
            [ -f "$PROJECT_DIR/poetry.lock" ] && DETECTED_BUILD="poetry"
        fi
    fi

    # Go projects
    if [ -f "$PROJECT_DIR/go.mod" ]; then
        DETECTED_BE="Go"
        DETECTED_BUILD="go build"
    fi

    # Rust projects
    if [ -f "$PROJECT_DIR/Cargo.toml" ]; then
        DETECTED_BE="Rust"
        DETECTED_BUILD="cargo"
    fi

    # Database detection
    if [ -f "$PROJECT_DIR/docker-compose.yml" ] || [ -f "$PROJECT_DIR/docker-compose.yaml" ]; then
        if grep -qi "postgres" "$PROJECT_DIR/docker-compose.yml" 2>/dev/null || \
           grep -qi "postgres" "$PROJECT_DIR/docker-compose.yaml" 2>/dev/null; then
            [ -z "$DETECTED_DB" ] && DETECTED_DB="PostgreSQL"
        fi
        if grep -qi "mysql\|mariadb" "$PROJECT_DIR/docker-compose.yml" 2>/dev/null || \
           grep -qi "mysql\|mariadb" "$PROJECT_DIR/docker-compose.yaml" 2>/dev/null; then
            [ -z "$DETECTED_DB" ] && DETECTED_DB="MySQL/MariaDB"
        fi
        if grep -qi "mongo" "$PROJECT_DIR/docker-compose.yml" 2>/dev/null || \
           grep -qi "mongo" "$PROJECT_DIR/docker-compose.yaml" 2>/dev/null; then
            [ -z "$DETECTED_DB" ] && DETECTED_DB="MongoDB"
        fi
    fi

    # Git info
    if [ -d "$PROJECT_DIR/.git" ]; then
        GIT_BRANCH="$(cd "$PROJECT_DIR" && git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"
        GIT_REPO="$(cd "$PROJECT_DIR" && git remote get-url origin 2>/dev/null || echo "")"
    fi
}

# ─────────────────────────────────────────────────────────────
#  PRE-FILL MEMORY — New Project
# ─────────────────────────────────────────────────────────────
prefill_memory_new() {
    local PROJECT_DIR="$1" NAME="$2" DESC="$3" TYPE="$4"
    local FE="$5" BE="$6" DB="$7" AUTH="$8" PAY="$9"
    local FEAT="${10}" TIME="${11}" BUD="${12}"

    mkdir -p "$PROJECT_DIR/.memory"
    mkdir -p "$PROJECT_DIR/.opencode/agents"

    # ── project.md ──
    cat > "$PROJECT_DIR/.memory/project.md" << EOMD
# Project Context — ${NAME}

## Description
${DESC}

## Type
${TYPE}

## Stack
- Frontend: ${FE}
- Backend: ${BE}
- Database: ${DB}
- Auth: ${AUTH}
- Payments: ${PAY}
- Deploy: TBD (configure during setup)

## Additional Features
${FEAT}

## Timeline
${TIME}

## Budget
${BUD}

## Structure
- \`src/\` - Source code
- \`src/app/\` - Application routes / pages
- \`src/components/\` - Reusable components
- \`src/lib/\` - Shared utilities
- \`prisma/\` - Database schema (if using Prisma)
- \`public/\` - Static assets

## Key Files
- \`package.json\` - Dependencies and scripts
- \`tsconfig.json\` - TypeScript configuration
- \`.env.local\` - Environment variables

## Conventions
- TypeScript strict mode
- Functional components with hooks
- Server components by default (Next.js App Router)
- Prisma for database access
EOMD

    # ── decisions.md ──
    cat > "$PROJECT_DIR/.memory/decisions.md" << EOMD
# Architecture Decisions — ${NAME}

## Initial Decisions

### Stack: ${FE} + ${BE} + ${DB}
- **Rationale**: Selected via setup wizard based on project requirements
- **Alternatives considered**: Standard options presented during setup

### Project Type: ${TYPE}
- **Rationale**: Determines architecture patterns and deployment strategy

## Pending Decisions
- Exact deployment platform (Vercel, Railway, etc.)
- Third-party service choices (analytics, monitoring, etc.)
- Detailed component architecture
EOMD

    # ── progress.md ──
    cat > "$PROJECT_DIR/.memory/progress.md" << EOMD
# Progress — ${NAME}

## Status
🚀 **New project** — Just created via setup wizard

## Completed
- [x] Project initialized
- [x] Memory system set up
- [x] Stack selected: ${FE} + ${BE} + ${DB}

## Current
- [ ] Waiting for AI to analyze and create development plan

## Next Steps
1. Open this project in your AI tool
2. Say: "Create a development plan for ${NAME}"
3. Or: "Start building ${NAME}"
EOMD

    # ── errors.md (pre-filled with common errors) ──
    cat > "$PROJECT_DIR/.memory/errors.md" << EOMD
# Errors to Avoid — ${NAME}

## Common Pitfalls (${FE} + ${BE} + ${DB})
- [Add errors you encounter here with their fixes]

## TypeScript
- Using \`any\` type — use proper types instead
- Missing null checks — enable strict null checks

## Database
- N+1 queries — use Prisma \`include\` or \`select\` to eager-load relations
- Missing migrations — always run \`prisma migrate dev\` after schema changes
EOMD

    # ── successes.md (pre-filled with patterns) ──
    cat > "$PROJECT_DIR/.memory/successes.md" << EOMD
# What Works Well — ${NAME}

## Recommended Patterns
- [Add patterns that work well here]

## Stack Patterns
- Server components for data fetching (Next.js App Router)
- API routes in \`src/app/api/\` for backend logic
- Prisma for type-safe database queries
EOMD

    # ── Copy agents ──
    cp "$REPO_DIR/agents/"*.md "$PROJECT_DIR/.opencode/agents/"
    cp "$REPO_DIR/templates/agents/"*-specialist.md "$PROJECT_DIR/.opencode/agents/"
    cp "$REPO_DIR/templates/agents/ai-engineer.md" "$PROJECT_DIR/.opencode/agents/"
    cp "$REPO_DIR/templates/agents/qa-engineer.md" "$PROJECT_DIR/.opencode/agents/"

    # ── Copy framework templates if matching ──
    if echo "$FE" | grep -qi "nextjs"; then
        cp "$REPO_DIR/templates/agents/nextjs.md" "$PROJECT_DIR/.opencode/agents/" 2>/dev/null || true
    fi
    if echo "$BE" | grep -qi "fastapi\|django"; then
        cp "$REPO_DIR/templates/agents/python-fastapi.md" "$PROJECT_DIR/.opencode/agents/" 2>/dev/null || true
        cp "$REPO_DIR/templates/agents/python-django.md" "$PROJECT_DIR/.opencode/agents/" 2>/dev/null || true
    fi
    if echo "$BE" | grep -qi "go"; then
        cp "$REPO_DIR/templates/agents/go.md" "$PROJECT_DIR/.opencode/agents/" 2>/dev/null || true
    fi
    if echo "$TYPE" | grep -qi "mobile"; then
        cp "$REPO_DIR/templates/agents/react-native.md" "$PROJECT_DIR/.opencode/agents/" 2>/dev/null || true
    fi

    create_tool_configs "$PROJECT_DIR" "$NAME"
}

# ─────────────────────────────────────────────────────────────
#  PRE-FILL MEMORY — Existing Project
# ─────────────────────────────────────────────────────────────
prefill_memory_existing() {
    local PROJECT_DIR="$1" NAME="$2" DESC="$3" STACK="$4"
    local STATE="$5" BUILD="$6" HELP="$7" CONV="$8"

    mkdir -p "$PROJECT_DIR/.memory"
    mkdir -p "$PROJECT_DIR/.opencode/agents"

    # ── project.md ──
    cat > "$PROJECT_DIR/.memory/project.md" << EOMD
# Project Context — ${NAME}

## Description
${DESC}

## Stack
${STACK}

## Current State
${STATE}

## Build System
${BUILD}

## Priority Needs
${HELP}

## Conventions
${CONV}

## Structure
${DETECTED_STRUCTURE:-"- \`src/\` - Source code (auto-detected)"}

## Key Files
${DETECTED_KEYFILES:-"- \`package.json\` - Dependencies"}

## Git
${GIT_REPO:+Remote: ${GIT_REPO}}
${GIT_BRANCH:+Branch: ${GIT_BRANCH}}
EOMD

    # ── progress.md ──
    cat > "$PROJECT_DIR/.memory/progress.md" << EOMD
# Progress — ${NAME}

## Status
🔍 **Existing project** — Analyzed via setup wizard

## State
${STATE}

## Priority
${HELP}

## Completed
- [x] Project detected and configured

## Current
- [ ] AI needs to analyze the codebase and create a plan

## Next Steps
1. Open this project in your AI tool
2. Say: "Analyze this project and help me ${HELP}"
3. Or: "What should I work on next?"
EOMD

    # ── decisions.md (minimal for existing) ──
    cat > "$PROJECT_DIR/.memory/decisions.md" << EOMD
# Architecture Decisions — ${NAME}

## Project Context
- Existing project with existing architecture decisions
- The AI should analyze the codebase to understand current patterns
- Document new decisions here as they are made
EOMD

    # ── errors.md ──
    cat > "$PROJECT_DIR/.memory/errors.md" << EOMD
# Errors to Avoid — ${NAME}

## Stack-Specific (${STACK})
- [The AI will discover and document errors during development]
EOMD

    # ── successes.md ──
    cat > "$PROJECT_DIR/.memory/successes.md" << EOMD
# What Works Well — ${NAME}

## Current Patterns
- [The AI will discover and document patterns during development]
EOMD

    # ── Copy all agents ──
    cp "$REPO_DIR/agents/"*.md "$PROJECT_DIR/.opencode/agents/"
    cp "$REPO_DIR/templates/agents/"*.md "$PROJECT_DIR/.opencode/agents/"

    create_tool_configs "$PROJECT_DIR" "$NAME"
}

# ─────────────────────────────────────────────────────────────
#  CREATE TOOL CONFIGURATIONS
# ─────────────────────────────────────────────────────────────
create_tool_configs() {
    local PROJECT_DIR="$1" NAME="$2"

    # ── opencode.jsonc ──
    cat > "$PROJECT_DIR/opencode.jsonc" << 'OPEOC'
{
  // ═══════════════════════════════════════════════
  //  AI Software House — CONFIG IB RIDA
  //  Go Plan (task critiche) + Free (supporto)
  // ═══════════════════════════════════════════════
  //
  //  GO PLAN: orchestrator, builder, backend,
  //    frontend, database, security
  //  ZENMUX FREE: planner, reviewer, documenter,
  //    devops, QA, testing, UI, mobile, etc.

  "default_agent": "orchestrator",
  "auto_apply": false,
  "model": "opencode/deepseek-v4-flash",
  "small_model": "zenmux/deepseek/deepseek-chat",
  "skills": [
    "opencode-agents"
  ],
  "rules": [
    "Always read .memory/project.md before starting work",
    "Read .memory/errors.md to avoid known mistakes",
    "Read .memory/successes.md for patterns that work",
    "Read .memory/progress.md for current status",
    "Read .memory/decisions.md for architecture decisions",
    "After completing work, update all .memory/ files",
    "Use the orchestrator agent as the primary interface"
  ],

  // ── Per-Agent Configuration ──
  "agent": {
    // ── GO PLAN (task critiche) ──
    "orchestrator":       { "model": "opencode/gpt-5-codex",            "temperature": 0.3 },
    "builder":            { "model": "opencode/deepseek-v4-flash",      "temperature": 0.2 },
    "backend-specialist": { "model": "opencode/deepseek-v4-flash",      "temperature": 0.2 },
    "frontend-specialist":{ "model": "opencode/deepseek-v4-flash",      "temperature": 0.2 },
    "database-specialist":{ "model": "opencode/deepseek-v4-flash",      "temperature": 0.2 },
    "security-specialist":{ "model": "opencode/deepseek-v4-flash",      "temperature": 0.1 },

    // ── ZENMUX FREE (supporto) ──
    "planner":            { "model": "zenmux/deepseek/deepseek-v3.2",  "temperature": 0.3 },
    "reviewer":           { "model": "zenmux/google/gemini-2.5-flash", "temperature": 0.1 },
    "documenter":         { "model": "zenmux/qwen/qwen3.5-plus",       "temperature": 0.2 },
    "ai-engineer":        { "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "auth-specialist":    { "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "data-specialist":    { "model": "zenmux/deepseek/deepseek-v3.2",  "temperature": 0.2 },
    "devops-specialist":  { "model": "zenmux/google/gemini-2.5-flash", "temperature": 0.2 },
    "integration-specialist": { "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "mobile-specialist":  { "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "payment-specialist": { "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "performance-specialist": { "model": "zenmux/google/gemini-2.5-flash","temperature": 0.2 },
    "qa-engineer":        { "model": "zenmux/google/gemini-2.5-flash", "temperature": 0.1 },
    "realtime-specialist":{ "model": "zenmux/deepseek/deepseek-v4-flash","temperature": 0.2 },
    "testing-specialist": { "model": "zenmux/google/gemini-2.5-flash", "temperature": 0.1 },
    "ui-specialist":      { "model": "zenmux/qwen/qwen3.5-plus",       "temperature": 0.2 }
  }
}
OPEOC
    echo -e "${GREEN}  ✅ opencode.jsonc${NC}"

    # ── CLAUDE.md ──
    cat > "$PROJECT_DIR/CLAUDE.md" << CLAUDE
# AI Software House — ${NAME}

## Memory System
Before starting work:
1. Read .memory/project.md — Project context
2. Read .memory/errors.md — Mistakes to avoid
3. Read .memory/successes.md — Patterns that work
4. Read .memory/progress.md — Current status
5. Read .memory/decisions.md — Architecture decisions

After completing work:
1. Update .memory/progress.md
2. Add new errors to .memory/errors.md
3. Add new successes to .memory/successes.md
4. Update .memory/decisions.md if needed

## Your Role
You are the CEO of an AI software house. Your job:
1. Analyze the project
2. Create development plans
3. Build specialized teams from .opencode/agents/
4. Execute tasks using the \`task\` tool for each agent
5. Verify quality
6. Update memory
7. Deliver results

## Workflow
- For NEW projects: Plan → Build → Review → Document
- For EXISTING projects: Analyze → Plan → Execute → Verify
- Always work in parallel when possible
CLAUDE
    echo -e "${GREEN}  ✅ CLAUDE.md${NC}"

    # ── .cursorrules ──
    cp "$PROJECT_DIR/CLAUDE.md" "$PROJECT_DIR/.cursorrules"
    echo -e "${GREEN}  ✅ .cursorrules${NC}"

    # ── PLAN.md ──
    cat > "$PROJECT_DIR/PLAN.md" << PLAN
# Development Plan — ${NAME}

## Project Overview
<!-- Filled by AI after analyzing the project -->

## Milestones

### Phase 1: Foundation
- [ ] Project analysis and planning
- [ ] Core setup and configuration
- [ ] Database schema design

### Phase 2: Core Features
- [ ] Authentication and user management
- [ ] Main feature implementation
- [ ] API and data layer

### Phase 3: Enhancement
- [ ] Additional features
- [ ] Testing
- [ ] Performance optimization

### Phase 4: Launch
- [ ] Deployment configuration
- [ ] Final testing and QA
- [ ] Documentation

## How to Start
Open this project in your AI tool and say:
- "Analyze this project and create a detailed plan"
- "Start building the first feature"
- "What should I work on next?"
PLAN
    echo -e "${GREEN}  ✅ PLAN.md${NC}"
}


# ─────────────────────────────────────────────────────────────
#  MAIN
# ─────────────────────────────────────────────────────────────
print_header

MODE="${1:-auto}"

case "$MODE" in
    "new")
        # Setup new project with wizard
        PROJECT_DIR="$2"
        if [ -z "$PROJECT_DIR" ]; then
            read -r -p "Project path: " PROJECT_DIR
            PROJECT_DIR="${PROJECT_DIR//\~/$HOME}"
        fi
        if [ ! -d "$PROJECT_DIR" ]; then
            mkdir -p "$PROJECT_DIR"
            echo -e "${GREEN}  📁 Created ${PROJECT_DIR}${NC}"
        fi
        # Install globally first (if not already)
        if [ ! -d "$OPENCODE_AGENTS_DIR" ] || [ -z "$(ls -A "$OPENCODE_AGENTS_DIR" 2>/dev/null)" ]; then
            echo -e "${YELLOW}First-time setup: installing globally...${NC}"
            install_global
        fi
        wizard_new "$PROJECT_DIR"
        ;;

    "existing")
        # Setup existing project with wizard
        PROJECT_DIR="$2"
        if [ -z "$PROJECT_DIR" ]; then
            read -r -p "Project path: " PROJECT_DIR
            PROJECT_DIR="${PROJECT_DIR//\~/$HOME}"
        fi
        if [ ! -d "$PROJECT_DIR" ]; then
            echo -e "${RED}Error: Directory not found: ${PROJECT_DIR}${NC}"
            exit 1
        fi
        # Install globally first (if not already)
        if [ ! -d "$OPENCODE_AGENTS_DIR" ] || [ -z "$(ls -A "$OPENCODE_AGENTS_DIR" 2>/dev/null)" ]; then
            echo -e "${YELLOW}First-time setup: installing globally...${NC}"
            install_global
        fi
        wizard_existing "$PROJECT_DIR"
        ;;

    "auto"|"")
        # No args or just "auto" → detect or install
        if [ -z "$2" ]; then
            # No project path → interactive menu
            echo -e "${BOLD}Welcome to the AI Software House!${NC}"
            echo ""
            echo "What would you like to do?"
            echo "  ${BOLD}1${NC}) Install globally (for all projects)"
            echo "  ${BOLD}2${NC}) Set up a new project with wizard"
            echo "  ${BOLD}3${NC}) Set up an existing project with wizard"
            echo "  ${BOLD}4${NC}) Both: install globally + set up a project"
            echo ""
            read -r -p "Choose (1-4): " CHOICE

            case "$CHOICE" in
                2)
                    read -r -p "New project path: " P
                    P="${P//\~/$HOME}"
                    mkdir -p "$P"
                    wizard_new "$P"
                    ;;
                3)
                    read -r -p "Existing project path: " P
                    P="${P//\~/$HOME}"
                    if [ ! -d "$P" ]; then
                        echo -e "${RED}Directory not found${NC}"
                        exit 1
                    fi
                    wizard_existing "$P"
                    ;;
                4)
                    install_global
                    echo ""
                    read -r -p "Project path to set up: " P
                    P="${P//\~/$HOME}"
                    if [ ! -d "$P" ]; then
                        mkdir -p "$P"
                        wizard_new "$P"
                    else
                        # Check if it's a new or existing project
                        if [ -f "$P/package.json" ] || [ -f "$P/go.mod" ] || [ -f "$P/Cargo.toml" ] || [ -f "$P/requirements.txt" ]; then
                            wizard_existing "$P"
                        else
                            wizard_new "$P"
                        fi
                    fi
                    ;;
                *)
                    install_global
                    ;;
            esac
        else
            # Path provided → auto-detect new vs existing
            PROJECT_DIR="$2"
            if [ ! -d "$PROJECT_DIR" ]; then
                mkdir -p "$PROJECT_DIR"
                echo -e "${GREEN}  📁 Created ${PROJECT_DIR}${NC}"
                install_global
                wizard_new "$PROJECT_DIR"
            elif [ -f "$PROJECT_DIR/package.json" ] || [ -f "$PROJECT_DIR/go.mod" ] || \
                 [ -f "$PROJECT_DIR/Cargo.toml" ] || [ -f "$PROJECT_DIR/requirements.txt" ] || \
                 [ -f "$PROJECT_DIR/pyproject.toml" ] || [ -f "$PROJECT_DIR/composer.json" ]; then
                install_global
                wizard_existing "$PROJECT_DIR"
            elif [ "$(ls -A "$PROJECT_DIR" 2>/dev/null | wc -l)" -gt 0 ]; then
                # Has files but no standard project files
                install_global
                wizard_existing "$PROJECT_DIR"
            else
                install_global
                wizard_new "$PROJECT_DIR"
            fi
        fi
        ;;

    *)
        # Unknown mode, treat as path
        PROJECT_DIR="$MODE"
        if [ ! -d "$PROJECT_DIR" ]; then
            mkdir -p "$PROJECT_DIR"
            install_global
            wizard_new "$PROJECT_DIR"
        else
            install_global
            # Check if it looks like a project
            if [ -f "$PROJECT_DIR/package.json" ] || [ -d "$PROJECT_DIR/src" ]; then
                wizard_existing "$PROJECT_DIR"
            else
                wizard_new "$PROJECT_DIR"
            fi
        fi
        ;;
esac

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✅ Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BOLD}Open your project and say:${NC}"
echo ""
echo -e "  ${CYAN}\"Create a plan for my project\"${NC}"
echo -e "  ${CYAN}\"Start building the first feature\"${NC}"
echo -e "  ${CYAN}\"Analyze my codebase and suggest next steps\"${NC}"
echo ""
