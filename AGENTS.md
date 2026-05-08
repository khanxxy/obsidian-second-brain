# AGENTS.md - Universal Agent Instructions

If you are an AI agent and this file was loaded automatically, follow it strictly.

Core idea: this vault is the source of truth. Do not let useful context stay only in chat.

---

## Reading Order

At the start of a vault-related session, read in this order:

1. `VAULT.md` - map of the vault
2. `AGENTS.md` - rules and protocols
3. `NOW.md` - active work, blockers, next actions
4. `!1 Work Log/<today>.md` - what already happened today, if it exists
5. `AI-Learnings/AI Rules.md` - established agent lessons
6. For project work: `Projects/<Project>/Context.md`
7. For project work: `Projects/<Project>/HANDOFF.md`
8. For knowledge wiki writes: `Knowledge/SCHEMA.md`

Do not answer current-state questions from memory. Read the file.

---

## Navigation

- Start from `VAULT.md`.
- Use `NOW.md` before touching any project.
- Follow wiki-links to the smallest useful context.
- Check `Projects/<Project>/HANDOFF.md` before continuing project work.
- Search before creating new notes.

---

## Editing Rules

- Keep changes surgical.
- Do not create duplicate notes if the topic already exists.
- Update `Changelog.md` when the vault structure changes.
- Use templates from `Projects/.template/`, `!2 Briefings/template.md`, and `Decisions/template.md`.
- Surface conflicts. Do not overwrite them silently.
- Never report success without verification.

---

## Session End - Mandatory Handoff

Before ending any meaningful project session, update these three files:

### 1. `NOW.md`

Update the project row:

- Status
- Next Action
- Blocker
- Last Agent
- Updated date

### 2. `Projects/<Project>/HANDOFF.md`

Add a new entry at the top:

```markdown
## YYYY-MM-DD HH:MM - <Agent Name>
**What was done:** ...
**Current state:** ...
**You must do next:** ...
**Watch out:** ...
```

Keep the last 5 entries visible. Move older entries to `## Archive`.

### 3. `!1 Work Log/YYYY-MM-DD.md`

If today's file does not exist, copy `!1 Work Log/template.md`.

Add a session entry under `## Sessions Today`:

```markdown
### HH:MM - <Agent Name>: <Short title>
**What was done:** ...
**Result:** ...
**Files:** path/to/file
```

Without these three updates, the session is not complete.

---

## TODO Routing

When the user says "remember this", "later", "put this on TODO", or when you discover a follow-up task, route it before session end.

| Task type | Destination | Format |
|---|---|---|
| Actionable today/tomorrow | `NOW.md` Top 3 or Active Projects "Next Action" | Inline |
| Planned for later | `Backlog.md` | One row with status, effort, note |
| Belongs to a project | `Projects/<Project>/HANDOFF.md` | In "You must do next" |
| Raw unsorted idea | `Inbox/YYYY-MM-DD-short-title.md` | 3-5 lines |
| Architecture decision | `Decisions/YYYY-MM-DD-topic.md` | ADR format |

Backlog status:

- `Ready` - can start now
- `Open` - idea clear, plan missing
- `Raw` - rough note, may be dropped

Golden rule: if a TODO is mentioned in chat and lands nowhere in the vault, it does not exist.

---

## Work Log vs Briefings

- `!1 Work Log/` is for human or agent sessions, commits, decisions, and operational notes.
- `!2 Briefings/` is for bot output, automated reports, daily digests, and feeds.
- `Changelog.md` is for structural vault changes: new templates, renamed folders, changed rules.

Do not write normal code-session summaries into `!2 Briefings/`.

---

## Git And Vault Sync

This vault is designed to work across devices and agents.

Before edits:

```bash
bash scripts/vault-prep.sh
```

After edits:

```bash
bash scripts/vault-finish.sh "vault: short description" file1 file2
```

Status check:

```bash
bash scripts/vault-status.sh
```

Common failure modes:

| Symptom | Response |
|---|---|
| `dubious ownership in repository` | Add the repo as a safe Git directory. |
| `Permission denied` | Fix file ownership; avoid writing as root in containers. |
| Rebase conflict | Stop, report it, and resolve deliberately. |
| Push rejected | Pull with rebase, then push again. |

Do not use `git reset --hard`, `git clean`, or `push --force` unless the user explicitly asks.

---

## Knowledge Wiki

Use `Knowledge/raw/` for immutable source captures.

Use domain folders for distilled pages:

- `Knowledge/AI/`
- `Knowledge/Business/`
- `Knowledge/Health/`
- `Knowledge/Marketing/`
- `Knowledge/Tools/`
- `Knowledge/Trading/`

Before writing durable knowledge:

1. Read `Knowledge/SCHEMA.md`.
2. Link sources or raw notes.
3. Update `Knowledge/LOG.md`.
4. Prefer small, maintainable concept pages over giant notes.

---

## Skill System

Skill-capable agents can load a compact vault workflow from:

```text
Agents/Skills/your-vault/SKILL.md
```

Install it locally:

```bash
bash scripts/install-skill.sh
```

The skill is not a replacement for this file. `AGENTS.md` remains the source of truth.

---

## Style

- Write in English unless the user prefers another language.
- Use short, clear notes.
- Prefer direct status over narrative.
- Use active voice.
- Keep project docs practical, not decorative.

---

## What Not To Do

- Do not make "while you're at it" changes.
- Do not add frameworks, plugins, or abstractions without a clear need.
- Do not skip hooks or checks.
- Do not leave TODOs only in chat.
- Do not report success without verification.
- Do not write private data into this public template.

---

## When In Doubt

Ask one clarifying question. If the task is clear, do it and verify it.
