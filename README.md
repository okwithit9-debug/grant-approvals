# grant-approvals

Public, open-source home for the **Local Compute Node** project (Foresight Institute grant application).

This repo holds only the pieces meant to be public:

- Sarah AI interface (open-source app; paywall stays private)
- ComfyUI workflows (Qwen 2.1 image + Flux)
- Node-management tooling and cluster setup docs
- Hardware manifests for the Spark + Mac Studio cluster
- `LICENSE` (MIT)

Everything else — personal workflows, prompts, grant strategy, family instances — lives privately in the `ai-workflows` repo under `grants/`.

## Architecture (current, running)

```
User → Sarah AI (subscription UI) → API call → Spark (Qwen 3.8 FlashNext) + Mac Studio (ComfyUI: Qwen 2.1 + Flux) → generated image → back to user
```

- **Spark**: text/LLM inference (Qwen 3.8 FlashNext)
- **Mac Studio 1**: image generation via ComfyUI (Qwen 2.1 image + Flux)
- **Mac Studio 2** (arriving): video generation

## License
MIT. See `LICENSE`.

## Status
Scaffold + architecture. Open-source deliverables (Sarah AI interface, ComfyUI workflows, node-management code) will be added here as they are ready.

## Links
- Private plan: (in ai-workflows/grants — not public)
- Foresight RFP: https://foresight.org/grants/ai-science-safety-nodes-rfp-local-compute/
