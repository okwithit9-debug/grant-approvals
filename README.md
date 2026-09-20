# Local Compute Node

Public, open-source home for a **home-deployable AI compute node** — the Foresight Institute Local Compute grant project.

This repo holds only what is meant to be public and replicable:

- Sara AI interface (Open WebUI front door + ComfyUI wiring)
- ComfyUI workflows (FLUX FP8 photoreal / anime / illustrated)
- Node-management scripts (install, start, smoke test, style switch)
- Hardware manifest + power/networking notes
- Honest economic model (current reality + grant-funded path)
- `LICENSE` (MIT)

Everything personal — family instances, grant strategy, prompts, private workflows — stays in the private `ai-workflows` repo under `grants/`.

## Architecture (running today)

```
phones (Tailscale Serve or Cloudflare Tunnel + Access)
        |
        v
Open WebUI  (Mac Studio, 127.0.0.1:8080)  <-- Sara AI front door
        |
        +-- chat  -->  Spark Tabby :8001  (Qwen3.8-Flash-Next-Uncensored-exl3-4bpw)
        |
        +-- generate -->  Mac ComfyUI :8188  (FLUX.1-dev FP8 + LoRAs)
```

- **Spark (NVIDIA DGX Spark)**: always-on text/LLM inference via Tabby. ~170W under load.
- **Mac Studio (M4 Max)**: image generation via ComfyUI. ~145W max, ~6W idle.
- **Mac Studio 2 (M5 Ultra, arriving)**: video generation tier (Phase 2).

Locked split: Spark never runs FLUX (no headroom next to Tabby). Mac never runs the chat model. See `sara-ai/image-gen/SWAP-VS-MAC.md` in the private repo for the measured numbers.

## What's in this repo

| Path | What |
|------|------|
| `blueprint.md` | Sanitized hardware + software manifest anyone can copy |
| `workflows/` | Three FLUX FP8 ComfyUI workflow JSONs (photoreal, anime, illustrated) |
| `scripts/install.sh` | One-command installer: pulls ComfyUI, downloads models, starts serving |
| `scripts/smoke-test.sh` | Verifies a PNG generates and the chat backend stays up |
| `economics.md` | Honest payback math — current $0 revenue, grant-funded path |
| `LICENSE` | MIT |

## One-command install (goal)

```bash
git clone https://github.com/okwithit9-debug/grant-approvals.git
cd grant-approvals
./scripts/install.sh
./scripts/smoke-test.sh
```

This is the Phase 1 deliverable the grant funds: software a non-expert can run without DevOps pain.

## Economic model (honest)

**Today:** $0 revenue. Sara AI launched ~3 days ago for the household only. No paywall, no public users, no OpenRouter listings yet. The cluster exists because the family needs it.

**Grant-funded path:** The $30–100k buys the software + networking layer (10GbE, dashboard, one-command setup, published blueprint) so the next household can stand up the same stack. Revenue loops that open once capacity exists:

- Sara AI subscription (registration gate today; paywall later)
- OpenRouter idle-time payouts (~$0.03/image provider share at current retail)
- Video tier once the M5 Ultra arrives

See `economics.md` for the napkin math.

## License

MIT. See `LICENSE`.

## Links

- Foresight Local Compute RFP: https://foresight.org/grants/ai-science-safety-nodes-rfp-local-compute/
- Private plan (not public): ai-workflows/grants/
