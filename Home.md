# Home

Start here when you open the vault.

---

## First Setup

- [ ] Read [[START-HERE]]
- [ ] If using an AI agent, copy a prompt from [[ASK-CODEX]]
- [ ] Fill in [[People/Me]]
- [ ] Copy `Projects/.template/` to `Projects/<Your Project>/`
- [ ] Fill in the new project's `Context.md`
- [ ] Add the project to [[NOW]]
- [ ] Install the skill with `bash scripts/install-skill.sh` if you use skill-capable agents
- [ ] Run your first agent session
- [ ] Verify the agent updated [[NOW]], the project `HANDOFF.md`, and today's [[!1 Work Log/README|Work Log]]

---

## Daily Start

1. Read [[NOW]]
2. Open the project from [[Projects/Index]]
3. Read the project's `Context.md`
4. Read the project's `HANDOFF.md`
5. Do the next action

---

## Navigation

| Area | Link | Purpose |
|---|---|---|
| Current state | [[NOW]] | What is active right now |
| Planned work | [[Backlog]] | What is later, not now |
| Projects | [[Projects/Index]] | Active, paused, finished work |
| Knowledge | [[Knowledge/Index]] | Long-term reference |
| Decisions | [[Decisions/Index]] | Decision log |
| People | [[People/Index]] | You, team, contacts |
| Sessions | [[!1 Work Log/README]] | Human and agent work |
| Briefings | [[!2 Briefings/Index]] | Bot output and reports |
| Agents | [[Agents/Index]] | Skills, sync, MCPs, bots |

---

## Agent Prompt

Use this prompt when starting a new agent session:

```text
Read AGENTS.md and VAULT.md first. Then read NOW.md and the relevant project Context.md and HANDOFF.md. Continue from the next action, and update NOW.md, HANDOFF.md, and today's Work Log before you finish.
```
