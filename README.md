# Obsidian Second Brain

Ein universelles Second-Brain-Template für Obsidian — optimiert für die Zusammenarbeit mit AI-Agents.

Dein Wissen, deine Projekte, deine Entscheidungen — an einem Ort. Jeder AI-Agent liest `VAULT.md` und navigiert sich selbst zum richtigen Kontext. Keine Plugins nötig. Nur Markdown.

## Warum das existiert

AI-Agents (Claude Code, Codex, Cursor, Copilot, etc.) sind mächtig — aber sie vergessen alles zwischen Sessions. Dieser Vault ist ihr Langzeitgedächtnis. Und deins auch.

Das **VAULT.md Pattern** gibt jedem Agent einen einzigen Einstiegspunkt. Von dort folgt er Wiki-Links und lädt nur was er braucht. Kein Context Window verschwendet auf irrelevante Dateien.

## Quick Start

1. Klicke **"Use this template"** auf GitHub (oder klone das Repo)
2. Öffne den Ordner in [Obsidian](https://obsidian.md) → Vaults verwalten → Ordner als Vault öffnen
3. Fülle `People/Ich.md` aus — dein Profil, Stimme, Präferenzen
4. Erstelle dein erstes Projekt — kopiere `Projects/.template/` und passe es an
5. Sag deinem AI-Agent: **"Lies zuerst VAULT.md"**

Das war's. Der Vault wächst organisch von dort.

## Struktur

```
VAULT.md                    ← Agent-Einstiegspunkt (zuerst lesen)
Home.md                     ← Dein persönliches Dashboard
Changelog.md                ← Was sich wann geändert hat

Briefings/                  ← Tägliche Zusammenfassungen
  Index.md                  ← Feed aller Briefings
  template.md               ← Vorlage für neue Briefings

People/                     ← Du und dein Netzwerk
  Index.md
  Ich.md                    ← Dein Profil, Stimme, Stil
  users/                    ← Messaging-Kontakte (Telegram, WhatsApp)
    template.md

Projects/                   ← Deine Projekte
  .template/                ← Kopiere das für neue Projekte
    PROJECT.md              ← Projektübersicht
    Voice.md                ← Wie das Projekt kommuniziert
    ICP.md                  ← Zielgruppe
    Services.md             ← Was angeboten wird
  Beispiel-Projekt/         ← Ausgefülltes Beispiel

Knowledge/                  ← Dein Wissen (Unterordner nach Bedarf)
  Index.md

Decisions/                  ← Warum du entschieden hast was du entschieden hast
  Index.md

Agents/                     ← AI-Agent-Configs, MCP-Server, Automatisierungen
  Index.md                  ← Zeitpläne, Agent-Details
  Active Bots.md            ← Live-Feed aller Bot-Runs
  MCP Stack.md              ← MCP-Server Konfiguration

AI-Learnings/               ← Regeln für AI-Agents (aus Fehlern gelernt)
  AI Regeln.md
  Import Instructions.md

Inbox/                      ← Ablage für unsortierte Notizen
```

## Wie es funktioniert

### Für dich
- Ideen, Notizen, Gedanken in `Inbox/` ablegen
- Dein AI-Agent sortiert sie an den richtigen Ort
- Projekte Schritt für Schritt füllen — oder den Agent machen lassen

### Für AI-Agents
```
Agent bekommt Aufgabe
    ↓
Liest VAULT.md
    ↓
Folgt Link zur relevanten Sektion
    ↓
Liest Index.md dieser Sektion
    ↓
Folgt Wiki-Links zu spezifischen Dateien
    ↓
Lädt nur was nötig ist (5-6 Dateien max)
```

### Automatisches Wachstum
Jeder Agent prüft am Ende einer Session:
1. Entscheidung getroffen? → `Decisions/`
2. Neues Wissen erstellt? → `Knowledge/`
3. Neue Person erwähnt? → `People/`
4. Projektstatus geändert? → Projektdatei updaten
5. Fehler oder Learning? → `AI-Learnings/AI Regeln.md`
6. Irgendetwas geändert? → `Changelog.md`

### Briefings
Das Briefing-System gibt dir eine tägliche Übersicht:
- Was ist heute passiert? (Sessions + Bot-Runs)
- Highlights und offene Punkte
- Kopiere `Briefings/template.md` für ein neues Briefing

## Neues Projekt erstellen

1. Kopiere `Projects/.template/` → `Projects/Dein-Projekt/`
2. Dateien ausfüllen — nicht jedes Projekt braucht alle
3. Projekt in `VAULT.md` verlinken
4. Siehe `Projects/Beispiel-Projekt/` für ein ausgefülltes Beispiel

## Agent Integration

Füge eine Zeile in die Config deines AI-Tools ein:

| Tool | Config-Datei | Zeile |
|------|-------------|-------|
| Claude Code | `CLAUDE.md` | `Lies zuerst: /pfad/zu/VAULT.md` |
| Codex | `AGENTS.md` | `Lies zuerst: /pfad/zu/VAULT.md` |
| Cursor | `.cursorrules` | `Lies zuerst: /pfad/zu/VAULT.md` |

Jedes Tool das Markdown lesen kann funktioniert mit diesem Vault. Kein Lock-in.

## Agents & Automatisierung

Dieses Template enthält eine vollständige Infrastruktur für automatische Agents:

- **`Agents/Index.md`** — Zentrale Übersicht aller Agents mit Zeitplänen
- **`Agents/Active Bots.md`** — Live-Dashboard aller Bot-Runs
- **`Agents/MCP Stack.md`** — MCP-Server Setup und Troubleshooting

### Beispiele für Agents
| Agent | Was er tut | Zeitplan |
|-------|-----------|----------|
| AI Digest | Tägliche AI-News kuratieren | Täglich 9:00 |
| Vault Sync | Git-Sync zwischen Geräten | Alle 5 Min |
| Research Bot | Automatische Recherche zu Themen | Nach Bedarf |

Agents können via **LaunchAgents** (macOS), **Cron** (Linux), oder **GitHub Actions** ausgeführt werden.

## Voraussetzungen

### Minimum (sofort starten)
- **[Obsidian](https://obsidian.md)** — Kostenlos, local-first, alle Plattformen
- **Irgendein AI-Tool** — Claude Code, Codex, Cursor, ChatGPT, egal was
- Das war's. Der Vault ist reines Markdown.

### Optional (macht es mächtiger)

| Fähigkeit | Warum | Beispiele |
|-----------|-------|-----------|
| **AI Coding Agent** | Liest/schreibt deinen Vault, führt Aufgaben aus | Claude Code, Codex CLI, Cursor |
| **Web-Zugang** | Agent kann recherchieren und Ergebnisse in Vault schreiben | Perplexity MCP, Firecrawl MCP |
| **Plattform-Zugang** | Direkter Zugriff auf Plattformen die du nutzt | Twitter MCP, Slack MCP, API-Integrationen |
| **Automatisierung** | Vault wächst automatisch (Reports, Digests) | Cron Jobs, GitHub Actions, LaunchAgents |
| **Git Sync** | Vault synchronisiert zwischen Geräten | Obsidian Git Plugin, oder manuelles Git |

### Empfohlene Obsidian Plugins
- **Git** — Auto-Sync via Git (essenziell für Multi-Device)
- **Templater** — Projekt-Templates effizienter nutzen
- **Dataview** — Vault wie eine Datenbank abfragen
- **Calendar** — Daily Notes Integration

## Prinzipien

- **Tool-agnostisch** — Reines Markdown, keine proprietären Formate
- **Agent-first** — Struktur optimiert für AI-Navigation
- **Organisches Wachstum** — Klein starten, wächst mit der Zeit
- **Wiki-Links** — `[[Links]]` sind wichtiger als Ordnerstruktur
- **YAGNI** — Ordner und Dateien nur erstellen wenn du sie brauchst
- **Eine Source of Truth** — Wenn es nicht im Vault steht, existiert es nicht

## Credits

Inspiriert von:
- [Skill Graphs](https://linas.substack.com/p/skill-graphs) — Vernetztes Wissen für AI-Agents
- [Karpathy's LLM Wiki Pattern](https://x.com/karpathy) — Wissen das über Sessions akkumuliert
- [Obsidian](https://obsidian.md) — Local-first Markdown Wissensmanagement

## Lizenz

MIT — siehe [LICENSE](LICENSE)
