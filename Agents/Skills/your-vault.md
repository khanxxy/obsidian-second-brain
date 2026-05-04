---
tags: [agents, skills, template, mirror]
status: template
created: 2026-05-04
---

# Your Vault Skill — Template

> Mirror documentation for a vault-specific skill. The actual skill file lives at `~/.agents/skills/<your-vault>/SKILL.md` on your machine.

## What this skill does

Onboarding compressor + lessons-memory for any agent that works with your vault. Pull-triggered: only loads when the agent's task mentions vault-related concepts (NOW.md, HANDOFF.md, Projects/, Work Log, briefings, etc.). Stays silent on unrelated tasks (e.g., "explain quantum computing").

## Why build a vault-specific skill

- **Without skill:** every new session, the agent re-reads AGENTS.md cold, may miss your specific conventions, repeats failure-modes you've already solved
- **With skill:** agent has the rules + lessons internalized from session start, your conventions auto-applied to vault-related tasks

## How to build your own

### 1. Install the skill builder
```bash
cd ~ && npx -y skills@latest add -y mattpocock/skills/skills/productivity/write-a-skill
```
This adds `write-a-skill` to `~/.agents/skills/` (universal format for Codex CLI / Claude Code / Antigravity / Gemini CLI / GitHub Copilot / Amp / etc.)

### 2. Generate your vault skill
In any agent CLI (Codex, Claude Code, etc.):

> "Use write-a-skill to create a skill named `<your-vault>` that compresses my AGENTS.md + Vault-Sync workflow + my custom conventions. The description should trigger on tasks involving the vault, Projects/, NOW.md, HANDOFF.md, work log, briefings, knowledge wiki, or TODO routing."

The agent will create `~/.agents/skills/<your-vault>/SKILL.md`.

### 3. Symlink for Claude Code (optional, convenience)
```bash
ln -s ~/.agents/skills/<your-vault> ~/.claude/skills/<your-vault>
```

### 4. Mirror in vault for human reading
```bash
cp ~/.agents/skills/<your-vault>/SKILL.md /path/to/vault/Agents/Skills/<your-vault>.md
```
This lets you read the skill content in Obsidian without diving into `~/.agents/`. Update the mirror whenever the source skill changes.

### 5. (Optional) Mirror to multi-agent setups
If you run a containerized agent (Hermes, OpenClaw, etc.) that doesn't auto-discover from `~/.agents/`, you can deploy a copy of the skill into the container's skill-folder and reference it from the agent's system prompt.

## Recommended skill content structure

```markdown
---
name: <your-vault>
description: Use when working with <Your> Vault (~/path). Enforces session-start
  reading order, session-end hand-off protocol (NOW.md + HANDOFF.md + Work Log),
  TODO routing, vault-sync workflow. Triggers on any task involving the vault,
  Projects/, NOW.md, HANDOFF.md, work log, briefings, or knowledge wiki.
---

# <Your> Vault Skill

## Vault paths
~/path/to/vault   # local
/container/path   # if applicable

## Session-Start: Mandatory Reading (in order)
1. VAULT.md
2. AGENTS.md
3. NOW.md
4. Work Log/<today>.md
5. (project work) Projects/<X>/Context.md + HANDOFF.md
6. (wiki work) Knowledge/SCHEMA.md

## Session-End: 3-File Hand-off Protocol
[NOW.md update template]
[HANDOFF.md entry template]
[Work Log entry template]

## TODO Routing Table
[NOW vs Backlog vs HANDOFF vs Inbox vs Decisions]

## Vault-Sync: Known Failure-Modes
[The 4 failure-modes from AGENTS.md, with resolutions]

## Vault Structure Map
[Top-level folders + what goes where]

## Style & Language
[Your conventions for language, tone, code style]

## Anti-Patterns
[What NEVER to do — your specific lessons]

## Tool Priority
[Which MCPs/APIs to use for which tasks]

## Who is the user?
[Brief profile so agents personalize responses]
```

## Update workflow

**Single source of truth:** `~/.agents/skills/<your-vault>/SKILL.md`

When you update the skill:
1. Edit `~/.agents/skills/<your-vault>/SKILL.md`
2. Codex CLI / Claude Code / etc. read it fresh on next session start
3. Sync this mirror in vault: `cp ~/.agents/skills/<your-vault>/SKILL.md /path/to/vault/Agents/Skills/<your-vault>.md`
4. (If applicable) sync to container/VPS mirrors

Auto-sync via cron is possible (small shell script). See [[Karpathy Autoresearch Loop]] — same "locked source + mutable application" principle applied to skill management.

## Related

- [[../AGENTS.md|AGENTS.md]] — the universal rules your skill compresses
- [[../Knowledge/AI/Karpathy Autoresearch Loop|Karpathy Autoresearch Loop]] — related "constrain what changes, let value compound" pattern
- `mattpocock/skills` on GitHub — universal skill format reference
