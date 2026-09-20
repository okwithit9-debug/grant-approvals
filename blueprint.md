# Blueprint — Sara AI Local Compute Node

## What runs where

| Role | Hardware | Software |
|---|---|---
| LLM brain (text) | NVIDIA Spark (or M5 Ultra when it lands) | Qwen 3.8 Flash Next, served via Tabby/Hermes as a normal API |
| Image gen | Mac Studio M4 Max 128GB | ComfyUI + Flux / Qwen-image |
| Front door | Mac Studio | Open WebUI (Sara AI), Docker, Cloudflare tunnel → saraai.chat |
| Video gen | (Phase 2) | ComfyUI video workflows |

## The two doors, one cluster

1. **Private door** — family, unlimited, no meter. Registration gate (Cloudflare Access email allowlist + Open WebUI auth). No paywall today.
2. **Public door** — same stack, registration-gated for strangers, future subscription + OpenRouter idle payouts.

Nothing leaves the hardware unless you choose to sell idle time.

## What the grant funds (Phase 1)

- 10GbE networking so the boxes talk fast
- Node-management software: dashboard, one-command setup, monitoring, failover
- This public blueprint + installer + workflow JSONs
- Docs and reporting overhead

No new giant GPU in Phase 1. The Station-class box is Phase 2, after the loop proves itself.

## Open-source boundary

**Public (this repo, MIT):** interface shape, ComfyUI workflows, installer, smoke test, architecture docs.
**Private (not here):** household accounts, keys, any future paywall logic, personal routing.

## Quick start

```bash
./scripts/install.sh
./scripts/smoke-test.sh
```

See `scripts/install.sh` for what it pulls and starts.
