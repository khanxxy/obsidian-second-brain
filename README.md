# Obsidian Second Brain

An agent-first Obsidian vault template based on a real multi-agent workflow.

Start simple. The full system is already in place for later.

---

## What This Is

This vault gives humans and AI agents one shared source of truth:

- `VAULT.md` is the map.
- `AGENTS.md` is the operating manual.
- `NOW.md` is the current state.
- `Projects/<Project>/HANDOFF.md` keeps agent continuity.
- `!1 Work Log/` records real sessions.
- `!2 Briefings/` stores bot output and daily reports.
- `Backlog.md` holds planned work.
- `Knowledge/` becomes the long-term wiki.
- `Agents/Skills/your-vault/SKILL.md` can be installed so capable agents load your vault rules automatically.

The template ships empty by design: no private data, no fake businesses, no client examples.

---

## 30-Minute Setup

1. Click **Use this template** on GitHub, or clone the repo.
2. Open the folder in Obsidian.
3. Fill in `People/Me.md`.
4. Copy `Projects/.template/` to `Projects/<Your Project>/`.
5. Fill in the new project's `Context.md`.
6. Add the project to `NOW.md`.
7. Tell your agent:

```text
Read AGENTS.md and VAULT.md first. Then help me continue my current project.
```

At the end of every agent session, verify that the agent updated:

- `NOW.md`
- `Projects/<Project>/HANDOFF.md`
- `!1 Work Log/YYYY-MM-DD.md`

If those three files were not updated, the session is not finished.

---

## Levels

### Level 1: Human + One Agent

Use only:

- `VAULT.md`
- `AGENTS.md`
- `NOW.md`
- `Projects/`
- `!1 Work Log/`

This is enough for daily work.

### Level 2: Git Sync

Use `scripts/vault-prep.sh`, `scripts/vault-finish.sh`, and `scripts/vault-status.sh` before and after edits. This lets multiple devices or agents work on the same vault.

### Level 3: Install The Vault Skill

Install the bundled skill:

```bash
bash scripts/install-skill.sh
```

Then skill-capable agents can auto-load the vault workflow when the task mentions projects, handoffs, work logs, briefings, TODOs, or the knowledge wiki.

### Level 4: Bots And Briefings

Put automated reports in `!2 Briefings/`. Keep human and agent work in `!1 Work Log/`.

### Level 5: Knowledge Pipeline

Use `Knowledge/raw/` for immutable sources and domain folders like `Knowledge/AI/` or `Knowledge/Business/` for distilled concept pages. Read `Knowledge/SCHEMA.md` before writing durable knowledge.

---

## Structure

```text
AGENTS.md                  Agent rules and protocols
VAULT.md                   Central entry point
NOW.md                     Current projects, blockers, next actions
Backlog.md                 Planned work not active yet
Home.md                    Human-facing start page
Changelog.md               Structural vault changes

!1 Work Log/               Human/agent sessions, commits, decisions
!2 Briefings/              Bot outputs, reports, daily highlights

Projects/                  Active and archived work
  .template/               Project starter folder
    Context.md
    HANDOFF.md
    ICP.md
    Voice.md
    Services.md

Knowledge/                 Long-term wiki
  SCHEMA.md                Rules for wiki writes
  LOG.md                   Knowledge maintenance log
  raw/                     Immutable source captures
  AI/ Business/ Tools/ ...

People/                    User profile, team, contacts
Decisions/                 ADR-style decisions
Agents/                    Bots, MCPs, sync, skills
AI-Learnings/              Lessons and rules for agents
Inbox/                     Unsorted captures
scripts/                   Git sync and skill install helpers
```

---

## Core Rule

The vault exists to prevent context loss. Do not let important work stay only in chat.

If a task, decision, blocker, or next action matters, it must land in the right file.

---

## License

MIT. See `LICENSE`.
