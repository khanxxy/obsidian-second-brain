# Obsidian Second Brain

A clean, shippable Obsidian vault template for humans and AI agents.

No private projects. No client data. No example businesses.
Just a solid structure, templates, rules, and a clear entry point.

---

## What this template solves

AI agents lose context between sessions. Humans too.
This repo gives both a stable location for:

- Projects
- Knowledge
- Decisions
- People
- Daily briefings
- Agent workflows

The core is simple:

1. `AGENTS.md` defines agent behavior — including mandatory session-end protocol
2. `VAULT.md` is the entry point
3. `NOW.md` holds the current state of all projects
4. Wiki-links lead to the relevant context

---

## What is intentionally missing

- Real projects
- Personal names
- Reports
- Client examples
- Running daily notes
- Private Obsidian workspace states

This repo should be shareable with friends without needing to clean up first.

---

## Quick Start

1. Click **"Use this template"** on GitHub or clone the repo
2. Open the folder in [Obsidian](https://obsidian.md) as a vault
3. Fill in `People/Ich.md` (your profile)
4. Fill in `NOW.md` (your current projects)
5. Copy your first project from `Projects/.template/`
6. Tell any agent: **"Read AGENTS.md and VAULT.md first"**

---

## Structure

```
AGENTS.md                  ← Behavior rules for agents (read first)
VAULT.md                   ← Central entry point
NOW.md                     ← Current state of all projects
Home.md                    ← Dashboard and start checklist
Changelog.md               ← Structural vault changes

! Briefings/               ← Bot runs and daily highlights
  Index.md
  template.md

Work Log/                  ← Sessions, commits, decisions (one file per day)
  README.md
  template.md

People/                    ← You, your team, your contacts
Projects/
  Index.md
  .template/               ← Template for new projects
    Context.md             ← Project background and status
    HANDOFF.md             ← Agent hand-off log (newest on top)
    ICP.md
    Voice.md
    Services.md

Knowledge/                 ← Topic knowledge that lives beyond projects
Decisions/                 ← Decision logic and trade-offs
Agents/                    ← MCPs, bots, automations, sync rules
AI-Learnings/              ← Rules and learnings for agents
Inbox/                     ← Unsorted inputs
scripts/                   ← Optional Git sync helpers for multi-device setups
```

---

## Key patterns

### NOW.md — current state table
One row per active project. Agents update it at the end of every session.
Answers the question: *"What is happening right now?"*

### HANDOFF.md — agent continuity
One entry per session, newest on top. Last 5 visible, older in `## Archive`.
Answers the question: *"What did the last agent do, and what do I do next?"*

### Work Log vs Briefings
- `Work Log/` → actual project work (commits, code, sessions)
- `! Briefings/` → bot runs, automated reports, daily highlights

---

## Principles

| Principle | Description |
|-----------|-------------|
| **Empty by default** | No foreign content in initial state |
| **Agent-first** | Clear entry point instead of chaotic folder structure |
| **Continuity built-in** | NOW.md + HANDOFF.md prevent context loss between sessions |
| **Markdown only** | No plugin dependency for core function |
| **Minimal setup** | Add complexity only when truly needed |
| **Git-friendly** | Multi-device and multi-agent sync cleanly |

---

## For whom

- Solo founders
- Freelancers
- Research-heavy operators
- People using multiple AI tools (Claude, Codex, Gemini, Cursor, ...)
- Teams wanting to keep knowledge in Markdown

---

## Optional but useful

- Obsidian Git Plugin or standard Git
- Templater
- Dataview
- Dedicated MCPs or API tools

The template works completely without these extras.

---

## License

MIT — see [LICENSE](LICENSE)
