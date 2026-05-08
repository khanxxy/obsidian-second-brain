# Agents

Agents, bots, MCPs, sync rules, and skills.

This area is optional at first. Keep it small until you actually run automations.

---

## Start Here

- [[Agents/Vault Sync]] - Git workflow for multiple devices or agents
- [[Agents/MCP Stack]] - tools and API integrations
- [[Agents/Active Bots]] - running automations
- [[AI-Learnings/AI Rules]] - established lessons for agents
- [[Agents/Skills/your-vault/SKILL]] - installable vault skill

---

## Agent Inventory

| Agent | Schedule | Script | Output |
|---|---|---|---|
| Example: Daily Digest | Daily 09:00 | `~/Scripts/daily-digest/` | [[!2 Briefings/Index]] |
| Example: Vault Sync | Every 15 min | `~/Scripts/vault-sync.sh` | Git |

---

## Agent Detail Template

### Agent Name

- **What:** What the agent does
- **Trigger:** Manual, cron, webhook, launch agent
- **Script:** `path/to/script`
- **Output:** `path/to/output`
- **Logs:** `path/to/logs`
- **APIs:** Which APIs it uses
- **Owner:** Human responsible for it

Copy this block for each real agent.
