# Blueprint - local compute node

## Current (working)

One NVIDIA Spark-class box serves the long-context chat model as a normal OpenAI-compatible API.
One Apple Silicon Studio runs the front door (Open WebUI) and ComfyUI image generation.
A smaller local model on the Studio is available as a fallback. It is not the household chat backend.

```
phones (HTTPS: tailnet or tunnel + allowlist)
        |
        v
Open WebUI  (127.0.0.1:8080 on the Studio)
        |  OpenAI-compatible
        v
LLM API     (private LAN, example http://LLM_LAN_IP:8001/v1)
        model id set in .env

Image generate:
Open WebUI -> ComfyUI on the Studio (127.0.0.1:8188)
```

What crosses the LAN is a short request and tokens. Not a growing KV cache.

## Future (documented, not required to clone)

| Role | Target |
|------|--------|
| Brain | Larger unified-memory Mac (Flash Next class local) |
| Images + smaller LLM | Original Studio |
| Video | Spark + ComfyUI (CUDA) |

Cluster with Thunderbolt between Macs if you later pool memory. Spark stays on Ethernet for API and video jobs.

## Two doors

1. Private door - named logins, no meter, allowlist.
2. Public door - same stack, registration gate. Paid tier is future work and is not in this repo.

## Public vs private

**This repo:** compose, env examples, ComfyUI workflows, installer, architecture.

**Not this repo:** real `.env`, tunnel tokens, family emails, private workflow Hub, agent/computer-use configs, grant application drafts, budgets with personal figures.
