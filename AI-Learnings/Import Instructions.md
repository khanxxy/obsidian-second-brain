---
tags: [ai-learnings, import, instructions]
---

# Import Instructions

> Diese Datei erklärt jedem AI-Agent wie er Chat-Verläufe und Projektwissen in diesen Vault importiert.
> Funktioniert mit: Claude Desktop, ChatGPT, Gemini, oder jedem Tool das Markdown schreiben kann.

## Wann importieren?

Wenn der User sagt:
- "export to vault"
- "in Obsidian speichern"
- "save to second brain"
- "ins Vault schreiben"

## Wie importieren?

### Schritt 1: Vault-Struktur verstehen
Lies `VAULT.md` im Vault um die Struktur zu verstehen.

### Schritt 2: Wissen extrahieren
Fasse das wichtigste Wissen aus dem Chat/Projekt zusammen:
- **Fakten & Erkenntnisse** — Was wurde gelernt?
- **Entscheidungen** — Was wurde entschieden und warum?
- **Personen** — Wer wurde erwähnt?
- **Action Items** — Was muss noch gemacht werden?
- **Fehler & Learnings** — Was lief schief, was haben wir gelernt?

### Schritt 3: Am richtigen Ort speichern

| Inhalt | Wohin | Beispiel |
|--------|-------|---------|
| Projekt-spezifisch | `Projects/[Projekt]/` | Projekt-Tipps → `Projects/[Name]/` |
| Allgemeines Wissen | `Knowledge/[Thema]/` | AI-Tool Vergleich → `Knowledge/AI/` |
| Neue Person | `People/[Name].md` | Neuer Kontakt → `People/` |
| Entscheidung | `Decisions/[Datum-Thema].md` | Architektur-Wahl → `Decisions/` |
| AI-Regel/Learning | `AI-Learnings/AI Regeln.md` | Neues Feedback → anhängen |
| Unklar | `Inbox/` | Unsortiertes → `Inbox/` |

### Schritt 4: Datei-Format

```markdown
---
tags: [relevante, tags]
source: [Tool] — [Projekt/Chat Name]
exported: YYYY-MM-DD
---

# Titel

## Zusammenfassung
Kernaussagen in 3-5 Bullet Points.

## Details
[Ausführlicher Inhalt, strukturiert mit Überschriften]

## Entscheidungen
- Entscheidung X weil Y

## Offene Punkte
- [ ] Todo 1
- [ ] Todo 2

## Verknüpfungen
- [[Verwandte Notiz]]
- [[Person]]
```

### Schritt 5: Verknüpfen
- Nutze `[[Wikilinks]]` um mit bestehendem Wissen zu verknüpfen
- Prüfe ob es bereits eine Notiz zum Thema gibt — ergänze statt dupliziere
- Verlinke erwähnte Personen mit `[[People/Name]]`

### Schritt 6: Changelog
Update `Changelog.md` mit dem Import.

## Tipps für den User

### Claude Desktop
Sage in jedem Projekt: "export to vault"
Claude hat via Obsidian MCP Zugriff und kann direkt schreiben.

### ChatGPT
1. Sage: "Fasse alles wichtige aus diesem Chat zusammen als Markdown"
2. Kopiere das Ergebnis
3. Erstelle eine .md Datei im Vault, oder gib es einem Agent

### Gemini
Gleich wie ChatGPT — zusammenfassen lassen, dann manuell oder via Agent einsortieren.

### Bulk Import (viele Chats)
Exportiere Chat-Verläufe als JSON/Markdown (alle Tools bieten das an).
Lass einen Agent die Dateien lesen und nach obigem Schema einsortieren.
