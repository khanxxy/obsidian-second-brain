---
tags: [ai-learnings, import, instructions]
---

# Import Instructions

> Wie AI-Agents Chat-Verläufe und Projektwissen in diesen Vault importieren.
> Funktioniert mit: Claude Code, Codex, Cursor, ChatGPT, Gemini oder jedem Tool das Markdown schreiben kann.

## Wann importieren?

Wenn der User sagt:
- "exportiere in den Vault"
- "speichere im Second Brain"
- "schreib in Obsidian"

## Wichtig: Reihenfolge beachten (Tool-Limits)

Manche Tools haben ein Limit an Tool-Calls pro Nachricht. Deshalb:
1. **Changelog ZUERST** (klein, schnell)
2. **People-Dateien** (klein)
3. **Grosse Wissensdateien** zuletzt (können fortgesetzt werden falls abgebrochen)

## So funktioniert der Import

### Schritt 1: Vault-Struktur lesen
`VAULT.md` lesen um die Struktur zu verstehen.

### Schritt 2: Wissen extrahieren (NOCH NICHT SCHREIBEN)
Mental zusammenfassen was wichtig ist:
- **Fakten & Erkenntnisse** — Was wurde gelernt?
- **Entscheidungen** — Was wurde entschieden und warum?
- **Personen** — Wer wurde erwähnt?
- **Action Items** — Was muss noch getan werden?
- **Fehler & Learnings** — Was ging schief, was haben wir gelernt?

### Schritt 3: Changelog ZUERST schreiben
`Changelog.md` lesen, dann neuen Eintrag OBEN hinzufügen (nach dem Header):
```
## YYYY-MM-DD ([Projekt] Import)
### Import
- [Tool] Projekt "[Name]" → [Zielpfad]
### Was wurde importiert?
- Kurze Beschreibung
```

### Schritt 4: Am richtigen Ort speichern

| Inhalt | Wohin | Beispiel |
|--------|-------|----------|
| Projekt-spezifisch | `Projects/[Projekt]/` | Marketing-Plan → `Projects/Mein-SaaS/` |
| Allgemeines Wissen | `Knowledge/[Thema]/` | AI-Tool-Vergleich → `Knowledge/AI/` |
| Neue Person | `People/[Name].md` | Neuer Kontakt → `People/` |
| Entscheidung | `Decisions/[Datum-Thema].md` | Architektur-Wahl → `Decisions/` |
| AI Regel/Learning | `AI-Learnings/AI Regeln.md` | An bestehende Datei anhängen |
| Unklar | `Inbox/` | Unsortiert → `Inbox/` |

### Schritt 5: Datei-Format

```markdown
---
tags: [relevante, tags]
source: [Tool] — [Projekt/Chat-Name]
exported: YYYY-MM-DD
---

# Titel

## Zusammenfassung
Kernpunkte in 3-5 Bullets.

## Details
[Detaillierter Inhalt, strukturiert mit Überschriften]

## Entscheidungen
- Entscheidung X weil Y

## Offene Punkte
- [ ] Todo 1
- [ ] Todo 2

## Links
- [[Verwandte Notiz]]
- [[Person]]
```

### Schritt 6: Verknüpfen
- `[[Wiki-Links]]` nutzen um mit bestehendem Wissen zu verbinden
- Prüfen ob eine Notiz zum Thema schon existiert — ergänzen statt duplizieren
- Erwähnte Personen mit `[[People/Name]]` verlinken

## Tipps nach Tool

### Claude Code / Codex / Cursor
Sag "exportiere in den Vault" — der Agent hat Dateizugriff und kann direkt schreiben.

### ChatGPT / Gemini (kein Dateizugriff)
1. Sag: "Fasse alles Wichtige aus diesem Chat zusammen in folgendem Format: [Format oben]"
2. Output kopieren
3. .md-Datei im Vault manuell erstellen, oder einem Agent mit Dateizugriff übergeben

### Bulk Import (viele Chats)
Chat-Verläufe als JSON/Markdown exportieren (alle Tools bieten das an). Einen Agent lesen und einsortieren lassen.
