# Obsidian Second Brain Template

Ein universelles Second Brain für Obsidian. Dein Wissen, deine Projekte, deine Entscheidungen — an einem Ort. Optimiert für die Zusammenarbeit mit AI-Agents (Claude, Codex, Cursor, etc.).

## Was ist das?

Ein Vault-Template das auf dem **VAULT.md Pattern** basiert:
- **VAULT.md** ist der universelle Einstiegspunkt für jeden AI-Agent
- Jeder Agent liest eine Datei und navigiert sich selbst zum relevanten Kontext
- Wissen ist als vernetzte Markdown-Files organisiert (Skill Graph Prinzip)
- Tool-agnostisch: Alles plain Markdown, funktioniert mit jedem Tool

## Quick Start

1. **Klone dieses Repo** (oder "Use this template" auf GitHub)
2. **Öffne den Ordner in Obsidian** (Manage Vaults → Open folder as vault)
3. **Fülle `People/Me.md`** aus — dein Profil, Stimme, Stil
4. **Erstelle dein erstes Projekt** — kopiere `Projects/.template/` und passe an
5. **Sag deinem AI-Agent**: "Lies zuerst VAULT.md"

## Struktur

```
VAULT.md                  ← Agent-Einstiegspunkt
Home.md                   ← Dein persönlicher Einstieg
Changelog.md              ← Was ist neu

People/                   ← Du und dein Netzwerk
  Index.md
  Me.md                   ← Dein Profil

Projects/                 ← Deine Projekte
  .template/              ← Kopierbare Vorlagen
    PROJECT.md            ← Projekt-Einstieg
    Voice.md              ← Kommunikationsstil
    ICP.md                ← Zielgruppe
    Services.md           ← Angebot

Knowledge/                ← Dein Wissen (erstelle eigene Unterordner)
  Index.md

Decisions/                ← Warum du was entschieden hast
  Index.md

Agents/                   ← AI-Agent Konfiguration
  Index.md

AI-Learnings/             ← Regeln für AI-Agents
  AI Regeln.md

Inbox/                    ← Drop-Zone für Unsortiertes
```

## Wie es funktioniert

### Für dich
- Schreib Ideen, Gedanken, Notizen → wirf sie in `Inbox/`
- Dein AI-Agent sortiert sie später ein
- Fülle deine Projekte Schritt für Schritt

### Für AI-Agents
```
Agent bekommt Aufgabe
    ↓
Liest VAULT.md
    ↓
Folgt Link zum relevanten Bereich
    ↓
Liest Index.md des Bereichs
    ↓
Folgt Wikilinks zu spezifischen Files
    ↓
Lädt nur was gebraucht wird (5-6 Files max)
```

### Automatisches Wachstum
Jeder Agent sollte am Ende einer Session prüfen:
1. Entscheidung getroffen? → `Decisions/`
2. Neues Wissen erarbeitet? → `Knowledge/`
3. Neue Person erwähnt? → `People/`
4. Projektstatus geändert? → Update Projekt-File
5. Learning/Fehler? → `AI-Learnings/AI Regeln.md`
6. Irgendwas geändert? → `Changelog.md`

## Neues Projekt erstellen

1. Kopiere `Projects/.template/` → `Projects/Dein-Projekt/`
2. Benenne die Files um und fülle sie aus
3. Verlinke das Projekt in `VAULT.md` und `Home.md`
4. Nicht jedes Projekt braucht alle Files — erstelle nur was du brauchst

## Agent-Integration

Füge eine Zeile in die Config deines AI-Tools ein:

| Tool | Config | Zeile |
|------|--------|-------|
| Claude Code | `CLAUDE.md` | `Lies zuerst: /pfad/zu/VAULT.md` |
| Codex | `AGENTS.md` | `Lies zuerst: /pfad/zu/VAULT.md` |
| Cursor | `.cursorrules` | `Lies zuerst: /pfad/zu/VAULT.md` |

## Prinzipien

- **Tool-agnostisch** — Plain Markdown, keine proprietären Formate
- **Agent-first** — Struktur optimiert für AI-Navigation
- **Organisches Wachstum** — Fang klein an, wächst mit der Zeit
- **Wikilinks** — `[[Verlinkung]]` ist wichtiger als Ordnerstruktur
- **YAGNI** — Erstelle Ordner und Files erst wenn du sie brauchst

## Credits

Basiert auf dem VAULT.md Pattern, inspiriert von:
- [Skill Graphs](https://linas.substack.com/p/skill-graphs) — Vernetztes Wissen für AI-Agents
- [Karpathy's LLM Wiki Pattern](https://x.com/karpathy) — Wissen das über Sessions akkumuliert
- [Obsidian](https://obsidian.md) — Local-first Markdown Knowledge Management
