---
tags: [agents, mcp]
---

# MCP Stack

> Optionale Tool-Schicht fuer Agents.
> Lass diese Datei leer oder minimal, bis du wirklich MCPs nutzt.

---

## Server

| # | Server | Command | Zweck |
|---|--------|---------|-------|
| 1 | _Beispiel: Obsidian_ | `npx -y obsidian-mcp <vault-path>` | Vault durchsuchen |
| 2 | _Beispiel: Firecrawl_ | `npx -y firecrawl-mcp` | Webinhalte lesen |
| 3 | _Beispiel: Perplexity_ | `npx -y @perplexity-ai/mcp-server` | Recherche mit Quellen |

> Füge hier deine Server hinzu sobald du sie einrichtest.

## Config-Dateien

| Wo | Pfad |
|----|------|
| **Claude Code** | `~/.claude.json` |
| **Claude Desktop** | `~/Library/Application Support/Claude/claude_desktop_config.json` |
| **Andere Tools** | jeweilige Tool-Config |

Nur die Configs pflegen, die du wirklich verwendest.

## Installation

```bash
claude mcp add <name> -s user -e KEY1=val1 -- <command> [args]
```

- Keys sofort mitgeben
- Volle Pfade verwenden, wenn Desktop-Apps dein Shell-PATH nicht kennen
- Installation immer verifizieren

## Bekannte Probleme

| Problem | Lösung |
|---------|--------|
| Desktop findet `npx` nicht | Vollen Pfad: `/opt/homebrew/bin/npx` |
| Obsidian MCP crasht | echten Vault-Pfad pruefen |
| MCP startet nicht | API Keys vergessen? → neu installieren mit `-e` |
| MCP langsam | direkten Dateizugriff bevorzugen, MCP nur wenn noetig |
