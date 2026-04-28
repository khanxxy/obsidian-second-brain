# Agent Rules

Read this file first. Then read `VAULT.md`. Then read `NOW.md`.

---

## Navigation

- Never guess the vault structure — use `VAULT.md` as the entry point.
- Use `NOW.md` to understand what's currently active before touching anything.
- Follow wiki-links to the smallest useful context.
- Check `Projects/<X>/HANDOFF.md` before starting work on any project.

---

## Editing

- Keep changes surgical. Only touch what's relevant to the task.
- Do not create duplicate notes if the topic already exists.
- Update `Changelog.md` when the vault structure changes.
- Use templates from `Projects/.template/`, `! Briefings/template.md`, and `Decisions/template.md`.

---

## Daily Flow

- Daily work sessions belong in `Work Log/YYYY-MM-DD.md`.
- Bot outputs, news, and briefings belong in `! Briefings/`.
- Structural changes belong in `Changelog.md`.
- New durable knowledge belongs in `Knowledge/`, `People/`, `Projects/`, or `Decisions/`.

---

## Session End — Mandatory Handoff Protocol

Before ending any session, update these three files:

### 1. `NOW.md`
Update your project row: Status, Next Action, Blocker, your agent name, today's date.

### 2. `Projects/<X>/HANDOFF.md`
Add a new entry at the top:

```
## YYYY-MM-DD HH:MM — [Agent Name]
**What was done:** ...
**Current state:** ...
**You must do next:** ...
**Watch out:** ...
```

Keep the last 5 entries visible. Move older ones to `## Archive`.

### 3. `Work Log/YYYY-MM-DD.md`
Add your session entry. If today's file doesn't exist, copy from `Work Log/template.md`.

**Without these three updates, the session is not complete.**  
The next agent — human or AI — will lose context and have to re-discover everything.

---

## Anti-Hallucination Rules

- Never answer questions about current state from memory alone — read the actual file first.
- Never report success without verifying the result.
- If you're unsure what's in a file, read it. Do not guess.
- If a conflict exists in git, stop and report it. Do not overwrite.

---

## Git

- Run `scripts/vault-prep.sh` before edits when available.
- Run `scripts/vault-finish.sh "vault: short description" <files...>` after edits.
- If conflicts happen, stop and merge carefully. Never force-push.

---

## Style

- Write in English. (Exception: user explicitly writes in another language.)
- Prefer minimal, clear notes over elaborate systems.
- Do not add complexity unless it's actually needed.
- Short sentences. Active voice.
