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

## Programme (HORIZON-LEO)
80 LEO sats, 8 polar planes, 550 km · ~$3.4M/sat incl. launch · programme budget **$273.5M** · NOC **Denver** (primary) + **Dublin** (backup, shared identity plane) · gateways **Fairbanks, Tromsø, Singapore, Perth**.

## Objectives (graph anchors)
**TCO-01** Reach & sustain positive EBITDA · **TCO-02** Maintain operating licenses & flawless safety record · **TCO-03** Achieve commercial scale & customer diversification.
**TPO-01..06**: EBITDA+ by Q4'28 · Phase 3 by Q2'27 · FCC license Q3'26 · first $10M+ Gov contract Q4'26 · AURORA-GEO PDR Q1'27 · zero debris incidents.

## Hero scenario benchmark
[[BST-S1 NOC Ground Compromise (Cyber)|S1]] ≈ **$69M** (direct $17M + indirect $52M) → turns +$13M EBIT into ≈ −$41M.

*See [[ODT Worldbook - Core]] for narrative context and [[Annex - Finance & Unit Economics]] for the full derivations.*
