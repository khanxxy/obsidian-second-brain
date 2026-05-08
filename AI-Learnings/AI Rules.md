# AI Rules

Stable lessons for agents working in this vault.

See also [[AGENTS]] for the full session protocol.

---

## Core Rules

1. **Read before writing.** Read `NOW.md` and the relevant project `HANDOFF.md` before starting work.
2. **Update before leaving.** Update `NOW.md`, project `HANDOFF.md`, and `!1 Work Log/` before ending a meaningful session.
3. **Do not guess state.** If you do not know the current status, read the file.
4. **Surgical edits only.** Change only what the user asked for.
5. **No silent failures.** If something fails, say what failed and why.
6. **Verify success.** Never report success without checking the result.

---

## Memory Between Sessions

Agents usually have no reliable memory between sessions. This vault creates memory through files:

- `NOW.md` = current project state
- `Projects/<Project>/HANDOFF.md` = what the last agent did and what comes next
- `!1 Work Log/` = session history
- `Backlog.md` = later, not now
- `Knowledge/` = durable concepts

Use them. Update them. That is how continuity works.

---

## When In Doubt

Ask one clarifying question. Do not guess. Do not do unrelated cleanup.
