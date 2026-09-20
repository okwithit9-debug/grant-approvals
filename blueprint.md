# Node Blueprint (sanitized)

Home-deployable AI compute node. Replicable at different scales.

## Hardware (current)
- 1x NVIDIA Spark — Qwen 3.8 FlashNext (text/LLM)
- 1x Mac Studio (M-series) — ComfyUI, Qwen 2.1 image + Flux
- 1x Mac Studio (arriving) — video generation

## Power & networking
- Standard home outlet (Spark ~100W, Studios ~200-400W under load)
- 1GbE or 10GbE between nodes (recommend 10GbE switch for multi-node)
- No special cooling beyond stock

## Software stack
- ComfyUI for image/video workflows
- Qwen models (open weights)
- Flux (open weights)
- Sarah AI interface (open-source; paywall private)

## Setup (one-command goal)
Coming soon: a single script that provisions the node, pulls models, and starts serving.

## Economic model
- Subscription revenue (Sarah AI)
- OpenRouter idle-time payouts
- Video tier (Phase 2)

See the private plan for full payback math.
