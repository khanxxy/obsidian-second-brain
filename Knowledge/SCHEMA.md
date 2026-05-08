# Knowledge Schema

Rules for durable knowledge pages.

The goal is not to collect everything. The goal is to turn repeated sources, lessons, and decisions into reusable knowledge.

---

## Layers

### 1. Raw Sources

Path: `Knowledge/raw/`

Use for immutable captures:

- Bot outputs
- Imported conversations
- Research notes
- Reports
- Source excerpts

Do not edit raw sources except for privacy cleanup.

### 2. Concept Pages

Path: `Knowledge/<Domain>/`

Use for distilled knowledge:

- What is true
- Why it matters
- When to use it
- Links to sources
- Open questions

### 3. Index And Log

- Update `Knowledge/Index.md` when adding important concept pages.
- Update `Knowledge/LOG.md` for meaningful ingest, synthesis, or maintenance work.

---

## Required Page Shape

Use this shape for concept pages:

```markdown
# Topic

## Summary

## What Is True

## When To Use This

## Sources

## Open Questions
```

---

## Rules

- Prefer one focused page over one giant note.
- Link to raw sources or external references.
- Mark uncertainty explicitly.
- Do not write secrets or private client data into public notes.
- If the note belongs to a project, keep it in `Projects/` instead of `Knowledge/`.
