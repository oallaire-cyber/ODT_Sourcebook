---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-FN1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000005
family: financial
cause-type: other
illustrates: [RC-01, RC-02, RC-03]
caused-by: [—]
assessed-against: BP-LEO
validated: business
tags: [bestiary, bestiary/financial, status/new]
---
# 👹 BST-FN1 — IPO Window Collapse / Distressed Raise
**Family:** financial · **Cause-type (schema):** `other` · **Assessed against:** `BP-LEO` · **Illustrates:** RC-01, RC-02, RC-03

## Sponsor / cause
No single sponsor — this is the **convergence node**. Its cause is *any* upstream family that pushes FY2028 below plan plus a closing market window.

## Business objective (consequence, not technique)
**Erase the IPO story.** Push FY2028 FCF below the **−$100M liquidity trigger**, forcing an emergency, **dilutive** raise before H1 2029 — or collapse the valuation multiple via a visible churn/EBIT shock.

## One plausible path (last steps)
Upstream losses (outage, slip, freeze) compound: EBIT turns negative, FCF breaches −$100M, the venture-debt facility is drawn early, and a **down-round** or delayed IPO follows. Public markets re-rate recurring-revenue companies on churn/LTV:CAC — so the damage is to the **multiple**, not just the year.

## Detection
Visible to the board immediately via the cash-flow statement and the AOP variance — owned by [[Diane Marchetti (CFO)]].

## Three cases (→ P10 / P50 / P90)
| Case | EBIT y1 | EBIT y2 | EBIT y3 | EBIT total | FCF y1 | Op recovery | Fin recovery |
|---|---|---|---|---|---|---|---|
| **Best** (P10) | — | — | — | *dilution-priced* | −60 | n/a | 2 yrs |
| **Realistic** (P50) | — | — | — | *distressed raise* | −100 | n/a | 3 yrs |
| **Pessimistic** (P90) | — | — | — | *IPO pulled, down-round* | −140 | n/a | 3+ yrs |

## Mitigation objectives (`ADDRESSES`)
- Hold FY2028 FCF above the −$100M trigger (every upstream mitigation feeds this)
- Pre-arranged **bridge financing** & insurance that actually pays
- Quantified, **disclosed** risk in the IPO file (Diane's lever)

## 🔗 Interconnection (why it lives in a graph)
> [!important] The point of the whole bestiary
> FN1 has **no `influences` of its own** — it is the **sink**. Four different families, with utterly different causes (a hacker, a supplier, a regulator, a geopolitical shift), all land here. This is the **commonality view** RIM exists to produce: the mitigations worth most are the ones that protect this convergence. Its metric is **dilution / cost of capital** — a State-A-style metric reappearing in State B, exactly the [[ODT Worldbook - Core|dual-state]] teaching point.

**Influences:**
- (none)

**Influenced by:**
- [[BST-S1 NOC Ground Compromise (Cyber)|S1]] — Strong
- [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] — Strong
- [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]] — Strong
- [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] — Moderate
- [[BST-GA1 AURORA-GEO Development Overrun (Programme)|GA1]] — Moderate *(GEO perimeter, via RA-02 → RC-02)*

## Graph anchoring
`CAUSED_BY` → — · `ILLUSTRATES` → RC-01, RC-02, RC-03 · `ASSESSED_AGAINST` → BP-LEO. FN1 is **the scenario of failing [[Canon & Figures Register|TCO-04]] (the IPO)**: all three illustrated risks `IMPACTS_TCO` → TCO-04 (IMC-04/05/06), making this the convergence apex. See [[Annex - RIM Anchoring]] · [[Data Dictionary]].
> [!note] Graph encoding: FN1's damage is **FCF/dilution**, not operating EBIT, so the three SpiceScenario cases store `ebit_impact = 0` and carry the loss in `fcf_impact_y1` (−60 / −100 / −140). The `hypothesis` field records this. The −$100M realistic case sits exactly on the liquidity trigger.
