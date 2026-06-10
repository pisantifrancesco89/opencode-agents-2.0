#!/bin/bash

# ─────────────────────────────────────────────────────────────
#  Universal AI Software House - One-Line Installer
#  Usage:
#    curl -fsSL https://raw.githubusercontent.com/pisantifrancesco89/opencode-agents-2.0/main/install.sh | bash
#    curl -fsSL https://raw.githubusercontent.com/pisantifrancesco89/opencode-agents-2.0/main/install.sh | bash -s -- /path/to/my-project
# ─────────────────────────────────────────────────────────────

set -e

# ── Colors ──
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

INSTALL_DIR="${HOME}/.opencode-agents"
REPO_URL="https://github.com/pisantifrancesco89/opencode-agents-2.0.git"

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Universal AI Software House - Installer${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ── Detect existing installation ──
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}Installation found at ${INSTALL_DIR}${NC}"
    echo -e "${YELLOW}Updating to latest version...${NC}"
    cd "$INSTALL_DIR"
    git pull origin main 2>/dev/null || {
        echo -e "${YELLOW}Git pull failed, re-cloning...${NC}"
        cd "$HOME"
        rm -rf "$INSTALL_DIR"
        git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
    }
else
    echo -e "${YELLOW}Downloading OpenCode Agents...${NC}"
    git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
fi

echo -e "${GREEN}✅ Repository downloaded to ${INSTALL_DIR}${NC}"
echo ""

# ── Run setup ──
if [ -z "$1" ]; then
    # No project dir → interactive mode: ask if they want to set up a project
    echo -e "${CYAN}Do you want to set up a project now?${NC}"
    echo -e "  ${BOLD}1${NC}) Yes, set up a ${BOLD}new project${NC}"
    echo -e "  ${BOLD}2${NC}) Yes, set up an ${BOLD}existing project${NC}"
    echo -e "  ${BOLD}3${NC}) No, just install globally"
    echo ""
    read -r -p "Choose (1/2/3): " SETUP_CHOICE

    case "$SETUP_CHOICE" in
        1)
            read -r -p "Project path (e.g. ~/my-project): " PROJECT_PATH
            # Remove quotes if user typed them
            PROJECT_PATH="${PROJECT_PATH%\"}"
            PROJECT_PATH="${PROJECT_PATH#\"}"
            PROJECT_PATH="${PROJECT_PATH%\'}"
            PROJECT_PATH="${PROJECT_PATH#\'}"
            PROJECT_PATH="${PROJECT_PATH//\~/$HOME}"
            bash "$INSTALL_DIR/setup.sh" "new" "$PROJECT_PATH"
            ;;
        2)
            read -r -p "Existing project path (e.g. ~/my-existing-app): " PROJECT_PATH
            PROJECT_PATH="${PROJECT_PATH%\"}"
            PROJECT_PATH="${PROJECT_PATH#\"}"
            PROJECT_PATH="${PROJECT_PATH%\'}"
            PROJECT_PATH="${PROJECT_PATH#\'}"
            PROJECT_PATH="${PROJECT_PATH//\~/$HOME}"
            bash "$INSTALL_DIR/setup.sh" "existing" "$PROJECT_PATH"
            ;;
        *)
            bash "$INSTALL_DIR/setup.sh"
            ;;
    esac
else
    # Project dir provided as argument
    PROJECT_PATH="$1"
    bash "$INSTALL_DIR/setup.sh" "$PROJECT_PATH"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "Open your project in your AI tool and say:"
echo -e "  ${BOLD}\"I want to build...\"${NC}  → for new projects"
echo -e "  ${BOLD}\"Help me add...\"${NC}     → for existing projects"
echo ""
