# SEO GEO Audit App: DataForSEO Integration, Current Stack, and Required Tooling

Date: 2026-04-15
Repo: `/Users/goekhandogan/Projects/seo-geo-audit-app`

## What Changed Today

### Product direction locked in
- Moved the app away from a consultant-style input form.
- User now only needs:
  - website URL
  - target visibility scope: `regional`, `national`, `international`, `all`
  - language
  - audit mode
- Industry, market, likely competitors, and AI visibility queries are now inferred automatically.

### Scan and discovery changes already implemented
- Added automatic business discovery from the crawled site:
  - brand name
  - industry
  - main services
  - languages
  - city/country heuristics
- Added auto-generated GEO / AI visibility queries from the business profile.
- Added competitor auto-discovery from market signals instead of relying on manual competitor input.

### Market analysis changes already implemented
- Added a market landscape layer per query.
- Added channel-level insight generation for:
  - organic
  - ads
  - local
  - AI
- Added deterministic AI visibility scoring in code instead of leaving GEO score mainly to the LLM.
- Added query-level gap analysis and competitor leaders.

### DataForSEO integration implemented
- Added `DATAFORSEO_LOGIN` and `DATAFORSEO_PASSWORD` support in config and `.env.example`.
- Added a new DataForSEO service layer.
- Replaced the old LLM-only `market landscape` estimation with live DataForSEO calls when credentials are configured.
- Implemented live retrieval for:
  - Google Organic SERP
  - Google Ads Search
  - Google Local Finder
- Stored richer result objects per query, including:
  - organic URLs/domains and ranks
  - ads domains/titles/format/first-shown/last-shown
  - local result titles/domains/URLs/phones
  - local ratings and review counts from Local Finder
  - local `cid` values for future Google review retrieval
- Kept LLM estimation only as fallback when DataForSEO is not configured.

## Current Tech Stack

### Core app
- Backend: Node.js + TypeScript + Express
- Frontend: React + Vite
- Tests: Vitest

### Current external data/services
- Firecrawl
  - website map
  - page scraping
  - structural/SEO page metadata
- Google PageSpeed API
  - performance and CWV inputs
- Anthropic Claude
  - audit synthesis
  - recommendations
  - prose generation
- Perplexity
  - AI visibility answer testing
  - fallback competitor/landscape estimation only
- Stripe
  - auth/credits billing
- DataForSEO
  - real organic SERP data
  - real Ads visibility data
  - real Local Finder visibility data
  - ratings/review-count signal from local results

### Current architecture by responsibility
- Firecrawl = understand the website
- DataForSEO = understand the market
- Perplexity = probe AI answers
- Claude = interpret, prioritize, explain

## What We Still Need

### Required next tool additions
- No second SERP provider is required yet.
- The next likely addition should be one of:
  - Google Places API
    - for stable place details enrichment
    - place IDs, opening hours, categories, phone, website consistency
  - DataForSEO Google Reviews API
    - for actual review text retrieval using `cid`
    - sentiment/review-theme analysis

### Why we still need more than current DataForSEO setup
- We now get Local Finder ratings and `votes_count`, which is enough for:
  - star rating
  - review count
  - local competitor benchmarking
- We do **not** yet fetch:
  - actual review text
  - review recency
  - recurring sentiment themes
  - complaint patterns
- We also do not yet enrich local businesses with:
  - opening hours
  - detailed category labels
  - place-level metadata consistency

## Recommended Target Stack

### Keep
- Firecrawl
- PageSpeed API
- Claude
- Stripe
- DataForSEO

### Keep, but demote in importance
- Perplexity
  - use for AI answer checks
  - do not use as source of truth for ads/local/organic

### Add next
- Google Places API or DataForSEO Reviews API
  - to deepen local/GBP analysis

### Optional later
- OpenRouter multi-model benchmarking
  - if we want AI visibility measured against several answer engines/models
- A second SERP provider
  - only if DataForSEO proves insufficient for a specific country/channel
  - not needed right now

## Open Technical Gaps

### 1. AI visibility is better, but still incomplete
- Current AI visibility uses:
  - Perplexity answer presence
  - citation detection
  - owned cited domains
  - market presence modifiers
  - competitor pressure
- Missing next:
  - multiple AI engines / model comparison
  - better cited-page attribution
  - stability across repeat runs
  - direct competitor answer share by query cluster

### 2. Ads analysis is real, but still shallow
- We now retrieve advertiser/ad results.
- Missing next:
  - landing page quality extraction
  - ad copy clustering
  - repeated advertiser share by query cluster
  - brand absent/present by paid intent cluster

### 3. Local analysis is real, but still shallow
- We now retrieve:
  - local businesses
  - ratings
  - review counts
  - `cid`
- Missing next:
  - review text and sentiment
  - place enrichment
  - multi-city benchmarking
  - local pack share by geo cluster

### 4. Organic analysis still needs deeper competitive truth
- We now retrieve live organic domains and URLs.
- Missing next:
  - SERP positions per query cluster in stored normalized form
  - rank aggregation by competitor and channel
  - page-type classification for winning competitor URLs
  - topic-to-page gap mapping

## Immediate Build Priorities

1. Replace generic market snapshots in the UI with real channel cards from DataForSEO-backed results.
2. Add local benchmark objects:
   - competitor
   - rating
   - review_count
   - local position
   - cid
3. Add review retrieval layer:
   - DataForSEO Google Reviews API or Google Places enrichment
4. Add query-cluster summary:
   - winners by channel
   - missing channels for brand
   - strongest competitor by cluster
5. Improve AI visibility from single-engine probing to multi-engine benchmarking.

## Code Areas Touched

- `src/config.ts`
- `.env.example`
- `src/services/dataforseo.ts`
- `src/services/market-landscape.ts`
- `src/orchestrator.ts`
- `src/services/analysis.ts`
- `src/services/market-insights.ts`
- `src/services/ai-visibility.ts`
- `src/types.ts`
- `client/src/components/AuditForm.tsx`
- `src/routes.ts`

## Bottom Line

The app is no longer just a website analyzer with manually entered competitors.
It is moving toward an autonomous market intelligence pipeline:

- understand the business automatically
- discover the market automatically
- retrieve real channel data
- measure AI visibility with deterministic logic
- prepare the system for true local/ads/organic/AI benchmarking

The next major milestone is to turn the new backend truth layer into a high-value market UI and deepen local review intelligence.
