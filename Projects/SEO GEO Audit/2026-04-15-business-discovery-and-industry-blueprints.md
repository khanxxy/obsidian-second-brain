# 2026-04-15 Business Discovery and Industry Blueprints

## Why this note exists

This note captures the product and implementation shift from:

- `infer something from random page text`

to:

- `understand the actual business model, services, and local market intent`

This became necessary after a real audit on `baltrex.ch` showed a structural discovery failure.

## The bug that exposed the problem

The app generated nonsensical AI-visibility queries for `baltrex.ch`, such as:

- `Mehr Transparenz bei Mietverträgen`
- `Begrenzung des Fahrtkostenabzugs`

These were article / editorial fragments, not the real business.

The underlying business is:

- `Treuhand`
- location: `Basel`

The system should therefore reason from business reality, for example:

- `treuhand basel`
- `treuhänder basel`
- `steuerberater basel`
- `treuhand für KMU basel`

## Product conclusion

The app must not derive market queries from arbitrary visible text.

It must first infer:

- the business type
- the core services
- the local market
- the likely search logic of buyers in that market

Only then should it generate:

- AI visibility queries
- competitor discovery inputs
- local SEO checks
- channel-level market measurements

## Discovery logic now implemented

The current discovery layer now does four important things better:

### 1. Core business pages are weighted higher

The system now prioritizes:

- homepage
- service pages
- about pages
- contact pages
- location pages

It downweights:

- blog posts
- news pages
- editorial / guide content
- legal pages

### 2. Brand inference is more defensive

The system is now less likely to mistake:

- slogans
- single generic words
- editorial headlines

for the actual brand.

### 3. Industry detection uses industry blueprints

Instead of only freeform inference, the app now supports structured industry blueprints.

Blueprints currently implemented:

- `Treuhand`
- `Autowerkstatt`

Each blueprint contains:

- canonical industry label
- service matchers
- query topics
- localized search qualifiers

### 4. Query generation follows market intent

For local German-speaking markets, the first auto-generated queries now prioritize:

- service + city
- category + city
- buyer-language provider variants

Instead of:

- brand-heavy queries
- article-title fragments
- generic English phrasing for German local businesses

## Current blueprint examples

### Treuhand

Business understanding:

- industry: `Treuhand`
- likely services:
  - `Treuhand für KMU`
  - `Steuerberatung`
  - `Buchhaltung`
  - `Lohnbuchhaltung`
  - `Revision`

Likely local queries:

- `treuhand basel`
- `treuhänder basel`
- `steuerberater basel`
- `steuerexperte basel`
- `treuhand für kmu basel`

### Autowerkstatt

Business understanding:

- industry: `Autowerkstatt`
- likely services:
  - `Auto Reparatur`
  - `Auto Service`
  - `Ölwechsel`
  - `Reifenservice`
  - `MFK Vorbereitung`
  - `Fahrzeugdiagnose`

Likely local queries:

- `autowerkstatt basel`
- `garage basel`
- `auto reparatur basel`
- `auto service basel`
- `ölwechsel basel`
- `reifenservice basel`

## Why this matters for the product

This is a core product change, not just a small keyword fix.

It moves the app closer to the right product behavior:

- website in
- business model understood
- services inferred
- city / country inferred
- real market search patterns generated
- local SEO, organic, ads, and AI visibility checked against that market

This is the basis for becoming more useful than:

- `ChatGPT, analyze my site`
- `Gemini, find my SEO problems`

because the app is no longer only reacting to text.
It is trying to model the market around the business.

## Tests added

Regression coverage was added for:

- `baltrex.ch` style `Treuhand in Basel`
- `Autowerkstatt in Basel` with distracting blog content

This protects against the same category of discovery regression in future work.

## Next blueprint priorities

The next industry blueprints to add should be:

- `Anwalt`
- `Zahnarzt`
- `Klinik`
- `SEO / Marketing Agentur`
- `Immobilien`
- `Restaurant`

Each blueprint should define:

- main business label
- core services
- local buyer keywords
- comparison intent patterns
- trust / review-sensitive query types

## Important product rule going forward

Whenever the discovery system is unsure, it should prefer:

- stable business entities

over:

- content headlines
- article titles
- temporary editorial themes

The app should infer the business first, not just summarize the crawl.
