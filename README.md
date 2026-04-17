# Obsidian Second Brain

Ein leeres, verschickbares Obsidian-Template fuer Menschen und AI-Agents.

Keine privaten Projekte. Keine Kundendaten. Keine Beispiel-Businesses.
Nur eine saubere Struktur, Templates, Regeln und ein klarer Einstiegspunkt.

## Was dieses Template loest

AI-Agents verlieren Kontext zwischen Sessions. Menschen auch. Dieses Repo gibt beiden einen stabilen Ort fuer:

- Projekte
- Wissen
- Entscheidungen
- Personen
- Tagesbriefings
- Agent-Workflows

Der Kern ist simpel:

1. `AGENTS.md` setzt das Arbeitsverhalten
2. `VAULT.md` ist der Einstiegspunkt
3. Wiki-Links fuehren zum relevanten Kontext

## Was absichtlich fehlt

- echte Projekte
- persoenliche Namen
- Reports
- Kundenbeispiele
- laufende Tagesnotizen
- private Workspace-States aus Obsidian

Dieses Repo soll man Freunden schicken koennen, ohne vorher aufraeumen zu muessen.

## Quick Start

1. Auf GitHub `Use this template` klicken oder das Repo klonen
2. Ordner in [Obsidian](https://obsidian.md) als Vault oeffnen
3. `People/Ich.md` ausfuellen
4. Erstes Projekt aus `Projects/.template/` kopieren
5. Dem Agent sagen: `Lies zuerst AGENTS.md und VAULT.md`

## Struktur

```text
AGENTS.md                  ← Verhaltensregeln fuer Agents im Repo
VAULT.md                   ← zentraler Einstiegspunkt
Home.md                    ← Dashboard und Startcheckliste
Changelog.md               ← strukturelle Vault-Aenderungen

! Briefings/               ← Tagesbriefings
  Index.md
  template.md

People/                    ← du, dein Team, deine Kontakte
Projects/
  Index.md
  .template/               ← Vorlage fuer neue Projekte

Knowledge/                 ← Themenwissen
Decisions/                 ← Entscheidungslogik
Agents/                    ← MCPs, Bots, Automationen, Sync-Regeln
AI-Learnings/              ← Regeln und Learnings fuer Agents
Inbox/                     ← unsortierte Eingaben
scripts/                   ← optionale Git-Sync-Helfer fuer Multi-Device-Setups
```

## Fuer wen das gedacht ist

- Solo-Founder
- Freelancer
- Research-lastige Operator
- Leute mit mehreren AI-Tools
- Teams, die Wissen in Markdown halten wollen

## Prinzipien

- **Empty by default** — keine fremden Inhalte im Startzustand
- **Agent-first** — klarer Einstieg statt chaotischer Ordnerlandschaft
- **Markdown only** — kein Plugin-Zwang fuer die Kernfunktion
- **Minimal setup** — Komplexitaet erst hinzufuegen, wenn sie wirklich gebraucht wird
- **Git-friendly** — Multi-Device und Multi-Agent koennen sauber synchronisieren

## Optional, aber sinnvoll

- Obsidian Git Plugin oder normales Git
- Templater
- Dataview
- dedizierte MCPs oder API-Tools

Das Template funktioniert aber auch komplett ohne diese Extras.

## Lizenz

MIT — siehe [LICENSE](LICENSE)
