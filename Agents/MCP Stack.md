---
tags: [agents, mcp]
---

# MCP Stack

Optional tool layer for agents.

Keep this empty or minimal until you really use MCPs.

---

## Servers

| # | Server | Command | Purpose |
|---|---|---|---|
| 1 | Example: Obsidian | `npx -y obsidian-mcp <vault-path>` | Search vault |
| 2 | Example: Firecrawl | `npx -y firecrawl-mcp` | Read web pages |
| 3 | Example: Perplexity | `npx -y @perplexity-ai/mcp-server` | Research with sources |

Add servers only when they are actually installed.

---

## Config Files

| Tool | Path |
|---|---|
| Claude Code | `~/.claude.json` |
| Claude Desktop | `~/Library/Application Support/Claude/claude_desktop_config.json` |
| Other tools | Tool-specific config |

Only maintain configs for tools you use.

---

## Installation Pattern

```bash
claude mcp add <name> -s user -e KEY1=val1 -- <command> [args]
```

- Provide API keys during install.
- Use full binary paths if desktop apps cannot see your shell PATH.
- Verify after installation.

---

## Common Problems

| Problem | Fix |
|---|---|
| Desktop cannot find `npx` | Use the full path, such as `/opt/homebrew/bin/npx`. |
| Obsidian MCP crashes | Check the real vault path. |
| MCP does not start | Reinstall with required API keys. |
| MCP is slow | Prefer direct file access when possible. |
