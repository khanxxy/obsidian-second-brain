#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[vault-status] repo: $ROOT_DIR"
git -C "$ROOT_DIR" status --short --branch
echo "[vault-status] head: $(git -C "$ROOT_DIR" rev-parse HEAD)"
UPSTREAM="$(git -C "$ROOT_DIR" rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)"
if [[ -n "$UPSTREAM" ]]; then
  echo "[vault-status] upstream: $UPSTREAM $(git -C "$ROOT_DIR" rev-parse --verify "$UPSTREAM" 2>/dev/null || echo unknown)"
else
  echo "[vault-status] upstream: none"
fi
