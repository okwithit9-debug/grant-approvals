#!/usr/bin/env bash
# One-command installer for the Local Compute Node (Phase 1 deliverable).
# Pulls ComfyUI, downloads FLUX FP8 + LoRAs, starts the image backend on :8188.
# Chat backend (Tabby on Spark) is assumed already running — this script does NOT touch it.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
COMFY_HOME="${COMFY_HOME:-$HOME/ComfyUI}"

echo "==> Local Compute Node installer"
echo "    ComfyUI home: $COMFY_HOME"

# 1. ComfyUI
if [ ! -d "$COMFY_HOME/.git" ]; then
  echo "==> Cloning ComfyUI"
  git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFY_HOME"
fi
cd "$COMFY_HOME"

# 2. Python venv + deps (skip if present)
if [ ! -d venv ]; then
  python3 -m venv venv
fi
# shellcheck disable=SC1091
source venv/bin/activate
pip install -q -r requirements.txt

# 3. Models (~16.4 GiB)
CKPT_DIR=models/checkpoints
LORA_DIR=models/loras
mkdir -p "$CKPT_DIR" "$LORA_DIR"

if [ ! -f "$CKPT_DIR/flux1-dev-fp8.safetensors" ]; then
  echo "==> Downloading FLUX.1-dev FP8 (16.1 GiB)"
  pip install -q huggingface_hub
  huggingface-cli download Comfy-Org/flux1-dev flux1-dev-fp8.safetensors --local-dir "$CKPT_DIR"
fi

for spec in \
  "XLabs-AI/flux-RealismLora:flux-photoreal.safetensors" \
  "alfredplpl/flux.1-dev-modern-anime-lora:flux-anime.safetensors" \
  "alvdansen/frosting_lane_flux:flux-illustrated.safetensors"
do
  repo="${spec%%:*}"; file="${spec##*:}"
  if [ ! -f "$LORA_DIR/$file" ]; then
    echo "==> Downloading LoRA $file"
    huggingface-cli download "$repo" --local-dir "$LORA_DIR"
  fi
done

# 4. Start (localhost only — never 0.0.0.0)
echo "==> Starting ComfyUI on 127.0.0.1:8188"
python main.py --listen 127.0.0.1 --port 8188 &
echo "    PID $!  — smoke test: ./scripts/smoke-test.sh"
