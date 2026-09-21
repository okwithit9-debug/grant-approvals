#!/usr/bin/env bash
# Verifies the image backend is up. Chat backend check is optional.
set -euo pipefail

COMFY="${COMFY:-http://127.0.0.1:8188}"
# Set LLM_MODELS_URL to your private OpenAI-compatible /v1/models if you want this check.
LLM_MODELS_URL="${LLM_MODELS_URL:-}"

echo "==> Smoke test: ComfyUI"
curl -fsS "$COMFY/system_stats" > /dev/null && echo "    ComfyUI up"

echo "==> Smoke test: chat backend (optional, read-only)"
if [ -n "$LLM_MODELS_URL" ]; then
  curl -fsS "$LLM_MODELS_URL" > /dev/null && echo "    LLM API still serving" || echo "    LLM check failed"
else
  echo "    skipped (set LLM_MODELS_URL to enable)"
fi

echo "==> Done."
