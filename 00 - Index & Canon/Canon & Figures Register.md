---
type: canon
sourcebook-line: "00 - Index & Canon"
status: new
tags: [canon, figures, status/new]
aliases: ["The Numbers", "Figures Register"]
---
# 📊 Canon & Figures Register

> [!important] Single source of truth for numbers
> Every other note **cites** these figures; none invents its own. If a number changes, it changes **here first**. Figures are order-of-magnitude by design.
>
> Proposed changes, inconsistencies and improvements are tracked in [[Canon Change & Issue Register]] — change canon here, then regenerate via [[Data Dictionary|the workbook pipeline]].

## State axis (same company, two frozen points)
| | **State A — Jun 2025 (Scale-up)** | **State B — Jun 2028 (Operator)** *(canonical)* |
|---|---|---|
| Stage | Pre-revenue, FCC pending | 56 sats in service, first profitable year |
| Cash | $78M | $85M + $60M facility |
| Headcount | 285 | 540 |
| Risk metric | runway, dilution, milestone slip | EBIT, FCF, SLA, churn |

## State B — the P&L being protected (FY2028 plan)
| Metric | Value | Note |
|---|---|---|
| Revenue | **$270M** | ≈ $0.74M/day blended; $0.52M/day corp+gov |
| EBITDA | **+$45M** | 16.7% margin |
| EBIT | **+$13M** | first positive year — the IPO story |
| Free Cash Flow | **−$40M** | negative by design (Phase 4 CapEx) |
| Liquidity trigger | **−$100M FCF** | below this → distressed raise before IPO |
| IPO bridge assumption | FCF ≥ **−$60M** | the plan the IPO bridge is built on |
| Gross margin | 72% | |
| Fixed-cost share | ~75% | outage hits margin almost 1:1 |
| IPO | H1 2029 (~$250M, Nasdaq) | the story to protect |

## FY2028 full P&L — Annual Operating Plan *(derivations: [[Annex - Finance & Unit Economics]])*
| P&L line | $M | Note |
|---|---|---|
| Revenue | **270.0** | ≈ $22.5M/month; low seasonality (B2B/gov) |
| Cost of service | −75.6 | gateways, NOC, bandwidth, terminal logistics & support (28%) |
| **Gross profit** | **194.4** | 72% gross margin |
| Sales & Marketing | −55.0 | direct sales, channel, gov bid teams |
| R&D / Engineering | −50.0 | next-gen payload, software, ground software |
| G&A | −44.4 | corporate, compliance, pre-IPO costs |
| **EBITDA** | **45.0** | 16.7% margin |
| Depreciation & Amortisation | −32.0 | satellites in service (7-yr) + ground assets |
| **EBIT** | **+13.0** | first positive year |
| CapEx (Phase 4) | −77.0 | Phase-4 manufacturing & launches (total commitment) |
| **Free Cash Flow** | **−40.0** | see cash-flow statement below |

## FY2028 cash-flow statement *(illustrative — the survival document)*
| Block | $M | Note |
|---|---|---|
| EBITDA | 45.0 | operating cash generation |
| Working-capital change | −8.0 | growth ties up cash (receivables, prepayments) |
| Net interest & tax | −5.0 | venture-debt interest, minimal tax |
| **Net cash from operations (CFO)** | **32.0** | cash-generative at the operating line |
| CapEx — Phase 4 (FY2028 cash) | −72.0 | the dominant outflow |
| **Net cash from investing (CFI)** | **−72.0** | |
| **Free Cash Flow (CFO + CFI)** | **−40.0** | the derived metric |
| Venture-debt drawdown / other (CFF) | +20.0 | partial refill while the IPO is prepared |
| **Net change in cash** | **−20.0** | drawn from $85M → ~$65M year-end |

> [!note] CapEx **77 vs 72**: $77M = total Phase-4 CapEx *commitment* (programme budget Phase-4 line); $72M = the portion hitting *FY2028 cash*. Different concepts, both canonical. Tracked as [[Canon Change & Issue Register|INC-04]].

## Revenue mix
| Segment | Share | Revenue | Note |
|---|---|---|---|
| Corporate | 40% | $108M | ~90 accounts, $1.2M ARR avg, 3-yr SLA-backed (mining, oil & gas, logistics, agri-tech) |
| Government & Defense | 30% | $81M | ~12 contracts, $5–25M ARR; accreditation-gated, availability KPIs (corp+gov = 70%) |
| Consumer (via telcos) | 15% | $40.5M | 6 telco partners, ~45k subs @ $75/mo; wholesale, ODT doesn't own the end customer |
| IoT | 15% | $40.5M | ~40 platform deals, ~180k devices @ $19/mo; low ARPU, high volume |

## Unit economics & recovery
ARR/account **$1.2M** (~500 terminals @ ~$200/mo) · LTV **~$4.3M** (5-yr, gross-margin basis) · CAC **~$0.9M** (9–18 mo sales cycle) · LTV:CAC **~4.8:1** (>3:1 healthy; was **<1:1** in 2025–26 early phase) · CAC payback **~13 mo** · churn baseline **8%/yr** (mild incident **+5 pts**; severe public incident **+15–25 pts**) · ramp-up drag **12–18 mo**.
Per-terminal pricing **$150–300/mo** corporate; a typical corporate account runs **~400–600 terminals**. Revenue table counts **accounts/contracts** (~150 total), not terminals.

## Contractual price of downtime
SLA credit ladder (corporate/telco, on monthly fee): **<99.5% → −5%**, **<98% → −15%**, **<95% → −30%**. Government: liquidated damages + termination after **30 consecutive days** degraded; accreditation suspension freezes new task orders.

## Insurance
Cyber limit **$50M**, deductible **$5M**, BI after **72h**, **war/state-actor exclusion** (attribution dispute → don't bank it).

## Mitigation costs — S1 cyber controls *(order-of-magnitude, one-time)*
The two real S1 controls priced so the SPICE *return-on-spend* is quantitative (closes [[Canon Change & Issue Register|ENH-06]]). Costs are order-of-magnitude by design (Rule 6), USD_M. Per [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] both are `planned` controls (decided in principle, **un-capitalised**), so the figure is carried as **`committed_budget`** (→ becomes `capex` on funding); it is the ROCE denominator for the projected mitigated version.
| Control | `committed_budget` | Note |
|---|---|---|
| **SM-IDENTITY-SPLIT** (Denver/Dublin identity & PAM plane separation) | **~$4M** | structural re-architecture of the shared privileged-access plane across both ground sites — the heavier control |
| **SM-CTRL-RECOVERY** (clean control-plane recovery — golden images + rebuild runbook) | **~$1.5M** | recovery-accelerating; buys crisis days back |
| **Portfolio** | **~$5.5M** | vs the S1 tail it removes: −$69M realistic / **−$118M FCF** pessimistic (which breaches the −$100M trigger → FN1). ≈ **12×** the realistic feared loss avoided (exposure-vs-spend framing). |

## S1 — projected *mitigated* re-assessment *(CR-01 §C4 / DM-01 "after"; owner-confirmed 2026-06-29)*
The analyst-authored mitigated version of the S1 family (`scenario_family_id …01`, `version_number 2`), citing the two `planned` cyber controls above. Because the controls are un-capitalised, this version is a **projection** (`status_in_family: draft`) — "benefit if funded"; the base (v1) stays `current`. On funding/deployment the analyst flips base→`superseded`, this→`current`. **Benefit = base − mitigated** (computed by RIM, [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] §C5).
| Case | EBIT total (base → mitigated) | FCF (base → mitigated) | FCF benefit |
|---|---|---|---|
| best | −40 → **−23** | −60 → **−38** | +22 |
| realistic | −69 → **−40** | −79 → **−54** | +25 |
| pessimistic | −110 → **−64** | **−118 → −82** (held above −100) | **+36** |

Pessimistic FCF is pulled from −118 (a −$100M-trigger breach) to **−82**, **severing the S1 → FN1 path**. SM-CYBER-INS is cited (`MITIGATED_BY`) but contributes ~0 to the projection — the $50M tower's war/state-actor exclusion vs S1's state-aligned actor (so the controls, not insurance, are the primary protection).

## Programme (HORIZON-LEO)
80 LEO sats, 8 polar planes, 550 km · ~$3.4M/sat incl. launch · programme budget **$273.5M** · NOC **Denver** (primary) + **Dublin** (backup, shared identity plane) · gateways **Fairbanks, Tromsø, Singapore, Perth**.

## Programme (AURORA-GEO)
GEO optical-relay (ISL) demonstrator, ESA/NASA co-funded · Phase A/B, **PDR gate Q1 2027** (TPO-05) at **TRL 4+** · second P&L perimeter (**BP-GEO**).
| Field | Value | Note |
|---|---|---|
| Total Phase-A/B→PDR budget | **~$50M** | the "smaller second bet" vs LEO's $273.5M; order-of-magnitude |
| ESA/NASA co-funding share | **~60% (~$30M)** | sovereign co-development (ESA ARTES/Partnership-style) |
| ODT internal share | **~40% (~$20M)** | ODT's *own* cash exposure — the part that drains into company cash (RA-02 → RC-02) |
| FY2028 ODT internal burn | **~$10M** | Phase-C development ramp; = BP-GEO `fcf_baseline` (see perimeter map) |

## Business perimeters (P&L map) — consolidation
The consolidated State-B P&L is the **sum of perimeters**. RIM scenarios are assessed against the perimeter that bears them.
| Perimeter | Holder | `ebit_baseline` | `fcf_baseline` | Note |
|---|---|---|---|---|
| **BP-LEO** | HORIZON-LEO BU | **13.0** | **−30.0** | operating constellation (bears all canon EBIT) |
| **BP-GEO** | AURORA-GEO Programme | **0.0** *(pre-revenue; dev-spend capitalised)* | **−10.0** | development burn (ODT internal share) |
| **Consolidated** | ODT | **+13.0** ✔ | **−40.0** ✔ | EBIT: LEO 13 + GEO 0; FCF: LEO −30 + GEO −10 = **canon EBIT +$13M / FCF −$40M** |
> [!note] Reconciliation *(CAN-01 / CAN-03 EBIT leg closed 2026-06-26)*
> The perimeters **sum to the canon consolidated figures**: EBIT **+13** (LEO 13 + GEO 0) and FCF **−40** (LEO −30 + GEO −10). BP-LEO's `ebit_baseline` now holds the **true EBIT (+13)**, replacing the EBITDA-level 45 it previously carried. AURORA-GEO's FY2028 dev-spend is treated as **capitalised** (it hits FCF, not EBIT), so BP-GEO stays `ebit_baseline 0` (pre-revenue) with `fcf_baseline −10`. This closes both halves of [[Canon Change & Issue Register|CAN-01]] and the EBIT leg of [[Canon Change & Issue Register|CAN-03]]. *(Revenue remains 100% LEO by design — no GEO service revenue.)*

## Objectives (graph anchors)
**TCO-01** Reach & sustain positive EBITDA · **TCO-02** Maintain operating licenses & flawless safety record · **TCO-03** Achieve commercial scale & customer diversification · **TCO-04** Achieve a successful **IPO / liquidity event by H1 2029** *(owner CEO; the convergence apex — see below)*.
**TPO-01..06**: EBITDA+ by Q4'28 · Phase 3 by Q2'27 · FCC license Q3'26 · first $10M+ Gov contract Q4'26 · AURORA-GEO PDR Q1'27 · zero debris incidents.

> [!important] TCO-04 is the convergence apex
> The bestiary thesis is that all risk families converge on the **financing/IPO** objective. **TCO-04 (IPO)** makes that literal: the company financial-risk cluster — **RC-01** (EBITDA miss), **RC-02** (cash runway), **RC-03** (investor confidence) — all `IMPACTS_TCO` **TCO-04**, and **TPO-01** (revenue ramp) `CONTRIBUTES_TO` it. **TCO-01 (EBITDA)** stays a real objective but is now correctly an *enabler* of the IPO, not a proxy for it. The IPO is targeted H1 2029, **~$250M, Nasdaq** (see State B table). [[BST-FN1 IPO Window Collapse (Financial)|FN1]] is the scenario of failing TCO-04.

## Opportunity Register (the upside the RIM protects)
> [!important] Both sides of the ledger
> The risk graph exists to protect **value being created**, not only loss being avoided. These are the upsides ODT is reaching for; each **advances** an objective and is **threatened by** a named downside family. RIM v3.0 has no `opportunity` node type, so opportunities are **canonical narrative anchors** (OPP-IDs) wired onto the objective tree — not graph nodes. Full pairing in [[Annex - Objectives & Opportunities]]. *(Owner-confirmed model, 2026-06-28: distinct OPP register.)*

| ID | Opportunity | Value at stake *(canon)* | Advances | Threatened by |
|---|---|---|---|---|
| **OPP-01** | **IPO / liquidity event** — the prize | **~$250M, Nasdaq, H1 2029** | **TCO-04** (apex) | **FN1** directly; the whole convergence (S1/SC1/RG1/GP1/GA1 → RC-01/02/03 → TCO-04) |
| **OPP-02** | **AURORA-GEO second P&L** — the equity second act | **~$50M** programme (**~$20M** ODT share); **BP-GEO** perimeter | **TCO-03** (via TPO-05 PDR); reinforces TCO-04 equity story | **GA1** / RA-02 (dev overrun) / RA-04 (partner withdrawal) |
| **OPP-03** | **Anchor Government contract** — diversification beachhead | **$10M+ ARR** by Q4 2026 | **TCO-03** (via TPO-04) | **RG1** (accreditation suspension) / **GP1** (export-control + launch) / RH-05 |
| **OPP-04** | **Commercial scale & diversification** — reduce the 30% gov concentration | corporate backlog growth (**~$1.2M ARR/acct**, **LTV:CAC ~4.8:1**) | **TCO-03** | **S1** (severe public incident **+15–25 pts** churn) / RC-05 (reputation) / RH-04 (competition) |
| **OPP-05** | **First profitable year** — the IPO story itself | **+$13M EBIT** (FY2028) | **TCO-01** (the headline IPO enabler) | **S1** (**$69M** turns +13 into **−41**) / SC1 / RH-01 / RH-03 |

> [!note] Reading the register
> The apex opportunity **OPP-01** is the IPO; **OPP-02..05** are the supporting bets that feed it (a credible **first-profit** story (OPP-05) + **diversified, scaling** revenue (OPP-03/04) + a **second-act** growth narrative (OPP-02) are what the IPO is sold on). Every bestiary family threatens at least one opportunity — that is the convergence thesis read from the *upside* in. No new figures: every value above is cited from this register.

## Hero scenario benchmark
[[BST-S1 NOC Ground Compromise (Cyber)|S1]] ≈ **$69M** (direct $17M + indirect $52M) → turns +$13M EBIT into ≈ −$41M.

*See [[ODT Worldbook - Core]] for narrative context and [[Annex - Finance & Unit Economics]] for the full derivations.*
