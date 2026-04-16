# 2026-04-15 Master Tech Stack and Product Plan

## Purpose of this document

This is the central planning note for the app.

It should be the single readable place for:

- product direction
- current architecture
- current tool stack
- what has already been implemented
- what still needs to be built
- how the app should evolve from audit tool to revenue engine

The more detailed implementation notes still exist in separate files, but this document is the top-level source of truth.

## Product direction

The app should not remain a technical audit generator.

The target product is:

- `Step 1`: autonomous market discovery and visibility audit
- `Step 2`: owner-first commercial report and upgrade funnel
- `Step 3`: execution engine for content, SEO, GEO, and paid-media improvements
- `Step 4`: remeasurement and recurring growth control

The main business goal is not just to generate reports.
The app should be the entry point into higher-value follow-up work.

## Core product principles

- minimal user input
- autonomous market understanding
- real market data over AI guessing
- owner-first explanations, not just technical reports
- clear upgrade paths into paid services
- repeatable benchmarking over time

## Input philosophy

The user should ideally only enter:

- website URL
- target market scope
  - `regional`
  - `national`
  - `international`
  - `all`
- language
- audit mode

The system should infer:

- brand
- business type
- industry
- services
- location / country
- competitors
- query universe
- channel-specific visibility gaps

## Current architecture

### Website understanding

- `Firecrawl`
  - site map discovery
  - page scraping
  - metadata extraction
  - structural page understanding

### Market truth

- `DataForSEO`
  - organic SERP
  - paid results from live Google SERP `paid` items
  - local finder
  - Google reviews
  - backlinks summary
  - domain pages summary

### AI visibility probing

- `Perplexity`
  - AI-answer probing
  - citation detection
  - fallback landscape estimation only when live market truth is missing

### Synthesis and narrative

- `Anthropic Claude`
  - analysis
  - prioritization
  - recommendations
  - long-form report prose

### Technical performance

- `Google PageSpeed API`
  - Lighthouse lab performance
  - field / origin field data when available
  - deterministic Core Web Vitals mapping in code

### Billing

- `Stripe`
  - checkout
  - credits
  - purchases

### Frontend / app

- backend: `Node.js + TypeScript + Express`
- frontend: `React + Vite`
- tests: `Vitest`

## Current responsibility split

- `Firecrawl` = understand the business website
- `DataForSEO` = understand the search market and competitors
- `Perplexity` = probe AI-answer visibility
- `Claude` = interpret, explain, and prioritize
- `PageSpeed API` = technical performance truth
- `Stripe` = monetization

## What is already implemented

### 1. Autonomous business discovery

Implemented:

- brand inference
- industry inference
- core service extraction
- language inference
- location inference
- confidence scoring
- page-intent weighting:
  - homepage
  - service pages
  - about / contact / location pages
  - blog / editorial pages downweighted
- stronger defensive logic against article headlines and slogans being mistaken for stable business entities
- first structured industry blueprints now in use for:
  - `Treuhand`
  - `Autowerkstatt`

Important product direction:

- the app should infer the real business model, not summarize random page text
- local businesses should get query logic built from:
  - business type
  - core services
  - city / country

This became necessary after a real `baltrex.ch` audit regression, where article-style text polluted the inferred industry and AI-visibility query set.

### 2. Minimal-input audit flow

Implemented:

- user no longer has to provide industry manually
- user no longer has to provide competitors manually
- user no longer has to provide AI visibility keywords manually

### 3. Query generation for AI visibility

Implemented:

- query generation based on business profile
- stronger commercial intent logic
- geo-aware query variants
- service + location prioritization
- stronger German local-market query generation for businesses such as:
  - `Treuhand in Basel`
  - `Autowerkstatt in Basel`

Important direction:
- no more over-reliance on brand-like queries
- stronger non-brand and commercial query testing
- expand the blueprint library so query generation becomes more industry-aware and less generic

### 4. Market landscape

Implemented:

- per-query market snapshots
- channel-level data for:
  - organic
  - ads
  - local
  - AI
- recurring market leaders
- query gaps
- channel coverage

### 5. Local intelligence

Implemented:

- local pack competitor aggregation
- ratings
- review counts
- review snippets
- recurring local leaders

### 6. Offpage intelligence

Implemented:

- backlink summary
- referring domain comparison
- competitor authority gap
- best linked pages

### 7. AI visibility scoring

Implemented:

- deterministic scoring in code
- mention detection
- citation detection
- owned citation rate
- market presence modifiers
- competitor pressure

Still not final:
- multi-engine benchmarking
- repeat-run stability
- stronger cited-page attribution

### 8. Technical performance layer

Implemented:

- homepage-first PageSpeed measurement
- Lighthouse scores
- deterministic Core Web Vitals computation from API data
- separation between field/origin-field and lab-style values

### 9. Billing / credits

Implemented:

- Stripe checkout
- purchase history
- paid credits
- client-side billing status improvements

### 10. Market overview UI

Implemented:

- business fingerprint
- scores
- channel coverage
- leaders
- query gaps
- local leaders
- backlink view

### 11. Bilingual product surface

Implemented:

- German as the default public language
- English as the secondary language
- route split for landing page:
  - `/`
  - `/en`
- route split for app:
  - `/app`
  - `/en/app`
- app-level language switching for the main audit workflow

Why it matters:

- the product is now more usable for the primary German-speaking market
- the public sales surface and the app surface now follow the same language model

### 12. Report localization

Implemented:

- HTML report now respects `reportLanguage`
- PDF report now respects `reportLanguage`
- shared report copy layer for DE/EN labels
- German final audits now produce German report deliverables for new runs

Important limitation:

- already cached old PDFs do not retroactively change language
- a fresh final audit is required if a new PDF should be generated in another language

## What is still weak or incomplete

### Owner-facing reporting

Current issue:

- the PDF/report is still too technical
- business owners will not read the full audit in its current form

Important update:

- localization is no longer the main report problem
- the main problem is now report shape and commercial readability
- the next report step is not translation work, but owner-first restructuring

Target direction:

- `Owner Brief`
  - short
  - commercial
  - opportunity-driven
  - focused on money, visibility, and next steps
- `Implementation Appendix`
  - detailed
  - technical
  - for developers / SEOs / agencies

### AI visibility

Still missing:

- multi-model / multi-engine benchmarking
- better competitor share by query cluster
- better page-level attribution
- repeatability across reruns

### Organic competitor intelligence

Still missing:

- winning page type classification
- intent classification
- query cluster winners by channel
- better mapping from gap -> missing page -> recommended asset

### Local intelligence

Still missing:

- stronger place/entity enrichment
- sentiment/theme extraction from reviews
- multi-city benchmarks
- clearer industry-aware local framing, for example:
  - which local services matter most
  - which local trust signals are weak
  - which review / rating gap is commercially relevant

### Paid media intelligence

Still missing:

- live Google Ads connection
- GA4 connection
- real owner-side paid control dashboard

## New product layer: Ads Control

This module is now part of the product plan.

Purpose:

- give the business owner an independent control layer over ad spend
- reduce agency information asymmetry
- detect wasted spend
- translate audit findings into paid follow-up services

### Questions the module should answer

- can I trust the reported return
- how much ad spend is likely wasted
- is brand demand hiding weak non-brand performance
- which landing pages break the paid journey
- is PMax / YouTube creating value or just spend
- what should be fixed first

### Target truth sources

- `Google Ads API`
  - campaign truth
  - search terms
  - PMax/search themes
  - assets
  - landing pages
- `GA4 Data API`
  - landing page outcome truth
  - revenue/conversion validation
  - geo/device quality
- `DataForSEO`
  - competitor ads context
- `Firecrawl`
  - landing page quality and message match analysis

### Current implementation state

Implemented in architecture form:

- app-level readiness model
- provider blueprints
- owner-side score pillars
- deterministic ads control scoring
- owner package definitions
- first owner-facing UI panel

Not implemented yet:

- live Google OAuth connect flow
- token storage
- account selection
- live Google Ads ingestion
- live GA4 ingestion

### Ads Control score pillars

- `measurementTrust`
- `spendEfficiency`
- `queryQuality`
- `creativeHealth`
- `landingPageMatch`
- `budgetAllocation`
- `growthReadiness`

### Productized service packages already modeled

- `Tracking Fix`
- `Search Cleanup`
- `Landing Page Upgrade`
- `PMax / YouTube Optimization`

## Execution engine: Step 2 after the audit

The app should not stop after analysis.

Next product direction:

- identify the content gap
- generate the right asset
- let the client review it
- help publish it
- remeasure the result

### Content execution

Target capabilities:

- topic / cluster prioritization
- article briefs
- service page briefs
- FAQ generation
- full draft generation
- image / visual brief suggestions
- internal linking suggestions
- schema suggestions
- client review loop

### Technical SEO / GEO execution

Target capabilities:

- title/meta/H1 suggestions
- schema generation
- FAQ / trust block suggestions
- internal link fixes
- developer-ready implementation tickets
- later CMS-specific publishing helpers

### Publishing principle

Do not fully auto-publish by default.

Preferred flow:

- generate
- review
- approve
- publish
- remeasure

## Report strategy

The report should split into two layers:

### 1. Owner Brief

Must answer:

- where money or leads are being lost
- what the upside is
- what should happen next
- what package Raken AI recommends

### 2. Implementation Appendix

Should contain:

- technical findings
- detailed page-level actions
- schema details
- SEO/GEO specifics
- developer / agency handoff detail

## Recommended next build priorities

### Product / reporting

1. build the `Owner Brief`
2. move technical detail into appendix-style output
3. add clearer upgrade CTAs and package recommendations

### Search / GEO

4. deepen query-cluster winner logic
5. classify winning pages by page type and intent
6. expand AI visibility to multi-model benchmarking
7. expand the industry blueprint library:
   - `Anwalt`
   - `Zahnarzt`
   - `Klinik`
   - `SEO / Marketing Agentur`
   - `Immobilien`
   - `Restaurant`

### Paid control

8. build Google OAuth connect flow
9. add live Google Ads import
10. add live GA4 import
11. render real owner-side Ads Control dashboard

### Execution layer

12. add content brief + content draft engine
13. add technical SEO/GEO implementation suggestions as reusable tasks
14. add review/approval loop for generated assets

## Required env vars

### Current live audit stack

- `FIRECRAWL_API_KEY`
- `PERPLEXITY_API_KEY`
- `DATAFORSEO_LOGIN`
- `DATAFORSEO_PASSWORD`
- `DATAFORSEO_LOCAL_REVIEW_DEPTH`
- `DATAFORSEO_LOCAL_REVIEW_BUSINESSES`
- `DATAFORSEO_BACKLINK_COMPETITORS`
- `DATAFORSEO_BACKLINK_TOP_PAGES`
- `PAGESPEED_API_KEY`
- `ANTHROPIC_API_KEY`

### Reserved / next for Ads Control

- `GOOGLE_OAUTH_CLIENT_ID`
- `GOOGLE_OAUTH_CLIENT_SECRET`
- `GOOGLE_OAUTH_REDIRECT_URI`
- `GOOGLE_ADS_DEVELOPER_TOKEN`
- `GOOGLE_ADS_LOGIN_CUSTOMER_ID`

## Linked detailed notes

- `2026-04-15-dataforseo-market-stack-report.md`
- `2026-04-15-market-overview-local-reviews-report.md`
- `2026-04-15-ads-control-architecture.md`
- `2026-04-15-fue-hlc-test-runbook.md`

## Bottom line

The plan is now clear:

- the app begins with autonomous market discovery
- it becomes an owner-first visibility and control product
- it then opens into paid execution services
- and it should remeasure results over time

That is the correct direction if the app is meant to become a real acquisition and upsell engine rather than just a technical audit generator.
