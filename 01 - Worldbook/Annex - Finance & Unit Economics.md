---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: active
tags: [worldbook, finance, status/active]
---
# 💶 Annex — Finance & Unit Economics
> [!info] Detachable annex of [[ODT Worldbook - Core]]. All headline figures live in [[Canon & Figures Register]]; this annex holds the **derivations and explanations** the Core only names. Ported from `ODT_Context_v2.2_DualState.md` §4.2–4.7 & §6.1–6.5. Order-of-magnitude by design.

**Scope.** The FY2028 P&L and cash-flow statement, the fixed/variable split, the churn mechanics, the unit-economics chain (ARR → LTV vs CAC), the service-capacity ceiling, and the **business-consequence → finance** translation table used by [[Marc Lindqvist (Finance Controller)]] and owned by [[Diane Marchetti (CFO)]].

---

## 4.2 FY2028 P&L baseline (Annual Operating Plan)
The canonical P&L is in [[Canon & Figures Register#FY2028 full P&L — Annual Operating Plan|the register]]. Headline shape:

| P&L line | $M | Note |
|---|---|---|
| Revenue | 270.0 | ≈ $22.5M/month; low seasonality (B2B/gov contracts) |
| Cost of service | −75.6 | gateways, NOC, bandwidth, terminal logistics & support (28%) |
| **Gross profit** | **194.4** | 72% gross margin |
| Sales & Marketing | −55.0 | direct sales, channel, gov bid teams |
| R&D / Engineering | −50.0 | next-gen payload, software, ground software |
| G&A | −44.4 | corporate, compliance, pre-IPO costs |
| **EBITDA** | **45.0** | 16.7% margin |
| D&A | −32.0 | satellites in service (7-yr) + ground assets |
| **EBIT** | **+13.0** | first positive year in company history |
| CapEx | −77.0 | Phase-4 manufacturing & launches (commitment) |
| **Free Cash Flow** | **−40.0** | EBITDA − CapEx − ΔWC − net interest (order of magnitude) |

## 4.3 Revenue structure
Full mix in [[Canon & Figures Register#Revenue mix|the register]]. Four segments, 40 / 30 / 15 / 15:
- **Corporate connectivity — 40% / $108M**, ~90 accounts, $1.2M ARR avg, 3-yr SLA-backed terms (mining, oil & gas, logistics, agri-tech). Per-terminal pricing $150–300/mo; a typical account runs ~400–600 terminals.
- **Government & Defense — 30% / $81M**, ~12 contracts at $5–25M ARR; US DoD, allied militaries, agencies; multi-year, availability KPIs, security accreditation.
- **Consumer (via telcos) — 15% / $40.5M**, 6 telco partners, ~45k subs @ $75/mo wholesale; ODT does not own the end customer.
- **IoT & connected devices — 15% / $40.5M**, ~40 platform deals, ~180k devices @ $19/mo; maritime, aviation, sensors; low ARPU, high volume.

> "Contracts" counts accounts/agreements, **not terminals** — the v1→v2 ARPU reconciliation (Annex B, correction 1).

## 4.4 Cost structure, contracts & sensitivity — *Finance Controller source data*
Rules of thumb handed to the Finance Controller during the workshop; deliberately order-of-magnitude.
- **Fixed-cost share ~75%** of cash operating costs over a 12-month horizon (NOC 24/7 staffing, gateway leases & backhaul, licences, insurance, payroll). **During an outage the cost base barely moves** — revenue loss flows almost 1:1 to margin.
- **Revenue per day, fully loaded ≈ $0.74M/day** blended; corporate+gov ≈ $0.52M/day of it.
- **SLA service-credit ladder** (corporate & telco): monthly uptime <99.5% → 5% credit of monthly fee; <98% → 15%; <95% → 30%. Credits are **revenue deductions, not costs**.
- **Government contracts:** availability KPI with liquidated damages, and a **termination right after 30 consecutive days** of degraded service. Security-accreditation suspension stops new task orders immediately.
- **Churn baseline:** corporate 8%/yr. Post-incident brackets: mild incident **+5 pts** for one year; severe public incident **+15–25 pts** on the affected segment, with **12–18 months** of depressed new-sales win rate ("ramp-up drag").
- **Cyber insurance:** $50M limit, $5M deductible, business interruption covered after a **72-hour** waiting period; **war/state-actor exclusion** subject to attribution dispute.
- **Liquidity rule:** cash $85M + $60M facility. The IPO bridge assumes FY2028 FCF ≥ **−$60M**. A scenario pushing FY2028 FCF below **−$100M** forces an emergency raise before the IPO.

## 4.5 What "risk" means in State B — quantification axes
- **EBIT** — the first positive year *is* the IPO story. A scenario that turns +$13M into a loss doesn't just cost money; it costs the narrative.
- **Free Cash Flow & liquidity** — FCF is already −$40M by design; unplanned cash-out compounds with revenue loss against the −$100M trigger.
- **Contractual exposure** — SLA credits, liquidated damages, gov termination rights: consequences with a contractual price tag Finance can read directly.
- **Customer trust / churn** — the slow consequence. Service recovery takes weeks; commercial recovery takes years. Financial recovery is complete only when EBIT and FCF return to plan trajectory.

## 4.6 FY2028 cash-flow statement & why it differs from FCF
FCF is a single derived metric; the cash-flow statement is the full liquidity picture in three blocks. For a pre-IPO company that consumes cash by design, **this statement — not the P&L — is the survival document.** Full table in [[Canon & Figures Register#FY2028 cash-flow statement|the register]]:

| Block | $M |
|---|---|
| Net cash from operations (CFO) | **32.0** |
| Net cash from investing (CFI) — Phase-4 CapEx cash | **−72.0** |
| Free Cash Flow (CFO + CFI) | **−40.0** |
| Net cash from financing (CFF) — venture-debt drawdown | **+20.0** |
| Net change in cash | **−20.0** (→ ~$65M year-end) |

**Why both metrics matter in a crisis.** FCF answers *"is the underlying business self-sustaining?"* (−$40M: not yet, by design). The cash-flow statement answers *"will we run out of money?"* — which depends on CFF, the financing line. A catastrophic scenario hits **CFO** (revenue & margin collapse), forces extra **CFI/OpEx** (rebuild spend), and can trigger an emergency, dilutive **CFF** event — the distressed raise the −$100M trigger describes. In the hero scenario ([[BST-S1 NOC Ground Compromise (Cyber)|S1]]), Year-1 FCF of −$79M plus the year-end cash base pushes ODT toward exactly that financing decision — the real boardroom consequence behind the headline number.

> [!note] CapEx 77 vs 72 is intentional: $77M = total Phase-4 commitment; $72M = the FY2028 cash portion. See [[Canon Change & Issue Register|INC-04]].

## 4.7 Service-capacity ceiling — *enrichment, not on the ID card*
A LEO constellation sells **throughput (Gbps), not subscribers**. Usable capacity over any market = (spectrum × spectral efficiency) × (satellites currently overhead) × (oversubscription ratio). Because each satellite is over a region for only minutes, the capacity serving a given city is a **fraction of the fleet, not all 80 satellites**.
- **Order of magnitude:** one software-defined ODT satellite delivers a few hundred Gbps usable; the constellation's *regional* capacity, not its satellite count, is the real sales limit.
- **Contention differs by segment:** committed-rate government and corporate consume capacity tightly (low oversubscription); consumer and IoT are sold at high contention (20:1–50:1).
- **Why it matters for risk:** ODT **cannot simply "sign more customers"** to recover post-incident revenue — regional capacity is capped, and capacity freed by churn is resold at lower ARPU in a buyer's market. It also creates an attack-free latent risk: over-selling a dense market degrades SLA compliance on its own.

---

## 6.1 Unit economics — corporate segment, account level (FY2028)
Canonical values in [[Canon & Figures Register#Unit economics & recovery|the register]]:

| Metric | Value | Note |
|---|---|---|
| ARR per account (avg) | $1.2M | ~500 terminals × ~$200/mo |
| Gross margin | 72% | service delivery ≈ 28% of revenue |
| CAC per account | ~$0.9M | sales cycle 9–18 mo: pilots, certification, integration |
| LTV (5-yr, GM basis) | ~$4.3M | $1.2M × 5 × 72%, before churn adjustment |
| LTV:CAC | ~4.8:1 | above the 3:1 target at 2028 scale; **was <1:1** in 2025–26 (early-phase CAC) |
| CAC payback | ~13 months | on gross margin |
| Churn (corporate) | 8%/yr | baseline; post-incident brackets in §4.4 |

## 6.2 Competitive position & commercial challenges
- **Advantages:** reconfigurable payload (capacity follows demand), sub-50ms latency, ~$3.4M per satellite incl. launch (order of magnitude below first-gen incumbents), DoD relationships, lean operations.
- **Challenges:** crowded market (Starlink, Kuiper, OneWeb/Eutelsat, Telesat); high CAC; slow channel partnerships; commodity pricing pressure as orbital capacity exceeds demand 2026–2028.

> **Implication for risk analysis:** in a buyer's market, a service incident doesn't only lose revenue — it hands customers a credible alternative. **Churn assumptions are the most sensitive variable in any ODT scenario.**

## 6.3 Churn, explained — why it dominates every scenario
**Definition.** Churn is the share of existing customers who leave over a year. ODT's 8% corporate baseline means 8 of every 100 accounts won't renew. It's the most consequential single number in a recurring-revenue business because **it compounds.** Three mechanisms a cyber audience needs to internalise:
- **It attacks the recurring base — the most valuable asset.** New sales are expensive and slow (9–18 mo, high CAC). The installed base is renewing revenue that already paid its acquisition cost. Churn destroys cheap revenue and forces replacement with expensive revenue.
- **It is a multi-year wound, not a one-off.** A lost $1.2M-ARR account isn't a $1.2M loss; it's $1.2M every year it would have stayed. At 72% GM over ~5 years, that's roughly **$3.5–4.3M of gross profit gone per lost anchor account**. This is why the hero scenario's churn line (~$28M) dwarfs its direct costs (~$17M).
- **A public incident adds two shocks on top of baseline:** (a) **reactive churn** — customers who leave because of the outage (the +15–25 pts in a severe public incident); (b) **ramp-up drag** — for 12–18 months the win rate on new deals drops because prospects have read the headlines. Together they are the "commercial fallout" that makes financial recovery lag service recovery by years.

> **Why brackets, not point values.** The post-incident figures are deliberately ranges. In the workshop the Finance Controller asks "is it 5% or 25%?" and the room debates the bracket — which is honest — rather than inventing a single false-precision number.

## 6.4 Unit economics, explained — the multiplier from incident to valuation
**Definition.** Unit economics is the revenue and cost of one customer account, stripped of company-wide noise. It answers: does each customer, on its own, make money? If the unit doesn't work, scaling only loses money faster. For an ODT corporate account:
- **ARR ~$1.2M** × **72% GM** × ~5-yr life = **LTV ~$4.3M** (lifetime gross profit).
- Against **CAC ~$0.9M** (9–18 mo cycle), giving **LTV:CAC ≈ 4.8:1** — roughly $4.8 earned per $1 of acquisition spend.
- **Health rule:** >3:1 healthy; <1:1 means you lose money on every customer. ODT clears it at 2028 scale but was below 1:1 in the early launch phase (huge CAC, tiny base) — exactly why a young scale-up burns cash and needs the funding rounds. **CAC payback ~13 months.**

> **Why a cyber audience must grasp this.** Tell a CFO "churn rose 15 points" and they don't hear a percentage — they hear *LTV destroyed → accounts lost, plus CAC wasted on accounts that left early, plus the cost to re-acquire replacements at ~$0.9M each*. Unit economics is the multiplier that converts a security incident into a **valuation event**. Public markets value recurring-revenue companies on LTV:CAC, churn and growth efficiency — so a visible incident that spikes churn doesn't just dent one year's EBIT, it can **re-rate the multiple** the whole company is valued on.

## 6.5 Translating business consequences into finance — *facilitator aid*
The bridge the workshop teaches: how a timeline consequence becomes a P&L number. **The security room produces the left column; the Finance Controller prices the right.** This table is the heart of the SPICE exercise — and the basis of the bestiary's three-case stat-blocks ([[Bestiary Index]]).

| Business consequence (what the room describes) | Financial line (what Finance prices) |
|---|---|
| Service degraded/down for N days | Revenue lost = N × daily revenue of affected segments; ~75% flows to margin (fixed costs) |
| Uptime breaches an SLA threshold | Service credit = 5/15/30% of affected monthly fees (a revenue deduction) |
| Government availability KPI missed | Liquidated damages; if >30 days degraded, contract termination risk; new task-order freeze |
| Customers leave after the incident | Churn × LTV = multi-year gross-profit loss, plus CAC to re-acquire |
| Sales harder for 12–18 months | Ramp-up drag = reduced new-bookings vs AOP across the recovery window |
| Emergency rebuild / response spend | Direct cash-out (OpEx/CapEx); not always insurable (attribution, exclusions) |
| Cash position deteriorates | FCF impact vs the −$100M liquidity trigger → possible distressed, dilutive raise |

---
## Changelog
- 2026-06-18: built out from Context v2.2 §4.2–4.7 & §6.1–6.5; figures pushed to [[Canon & Figures Register]] first (full P&L, cash-flow statement, CAC payback, IPO-bridge assumption), then cited here.
