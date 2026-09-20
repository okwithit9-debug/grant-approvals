# Node Blueprint (sanitized)

Home-deployable AI compute node. Replicable at different scales.

## Hardware (current, running)

| Node | Role | Power (typical) | Notes |
|------|------|-----------------|-------|
| NVIDIA DGX Spark | Text/LLM via Tabby | ~170W load, ~40W idle | Qwen3.8-Flash-Next-Uncensored-exl3-4bpw, :8001 LAN only |
| Mac Studio M4 Max | Image gen via ComfyUI | ~145W max, ~6W idle | FLUX.1-dev FP8 + 3 LoRAs, :8188 localhost only |
| Mac Studio M5 Ultra (arriving) | Video gen (Phase 2) | TBD | Not yet in service |

Networking: 10GbE switch recommended between nodes (current: 1GbE home LAN, fine for family, chokes on multi-node file moves).
Power: standard home outlets. No rack, no special cooling.

## Software stack

- **Front door:** Open WebUI (Docker), named accounts, PWA on phones, Cloudflare Access email allowlist or Tailscale Serve
- **Chat backend:** Tabby on Spark serving open Qwen weights
- **Image backend:** ComfyUI on Mac serving open FLUX.1-dev FP8 + LoRAs (photoreal / anime / illustrated)
- **Retention:** 7-day chat-history purge; generated images purged 24h after delivery
- **Security:** signup off after bootstrap, API keys off, no public Tabby/ComfyUI ports, no cloud image APIs

## Workflows (in this repo)

- `workflows/flux-fp8-photoreal.json`
- `workflows/flux-fp8-anime.json`
- `workflows/flux-fp8-illustrated.json`

Import into ComfyUI Admin → Settings → Images. Node map: prompt=6, size=5, steps/seed=3.

## One-command setup

```bash
./scripts/install.sh    # pulls ComfyUI, downloads ~16.4 GiB models, starts :8188
./scripts/smoke-test.sh # generates a test PNG, confirms chat backend untouched
```

## Economic model

See `economics.md`. Short version: today $0 revenue (family-only, 3 days old). Grant funds the replicable software layer; revenue loops (subscription, OpenRouter idle, video) open as capacity grows.

## What the grant is NOT buying

The Spark, M4 Max, and incoming M5 Ultra are already owned or on order. The grant buys the layer around them: networking, node-management software, the published blueprint, and the one-command installer so someone else can copy the stack.
