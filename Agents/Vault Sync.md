# Vault Sync

Git workflow for multiple devices or multiple agents editing the same vault.

---

## Canonical State

- The shared branch is the canonical state.
- Local copies on laptops, servers, or containers are working copies.
- Always pull before editing and push after meaningful edits.

---

## Helper Scripts

Before edits:

```bash
bash scripts/vault-prep.sh
```

After edits:

```bash
bash scripts/vault-finish.sh "vault: short description" file1 file2
```

Status:

```bash
bash scripts/vault-status.sh
```

---

## Manual Flow

```bash
git pull --rebase --autostash
git add <files>
git commit -m "vault: short description"
git push
```

---

## Conflict Rules

- Do not blindly overwrite conflicts.
- Read the conflicting file.
- Preserve user work.
- If unsure, stop and ask.
- Do not use destructive Git commands unless explicitly requested.

---

## Common Problems

| Problem | Response |
|---|---|
| Push rejected | Pull with rebase, then push. |
| Rebase conflict | Stop and resolve deliberately. |
| Permission denied | Fix file ownership. |
| Dubious ownership | Configure Git safe.directory for the vault path. |
