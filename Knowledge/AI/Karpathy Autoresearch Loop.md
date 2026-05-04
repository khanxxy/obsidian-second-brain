---
tags: [knowledge, ai, concept, pattern]
domain: ai
type: pattern
status: active
created: 2026-05-04
---

# Karpathy Autoresearch Loop

> A pattern for autonomous strategy/code/system optimization: **Locked Evaluator + Mutable Strategy + Cron-driven LLM agent** that finds an optimum by compounding over weeks/months.

## Definition

A Karpathy Autoresearch Loop is a scientifically rigorous iteration system in which an LLM agent (cron-driven, autonomous) tests **one** isolated hypothesis per run, automatically decides KEEP-or-REVERT, and documents the result in an append-only log. The pattern was demonstrated by Andrej Karpathy in nanoGPT/llm.c and adapted for cross-domain optimization problems.

**Core principle:** *One* variable per iteration → causally interpretable → over N iterations the solution compounds toward real edge.

## Architecture

```
1. LOCKED ENGINE
   ├── evaluator.py  (score function — NEVER changed)
   ├── prepare.py    (data preparation — NEVER changed)
   └── score.py      (rating formula — NEVER changed)

2. MUTABLE STRATEGY
   └── strategy.py   (the ONE file the LLM modifies)

3. AUTORESEARCH LOOP
   └── loop.py       (cron driver: hypothesis → patch → backtest → KEEP/REVERT → commit)

Append-only logs:
   ├── results.tsv      (curated iterations with KEEP/REVERT decisions)
   └── experiments.jsonl (full score records per run)
```

## Critical setup conditions

### 1. Search-space MUST be tight
If the LLM mutates "strategy + hyperparameters" simultaneously, the loop diverges. Symptom: many REVERT-iterations in a row, no convergence.

**Fix:** Only hyperparameters mutable, strategy logic LOCKED.

### 2. Score function MUST have hard cutoffs
Without `score = -999` for obvious garbage iterations (e.g., `num_trades < 10`, `max_drawdown > 35%`, `beta > 1.2` for market-neutral strategies), the loop finds "trivially-working" strategies (e.g., "never trade" → max Sharpe trivially).

### 3. Walk-forward + sealed test are mandatory
- **Walk-Forward** during iterations (multiple temporally-shifted train/val windows) prevents overfitting to a single period.
- **Sealed Test** after optimization (completely unseen period, one-time verification) confirms edge is real.
- Without sealed test, score evaluation remains misleading.

### 4. Plateau detection needed
If 14 days no new best-score → loop has reached local optimum, manual intervention or pause. Otherwise loop runs forever on dead horse.

### 5. ONE change per iteration
Multi-variable mutations are not causally interpretable. KEEP-decision becomes guesswork.

## Score function pattern

Proven in financial-strategy-optimization domain:
```python
score = (
    weight_sharpe * sharpe_avg
    + weight_calmar * calmar_avg
    + weight_alpha * alpha_vs_benchmark
    - penalty_drawdown * max(0, max_dd - threshold)
    - penalty_beta * max(0, abs(beta) - target_beta)
)
final = mean(score_per_window) - std(score_per_window) * stability_weight
```

**Important:** Penalty terms prevent the loop from finding "risk-free-looking" garbage. Stability weight punishes strategies that perform well in only 1 of 5 windows.

## Application domains

The Karpathy Loop is domain-agnostic. Proven use-cases:
- **Strategy optimization** (trading, allocation, portfolio rebalancing)
- **Hyperparameter tuning** for ML models
- **Prompt engineering** (system prompts iterated against eval suite)
- **Code performance optimization** (benchmark as evaluator)
- **A/B test workflow automation**

## Convergence pattern (empirical)

| Phase | Iterations | What happens |
|---|---|---|
| Discovery | 1-5 | Large score jumps (low-hanging fruit) |
| Refinement | 6-15 | Marginal improvements, mostly KEEP |
| Plateau | 16+ | Many REVERTs, loop searches sweet spot |
| Breakthrough? | variable | Sometimes a new architecture idea brings a large jump |

## Anti-patterns (what does NOT work)

- ❌ **Mutable strategy logic** — leads to divergence
- ❌ **No sealed test** — in-sample score is misleading
- ❌ **Multi-variable mutation per iteration** — not causally interpretable
- ❌ **Score without hard cutoffs** — loop finds garbage strategies
- ❌ **Manual loops without cron** — user attention is the limiting factor

## Related to this template

This pattern is conceptually similar to the **vault skill** approach in this template:
- **Locked rules** = AGENTS.md (your conventions)
- **Mutable application** = the agent's task-specific actions
- **Compounding learning** = vault grows in clarity over time as conventions get refined

Both patterns share the principle: *constrain what changes, log every iteration, let value compound*.

## References

- Andrej Karpathy — public work on nanoGPT, llm.c, "neural nets are software 2.0"
- Jegadeesh & Titman (1993) — domain example: cross-sectional momentum (where the pattern was applied with mixed results)
- AQR Capital — institutional adoption in quant finance
