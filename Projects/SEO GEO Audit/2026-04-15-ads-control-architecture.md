# 2026-04-15 Ads Control Architecture

## Why this module exists

The SEO/GEO audit is useful as an entry point, but it is still mainly a market audit.

For business owners already spending on Google Search, YouTube, Performance Max, or mixed paid media, the more urgent pain is often:

- can I trust the reported return
- where is ad spend being wasted
- is my agency protecting brand traffic while non-brand underperforms
- which landing pages break the paid journey
- is YouTube or PMax creating business value or just reach

This is the new product direction:

- `SEO/GEO Audit` = market and visibility truth
- `Ads Control` = owner-side oversight for paid spend

The app should become a control layer that helps the owner challenge agency reporting, detect leaks, and buy follow-up services from Raken AI.

## Current implementation in repo

The repo now contains the first real `Ads Control` foundation:

- new domain types in `src/types.ts`
  - readiness
  - data sources
  - report blueprints
  - account snapshot
  - scorecard
  - owner summary
  - findings
- app-level readiness in `src/ads-control-readiness.ts`
- provider blueprints:
  - `src/services/google-ads.ts`
  - `src/services/ga4.ts`
- deterministic scoring + owner diagnostics in `src/services/ads-control.ts`
- API endpoint:
  - `GET /api/ads-control/blueprint`
- first UI surface:
  - `client/src/components/AdsControlPanel.tsx`

This is not the live account connection yet.
It is the architecture and scoring base plus the first product-facing owner view.

## Target stack

- `Google Ads API`
  - own account truth
  - campaign performance
  - search terms
  - PMax / search themes
  - asset groups / assets
  - landing page mapping
- `GA4 Data API`
  - landing page outcome truth
  - conversion quality
  - geo / device / session quality
  - revenue validation
- `DataForSEO`
  - competitor ads context
  - SERP truth
  - market pressure
- `Firecrawl`
  - landing page analysis
  - message match
  - trust / conversion / content / technical review
- `Claude`
  - owner narrative
  - agency challenge summary
  - prioritized actions

## App-level env vars now reserved

- `GOOGLE_OAUTH_CLIENT_ID`
- `GOOGLE_OAUTH_CLIENT_SECRET`
- `GOOGLE_OAUTH_REDIRECT_URI`
- `GOOGLE_ADS_DEVELOPER_TOKEN`
- `GOOGLE_ADS_LOGIN_CUSTOMER_ID`

These are app-level prerequisites for the future read-only connect flow.

## What the owner-facing module should answer

- can I trust the reported return
- how much ad spend is likely recoverable
- how much spend goes to weak search terms
- how dependent is the account on brand traffic
- which landing pages break the paid journey
- whether PMax / YouTube is helping or hiding inefficiency
- what Raken AI should fix first

## Score pillars now modeled in code

- `measurementTrust`
- `spendEfficiency`
- `queryQuality`
- `creativeHealth`
- `landingPageMatch`
- `budgetAllocation`
- `growthReadiness`

The output is intentionally owner-first:

- overall control score
- business-language headline
- tracking confidence
- return confidence
- estimated monthly waste
- top opportunity
- recommended follow-up packages

## Productized service packages modeled

- `Tracking Fix`
- `Search Cleanup`
- `Landing Page Upgrade`
- `PMax / YouTube Optimization`

These are the bridge from analysis to paid follow-up work.

## Next implementation steps

1. Build the Google OAuth connect flow
2. Store per-user Google account connections safely
3. Pull live Google Ads + GA4 data into `AdsAccountSnapshot`
4. Merge DataForSEO competitive ads evidence into the same view
5. Add a true owner dashboard:
   - wasted spend
   - brand vs non-brand share
   - tracking trust
   - landing page leaks
   - campaign winners / losers
6. Add a specialist appendix for agencies / media buyers
7. Add execution offers and direct upsell CTAs

## Important product principle

This should not become another agency vanity dashboard.

The module must stay:

- owner-first
- read-only
- independent from agency reports
- business-impact focused
- directly tied to Raken AI follow-up services
