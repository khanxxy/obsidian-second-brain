# Vault Sync

#agents #git #sync

Wenn mehrere Geraete oder mehrere Agents denselben Vault bearbeiten, braucht der Vault einen klaren Git-Workflow.

## Kanonischer Stand

- `origin/main` ist der gemeinsame Stand
- lokale Kopien auf Mac, VPS oder anderen Rechnern sind Arbeitskopien

## Minimaler Ablauf

Vor Aenderungen:

```bash
git pull --rebase --autostash origin main
```

Nach Aenderungen:

```bash
git add <dateien>
git commit -m "vault: kurze beschreibung"
git push origin main
```

## Optional: Hilfsskripte

Dieses Template liefert drei optionale Skripte:

- `scripts/vault-prep.sh`
- `scripts/vault-finish.sh`
- `scripts/vault-status.sh`

Sie vereinfachen den Ablauf fuer wiederkehrende Vault-Updates.

## Konflikte

- Bei Rebase- oder Merge-Konflikten nicht blind ueberschreiben
- Datei lesen
- beide Seiten sauber zusammenfuehren
- danach committen und pushen

## Empfehlung

- Vor jedem `update obsidian` erst pullen
- Nach jeder inhaltlichen Vault-Aenderung direkt committen
- Keine langen lokalen Divergenzen aufbauen
