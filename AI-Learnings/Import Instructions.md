---
tags: [ai-learnings, import, instructions]
created: 2026-04-11
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

## WICHTIG: Reihenfolge beachten (Tool-Limits!)

Manche Tools haben ein Limit an Tool-Aufrufen pro Nachricht. Deshalb:
1. **Changelog ZUERST** schreiben (klein, schnell)
2. **People-Files** erstellen (klein)
3. **Grosse Wissens-Files** zum Schluss (die dürfen abgeschnitten werden — der User kann "weiter" sagen)

## Wie importieren?

### Schritt 1: Vault-Struktur verstehen
Lies `VAULT.md` im Vault um die Struktur zu verstehen.

### Schritt 2: Wissen extrahieren (NOCH NICHT SCHREIBEN)
Fasse das wichtigste Wissen aus dem Chat/Projekt im Kopf zusammen:
- **Fakten & Erkenntnisse** — Was wurde gelernt?
- **Entscheidungen** — Was wurde entschieden und warum?
- **Personen** — Wer wurde erwähnt?
- **Action Items** — Was muss noch gemacht werden?
- **Fehler & Learnings** — Was lief schief, was haben wir gelernt?

### Schritt 3: Changelog ZUERST schreiben
Lies `Changelog.md`, dann füge den neuen Eintrag OBEN ein (nach dem Header):
```
## YYYY-MM-DD ([Projektname] Import)
### Import
- [Tool] Projekt "[Name]" → [Ziel-Pfad]
### Was wurde importiert?
- Kurze Beschreibung
```

### Schritt 4: Am richtigen Ort speichern

| Inhalt | Wohin | Beispiel |
|--------|-------|---------|
| Projekt-spezifisch | `Projects/[Projekt]/` | HLC-Beratungstipps → `Projects/HLC/` |
| Allgemeines Wissen | `Knowledge/[Thema]/` | AI-Tool Vergleich → `Knowledge/AI/` |
| Neue Person | `People/[Name].md` | Neuer Kontakt → `People/` |
| Entscheidung | `Decisions/[Datum-Thema].md` | Architektur-Wahl → `Decisions/` |
| AI-Regel/Learning | `AI-Learnings/AI Regeln.md` | Neues Feedback → anhängen |
| Unklar | `Inbox/` | Unsortiertes → `Inbox/` |

### Schritt 5: Datei-Format

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

### Schritt 6: Verknüpfen
- Nutze `[[Wikilinks]]` um mit bestehendem Wissen zu verknüpfen
- Prüfe ob es bereits eine Notiz zum Thema gibt — ergänze statt dupliziere
- Verlinke erwähnte Personen mit `[[People/Name]]`

### Schritt 7: Fertig
Changelog wurde bereits in Schritt 3 geschrieben. Prüfe ob alles verlinkt ist.

## Tipps für den User

### Claude Desktop
Sage in jedem Projekt: "export to vault"
Claude hat via Obsidian MCP Zugriff und kann direkt schreiben.

### ChatGPT
1. Sage: "Fasse alles wichtige aus diesem Chat zusammen im folgenden Format: [Format von oben]"
2. Kopiere das Ergebnis
3. Erstelle manuell eine .md Datei im Vault, oder paste es Claude Code

### Gemini
Gleich wie ChatGPT — zusammenfassen lassen, dann manuell oder via Agent in den Vault.

### Bulk Import (viele Chats)
Exportiere Chat-Verläufe als JSON/Markdown (alle Tools bieten das an).
Lass einen Agent die Dateien lesen und nach obigem Schema einsortieren.
