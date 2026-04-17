#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[vault-prep] repo: $ROOT_DIR"
git -C "$ROOT_DIR" status --short --branch
git -C "$ROOT_DIR" pull --rebase --autostash origin main
git -C "$ROOT_DIR" status --short --branch
