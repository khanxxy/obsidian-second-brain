# Agent Rules

Read this file first, then read `VAULT.md`.

## Navigation
- Never guess the vault structure.
- Use `VAULT.md` as the entrypoint.
- Follow wiki-links to the smallest useful context.

## Editing
- Keep changes surgical.
- Do not create duplicate notes if the topic already exists.
- Update `Changelog.md` when the vault structure changes.
- Use templates from `Projects/.template/`, `! Briefings/template.md`, and `Decisions/template.md`.

## Daily Flow
- Daily work belongs in `Work Log/YYYY-MM-DD.md`.
- Bot runs and highlights belong in `! Briefings/`.
- Structural changes belong in `Changelog.md`.
- New durable knowledge belongs in `Knowledge/`, `People/`, `Projects/`, or `Decisions/`.

## Session End — MANDATORY

Before ending any session, update these three files:

1. **`NOW.md`** — Update the project row: status, next action, blocker, last agent, date.
2. **`Projects/<X>/HANDOFF.md`** — Add a new entry at the top: what was done, current state, what to do next, watch out. Keep last 5 entries visible, move older ones to `## Archive`.
3. **`Work Log/YYYY-MM-DD.md`** — Add your session row. Create the file from `Work Log/template.md` if it doesn't exist yet.

Without these three updates, the session is not finished.
The next agent (or you tomorrow) will lose context and have to re-discover everything.

## Anti-Hallucination
- Never answer questions about current project state from memory alone.
- Always read `NOW.md` first, then the relevant `Projects/<X>/HANDOFF.md`.
- If you are unsure what file contains the information, follow the links in `VAULT.md`.
- Never create a new file for something that already exists — search first.

## Git
- If this vault is synced across devices or agents, run `scripts/vault-prep.sh` before edits when available.
- After edits, run `scripts/vault-finish.sh "vault: short description" <files...>` when available.
- If conflicts happen, stop and merge carefully instead of overwriting.

## Style
- Prefer minimal, clear notes over elaborate systems.
- Do not add complexity unless the user actually needs it.
