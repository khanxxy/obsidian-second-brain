# Ask Codex

Copy one of these prompts into Codex, Claude Code, Cursor, or another file-capable AI agent.

Use `START-HERE.md` if you want the full human walkthrough.

---

## 1. Set This Up For Me

Use this when you are starting from the GitHub repo link.

```text
Clone or inspect this repo and help me set it up:
https://github.com/khanxxy/obsidian-second-brain

Read README.md, START-HERE.md, VAULT.md, and AGENTS.md first.

Then explain in plain language:
1. what this system is
2. what NOW.md, HANDOFF.md, and !1 Work Log are for
3. what I need to do first

Do not edit files until you ask me for:
- my name or profile basics
- my first project name
- my first project's one-sentence goal
```

---

## 2. Create My First Project

Use this after the repo is already cloned and opened locally.

```text
Read AGENTS.md, VAULT.md, START-HERE.md, and NOW.md first.

Help me create my first project in this vault.

Ask me for:
1. project name
2. one-sentence goal
3. current state
4. next meaningful step
5. blockers

After I answer, create the project from Projects/.template, fill Context.md, add an initial HANDOFF.md entry, update NOW.md, and create or update today's !1 Work Log/YYYY-MM-DD.md.

Do not create fake content. Use only what I tell you.
```

---

## 3. Continue My Current Project

Use this when you already have one or more projects.

```text
Read AGENTS.md and VAULT.md first.
Then read NOW.md.

Identify my active project and read its Context.md and HANDOFF.md.

Tell me:
1. current status
2. next action
3. blocker if any

Then ask me whether to continue that next action.

Before you finish, update NOW.md, the project HANDOFF.md, and today's !1 Work Log/YYYY-MM-DD.md.
```

---

## 4. Summarize My Vault

Use this when you want a status overview.

```text
Read VAULT.md, AGENTS.md, NOW.md, Backlog.md, and Projects/Index.md.

Give me a concise status overview:
1. active projects
2. next actions
3. blockers
4. stale or missing handoffs
5. what I should do next

Do not edit files unless I ask you to.
```

---

## 5. Save This Conversation Into The Vault

Use this after a useful chat.

```text
Read AGENTS.md, VAULT.md, NOW.md, and AI-Learnings/Import Instructions.md.

Import the useful parts of this conversation into the vault.

Route information correctly:
- project work -> Projects/<Project>/
- later tasks -> Backlog.md
- durable knowledge -> Knowledge/
- decisions -> Decisions/
- unsorted notes -> Inbox/

Before you write, tell me where you plan to put the information.
After writing, update the relevant HANDOFF.md and today's !1 Work Log/YYYY-MM-DD.md.
```

---

## 6. Install The Vault Skill

Use this after the first project works.

```text
Read START-HERE.md and Agents/Skills/your-vault/SKILL.md.

Explain what the vault skill does.
Then install it with:

bash scripts/install-skill.sh

After installation, verify that ~/.agents/skills/your-vault/SKILL.md exists.
```

---

## Rule Of Thumb

If you are unsure what to ask Codex, use prompt 1 first.

If Codex starts editing before asking about your first real project, stop it and say:

```text
Stop. First explain the vault workflow and ask me for my first project name and goal.
```
