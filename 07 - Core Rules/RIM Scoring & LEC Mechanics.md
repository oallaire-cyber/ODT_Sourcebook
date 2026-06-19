---
type: core-rules
sourcebook-line: "07 - Core Rules"
status: new
tags: [core-rules, rim, mechanics, status/new]
---
# 🎰 RIM Scoring & LEC Mechanics
> [!info] How the graph becomes a loss curve. Practitioner summary; full treatment in the RIM whitepaper.

**Two pipelines, combined by a compound-Poisson model:**
- **Frequency (λ)** — from the graph: a risk's likelihood (1–10) → annual Poisson rate `annual_probability`, by analyst entry or a domain lookup. *SPICE does not feed frequency.*
- **Magnitude** — from SPICE where it exists: the three `SpiceScenario` cases fitted (P10/P50/P90) by the MagnitudeCalibrator; else a YAML domain default or the Tier-2 `magnitude_point_estimate`.

**Output:** the **Loss Exceedance Curve** `P(annual loss > x)`; derived ALE, VaR 95/99/99.5, Expected Shortfall.

**Exposure (graph side):** `likelihood × severity` (max 100), propagated along `INFLUENCES` with decay 0.85; strengths weak 0.25 / moderate 0.5 / strong 0.75 / critical 1.0; mitigations reduce by low 0.3 / med 0.5 / high 0.7 / critical 0.9.

**Provenance:** every LEC records whether magnitude came from SPICE or YAML — so a reviewer sees which risks a workshop has touched. This is why building [[Bestiary Index|bestiary entries]] (real SpiceScenarios) makes the demo's LEC *real*.
