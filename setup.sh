#!/bin/bash

# OpenCode Agents 2.0 - Quick Setup Script

set -e

echo "🚀 OpenCode Agents 2.0 - Setup"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 non trovato. Installalo da python.org"
    exit 1
fi

# Check pip
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 non trovato. Installa pip3."
    exit 1
fi

# Install dependencies
echo "📦 Installazione dipendenze..."
pip3 install -r requirements.txt --break-system-packages 2>/dev/null || pip3 install -r requirements.txt

# Make wizard executable
chmod +x wizard/wizard.py

echo ""
echo "✅ Setup completato!"
echo ""
echo "🎯 Per iniziare:"
echo "   python3 wizard/wizard.py"
echo ""
echo "📚 Documentazione:"
echo "   cat README.md"
echo ""
