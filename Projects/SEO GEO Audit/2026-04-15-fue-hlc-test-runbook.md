# FUE-HLC Test Runbook

Date: 2026-04-15
Target: `https://fue-hlc.com`

## Goal

Use `fue-hlc.com` as the first serious benchmark domain because real Google Analytics and Google Search Console data are available for comparison.

This test is not only about whether the app runs.
It is about whether the app's market model matches reality.

## Recommended Audit Settings

- URL: `https://fue-hlc.com`
- Visibility target: `international`
- Language: `en`
- Mode: `final`

## Runtime Requirements

Required for a full audit run:
- `FIRECRAWL_API_KEY`
- `PERPLEXITY_API_KEY`
- `ANTHROPIC_API_KEY`
- `PAGESPEED_API_KEY`

Configured separately for market truth:
- `DATAFORSEO_LOGIN`
- `DATAFORSEO_PASSWORD`

Optional cost controls:
- `DATAFORSEO_LOCAL_REVIEW_DEPTH`
- `DATAFORSEO_LOCAL_REVIEW_BUSINESSES`
- `DATAFORSEO_BACKLINK_COMPETITORS`
- `DATAFORSEO_BACKLINK_TOP_PAGES`

## What To Compare After The Audit

### Search Console

Check whether the audit output matches:
- top queries
- top landing pages
- top countries
- branded vs non-branded query split
- service vs informational page visibility

Main question:
Does the app identify the same market and page priorities that GSC already shows?

### Google Analytics

Check whether the audit output matches:
- top landing pages
- pages with strongest conversion intent
- country mix
- pages that actually attract qualified sessions

Main question:
Does the app's market and authority model align with the pages that matter commercially?

## What To Judge During The Test

### Discovery quality
- Did the app correctly infer business type, services, market, and location?
- Did it generate sensible AI visibility queries without user input?
- Did it identify real competitors?

### Market truth quality
- Are the organic winners realistic?
- Are paid results plausible?
- Are local competitors and review signals useful?
- Are backlink competitors believable?
- Do best linked pages make sense or are they noisy?

### AI visibility quality
- Are the detected wins/losses believable?
- Do cited domains match expectations?
- Is the score directionally correct even if still imperfect?

### Actionability
- Does the app show what is missing?
- Does it surface commercially meaningful gaps?
- Does it go beyond what a simple webchat site analysis would tell us?

## Expected Weak Spots

These are known likely limitations during the benchmark:
- AI visibility still relies on a single main answer-probing layer
- query-cluster logic is still not deep enough
- backlink page classification is not yet semantic
- GSC and GA are not integrated directly into the app yet

## Immediate Follow-Up After The Test

Based on the FUE-HLC results, the next product steps should be chosen from:
- query-cluster winners and losers
- competitor page-type classification
- backlink page classification
- local review-theme extraction
- multi-model AI visibility benchmarking
- optional GA/GSC comparison import layer
