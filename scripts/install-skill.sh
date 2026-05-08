#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_NAME="${1:-your-vault}"
SOURCE="$ROOT_DIR/Agents/Skills/your-vault/SKILL.md"
DEST="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills/$SKILL_NAME}"

if [[ ! -f "$SOURCE" ]]; then
  echo "Skill source not found: $SOURCE" >&2
  exit 1
fi

mkdir -p "$DEST"
cp "$SOURCE" "$DEST/SKILL.md"

echo "Installed skill: $DEST/SKILL.md"

if [[ "${2:-}" == "--claude" ]]; then
  CLAUDE_DEST="$HOME/.claude/skills/$SKILL_NAME"
  mkdir -p "$(dirname "$CLAUDE_DEST")"
  if [[ -e "$CLAUDE_DEST" && ! -L "$CLAUDE_DEST" ]]; then
    echo "Claude skill path exists and is not a symlink: $CLAUDE_DEST" >&2
    exit 1
  fi
  ln -sfn "$DEST" "$CLAUDE_DEST"
  echo "Linked Claude skill: $CLAUDE_DEST -> $DEST"
fi
