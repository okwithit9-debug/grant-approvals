# Sanitize check (2026-09-21)

Copied from a private working tree into this public repo, then stripped.

## Removed

- Legal names, family roles as accounts, home paths (`/Users/...`)
- Machine hostnames, MAC-specific user names
- Live LAN IPs and relay hostnames (replaced with `LLM_LAN_IP` / `host.docker.internal`)
- Private Hub paths (`shared/memory.md`, personal plan files, Hermes configs)
- Grant application drafts and personal budget sheets
- Tunnel tokens, passwords, API keys (examples only)
- Agent / computer-use wiring (out of scope for the public node)

## Kept (on purpose)

- Model class names (Qwen 3.8 Flash Next, Qwen 3.8 27B, FLUX FP8)
- Public demo URL already advertised: https://saraai.chat
- Generic hardware classes (Spark-class 128 GB, Mac Studio)
- Open WebUI + ComfyUI + Docker recipe

## Double-check

Searched this public tree after copy: no home street address, no personal email allowlist, no raw secrets files.
