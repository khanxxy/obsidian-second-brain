# Agents

> Uebersicht aller Agents, Automationen und Tool-Setups.
> Diese Sektion ist optional. Wenn du keine Bots nutzt, kann sie fast leer bleiben.

## Dashboard
- **[[Agents/Active Bots]]** — Live-Feed aller Bot-Runs nach Datum

## Konfiguration
- [[Agents/MCP Stack]] — Alle MCPs, Config, Troubleshooting
- [[Agents/Vault Sync]] — Git-Workflow fuer mehrere Geraete oder Agents
- [[AI-Learnings/AI Regeln]] — Regeln für alle Agents

---

## Zeitplaene

| Agent | Zeitplan | Script | Output |
|-------|----------|--------|--------|
| _Beispiel: AI Digest_ | _Täglich 9:00_ | _~/Scripts/ai-digest/_ | _[[Projects/...]]_ |
| _Beispiel: Vault Sync_ | _Alle 5 Min_ | _~/Scripts/vault-sync.sh_ | _—_ |

---

## Agent-Details

### Beispiel-Agent
- **Was:** Beschreibung des Agents
- **Script:** `~/Scripts/agent-name/run.sh`
- **LaunchAgent / Cron:** `com.user.agent-name.plist` oder Crontab
- **Output:** `~/Vault/Projects/.../YYYY-MM-DD.md`
- **Logs:** `~/Scripts/agent-name/output.log` / `error.log`
- **APIs:** Welche APIs werden genutzt?

> Kopiere diesen Block für jeden neuen Agent.

---

## LaunchAgents oder Cron

macOS:
- `~/Library/LaunchAgents/`

Linux / VPS:
- `crontab -e`
- `systemd --user`

Fuehre hier nur die Jobs auf, die du wirklich benutzt.

---

## Kosten-Tracking

| Provider | Budget | Aktuell | Alert bei |
|----------|--------|---------|-----------|
| _Anthropic_ | _$100/Mo_ | _$--_ | _$80_ |
| _OpenRouter_ | _$50/Mo_ | _$--_ | _$40_ |
