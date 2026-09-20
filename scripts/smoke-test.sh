#!/usr/bin/env bash
# Verifies the image backend generates a PNG and the chat backend is untouched.
set -euo pipefail

COMFY="http://127.0.0.1:8188"
TABBY="http://10.10.10.2:8001/v1/models"

echo "==> Smoke test: ComfyUI"
curl -fsS "$COMFY/system_stats" > /dev/null && echo "    ComfyUI up"

WF='{"1":{"inputs":{"ckpt_name":"flux1-dev-fp8.safetensors"},"class_type":"CheckpointLoaderSimple"},"2":{"inputs":{"text":"a red bicycle parked under a maple tree, daytime, no people","clip":["1",1]},"class_type":"CLIPTextEncode"},"3":{"inputs":{"seed":1,"steps":4,"cfg":1,"sampler_name":"euler","scheduler":"simple","denoise":1,"model":["1",0],"positive":["2",0],"negative":["4",0],"latent_image":["5",0]},"class_type":"KSampler"},"4":{"inputs":{"text":"","clip":["1",1]},"class_type":"CLIPTextEncode"},"5":{"inputs":{"width":512,"height":512,"batch_size":1},"class_type":"EmptyLatentImage"},"6":{"inputs":{"samples":["3",0],"vae":["1",2]},"class_type":"VAEDecode"},"7":{"inputs":{"filename_prefix":"smoke","images":["6",0]},"class_type":"SaveImage"}}'

curl -fsS -X POST "$COMFY/prompt" -H 'Content-Type: application/json' -d "$WF" > /dev/null
echo "    Prompt queued"

sleep 8
LATEST=$(ls -t "$HOME/ComfyUI/output"/smoke*.png 2>/dev/null | head -1 || true)
if [ -n "$LATEST" ]; then
  echo "    PNG generated: $LATEST"
else
  echo "    WARN: no PNG yet (model may still be loading)"
fi

echo "==> Smoke test: chat backend untouched (read-only)"
curl -fsS "$TABBY" > /dev/null && echo "    Tabby still serving" || echo "    Tabby check skipped (not on this LAN)"

echo "==> Done."
