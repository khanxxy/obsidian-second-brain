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
- Daily work belongs in `! Briefings/`.
- Structural changes belong in `Changelog.md`.
- New durable knowledge belongs in `Knowledge/`, `People/`, `Projects/`, or `Decisions/`.

## Git
- If this vault is synced across devices or agents, run `scripts/vault-prep.sh` before edits when available.
- After edits, run `scripts/vault-finish.sh "vault: short description" <files...>` when available.
- If conflicts happen, stop and merge carefully instead of overwriting.

## Style
- Prefer minimal, clear notes over elaborate systems.
- Do not add complexity unless the user actually needs it.
