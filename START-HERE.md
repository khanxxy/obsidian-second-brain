# Start Here

This is the practical onboarding guide.

Follow it once. After that, use `NOW.md` as your daily start page.

---

## If You Ask An AI Agent To Help

You can give Codex, Claude Code, Cursor, or another file-capable agent this prompt:

```text
Clone or inspect this repo and help me set it up:
https://github.com/khanxxy/obsidian-second-brain

Read README.md, START-HERE.md, VAULT.md, and AGENTS.md first. Then explain what this system is and guide me through the first setup. Do not edit files until you ask me for my first project name and one-sentence goal.
```

The agent should explain the workflow before editing anything:

- `NOW.md` = current state
- `Projects/<Project>/HANDOFF.md` = continuity between sessions
- `!1 Work Log/` = session history
- `Backlog.md` = later, not now
- `Knowledge/` = durable knowledge

---

## 1. Create Your Vault

On GitHub:

1. Open this template repo.
2. Click **Use this template**.
3. Create your own repo, for example `my-second-brain`.

On your computer:

```bash
git clone https://github.com/YOUR-USERNAME/my-second-brain.git
cd my-second-brain
```

Open the folder in Obsidian:

```text
Obsidian -> Open folder as vault -> my-second-brain
```

---

## 2. Fill In Your Profile

Open:

```text
People/Me.md
```

Fill in:

- who you are
- how you like to work
- your preferred language
- what AI agents should know about you

Keep it short. You can improve it later.

---

## 3. Create Your First Project

Copy the project template:

```bash
cp -R Projects/.template "Projects/My First Project"
```

Open:

```text
Projects/My First Project/Context.md
Projects/My First Project/HANDOFF.md
```

Fill in `Context.md` first:

- what the project is
- why it exists
- current state
- next meaningful step
- blockers

Then add a short first entry in `HANDOFF.md`.

---

## 4. Add The Project To NOW

Open:

```text
NOW.md
```

Replace the example project row with your real project.

`NOW.md` answers:

- What is active?
- What is the next action?
- What is blocked?
- Who worked on it last?

---

## 5. Start Your First Agent Session

Use this prompt:

```text
Read AGENTS.md and VAULT.md first. Then read NOW.md and the relevant project Context.md and HANDOFF.md. Continue from the next action, and before you finish update NOW.md, the project HANDOFF.md, and today's Work Log.
```

The agent should read the vault before doing work.

---

## 6. Check The Agent Did The Handoff

Before the session is done, check that these files changed:

```text
NOW.md
Projects/My First Project/HANDOFF.md
!1 Work Log/YYYY-MM-DD.md
```

If those three files were not updated, the session is not finished.

This is the main rule of the system.

---

## 7. Optional: Install The Vault Skill

If your agent supports skills, install the bundled skill:

```bash
bash scripts/install-skill.sh
```

For Claude Code symlink support:

```bash
bash scripts/install-skill.sh your-vault --claude
```

The skill helps agents auto-load the vault workflow when a task mentions projects, handoffs, work logs, briefings, TODOs, or knowledge.

---

## Daily Use

Start every day here:

```text
NOW.md
```

Then open the relevant project:

```text
Projects/<Project>/Context.md
Projects/<Project>/HANDOFF.md
```

At the end of every session:

```text
NOW.md
HANDOFF.md
!1 Work Log/YYYY-MM-DD.md
```

---

## Where Things Go

| Thing | File or folder |
|---|---|
| Active work | `NOW.md` |
| Later work | `Backlog.md` |
| Project details | `Projects/<Project>/Context.md` |
| Agent continuity | `Projects/<Project>/HANDOFF.md` |
| Session history | `!1 Work Log/` |
| Bot reports | `!2 Briefings/` |
| Durable knowledge | `Knowledge/` |
| Raw unsorted notes | `Inbox/` |
| Decisions | `Decisions/` |

---

## First Success Condition

You are set up when:

- `People/Me.md` describes you
- `NOW.md` has one real project
- `Projects/<Project>/Context.md` is filled in
- `Projects/<Project>/HANDOFF.md` has one entry
- an agent has created or updated today's `!1 Work Log/YYYY-MM-DD.md`

After that, the vault is usable.
