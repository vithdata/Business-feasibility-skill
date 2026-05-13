#!/bin/bash
# Hermes Business Framework — Setup Script
# Run: chmod +x install.sh && ./install.sh

set -e

echo "═══════════════════════════════════════════════"
echo "  Hermes Business Framework Setup"
echo "  เจ๊งในกระดาษ — Feasibility Workflow"
echo "═══════════════════════════════════════════════"

# ── Obsidian Vault Setup ───────────────────────────────────────────────────────
echo ""
echo "📁 Obsidian Vault Setup"
echo "------------------------"

read -p "Do you already have an Obsidian vault? (y/n): " HAS_VAULT

if [[ "$HAS_VAULT" == "y" ]]; then
    read -p "Enter vault name (default: vegapunk): " VAULT_NAME
    VAULT_NAME=${VAULT_NAME:-vegapunk}

    OBSIDIAN_PATH="$HOME/obsidian-vault/$VAULT_NAME"

    if [[ -d "$OBSIDIAN_PATH" ]]; then
        echo "✅ Vault found: $OBSIDIAN_PATH"
    else
        echo "❌ Vault not found at: $OBSIDIAN_PATH"
        read -p "Create it? (y/n): " CREATE_VAULT
        if [[ "$CREATE_VAULT" == "y" ]]; then
            mkdir -p "$OBSIDIAN_PATH"
            echo "✅ Created: $OBSIDIAN_PATH"
        fi
    fi
else
    VAULT_NAME="vegapunk"
    OBSIDIAN_PATH="$HOME/obsidian-vault/$VAULT_NAME"
    mkdir -p "$OBSIDIAN_PATH"
    echo "✅ Created new vault: $OBSIDIAN_PATH"
fi

# ── Create Directory Structure ──────────────────────────────────────────────────
echo ""
echo "📂 Creating directory structure..."
echo "------------------------"

mkdir -p "$OBSIDIAN_PATH/Business/Ventures"
mkdir -p "$OBSIDIAN_PATH/Business/Templates"
mkdir -p "$OBSIDIAN_PATH/Business/Research"
mkdir -p "reports"
mkdir -p "workflows/feasibility-study/guards"
mkdir -p "workflows/feasibility-study/states"
mkdir -p "workflows/feasibility-study/memory"
mkdir -p "workflows/feasibility-study/renderers"
mkdir -p "skills"
mkdir -p "docs"
mkdir -p "examples"

echo "✅ Directories created"

# ── Copy Obsidian Templates ─────────────────────────────────────────────────────
if [[ -f "obsidian/vault-template/venture-template.md" ]]; then
    cp obsidian/vault-template/venture-template.md "$OBSIDIAN_PATH/Business/Templates/"
    echo "✅ Venture template copied to Obsidian"
fi

# ── Generate config.yaml ───────────────────────────────────────────────────────
echo ""
echo "⚙️  Generating config.yaml..."

cat > config.yaml << 'EOF'
# Hermes Business Framework — Configuration

obsidian:
  vault_path: "{{OBSIDIAN_PATH}}"
  default_vault: "{{VAULT_NAME}}"
  ventures_dir: Business/Ventures
  templates_dir: Business/Templates
  research_dir: Business/Research

workflow:
  start_state: intake
  default_phases: [intake, grill, research, modeling, risk, recommendation]
  max_turns_per_phase: 4
  questions_per_turn: 5

reports:
  html_enabled: true
  markdown_enabled: true
  csv_enabled: false
  output_dir: reports

features:
  auto_logging: true
  assumption_marking: true
  report_gate: true
  resume_support: true

# Environment variable reference:
# OBSIDIAN_VAULT_PATH={{OBSIDIAN_PATH}}
EOF

sed -i "s|{{OBSIDIAN_PATH}}|$OBSIDIAN_PATH|g" config.yaml
sed -i "s|{{VAULT_NAME}}|$VAULT_NAME|g" config.yaml

echo "✅ config.yaml created"

# ── Set Environment Variable ────────────────────────────────────────────────────
echo ""
echo "🔧 Environment Setup"
echo "------------------------"

ENV_FILE="$HOME/.hermes/.env"
OBSIDIAN_SETTING="OBSIDIAN_VAULT_PATH=$OBSIDIAN_PATH"

if [[ -f "$ENV_FILE" ]]; then
    if grep -q "OBSIDIAN_VAULT_PATH" "$ENV_FILE"; then
        sed -i "s|OBSIDIAN_VAULT_PATH=.*|$OBSIDIAN_SETTING|" "$ENV_FILE"
        echo "✅ Updated OBSIDIAN_VAULT_PATH in $ENV_FILE"
    else
        echo "$OBSIDIAN_SETTING" >> "$ENV_FILE"
        echo "✅ Added OBSIDIAN_VAULT_PATH to $ENV_FILE"
    fi
else
    echo "$OBSIDIAN_SETTING" > "$ENV_FILE"
    echo "✅ Created $ENV_FILE with OBSIDIAN_VAULT_PATH"
fi

# ── Final Summary ──────────────────────────────────────────────────────────────
echo ""
echo "═══════════════════════════════════════════════"
echo "  ✅ Setup Complete!"
echo "═══════════════════════════════════════════════"
echo ""
echo "📍 Obsidian Vault: $OBSIDIAN_PATH"
echo "📍 Ventures:       $OBSIDIAN_PATH/Business/Ventures"
echo "📍 Templates:      $OBSIDIAN_PATH/Business/Templates"
echo ""
echo "🚀 Next steps:"
echo "   1. Add vault to Obsidian app"
echo "   2. Try: /bf ร้านกาแฟใกล้มหาวิทยาลัย"
echo ""
echo "📁 Local structure:"
echo "   reports/          ← HTML/markdown outputs"
echo "   workflows/        ← state machine definitions"
echo "   skills/           ← grill + sub-skills"
echo "   docs/             ← documentation"
echo ""
echo "Commands:"
echo "   /bf <ไอเดีย>       ← start feasibility study"
echo "   /bf resume         ← continue previous session"
echo "   /bf snapshot       ← show current status"
echo "   /grill-business    ← grill only"
echo ""
echo "For more: cat docs/workflow-engine.md"
echo "═══════════════════════════════════════════════"