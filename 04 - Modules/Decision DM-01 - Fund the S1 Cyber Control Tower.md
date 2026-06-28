---
type: module
sourcebook-line: "04 - Modules"
status: new
tags: [module, decision, decision-log, w7, spice, rim, status/new]
aliases: ["DM-01", "Fund the S1 Cyber Control Tower", "S1 control-tower decision"]
decision-id: DM-01
committee: Risk & Opportunity Committee
---
# 🟢 DM-01 — Fund the S1 Cyber Control Tower
> **Decision Log entry** of the [[Annex - Risk & Opportunity Committee|Risk & Opportunity Committee]] · **Type:** Fund · **Status:** at ROC · **Recommendation: APPROVE NOW**
> *A fully worked management decision shown as a **before/after on the RIM graph** — the W7 keystone (ROADMAP). Every figure is canon-cited from [[Canon & Figures Register]]; nothing is invented.*

## The ask
Capitalise the **two planned S1 cyber controls — ~$5.5M one-time** — or knowingly accept the cyber tail. The controls take the **pessimistic S1 case from −$118M FCF (a −$100M trigger breach) back above the trigger**, severing the path from a cyber incident to a forced, dilutive raise before the IPO.

## 1. Why now (trigger)
The two controls are **`status: planned`** — decided in principle, **un-capitalised**. The FY2028 plan runs on ~**$60M of FCF headroom** (plan −$40M vs the −$100M trigger), and S1 is the single scenario whose *pessimistic* case crosses that line on its own. Deferring the spend leaves the highest-leverage protection in the portfolio un-bought while the IPO window (H1 2029) approaches.

## 2. What is at stake
| | |
|---|---|
| **Opportunity protected** | [[Annex - Objectives & Opportunities\|OPP-01]] — the **~$250M H1 2029 IPO** (TCO-04); and [[Annex - Objectives & Opportunities\|OPP-05]] — the **+$13M first-profit** story (TCO-01) |
| **The line defended** | **FCF ≥ −$100M** liquidity trigger (below it → distressed raise *before* the IPO) |
| **Convergence context** | S1 is one of **six families** draining into RC-01/02/03 → TCO-04; it is the **highest-leverage** of them (see [[ODT Risk Status & Executive Decision Brief - 2026-06-28\|risk brief]] §3–4) |

## 3. What the RIM shows
- **The priced tail.** [[BST-S1 NOC Ground Compromise (Cyber)\|S1]] realistic ≈ **$69M** (direct $17M + indirect $52M) → turns **+$13M EBIT into ≈ −$41M**; realistic FCF **−$79M**; **pessimistic FCF −$118M → breaches −$100M → S1 → [[BST-FN1 IPO Window Collapse (Financial)\|FN1]]** path live.
- **Insurance won't save it.** The **$50M cyber tower carries a war/state-actor exclusion**, and S1's modelled cause is a **state-aligned** actor. In an attribution dispute the tower may not pay — so the **controls are the primary protection, not a supplement** (this is also why MO-FN1-2's 120% coverage is partly illusory).
- **The gap is funding, not design.** Both controls are scoped and priced; only the capital decision is missing.

## 4. The options
| Option | What | Consequence |
|---|---|---|
| **A — Fund both (~$5.5M)** ✅ *recommended* | SM-IDENTITY-SPLIT (~$4M) + SM-CTRL-RECOVERY (~$1.5M) | Pessimistic S1 held **above −$100M**; S1→FN1 severed; ~**12×** return |
| **B — Accept the tail** | Fund nothing; rely on the $50M tower + bridge facility | Exposed to the **state-actor exclusion**; one pessimistic S1 = trigger breach. Must be **minuted as an explicit acceptance** (links to [[Annex - Risk & Opportunity Committee\|DM-02]]) |
| **C — Partial (identity-split only, ~$4M)** | Structural control only; defer recovery | Reduces likelihood/blast-radius but **keeps slow recovery** — crisis days unbought; weaker on the pessimistic tail |

## 5. The numbers (return on spend)
| | $M |
|---|---|
| **Spend (one-time capex)** | **~5.5** (SM-IDENTITY-SPLIT ~4.0 + SM-CTRL-RECOVERY ~1.5) |
| Realistic feared loss avoided (S1) | ~**69** |
| Pessimistic tail removed | **−118 → above −100** (trigger held) |
| **Return vs realistic feared loss** | ≈ **12×** |

> [!note] ROCE is computed, not stored ([[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] §C5)
> Benefit = base − mitigated scenario impact (per case); ROCE = benefit ÷ Σ capex of the cited controls. The analyst authors only the **mitigated version** (§6) and the **capex** per control; the RIM derives the ratio. Until the controls are funded, that benefit is a **projection** (CR-01's realised-vs-projected rule).

## 6. Before / after on the graph
The mechanism CR-01 §C4 formalises: a **fund** decision authors a **mitigated version** of the S1 family (per case); the base stays visible as `superseded`.

| | **Before** (`current` base version) | **After** (projected mitigated version) |
|---|---|---|
| S1 realistic FCF | −$79M | improved (controls reduce duration/blast-radius) |
| **S1 pessimistic FCF** | **−$118M → breaches −$100M** | **held above −$100M** |
| S1 → FN1 path | **live** (cyber reaches the IPO sink) | **severed** |
| SM-IDENTITY-SPLIT / SM-CTRL-RECOVERY | `planned`, un-capitalised | `funded → on-going → existing` |
| Which version is `current` | the **base** (controls not yet realised) | becomes `current` **once funded & deployed** |

> [!important] Projection until funded
> Because the controls are *planned*, the mitigated version is the **"benefit if funded"** projection that justifies the spend — exactly the thing the ROC is deciding. Approving DM-01 is what turns the projection into the realised, `current` state. *(Graph mutation lands in the seed once [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] aligns the schema; the figures here are already canonical.)*

## 7. Decision, owners & conditions
- **Recommendation: APPROVE Option A now** — the highest-leverage decision in the portfolio.
- **Owners:** [[Tom Reuter (CISO)\|CISO (Tom Reuter)]] **stewards** delivery · [[Diane Marchetti (CFO)\|CFO (Diane Marchetti)]] **funds** (capital release) · [[Elena Vasquez (CEO)\|CEO (Elena Vasquez)]] **sponsors** (accountable for TCO-04).
- **Conditions on approval:**
  1. Pair with **[[Annex - Risk & Opportunity Committee|DM-02]]** — decide the insurance state-actor gap explicitly (the controls are the primary protection *because* the policy may not pay).
  2. Tie capital release to deployment milestones (identity/PAM plane separation across Denver/Dublin; golden-image rebuild runbook tested).
  3. Re-assess S1 at the next cycle (§5 review of the operating loop) — confirm the mitigated version becomes `current` only on realised deployment.
  4. Note the **CISO owner concentration** ([[Annex - Risk & Opportunity Committee|DM-06]]): the steward of these controls already bears 16/50 risks.

## 8. Follow-through
Logged in the [[Annex - Risk & Opportunity Committee#6. The Decision Log|ROC Decision Log]] as **DM-01 (Worked)**. Feeds: the seed-level before/after (pending [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]]); the [[Sponsor One-Pager - Pricing the Cyber Tail|sponsor one-pager]] and [[Sponsor Live Demo Script - Animating the Risk Graph|live demo]] (same spine); [[THE NUMBER - Season 2 (mitigation)|THE NUMBER S2]] (the dramatised version of this exact decision).

## Changelog
- 2026-06-28: **DM-01 created (W7).** First fully worked ROC management decision — fund the ~$5.5M S1 cyber control tower vs accept the tail — as a before/after on the graph (base vs projected mitigated version, per [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] §C4). Options A/B/C, ~12× return, owners (CISO steward / CFO fund / CEO sponsor), conditions (pair with DM-02; milestone-gated release). Seeded from the [[ODT Risk Status & Executive Decision Brief - 2026-06-28|risk brief]] §7 D1. All figures canon-cited; no new canon. Graph mutation pending CR-01 schema alignment. Target tier **L2**.
