# Retention (public default)

Phones are not the store. The Open WebUI server volume is.

| What | Default |
|------|---------|
| Chat history | Purge after 7 days |
| Generated images on disk | Purge after 24 hours |
| Vision uploads | Follow chat purge |
| Model weights, accounts, compose | Keep |

Implement the purge on your node before you invite anyone outside the house. This file is the policy, not a running cron.
