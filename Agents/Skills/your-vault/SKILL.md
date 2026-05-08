---
name: your-vault
description: Use when working with this Obsidian vault. Enforces startup reading order, session-end handoff protocol (NOW.md + Projects/<Project>/HANDOFF.md + !1 Work Log), TODO routing, vault sync workflow, Knowledge wiki rules, and agent operating conventions. Trigger on tasks involving the vault, Obsidian, Projects, NOW.md, HANDOFF.md, Work Log, Briefings, Backlog, Knowledge, or TODO routing.
---

# Your Vault Skill

Source of truth: `AGENTS.md` in the vault root. This skill is the compact operating guide, not a replacement.

## Vault Path

Set this after installation:

```text
~/YourVault
```

If the vault also runs in a container or VPS, document that path in `Agents/Vault Sync.md`.

## Session Start

For vault-related work, read in order:

1. `VAULT.md`
2. `AGENTS.md`
3. `NOW.md`
4. `!1 Work Log/<today>.md`, if it exists
5. `AI-Learnings/AI Rules.md`
6. For project work: `Projects/<Project>/Context.md`
7. For project work: `Projects/<Project>/HANDOFF.md`
8. For Knowledge writes: `Knowledge/SCHEMA.md`

Answer current-state questions from files, not memory.

## Session End

Before ending a meaningful project session, update:

1. `NOW.md`
2. `Projects/<Project>/HANDOFF.md`
3. `!1 Work Log/YYYY-MM-DD.md`

Use this handoff entry:

```markdown
## YYYY-MM-DD HH:MM - <Agent Name>
**What was done:** ...
**Current state:** ...
**You must do next:** ...
**Watch out:** ...
```

If these files were not updated, the session is not complete.

## TODO Routing

| Task type | Destination |
|---|---|
| Actionable now | `NOW.md` |
| Later | `Backlog.md` |
| Project-specific | Project `HANDOFF.md` |
| Raw unsorted idea | `Inbox/YYYY-MM-DD-short-title.md` |
| Architecture decision | `Decisions/YYYY-MM-DD-topic.md` |

Never leave real TODOs only in chat.

## Work Log vs Briefings

- `!1 Work Log/` is for human and agent sessions.
- `!2 Briefings/` is for bot outputs and automated reports.
- `Changelog.md` is for structural vault changes.

## Vault Sync

Before edits:

```bash
bash scripts/vault-prep.sh
```

After edits:

```bash
bash scripts/vault-finish.sh "vault: short description" file1 file2
```

If Git has a conflict, stop and report it. Do not overwrite user work.

## Knowledge

Before writing in `Knowledge/`, read `Knowledge/SCHEMA.md`.

Use:

- `Knowledge/raw/` for immutable sources
- domain folders for distilled concept pages
- `Knowledge/LOG.md` for meaningful ingest or maintenance work

## Style

- Use the user's language unless project docs establish another language.
- Keep notes short and operational.
- Prefer concrete next actions over summaries.
- Verify before reporting success.

## User Profile

Do not hardcode private user details into this skill. Read `People/Me.md` when user-specific context matters.

## Anti-Patterns

- Do not create duplicate notes without searching.
- Do not write private data into public templates.
- Do not put session summaries into `!2 Briefings/`.
- Do not use destructive Git commands without explicit user approval.
- Do not skip handoff files at session end.
