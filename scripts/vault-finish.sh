#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/vault-finish.sh \"commit message\" [path ...]" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMIT_MESSAGE="$1"
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
git -C "$ROOT_DIR" push origin main
git -C "$ROOT_DIR" status --short --branch
