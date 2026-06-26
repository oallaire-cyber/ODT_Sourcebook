---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-GA1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000006
family: programme
cause-type: other
illustrates: [RA-02, RA-04]
caused-by: [ROE-03]
assessed-against: BP-GEO
validated: business
tags: [bestiary, bestiary/programme, status/new]
---
# 👹 BST-GA1 — AURORA-GEO Development Overrun & Co-Funding Shock
**Family:** programme · **Cause-type (schema):** `other` · **Assessed against:** `BP-GEO` · **Illustrates:** RA-02, RA-04

> [!info] The portfolio's second perimeter, reaching the IPO story
> This is the **GEO-side** scenario. AURORA-GEO is pre-revenue, so its loss is **cash (FCF)**, not EBIT — and that cash comes off the *same* balance sheet the IPO depends on. It is the proof that a "$50M science project" is wired to the one objective the valuation rests on. See [[Annex - AURORA-GEO Programme]] §9.

## Sponsor / cause
No adversary. The cause is **technical maturation difficulty** on the optical inter-satellite link (pointing accuracy in the GEO thermal environment, **ROE-03** → optical-maturation risk **RA-03**) driving a **Phase A/B-to-C development overrun (RA-02)**, compounded in the tail by an **ESA/NASA co-funding / partner shock (RA-04)**.

## Business objective (consequence, not technique)
**Protect the IPO window from the GEO perimeter.** Keep AURORA's development burn inside the company FCF envelope so a GEO overrun does not push consolidated FY2028 FCF through the **−$60M IPO-bridge assumption** toward the **−$100M liquidity trigger** ([[Canon & Figures Register]]).

## One plausible path (last steps)
Optical-ISL test campaign slips → re-work and added schedule consume Phase-A/B-to-C budget → ODT's internal share of the burn rises beyond plan → cash reserves earmarked for HORIZON operations are drawn down (graph edge **INF-29**, RA-02 → RC-02) → in the tail, a partner re-baselines or withdraws co-funding (RA-04), forcing ODT to backfill or write down → consolidated FCF erodes toward the IPO-bridge assumption.

## Detection
PDR/sub-system **stage-gate variance** and monthly programme cost reporting — owned by the [[Henrik Sorensen (Program Director)|AURORA Program Director]] (schedule) and [[Diane Marchetti (CFO)|CFO]] (budget, RA-02).

## Three cases (→ P10 / P50 / P90)
*Impact is FCF on **BP-GEO**; `ebit_impact = 0` by design (pre-revenue). Consolidates with the canon FY2028 plan FCF of **−$40M**.*

| Case | EBIT total | FCF y1 | Consolidated FCF | PDR slip (op recovery) | Fin recovery |
|---|---|---|---|---|---|
| **Best** (P10) | 0 *(cash-priced)* | −6 | −46 *(inside bridge)* | ~90 d | 1 yr |
| **Realistic** (P50) | 0 *(cash-priced)* | −12 | −52 *(eroding toward −60)* | ~180 d | 2 yrs |
| **Pessimistic** (P90) | 0 *(cash-priced)* | −24 | **−64** *(breaches −60 bridge)* | ~365 d | 3 yrs |

> [!note] Calibration: the **pessimistic GEO overrun alone breaches the −$60M IPO-bridge assumption** (−64), yet stays well short of FN1's standalone collapse (−100/−140). AURORA is a *contributor* to the IPO risk, not the whole of it — which is exactly the portfolio teaching point.

## Mitigation objectives (`ADDRESSES`)
- **MO-GA1-1** — De-risk optical ISL to TRL 4+ ahead of the PDR gate *(fulfilled by SM-AURORA-DERISK, 80%)*
- **MO-GA1-2** — Hold AURORA spend within the company FCF envelope *(fulfilled by SM-AURORA-VARIANCE, 75%)*
- **MO-GA1-3** — Secure ESA/NASA co-funding continuity & partner commitment *(**no `FULFILS`** — a governance/relationship objective with no purchasable control; deliberate coverage gap, like [[BST-FN1 IPO Window Collapse (Financial)|MO-FN1-3]])*

Also `MITIGATED_BY_SPICE` the company **bridge facility** (SM-BRIDGE-FACILITY) — the shared liquidity backstop that absorbs a GEO overrun's cash impact, demonstrating a **cross-perimeter mitigation**.

## 🔗 Interconnection (why it lives in a graph)
> [!important] The cross-perimeter convergence
> GA1 is the GEO entry point to the convergence thesis. Its illustrated risk **RA-02 → RC-02** (INF-29) lands in the **same company-cash cluster** that [[BST-FN1 IPO Window Collapse (Financial)|FN1]] illustrates (RC-02/RC-03), and **RC-02 `IMPACTS_TCO` [[Canon & Figures Register|TCO-04]] (the IPO)** (IMC-05). So a *different perimeter, with no EBIT*, provably reaches the IPO apex — the diversification bet and the financing crunch are one balance sheet.

**Influences:**
- [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — Moderate *(via RA-02 → RC-02, INF-29: AURORA overrun consumes company cash)*

**Influenced by:**
- *(internal AURORA chain: ROE-03 → RA-03 → RA-01 → PDR gate)*
- *(candidate: [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] — a launch/export shock could also hit AURORA — pending [[Canon Change & Issue Register|INC-02]])*

## Graph anchoring
`CAUSED_BY` → ROE-03 · `ILLUSTRATES` → RA-02, RA-04 · `ASSESSED_AGAINST` → BP-GEO · `ADDRESSES` → MO-GA1-1/2/3 · `MITIGATED_BY_SPICE` → SM-AURORA-DERISK, SM-AURORA-VARIANCE, SM-BRIDGE-FACILITY. See [[Annex - RIM Anchoring]] · [[Data Dictionary]].
> [!note] Graph encoding: like FN1, GA1's damage is **FCF**, not operating EBIT, so the three SpiceScenario cases store `ebit_impact = 0` and carry the loss in `fcf_impact_y1` (−6 / −12 / −24); the `hypothesis` field records why. `operational_recovery_days` encodes the **PDR schedule slip** (90 / 180 / 365 d), AURORA's schedule-not-EBIT recovery metric. This is the first scenario `ASSESSED_AGAINST` **BP-GEO**, making the second perimeter SPICE-covered.
