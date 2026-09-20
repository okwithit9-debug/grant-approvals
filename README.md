# README

Open-source home AI compute node. MIT.

This is the **public** half of a project applying to the Foresight Institute Local Compute grant. The private strategy, budgets, and drafts live in a separate private repo.

## What this is

A replicable blueprint for running a ChatGPT / Imagine / Sora-style stack on hardware you own:

- **Brain:** local LLM (Qwen 3.8 Flash Next class) served as a normal API
- **Eyes:** ComfyUI + Flux / Qwen-image for image generation
- **Front door:** Open WebUI (Sara AI) with a registration gate — family-first, open to others behind an allowlist
- **Installer:** one command, `scripts/install.sh`
- **Proof it runs:** https://saraai.chat (registration-gated, live today)

## Why it exists

Local AI stacks today are expert-only glue. This repo is the shared recipe so an average person can stand up a private node in under an hour, with a documented path to sell idle time so the box funds itself.

## Layout

- `blueprint.md` — architecture, what runs where, what stays private
- `economics.md` — honest payback math (zero revenue today, the loop we are funding)
- `workflows/` — ComfyUI Flux workflow JSONs (photoreal, illustrated, anime)
- `scripts/install.sh` — one-command setup
- `scripts/smoke-test.sh` — verifies the node is alive

## License

MIT. See `LICENSE`.

## Status

Prototype stage. Working household node, open blueprint in progress. Grant-funded work ships here as it lands.
