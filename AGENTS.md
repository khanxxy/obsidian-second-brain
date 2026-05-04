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

## TODO Routing — where does a new task land?

When the user says "put that on TODO" / "later" / "remember" — OR when you discover a follow-up task during a session — never let it die in chat. Before session end, write it to the right place:

| Type of task | Where | Format |
|---|---|---|
| Actionable today/tomorrow | `NOW.md` → Top 3 or Active Projects "Next Action" | Inline |
| Planned for "whenever there's time" | `Backlog.md` → matching category | One row with Status (🟢/🟡/🔴) + Effort (S/M/L/XL) + 1-line note |
| Belongs to a specific project | `Projects/<X>/HANDOFF.md` → "You must do next" | In the running HANDOFF entry |
| Raw idea, no time to sort | `Inbox/YYYY-MM-DD-shorttitle.md` | 3-5 lines, sort during weekly review |
| Architecture decision with rationale | `Decisions/YYYY-MM-DD-<topic>.md` | ADR format |

**Golden rule:** If a TODO is mentioned in chat and lands nowhere in the vault → it does not exist. The user forgets, the next agent knows nothing about it. Better to over-categorize than under.

**Status markers in Backlog:**
- 🔥 in `NOW.md` Top 3 = this week
- 🟢 in Backlog = ready to start, plan complete
- 🟡 in Backlog = idea clear, plan missing
- 🔴 in Backlog = raw note, possibly drop

---

## Anti-Hallucination Rules

- Never answer questions about current state from memory alone — read the actual file first.
- Never report success without verifying the result.
- If you're unsure what's in a file, read it. Do not guess.
- If a conflict exists in git, stop and report it. Do not overwrite.

---

## Git & Vault-Sync — Known Failure-Modes

This vault is typically synced across multiple devices (Mac, VPS, mobile) via Git. Race-conditions are normal. Here are the four common failure-modes and how to resolve them.

### Before edits
```bash
bash scripts/vault-prep.sh   # pull/rebase
```

### After edits
```bash
bash scripts/vault-finish.sh "vault: short description" file1 file2 ...
```

### Failure-Mode 1: `dubious ownership in repository`
Common in containerized setups (Docker) when files are owned by a different UID than the executing process.
```bash
git config --global --add safe.directory /path/to/vault
```

### Failure-Mode 2: `Permission denied` when writing
Files were written as a different user (often root in container contexts). Fix ownership:
```bash
# In container context (example Docker)
docker exec --user root <container> chown -R <uid>:<gid> /path/to/vault
```
**Best practice:** ALWAYS run mutating ops as the vault-owning user, never as root.

### Failure-Mode 3: `Could not apply ... rebase conflict`
Race-condition with auto-sync from another device.

- **If the other device has the canonical version:** `git fetch origin && git reset --hard origin/main` (loses your local commits — make sure they're saved elsewhere first)
- **If your local edits are critical:** manually resolve the conflict, then `git add <file> && git rebase --continue`
- **For programmatic merges of "both versions wanted" scenarios:**
  ```python
  import re
  s = open(p).read()
  merged = re.sub(r'<<<<<<< HEAD\n(.*?)=======\n(.*?)>>>>>>> .*?\n',
                  lambda m: m.group(1) + m.group(2),
                  s, flags=re.DOTALL)
  open(p, 'w').write(merged)
  ```
- **For test-runs that write to vault:** pause auto-sync first to prevent races

### Failure-Mode 4: `git push` rejected with "fast-forward"
Another sync-cycle pushed in the meantime.
```bash
git pull --rebase origin main && git push origin main
```

---

## Skill System (for skill-capable agents)

Skill-capable agents (Codex CLI, Claude Code, Antigravity, Gemini CLI, GitHub Copilot, Amp, etc.) auto-discover skills from `~/.agents/skills/<name>/SKILL.md`. A vault-specific skill compresses these AGENTS.md rules + your private conventions into one file that loads automatically when the agent's task touches the vault.

**Build your own vault-skill:**
1. Install `mattpocock/skills/skills/productivity/write-a-skill` via `npx skills@latest add ...`
2. Use it to generate `~/.agents/skills/<your-vault>/SKILL.md` based on this AGENTS.md + your custom conventions
3. Symlink for Claude Code: `ln -s ~/.agents/skills/<your-vault> ~/.claude/skills/<your-vault>`
4. Mirror in vault for human reading: `Agents/Skills/<your-vault>.md`

**Why this matters:** Without a skill, every new session re-reads AGENTS.md cold. With a skill, the agent has the rules + lessons internalized from session start, plus pulls them only when the task triggers vault-related descriptions (no noise on unrelated tasks).

See `Knowledge/AI/Karpathy Autoresearch Loop.md` for the related "locked rules + mutable application" pattern.

---

## Style

- Write in English. (Exception: user explicitly writes in another language.)
- Prefer minimal, clear notes over elaborate systems.
- Do not add complexity unless it's actually needed.
- Short sentences. Active voice.

---

## What NOT to do

- No "while you're at it" improvements — only what was asked.
- No new abstractions, helpers, or frameworks without authorization.
- No destructive git actions (`reset --hard`, `push --force`) without explicit permission.
- No skipping hooks (`--no-verify`).
- No silent errors — surface them.
- Never report success without verification.

---

## When in doubt

Ask ONE clarifying question. Never guess. Never assume. When the task is crystal-clear: just do it.
