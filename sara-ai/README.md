# Sara AI (public recipe)

Open WebUI in front of a local OpenAI-compatible LLM. Image generate via ComfyUI on a separate box from the chat model.

This folder is configs + docs. Compose does not start or stop the LLM server.

## Diagram

```
phones (HTTPS)
   -> Open WebUI  127.0.0.1:8080
        -> LLM API  http://LLM_LAN_IP:8001/v1
        -> ComfyUI  127.0.0.1:8188   (images only)
```

Set `OPENAI_API_BASE_URL` in `.env`. Never publish the model port on a router.

## Start

```bash
cp .env.example .env
# set WEBUI_SECRET_KEY and OPENAI_API_BASE_URL
docker compose up -d
curl -fsS http://127.0.0.1:8080/health
```

First browser signup is admin. Then set `ENABLE_SIGNUP=false` and recreate.

## Image gen

See `../scripts/install.sh` and `../workflows/`. Point Open WebUI Images at ComfyUI `http://host.docker.internal:8188`.

Do not load FLUX on the same GPU that is already full of the chat model.

## Access

Put Tailscale Serve or Cloudflare Tunnel + an email allowlist in front. Bind the UI to localhost.

## Chat-only

This public recipe turns off tools, code interpreter, web search, and workspace skills.
