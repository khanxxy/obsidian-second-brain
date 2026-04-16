---
tags: [ai-learnings, regeln, feedback]
---

# AI Regeln & Learnings

> Regeln für alle AI-Agents (Claude Code, Codex, Cursor, etc.).
> Tool-agnostisch: Gilt für jeden Agent, egal welches Tool.
> Aus Fehlern gelernt — hier steht was funktioniert.

---

## 1. VAULT.md zuerst lesen

Jede Aufgabe beginnt mit `VAULT.md`. Von dort navigieren. Nicht die Vault-Struktur raten — den Links folgen.

**Warum:** Agents die das überspringen verschwenden Context auf irrelevante Dateien oder erstellen Duplikate.

---

## 2. Wissen zurückschreiben

Wenn du Wissen produziert, eine Entscheidung getroffen oder etwas entdeckt hast — schreib es in den Vault bevor die Session endet.

**Wohin:**
- Wissen → `Knowledge/`
- Entscheidung → `Decisions/`
- Person → `People/`
- Learning → diese Datei
- Alles → `Changelog.md`

**Warum:** Was nicht im Vault steht, existiert nicht. Die nächste Session hat keinen Zugriff auf dein Chat-Fenster.

---

## 3. Verlinken statt Duplizieren

Bevor du eine neue Datei erstellst, prüfe ob schon eine zum Thema existiert. Wenn ja, ergänze sie. Nutze `[[Wiki-Links]]` um Notizen zu verbinden.

**Warum:** Duplikate erzeugen Verwirrung. Verlinkte Notizen erzeugen einen Knowledge Graph.

---

## 4. Templates benutzen

Neues Projekt? Kopiere `Projects/.template/`. Erfinde nicht jedes Mal eine neue Struktur.

---

## 5. Changelog ist Pflicht

Jede Session die den Vault verändert muss einen Eintrag in `Changelog.md` hinzufügen. Keine Ausnahmen.

**Format:**
```
## YYYY-MM-DD
### Neue Dateien
- ...
### Aktualisierte Dateien
- ...
### Was ist passiert?
- ...
```

Neueste Einträge immer oben.

**Warum:** Wenn du den Vault öffnest, siehst du nicht was neu ist. Changelog ist der Einstiegspunkt.

---

## 6. Nicht über-organisieren

Eine Notiz in `Inbox/` ist besser als keine Notiz. Einsortieren passiert später.

---

## 7. MCP Tool Priority

Bei Links zu Plattformen mit dediziertem MCP → **immer zuerst den dedizierten MCP nutzen**. Generische Tools (Firecrawl, Perplexity) nur als Fallback.

**Reihenfolge:**
1. Plattform-spezifischer MCP (Twitter, Analytics, Trading, etc.)
2. Generische Scraping/Research Tools als Fallback

**Warum:** Dedizierte MCPs sind schneller, zuverlässiger und haben authentifizierten Zugriff. Generische Tools blockieren oft oder liefern unvollständige Daten.

---

## 8. MCP Installation

Neue MCP-Server immer sauber installieren:

**Checkliste:**
1. Vor Installation alle benötigten API Keys bereithalten
2. Alles in einem Befehl: `claude mcp add <name> -s user -e KEY=val -- <command>`
3. `-s user` für globale Verfügbarkeit
4. Nie einen MCP Server ohne seine Keys installieren
5. Nach Installation verifizieren
6. Volle Pfade verwenden (z.B. `/opt/homebrew/bin/npx` statt `npx`)
7. Symlinks vorher auflösen

**Warum:** Jedes Mal wenn ein MCP ohne Keys installiert wird → startet nicht, Tools fehlen, manuelles Debugging nötig.

---

## 9. Git Author Privacy

Bei Public Repos immer anonymen Commit-Autor verwenden. Nie echten Namen oder lokale Email.

**Nutzen:** `username <username@users.noreply.github.com>`

**Prüfen:** `git log --format="%an <%ae> | %cn <%ce>" -1`

**Warum:** Google indexiert Git-Commit-Autoren. Echter Name + lokale Email werden öffentlich sichtbar.

---

_Füge unten deine eigenen Regeln hinzu, sobald du lernst was mit deinen Agents funktioniert._
