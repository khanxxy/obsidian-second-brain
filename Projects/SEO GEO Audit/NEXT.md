# NEXT

For a new session, start here:

1. Read `Projects/SEO GEO Audit/2026-04-15-master-tech-stack-and-product-plan.md`
2. Then read `Projects/SEO GEO Audit/2026-04-15-business-discovery-and-industry-blueprints.md`
3. Then read `Projects/SEO GEO Audit/2026-04-15-bilingual-surface-and-report-localization.md`
4. Then read `Projects/SEO GEO Audit/2026-04-15-market-overview-local-reviews-report.md`
5. Then read `Projects/SEO GEO Audit/2026-04-15-dataforseo-market-stack-report.md`
6. Then inspect the repo at `/Users/goekhandogan/Projects/seo-geo-audit-app`
7. Continue with the next priority:
   - build the owner-first brief layer for the report
   - move technical detail into appendix-style output
   - deepen competitor evidence by query cluster
   - classify winning pages by page type and intent
   - strengthen AI visibility from single-engine probing to multi-engine benchmarking
   - turn backlink data into page-type and authority recommendations
   - build the live Google Ads + GA4 connect flow for `Ads Control`

## Current product direction

- User should enter only:
  - website URL
  - target market scope
  - language
  - audit mode
- The system should infer:
  - business type
  - market
  - services
  - competitors
  - query universe
- Market truth should come from:
  - Firecrawl for site data
  - DataForSEO for organic/ads/local/reviews
  - Perplexity for AI answer probing
  - Claude for synthesis
- Paid account truth should come from:
  - Google Ads API for owner account reality
  - GA4 Data API for landing page and revenue validation
  - DataForSEO for competitor ads context

## Important implementation state

- DataForSEO is integrated as the primary source for:
  - organic SERP
  - paid results from google SERP `paid` items
  - local finder
  - Google reviews for top local competitors
  - backlinks summary
  - domain pages summary
- Paid search extraction now comes from live Google organic SERP `paid` items, not from the separate `ads_search` endpoint.
- Perplexity remains fallback for market landscape when DataForSEO creds are missing.
- Local ratings and review counts come from Local Finder results.
- Review snippets are fetched for the strongest recurring local profiles.
- The current DataForSEO integration has been live-validated against production credits.
- The app now includes an offpage layer:
  - target backlink summary
  - competitor authority comparison
  - backlink gap cards
  - best linked pages
- The app now renders a `Market Overview` before the full report iframe:
  - detected business fingerprint
  - score strip
  - channel coverage
  - cross-channel leaders
  - top query gaps
  - local pack leaders with ratings, review counts, and sample reviews
- The app now includes the first `Ads Control` architecture layer:
  - app-level Google Ads / GA4 readiness
  - provider blueprints for Google Ads API and GA4 Data API
  - deterministic owner-side ads scorecard
  - initial product packages for follow-up work
  - first owner-facing UI panel in the app
- The product surface is now bilingual:
  - German is the default language
  - English is the secondary language
  - landing routes:
    - `/`
    - `/en`
  - app routes:
    - `/app`
    - `/en/app`
- The report stack is now language-aware end-to-end for new audits:
  - HTML report respects `reportLanguage`
  - PDF report respects `reportLanguage`
  - old cached PDFs remain old artifacts and must be regenerated via a new final audit if a new language is needed
- The market-discovery layer now uses stronger business inference:
  - homepage / service / about / contact / location pages are weighted above blog and editorial pages
  - brand inference is more defensive against slogans and article titles
  - industry blueprints are now in use for:
    - `Treuhand`
    - `Autowerkstatt`
  - German local-market query generation now prioritizes service + city / provider + city logic
- This was added after a real regression on `baltrex.ch`, where article-style text polluted the inferred industry and query set.

## Required env vars

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
- `GOOGLE_OAUTH_CLIENT_ID`
- `GOOGLE_OAUTH_CLIENT_SECRET`
- `GOOGLE_OAUTH_REDIRECT_URI`
- `GOOGLE_ADS_DEVELOPER_TOKEN`
- `GOOGLE_ADS_LOGIN_CUSTOMER_ID`

## Recommended next coding task

Use the now-visible market data and the bilingual product surface to build the next commercial layer:
- owner-first brief before the technical appendix
- package / upgrade recommendation blocks
- query-cluster level winners by channel
- competitor page-type classification
- local sentiment/theme extraction
- multi-model AI visibility benchmarking
- backlink page classification and authority recommendations
- expand the industry blueprint library:
  - `Anwalt`
  - `Zahnarzt`
  - `Klinik`
  - `SEO / Marketing Agentur`
  - `Immobilien`
  - `Restaurant`
- then build the live `Ads Control` connection flow:
  - Google OAuth
  - Google Ads read-only import
  - GA4 read-only import
  - owner dashboard for wasted spend, tracking trust, and landing page leaks

## New session prompt

Use this as the practical opener for a new session:

`Read /Users/goekhandogan/Projects/obsidian-second-brain/Projects/SEO GEO Audit/NEXT.md, then read the notes it references, then inspect /Users/goekhandogan/Projects/seo-geo-audit-app and continue from there.`

If you want the session to focus on the current discovery / keyword logic, use:

`Read /Users/goekhandogan/Projects/obsidian-second-brain/Projects/SEO GEO Audit/NEXT.md and /Users/goekhandogan/Projects/obsidian-second-brain/Projects/SEO GEO Audit/2026-04-15-business-discovery-and-industry-blueprints.md, then inspect /Users/goekhandogan/Projects/seo-geo-audit-app and continue improving business inference, industry blueprints, and market-aware query generation.`
