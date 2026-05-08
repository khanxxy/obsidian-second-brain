---
tags: [ai-learnings, import, instructions]
---

# Import Instructions

How agents should import chats, notes, and project knowledge into this vault.

Works with any tool that can read and write Markdown.

---

## When To Import

Import when the user says:

- "save this in the vault"
- "write this to Obsidian"
- "export this to the second brain"
- "remember this for later"

---

## Import Flow

### 1. Read The Map

Read `VAULT.md`, then `AGENTS.md`, then `NOW.md`.

### 2. Extract Before Writing

Identify:

- Facts and lessons
- Decisions
- People
- Action items
- Project status
- Open questions

### 3. Route To The Right Place

| Content | Destination | Example |
|---|---|---|
| Project-specific | `Projects/<Project>/` | Roadmap, launch plan |
| General durable knowledge | `Knowledge/<Domain>/` | AI tool comparison |
| New person | `People/` | Contact profile |
| Decision | `Decisions/YYYY-MM-DD-topic.md` | Architecture choice |
| AI lesson | `AI-Learnings/AI Rules.md` | Add a rule |
| Later task | `Backlog.md` | Not active yet |
| Unclear | `Inbox/` | Sort weekly |

### 4. Update Logs

- For project work: update `NOW.md`, project `HANDOFF.md`, and `!1 Work Log/YYYY-MM-DD.md`.
- For structural vault changes: update `Changelog.md`.
- For Knowledge writes: update `Knowledge/LOG.md`.

---

## Note Shape

```markdown
---
tags: [relevant, tags]
source: tool or conversation
created: YYYY-MM-DD
---

# Title

## Summary

## Details

## Decisions

## Open Items

## Links
```

---

## Rules

- Search before creating a new note.
- Prefer updating an existing note over duplicating it.
- Use wiki-links.
- Do not import private data into public template repos.
- If you cannot finish the import, leave a clear entry in `!1 Work Log/YYYY-MM-DD.md`.
