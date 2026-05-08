#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM="$(git -C "$ROOT_DIR" rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)"

echo "[vault-prep] repo: $ROOT_DIR"
git -C "$ROOT_DIR" status --short --branch
if [[ -n "$UPSTREAM" ]]; then
  git -C "$ROOT_DIR" pull --rebase --autostash
else
  echo "[vault-prep] no upstream configured; skipping pull"
fi
git -C "$ROOT_DIR" status --short --branch
