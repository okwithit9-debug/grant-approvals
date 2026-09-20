# Economic Model (honest)

## Current reality (as of application)

- Sara AI launched ~3 days ago.
- Household only: 4 named users (admin + spouse + 2 kids).
- No paywall. Registration gate via Cloudflare Access email allowlist + Open WebUI named accounts.
- No public users. No OpenRouter provider listings. No subscription revenue.
- **Revenue today: $0.**

The cluster exists because the family needs private, local AI — not because it is profitable yet. That is the honest starting point.

## Cost to run (measured)

| Component | Power | Notes |
|-----------|-------|-------|
| DGX Spark | ~170W under load, ~40W idle | Tabby always-on |
| Mac Studio M4 Max | ~145W max, ~6W idle | ComfyUI on-demand or always-on |
| Combined | ~315W peak | Standard home outlet |

US average electricity: **18.34 ¢/kWh** (EIA, June 2026).

- Peak draw: 315W → ~7.6 kWh/day → **~$1.39/day → ~$42/month**
- Idle-heavy (Mac sleeps, Spark low): ~$15–20/month

Hardware already owned: Spark (~$4k), M4 Max (~$2k), incoming M5 Ultra (pre-ordered). No grant money asked for these.

## Revenue loops (grant-funded path)

The $30–100k grant buys the **software + networking layer** that makes the loop replicable. Three loops open as capacity grows:

### 1. Sara AI subscription (primary)
Today: registration gate, no charge. Tomorrow: $5–10/mo per household for unlimited local chat + image gen. 20 households = $100–200/mo. Scales with nodes, not with cloud margins.

### 2. OpenRouter idle-time payouts
List the node's ComfyUI endpoint on OpenRouter as a provider. Current retail image pricing ~$0.03–0.04/image; provider share ~70–80%.

- 50 idle images/mo → ~$1.50–1.60
- 200 idle images/mo → ~$6
- 500 idle images/mo → ~$15

Thin per-image, but free money on hardware that would otherwise sit idle between family use. Scales with more nodes and better models.

### 3. Video tier (Phase 2, M5 Ultra)
Video generation is higher-value per token than images. Once the Ultra is live, the same OpenRouter + subscription loop applies at better margins. Not yet built — this is the Phase 2 ask.

## Payback framing for the grant

The grant is not asked to fund a profitable business today. It is asked to fund the **replicable software layer** (one-command installer, 10GbE networking, dashboard, published blueprint) so the next household can stand up the same stack without a week of DevOps.

Payback math once the layer ships:

- Grant: $30–100k (software + networking + overhead ≤10%)
- Marginal cost per additional node: ~$4–6k hardware + ~$40/mo electricity
- Revenue per node at modest adoption (20 subs @ $8 + 200 OpenRouter imgs): ~$160–200/mo
- Hardware payback: ~2–3 years per node at that adoption, faster as the network grows

This is the "hardware pays for itself" model Foresight asked for — not a promise of instant profit, but a published path from family lab to replicable, self-sustaining node.

## What we will not claim

- We will not claim current revenue we do not have.
- We will not claim the DGX Station or M5 Ultra is grant-funded if it is already on order.
- We will not claim a paywall exists when only a registration gate does.
