---
tags: [ai-learnings, import, instructions]
---

# Import Instructions

> How any AI agent imports chat histories and project knowledge into this vault.
> Works with: Claude Desktop, ChatGPT, Gemini, or any tool that can write Markdown.

## When to Import

When the user says:
- "export to vault"
- "save to second brain"
- "write to obsidian"

## Important: Order Matters (Tool Limits)

Some tools have a limit on tool calls per message. So:
1. **Changelog FIRST** (small, fast)
2. **People files** (small)
3. **Large knowledge files** last (can be continued if cut off)

## How to Import

### Step 1: Read Vault Structure
Read `VAULT.md` to understand the structure.

### Step 2: Extract Knowledge (DON'T WRITE YET)
Mentally summarise the key knowledge from the chat:
- **Facts & insights** — What was learned?
- **Decisions** — What was decided and why?
- **People** — Who was mentioned?
- **Action items** — What needs to be done?
- **Mistakes & learnings** — What went wrong, what did we learn?

### Step 3: Write Changelog FIRST
Read `Changelog.md`, then add the new entry at the TOP (after the header):
```
## YYYY-MM-DD ([Project] Import)
### Import
- [Tool] project "[Name]" → [target path]
### What was imported?
- Brief description
```

### Step 4: Save to the Right Place

| Content | Where | Example |
|---------|-------|---------|
| Project-specific | `Projects/[Project]/` | Marketing plan → `Projects/My-SaaS/` |
| General knowledge | `Knowledge/[Topic]/` | AI tool comparison → `Knowledge/AI/` |
| New person | `People/[Name].md` | New contact → `People/` |
| Decision | `Decisions/[Date-Topic].md` | Architecture choice → `Decisions/` |
| AI rule/learning | `AI-Learnings/AI Rules.md` | Append to existing |
| Unclear | `Inbox/` | Unsorted → `Inbox/` |

### Step 5: File Format

```markdown
---
tags: [relevant, tags]
source: [Tool] — [Project/Chat Name]
exported: YYYY-MM-DD
---

# Title

## Summary
Key points in 3-5 bullets.

## Details
[Detailed content, structured with headings]

## Decisions
- Decision X because Y

## Open Items
- [ ] Todo 1
- [ ] Todo 2

## Links
- [[Related Note]]
- [[Person]]
```

### Step 6: Connect
- Use `[[wiki-links]]` to connect with existing knowledge
- Check if a note on the topic already exists — extend rather than duplicate
- Link mentioned people with `[[People/Name]]`

## Tips by Tool

### Claude Code / Codex / Cursor
Say "export to vault" — the agent has file access and can write directly.

### ChatGPT / Gemini (no file access)
1. Say: "Summarise everything important from this chat in the following format: [format above]"
2. Copy the output
3. Create a .md file in the vault manually, or hand it to an agent with file access

### Bulk Import (many chats)
Export chat histories as JSON/Markdown (all tools offer this). Let an agent read and sort them using the schema above.
