# 2026-04-15 Bilingual Surface and Report Localization

## Summary

Today the product surface was pushed into a proper bilingual state.

The app no longer has:

- English-only landing page
- English-only audit app shell
- partially localized German reports

The product now supports:

- German as the default public language
- English as the second language
- route-level language separation
- localized app UI for core audit workflows
- localized HTML report output
- localized PDF report output

## What was changed

### 1. Landing page language model

Implemented:

- `/` is now the German landing page
- `/en` is now the English landing page
- language switcher on the landing page
- dynamic title and description switching by language

Purpose:

- make German the primary market-facing experience
- keep English available as the secondary sales surface

### 2. Audit app language model

Implemented:

- `/app` is now the German app route
- `/en/app` is now the English app route
- app-level language switcher in the shell
- language follows the route, not only a client-side toggle

Core UI now localized:

- auth
- audit form
- progress view
- history
- billing
- report actions
- market overview

Important outcome:

- the owner can now move through the product in German end-to-end without dropping back into English in the main workflow

### 3. Report localization

Implemented:

- HTML report now respects `reportLanguage`
- PDF report now respects `reportLanguage`
- report section headings, table headings, score labels, and action-plan labels now localize through a shared report copy layer

Important detail:

- if the audit is run with `reportLanguage = de`, both the HTML report and the generated PDF should now be German
- already cached old PDFs remain old artifacts; they do not retroactively change language

Practical meaning:

- for a clean German client deliverable, run a new final audit in German

### 4. Shared translation approach

Implemented:

- app-side shared language helper for DE/EN route-aware UI
- shared backend report copy for HTML and PDF generators

Purpose:

- reduce drift between HTML and PDF report wording
- avoid one-off hardcoded translations scattered across files

## Product meaning

This matters for positioning and sales quality.

Before this work:

- the app could look polished in one place and unfinished in another
- German users could still hit English UI/report fragments
- a German audit did not guarantee a fully German deliverable

After this work:

- the product feels more intentional for the DACH market
- the sales surface and the audit surface are aligned
- German owner-facing use is now much more realistic

## Current limitation

Localization is now much better, but this does not solve the deeper reporting problem by itself.

Still true:

- the current report is too detailed and too technical for many business owners
- localization makes it readable
- it does not yet make it commercially sharp enough

The next report-level product step is still:

- build the short owner-first brief
- move deeper technical detail into appendix-style output
- make the report a better entry point into packages and implementation work

## Suggested next priority after this work

The strongest next product move is:

1. owner-first report layer
2. clearer package / upgrade CTA logic
3. stronger query-cluster evidence and page-type attribution

## Files / areas touched conceptually

- landing page routing and copy
- audit app routing and UI copy
- report localization layer
- HTML report generator
- PDF report generator
- tests for German localization

## Session handoff note

If a future session needs to continue from here, assume:

- German is the main language
- English is the secondary language
- route model is:
  - `/`
  - `/en`
  - `/app`
  - `/en/app`
- report language should follow the audit input and be reflected in both HTML and PDF
