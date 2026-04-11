# Obsidian Second Brain

A universal Second Brain template for Obsidian — optimised for AI agent collaboration.

Your knowledge, projects, decisions — one place. Any AI agent reads `VAULT.md` and navigates itself to the right context. No plugins required. Plain Markdown.

## Why This Exists

AI agents (Claude Code, Codex, Cursor, Copilot, etc.) are powerful — but they forget everything between sessions. This vault is their long-term memory. Yours too.

The **VAULT.md pattern** gives every agent a single entry point. From there, it follows wiki-links to load only what it needs. No context window wasted on irrelevant files.

## Quick Start

1. Click **"Use this template"** on GitHub (or clone the repo)
2. Open the folder in [Obsidian](https://obsidian.md) → Manage Vaults → Open folder as vault
3. Fill in `People/Me.md` — your profile, voice, preferences
4. Create your first project — copy `Projects/.template/` and customise
5. Tell your AI agent: **"Read VAULT.md first"**

That's it. The vault grows organically from there.

## Structure

```
VAULT.md                  ← Agent entry point (read this first)
Home.md                   ← Your personal dashboard
Changelog.md              ← What changed and when

People/                   ← You and your network
  Index.md
  Me.md                   ← Your profile, voice, style

Projects/                 ← Your projects
  .template/              ← Copy this to start a new project
    PROJECT.md            ← Project overview
    Voice.md              ← How this project communicates
    ICP.md                ← Target audience
    Services.md           ← What's offered
  Example-SaaS/           ← Filled example to show the pattern

Knowledge/                ← Your knowledge (create subfolders as needed)
  Index.md

Decisions/                ← Why you decided what you decided
  Index.md

Agents/                   ← AI agent configs, MCP servers, automations
  Index.md

AI-Learnings/             ← Rules for AI agents (learned from mistakes)
  AI Rules.md
  Import Instructions.md

Inbox/                    ← Drop zone for unsorted notes
```

## How It Works

### For You
- Drop ideas, notes, thoughts into `Inbox/`
- Your AI agent sorts them into the right place
- Fill your projects step by step — or let the agent do it

### For AI Agents
```
Agent receives task
    ↓
Reads VAULT.md
    ↓
Follows link to relevant section
    ↓
Reads Index.md of that section
    ↓
Follows wiki-links to specific files
    ↓
Loads only what's needed (5-6 files max)
```

### Automatic Growth
Every agent should check at the end of a session:
1. Decision made? → `Decisions/`
2. New knowledge created? → `Knowledge/`
3. New person mentioned? → `People/`
4. Project status changed? → Update project file
5. Mistake or learning? → `AI-Learnings/AI Rules.md`
6. Anything changed? → `Changelog.md`

## Creating a New Project

1. Copy `Projects/.template/` → `Projects/Your-Project/`
2. Fill in the files — not every project needs all of them
3. Link the project in `VAULT.md`
4. See `Projects/Example-SaaS/` for a filled example

## Agent Integration

Add one line to your AI tool's config:

| Tool | Config File | Line |
|------|------------|------|
| Claude Code | `CLAUDE.md` | `Read first: /path/to/VAULT.md` |
| Codex | `AGENTS.md` | `Read first: /path/to/VAULT.md` |
| Cursor | `.cursorrules` | `Read first: /path/to/VAULT.md` |
| Hermes Agent | `config.yaml` | Set vault path in Obsidian skill |

Any tool that can read Markdown works with this vault. No lock-in.

## Requirements

### Minimum (start immediately)
- **[Obsidian](https://obsidian.md)** — Free, local-first, all platforms
- **Any AI tool** — Claude Code, Codex, Cursor, ChatGPT, anything
- That's it. The vault is plain Markdown.

### Optional (makes it more powerful)

| Capability | Why | Examples (2026) |
|-----------|-----|----------------|
| **AI coding agent** | Reads/writes your vault, executes tasks | Claude Code, Codex CLI, Cursor |
| **Web access** | Agent can research and write findings to vault | Perplexity MCP, Firecrawl MCP, built-in web tools |
| **Platform access** | Direct access to platforms you use | Twitter MCP, Slack MCP, API integrations |
| **Automation** | Vault grows automatically (reports, digests) | Cron jobs, GitHub Actions, LaunchAgents |
| **Git sync** | Vault syncs between machines | Obsidian Git plugin, or manual git |

### Recommended Obsidian Plugins
- **Git** — Auto-sync vault via Git (essential for multi-device)
- **Templater** — Use the project templates more efficiently
- **Dataview** — Query your vault like a database
- **Calendar** — Daily notes integration

## Principles

- **Tool-agnostic** — Plain Markdown, no proprietary formats
- **Agent-first** — Structure optimised for AI navigation
- **Organic growth** — Start small, grows over time
- **Wiki-links** — `[[Links]]` matter more than folder structure
- **YAGNI** — Create folders and files only when you need them
- **One source of truth** — If it's not in the vault, it doesn't exist

## Credits

Inspired by:
- [Skill Graphs](https://linas.substack.com/p/skill-graphs) — Networked knowledge for AI agents
- [Karpathy's LLM Wiki Pattern](https://x.com/karpathy) — Knowledge that accumulates across sessions
- [Obsidian](https://obsidian.md) — Local-first Markdown knowledge management

## License

MIT — see [LICENSE](LICENSE)
