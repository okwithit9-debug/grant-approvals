# Local Compute Node (public)

Open-source home AI compute node. MIT.

This is the **public** half of a Foresight Institute Local Compute grant project. Household accounts, keys, private ops, and personal workflows live in a separate private repo and are never copied here.

Live prototype (registration-gated): https://saraai.chat

## What this is

A replicable blueprint for a ChatGPT / Imagine-style stack on hardware you own.

Current working split (what is running today):

| Role | Typical box | Software |
|------|-------------|----------|
| Chat brain | NVIDIA DGX Spark (128 GB) | Qwen 3.8 Flash Next (EXL3), OpenAI-compatible API |
| Hands / fallback LLM | Apple Mac Studio | Qwen 3.8 27B (local decode / computer-use stays off this UI) |
| Image gen | Same Mac Studio | ComfyUI + FLUX FP8 + LoRAs, plus Qwen-Image when you add it |
| Front door | Same Mac | Open WebUI (Sara AI), Docker, HTTPS tunnel or tailnet |

Future split (when a larger Apple Ultra-class box lands):

| Role | Box |
|------|-----|
| Chat brain | Larger Mac Studio (more unified memory) |
| Image gen + 27B | Original Mac Studio |
| Video gen (ComfyUI / Wan class) | Spark (CUDA) |

Machines talk over a private LAN API. The KV cache does **not** ship over Ethernet. Chat is an API call: prompt in, tokens out.

## Layout

- `blueprint.md` - architecture, current vs future, public vs private boundary
- `economics.md` - honest payback math
- `SANITIZE.md` - what was stripped before this repo went public
- `sara-ai/` - installable Open WebUI + ComfyUI recipe (placeholders only)
- `workflows/` - ComfyUI Flux JSON (photoreal, illustrated, anime)
- `scripts/install.sh` - image-backend installer
- `scripts/smoke-test.sh` - health check

## Quick start

```bash
cp sara-ai/.env.example sara-ai/.env
# set WEBUI_SECRET_KEY and OPENAI_API_BASE_URL to YOUR LAN endpoint
cd sara-ai && docker compose up -d
./scripts/install.sh
./scripts/smoke-test.sh
```

Do not commit `.env`. Do not publish the model port on the public internet.

## License

MIT. See `LICENSE`.
