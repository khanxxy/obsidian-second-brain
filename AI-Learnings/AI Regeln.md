---
tags: [ai-learnings, regeln, feedback]
---

# AI Regeln & Learnings

> Regeln fuer alle AI-Agents, die in diesem Vault arbeiten.
> Tool-agnostisch und fuer ein leeres Template optimiert.

---

## 1. AGENTS.md und VAULT.md zuerst lesen

Wenn im Repo eine `AGENTS.md` liegt, lies sie zuerst. Danach immer `VAULT.md`. Nicht die Struktur raten, sondern den Links folgen.

**Warum:** So bleiben Verhalten, Ton und Navigationslogik konsistent.

---

## 2. Wissen zurückschreiben

Wenn du Wissen produziert, eine Entscheidung getroffen oder etwas entdeckt hast, schreib es in den Vault bevor die Session endet.

**Wohin:**
- Wissen → `Knowledge/`
- Entscheidung → `Decisions/`
- Person → `People/`
- Learning → diese Datei
- Alles → `Changelog.md`

**Warum:** Was nicht im Vault steht, ist fuer die naechste Session verloren.

---

## 3. Verlinken statt Duplizieren

Bevor du eine neue Datei erstellst, pruefe ob schon eine zum Thema existiert. Wenn ja, erweitere sie. Nutze `[[Wiki-Links]]` statt Copy-Paste.

**Warum:** Duplikate erzeugen Drift. Verlinkte Notizen erzeugen Kontext.

---

## 4. Templates benutzen

Neues Projekt? Nutze `Projects/.template/`. Neue Tagesnotiz? Nutze `! Briefings/template.md`. Neue Entscheidung? Nutze `Decisions/template.md`.

---

## 5. Changelog ist Pflicht

Jede Session, die den Vault strukturell veraendert, braucht einen Eintrag in `Changelog.md`.

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

**Warum:** Der Changelog ist das Systemlog des Vaults.

---

## 6. Briefing und Changelog trennen

**Briefing** in `! Briefings/`
- taegliche Sessions
- Ergebnisse
- offene Schleifen
- naechste Schritte

**Changelog** in `Changelog.md`
- neue Dateien
- geloeschte Dateien
- strukturelle Aenderungen
- groessere Template-Updates

**Warum:** Briefing ist Tageslog, Changelog ist Systemlog.

---

## 7. Nicht ueber-organisieren

Eine Notiz in `Inbox/` ist besser als gar keine Notiz. Struktur folgt spaeter.

---

## 8. MCP- oder Native-Tools gezielt nutzen

Wenn es fuer eine Plattform ein natives Tool oder einen dedizierten MCP gibt, nutze ihn zuerst. Generische Recherche- oder Scraping-Tools nur als Fallback.

**Warum:** Dedizierte Zugriffe sind meist schneller und konsistenter.

---

## 9. Obsidian direkt als Dateisystem behandeln

Dieser Vault funktioniert als Markdown-Struktur. Wenn ein Agent direkt auf Dateien schreiben kann, ist das oft besser als Plugin-Magie.

**Warum:** Weniger versteckte Abhaengigkeiten, weniger Fehlerquellen.

---

## 10. Git-Sync bewusst behandeln

Wenn mehrere Geraete oder Agents denselben Vault schreiben, ist `origin/main` der gemeinsame Stand. Vor Aenderungen pullen, danach committen und pushen. Siehe [[Agents/Vault Sync]].

**Warum:** Sonst driften lokale Kopien auseinander.

---

## 11. Git Author Privacy

Bei Public Repos immer anonymen Commit-Autor verwenden. Nie persoenliche Mailadresse committen.

**Nutzen:** `username <username@users.noreply.github.com>`

**Prüfen:** `git log --format="%an <%ae> | %cn <%ce>" -1`

**Warum:** Commit-Metadaten sind oeffentlich sichtbar und indexierbar.

---

_Erweitere diese Datei, sobald du im echten Alltag neue Regeln lernst._
