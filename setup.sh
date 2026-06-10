#!/bin/bash

# Universal AI Software House - Setup Script
# Usage: 
#   ./setup.sh              (install globally for OpenCode)
#   ./setup.sh /path/to/project   (setup a specific project)

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENCODE_SKILL_DIR="$HOME/.config/opencode/skills/opencode-agents"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_header() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  Universal AI Software House - Setup${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

install_global() {
    echo -e "${YELLOW}Step 1: Installing OpenCode skill (global)...${NC}"
    
    mkdir -p "$OPENCODE_SKILL_DIR"
    cp "$REPO_DIR/skills/opencode-agents/SKILL.md" "$OPENCODE_SKILL_DIR/"
    
    echo -e "${GREEN}✅ Skill installed to: $OPENCODE_SKILL_DIR${NC}"
    echo ""
    echo -e "${YELLOW}Step 2: Testing a project...${NC}"
    echo ""
    echo "Now you can use the system in any project:"
    echo ""
    echo "  1. Create a new project:"
    echo "     mkdir ~/my-project && cd ~/my-project"
    echo ""
    echo "  2. Setup the project:"
    echo "     $REPO_DIR/setup.sh ~/my-project"
    echo ""
    echo "  3. Start talking to the AI:"
    echo '     "I want to create a SaaS for X"'
    echo ""
}

setup_project() {
    local PROJECT_DIR="$1"
    
    if [ -z "$PROJECT_DIR" ]; then
        echo -e "${YELLOW}Usage: $0 /path/to/project${NC}"
        exit 1
    fi
    
    if [ ! -d "$PROJECT_DIR" ]; then
        echo -e "${YELLOW}Creating project directory...${NC}"
        mkdir -p "$PROJECT_DIR"
    fi
    
    echo -e "${YELLOW}Setting up project: $PROJECT_DIR${NC}"
    echo ""
    
    # Copy memory system
    echo -e "${YELLOW}Step 1: Copying memory system...${NC}"
    if [ -d "$PROJECT_DIR/.memory" ]; then
        echo "  .memory/ already exists, skipping..."
    else
        cp -r "$REPO_DIR/memory/" "$PROJECT_DIR/.memory/"
        echo -e "${GREEN}✅ Memory system copied${NC}"
    fi
    
    # Copy agents (for OpenCode)
    echo -e "${YELLOW}Step 2: Copying agents...${NC}"
    if [ -d "$PROJECT_DIR/.opencode/agents" ]; then
        echo "  .opencode/agents/ already exists, skipping..."
    else
        mkdir -p "$PROJECT_DIR/.opencode/agents"
        cp "$REPO_DIR/agents/"*.md "$PROJECT_DIR/.opencode/agents/"
        echo -e "${GREEN}✅ Agents copied${NC}"
    fi
    
    # Copy CLAUDE.md for Claude Code users
    echo -e "${YELLOW}Step 3: Creating CLAUDE.md (for Claude Code)...${NC}"
    if [ -f "$PROJECT_DIR/CLAUDE.md" ]; then
        echo "  CLAUDE.md already exists, skipping..."
    else
        cat > "$PROJECT_DIR/CLAUDE.md" << 'EOF'
# AI Software House

## Memory System

Before starting any work:
1. Read .memory/project.md for project context
2. Read .memory/errors.md to avoid mistakes
3. Read .memory/successes.md for patterns that work
4. Read .memory/progress.md for current status
5. Read .memory/decisions.md for architecture decisions

After completing work:
1. Update .memory/progress.md
2. Add new errors to .memory/errors.md
3. Add new successes to .memory/successes.md
4. Update .memory/decisions.md if needed

## Agent Role

You are the CEO of an AI software house. Your job is to:
1. Analyze projects
2. Create plans
3. Build teams
4. Execute tasks
5. Verify quality
6. Update memory
7. Deliver results
EOF
        echo -e "${GREEN}✅ CLAUDE.md created${NC}"
    fi
    
    # Copy .cursorrules for Cursor users
    echo -e "${YELLOW}Step 4: Creating .cursorrules (for Cursor)...${NC}"
    if [ -f "$PROJECT_DIR/.cursorrules" ]; then
        echo "  .cursorrules already exists, skipping..."
    else
        cp "$PROJECT_DIR/CLAUDE.md" "$PROJECT_DIR/.cursorrules"
        echo -e "${GREEN}✅ .cursorrules created${NC}"
    fi
    
    # Create PLAN.md
    echo -e "${YELLOW}Step 5: Creating PLAN.md...${NC}"
    if [ -f "$PROJECT_DIR/PLAN.md" ]; then
        echo "  PLAN.md already exists, skipping..."
    else
        cat > "$PROJECT_DIR/PLAN.md" << 'EOF'
# Project Plan

## Status
Waiting for AI to analyze project and create plan.

## How to Start
Say to the AI: "Analyze this project and create a development plan"

## Expected Output
- Stack analysis
- Gap identification
- Milestone plan
- Task breakdown
EOF
        echo -e "${GREEN}✅ PLAN.md created${NC}"
    fi
    
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  Project setup complete!${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "Files created:"
    echo "  .memory/project.md      - Project context"
    echo "  .memory/errors.md       - Errors to avoid"
    echo "  .memory/successes.md    - What works well"
    echo "  .memory/progress.md     - Current status"
    echo "  .memory/decisions.md    - Architecture decisions"
    echo "  .opencode/agents/       - AI agents"
    echo "  CLAUDE.md               - Claude Code instructions"
    echo "  .cursorrules            - Cursor instructions"
    echo "  PLAN.md                 - Development roadmap"
    echo ""
    echo "Next steps:"
    echo "  1. Open the project in your AI tool"
    echo '  2. Say: "Analyze this project and create a plan"'
    echo '  3. Or: "I want to create a SaaS for X"'
    echo ""
}

# Main
print_header

if [ -z "$1" ]; then
    install_global
else
    setup_project "$1"
fi
