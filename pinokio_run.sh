#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PYTHON_BIN="${PYTHON_BIN:-python3}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  echo "Python 3 was not found. Install Python 3.10 or 3.11 and try again." >&2
  exit 1
fi

if [ ! -d .venv ]; then
  "$PYTHON_BIN" -m venv .venv
fi

source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt

if [ "${INSTALL_HF:-0}" = "1" ]; then
  python -m pip install -r requirements-hf.txt
  if [ -n "${HF_TOKEN:-}" ]; then
    huggingface-cli login --token "$HF_TOKEN" --add-to-git-credential || true
  fi
fi

exec python run.py
