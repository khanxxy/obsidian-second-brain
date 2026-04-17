#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[vault-status] repo: $ROOT_DIR"
git -C "$ROOT_DIR" status --short --branch
echo "[vault-status] head: $(git -C "$ROOT_DIR" rev-parse HEAD)"
echo "[vault-status] origin/main: $(git -C "$ROOT_DIR" rev-parse --verify origin/main 2>/dev/null || echo unknown)"
