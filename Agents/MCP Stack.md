---
tags: [agents, mcp]
---

# MCP Stack

> Alle MCP-Server, Config-Pfade, Troubleshooting.
> Letzte Aktualisierung: YYYY-MM-DD

---

## Server

| # | Server | Command | Zweck |
|---|--------|---------|-------|
| 1 | **Firecrawl** | `npx -y firecrawl-mcp` | Websites scrapen |
| 2 | **Obsidian** | `npx -y obsidian-mcp <vault-path>` | Vault lesen/schreiben |
| 3 | **Perplexity** | `npx -y @perplexity-ai/mcp-server` | AI-Recherche mit Quellen |

> Füge hier deine Server hinzu sobald du sie einrichtest.

## Config-Dateien

| Wo | Pfad |
|----|------|
| **Claude Code** | `~/.claude.json` → `mcpServers` |
| **Claude Desktop** | `~/Library/Application Support/Claude/claude_desktop_config.json` |

**Beide müssen synchron sein!**

## Installation

```bash
claude mcp add <name> -s user -e KEY1=val1 -e KEY2=val2 -- <command> [args]
```

- Immer `-s user` (global, nicht project)
- Immer alle API Keys sofort mitgeben
- Nach Installation: Desktop-Config manuell updaten
- Volle Pfade in Desktop: `/opt/homebrew/bin/npx` statt `npx`

## Vault-Pfad

Falls dein Vault über iCloud synchronisiert wird:
- **Symlink:** `~/MeinVault`
- **Echter Pfad:** `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MeinVault`
- **In MCP-Configs immer den echten Pfad verwenden!**

## Bekannte Probleme

| Problem | Lösung |
|---------|--------|
| Desktop findet `npx` nicht | Vollen Pfad: `/opt/homebrew/bin/npx` |
| Obsidian MCP crasht | Symlink → echten iCloud-Pfad nutzen |
| MCP startet nicht | API Keys vergessen? → neu installieren mit `-e` |
| Obsidian MCP langsam | Direkt in Vault schreiben, MCP nur für search |
