# SEO GEO Audit App: Market Overview UI, Local Review Intelligence, and Current Tech Stack

Date: 2026-04-15
Repo: `/Users/goekhandogan/Projects/seo-geo-audit-app`

## What Changed In This Step

### Live validation update

After DataForSEO credits were added, the integration was tested against the live API.

Important findings:
- `location_name` must use DataForSEO formatting such as `Berlin,Berlin,Germany`
- `local_finder` does not accept the same task body as `organic`
- `ads_search` is not the right endpoint for our query-level paid SERP use case
- Google paid results can be extracted directly from `serp/google/organic/live/advanced` as `paid` items
- `business_data/google/reviews` works live with the stored `cid`

Code was adjusted accordingly:
- fixed location formatting
- removed `se_domain` from `local_finder`
- switched paid-result parsing to the organic SERP response
- kept local reviews on the dedicated business-data endpoint

This means the current DataForSEO layer is no longer just test-covered, but also live-validated on:
- organic SERP
- local finder
- google reviews
- paid-result extraction from organic SERP

### Backlinks layer added

The app now includes a first real offpage intelligence layer based on DataForSEO Backlinks.

Implemented:
- `backlinks/summary/live`
- `backlinks/domain_pages_summary/live`

The system now fetches:
- target backlink summary
- backlink summaries for the strongest competitor set
- best linked target pages

The app now derives:
- authority gap vs competitors
- backlink gap by referring domains and backlink count
- strongest backlink competitors
- best linked pages on the target domain

This is surfaced in the app UI inside `Market Overview`, not hidden only in the report pipeline.

### 1. The app now shows the market before the report

Built a new `Market Overview` layer in the frontend.

It now renders before the embedded HTML report and exposes the scan results directly in the app:
- detected business fingerprint
- score strip for `overall`, `technical`, `content`, and `AI visibility`
- channel coverage for `organic`, `ads`, `local`, `ai`
- repeated cross-channel competitors
- top query gaps
- local pack leaders with ratings, review counts, and sample reviews

This matters because the app no longer hides the strongest data inside the generated report only. The user can now see the market model immediately after the audit finishes.

### 2. DataForSEO Google Reviews API is integrated

Added review enrichment on top of the existing `Google Local Finder` data.

Implemented:
- `business_data/google/reviews/task_post`
- polling with `business_data/google/reviews/task_get/{id}`
- parsing of:
  - overall rating
  - total review count
  - review text
  - reviewer name
  - reviewer profile URL
  - owner replies
  - review recency
  - local guide signal

This review enrichment is applied to the strongest recurring local businesses, not to every single result, to keep API cost under control.

### 3. Local competitors are now aggregated into reusable market objects

Instead of keeping local results only inside per-query snapshots, the backend now builds recurring local leaders with:
- business title
- domain / URL
- address
- phone
- `cid`
- rating
- review count
- query count
- average rank
- appearing queries
- optional review snippets

This is the start of a real local market benchmark layer.

### 4. Review cost controls were added to config

New env vars:
- `DATAFORSEO_LOCAL_REVIEW_DEPTH`
- `DATAFORSEO_LOCAL_REVIEW_BUSINESSES`

Current intent:
- control how many reviews are fetched per profile
- control how many top local businesses get review enrichment per audit

That gives budget control without weakening the scan architecture.

## Current Tech Stack

### Core app
- Backend: Node.js + TypeScript + Express
- Frontend: React + Vite + Tailwind
- Tests: Vitest

### External services in active use

#### Firecrawl
Use:
- site map discovery
- page scraping
- page metadata
- structural site understanding

Role:
- understand the target site

#### Google PageSpeed API
Use:
- performance inputs
- Core Web Vitals

Role:
- technical performance truth

#### DataForSEO
Use:
- Google Organic SERP
- Google paid results via organic SERP `paid` items
- Google Local Finder
- Google Reviews API
- Backlinks Summary
- Domain Pages Summary

Role:
- market truth
- competitor truth
- local benchmark truth
- offpage authority truth

#### Perplexity
Use:
- AI visibility answer probing
- fallback competitor / market estimation when DataForSEO is unavailable

Role:
- AI-answer signal

#### Anthropic Claude
Use:
- audit analysis
- interpretation
- prioritization
- prose generation

Role:
- synthesis and consultant layer

#### Stripe
Use:
- billing
- paid credits

Role:
- monetization

## Current Responsibility Split

- Firecrawl = understand the business website
- DataForSEO = understand organic / paid / local market reality
- DataForSEO = understand offpage authority reality
- Perplexity = probe AI-answer visibility
- Claude = explain, prioritize, score, and write
- Stripe = control paid usage

This is now a much stronger product architecture than a plain website analyzer.

## What Still Needs To Be Added

### High-priority next tools

#### 1. Google Places API
Recommended next addition, but not because the current stack is broken.

Use it for:
- stable place detail enrichment
- place IDs
- opening hours
- categories
- website / phone consistency
- stronger GBP-level profile analysis

Reason:
DataForSEO is now strong for rankings, local pack presence, and reviews. Google Places would deepen business profile integrity and local entity analysis.

#### 2. OpenRouter multi-model benchmarking
Recommended after the local / competitor evidence layer is stronger.

Use it for:
- multi-model AI visibility checks
- comparing brand presence across multiple answer engines / models

Reason:
Current AI visibility is still mostly one-engine probing. That is better than before, but not enough for a premium GEO product.

#### 3. DataForSEO Backlinks API
This is now integrated in the first production slice.

Use it for:
- authority gap
- referring domains
- top linked pages
- anchor profile
- toxic / over-optimized anchor patterns
- competitor offpage strength

What is still missing on top of the current slice:
- anchor analysis
- referring domain examples
- follow/nofollow split in the UI
- page-type classification for linked pages
- offpage recommendations tied to service/location pages

## What We Do Not Need Right Now

- A second SERP provider is not required yet.
- A custom crawler is not required yet.
- Replacing Firecrawl is not required.
- Replacing DataForSEO is not required.

The core market-data stack is now good enough to keep building product depth.

## Open Product Gaps

### Organic
- Need page-type classification for winning competitor URLs
- Need better query-cluster aggregation
- Need stronger mapping from lost query -> winning URL type -> recommended page to build

### Ads
- Need repeated advertiser share by cluster
- Need ad-copy clustering
- Need landing-page type extraction
- Need better differentiation between brand and non-brand paid presence

### Local
- Need review theme extraction
- Need review polarity summaries
- Need owner-reply benchmarking
- Need multi-city / multi-location comparison for businesses with several branches
- Need Places enrichment if we want full GBP-style analysis

### AI visibility
- Need multi-engine probing
- Need cited-page attribution quality
- Need rerun stability scoring
- Need competitor answer-share logic by cluster

### Backlinks
- Need best-linked-page classification:
  - homepage
  - service page
  - location page
  - asset / image
  - directory profile
- Need anchor profile analysis
- Need stronger offpage recommendations from gap data
- Need competitor referring-domain examples for manual outreach ideas

## Immediate Build Priorities

1. Build query-cluster summaries:
   - winners by channel
   - brand missing channels
   - strongest competitor by cluster

2. Classify winning competitor pages:
   - homepage
   - service page
   - city page
   - directory
   - comparison page
   - review page

3. Classify top linked target pages and exclude low-value asset-heavy link patterns from recommendations.

4. Add local review-theme extraction:
   - recurring praise
   - recurring complaints
   - unanswered complaint pattern

5. Expand AI visibility:
   - multi-model answer checks
   - stable rerun logic
   - better evidence scoring

6. Consider Google Places API after the above:
   - only if we need deeper entity / GBP enrichment than DataForSEO currently gives us

## Files Touched In This Step

- `src/services/dataforseo.ts`
- `src/services/backlinks.ts`
- `src/services/market-landscape.ts`
- `src/types.ts`
- `src/config.ts`
- `.env.example`
- `client/src/components/MarketOverview.tsx`
- `client/src/components/Report.tsx`
- `tests/dataforseo.test.ts`
- `tests/backlinks.test.ts`
- `tests/market-landscape.test.ts`

## Verification

- `npm test`
- `npm run build`

## Bottom Line

The app now has a visible market-intelligence layer, not just a hidden report pipeline.

The scan is moving in the right direction:
- less manual user input
- more real search-market evidence
- more actionable competitive context
- stronger local benchmark data

The next milestone is not UI polish. It is evidence depth:
- better query clusters
- better competitor page classification
- deeper local intelligence
- multi-engine AI visibility
