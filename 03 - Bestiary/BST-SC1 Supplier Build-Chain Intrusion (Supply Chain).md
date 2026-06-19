---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-SC1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000002
family: supply-chain
cause-type: security
illustrates: [RH-02]
caused-by: [SEC-02, ROE-01]
assessed-against: BP-LEO
validated: business
tags: [bestiary, bestiary/supply-chain, status/new]
---
# 👹 BST-SC1 — Supplier Build-Chain Intrusion & Production Halt
**Family:** supply-chain · **Cause-type (schema):** `security` · **Assessed against:** `BP-LEO` · **Illustrates:** RH-02

## Sponsor / cause
Industrial-espionage actor or state interest seeking to slow ODT's deployment and harvest payload IP.

## Business objective (consequence, not technique)
Inject **doubt into the integrity of satellites already built or in production**, forcing a choice between a risky launch and a costly schedule slip — while stealing design data. (Maps to graph scenario `SC-01`.)

## One plausible path (last steps)
Compromise a **tier-1 supplier** → pivot through the **shared PLM/engineering platform** into the build & test chain → exfiltrate payload design data and subtly alter test/config records. Once tampering is suspected, ODT **cannot certify which Phase-4 units are clean**.

## Detection
Discovered late — a test-telemetry anomaly or a supplier breach notice, weeks/months after the fact. The hardest detection of the set.

## Three cases (→ P10 / P50 / P90)
| Case | EBIT y1 | EBIT y2 | EBIT y3 | EBIT total | FCF y1 | Op recovery | Fin recovery |
|---|---|---|---|---|---|---|---|
| **Best** (P10) | −16 | −4 | — | **−20** | −24 | n/a (no outage) | 2 yrs |
| **Realistic** (P50) | −26 | −10 | — | **−36** | −42 | n/a | 2 yrs |
| **Pessimistic** (P90) | −42 | −18 | — | **−60** | −70 | n/a | 3 yrs |

## Mitigation objectives (`ADDRESSES`)
- **Re-verification / clean-build** capability for suspect units
- PLM **integrity monitoring** & supplier access governance
- IP-segmentation of payload design data

## 🔗 Interconnection (why it lives in a graph)
No outage at all, yet it costs tens of millions — **through schedule, integrity and IP**, not downtime. It is **caused by** [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] (supplier access) and **feeds** [[BST-FN1 IPO Window Collapse (Financial)|FN1]] via Phase-4 slip. The cheapest mitigation question: does the money go to S1's outage or SC1's integrity?

**Influences:**
- [[BST-S1 NOC Ground Compromise (Cyber)|S1]] — Weak (widened attack surface)
- [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — Strong (Phase-4 slip → revenue miss → IPO)

**Influenced by:**
- [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] — Strong (geopolitics disrupts supplier access)

## Graph anchoring
`CAUSED_BY` → SEC-02, ROE-01 · `ILLUSTRATES` → RH-02 · `ASSESSED_AGAINST` → BP-LEO. See [[Annex - RIM Anchoring]] · [[Data Dictionary]].
