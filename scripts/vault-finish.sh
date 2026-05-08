#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/vault-finish.sh \"commit message\" [path ...]" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMIT_MESSAGE="$1"
UPSTREAM="$(git -C "$ROOT_DIR" rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)"
shift

if [[ $# -gt 0 ]]; then
  git -C "$ROOT_DIR" add -- "$@"
else
  git -C "$ROOT_DIR" add -A
fi

if git -C "$ROOT_DIR" diff --cached --quiet; then
  echo "[vault-finish] no staged changes"
  exit 0
fi

git -C "$ROOT_DIR" commit -m "$COMMIT_MESSAGE"
if [[ -n "$UPSTREAM" ]]; then
  git -C "$ROOT_DIR" push
else
  echo "[vault-finish] no upstream configured; commit kept local, skipping push"
fi
git -C "$ROOT_DIR" status --short --branch
