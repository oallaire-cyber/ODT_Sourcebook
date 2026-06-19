---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-RG1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000003
family: regulatory
cause-type: other
illustrates: [RH-05]
caused-by: [SEC-04]
assessed-against: BP-LEO
validated: business
tags: [bestiary, bestiary/regulatory, status/new]
---
# 👹 BST-RG1 — Security Accreditation Suspension
**Family:** regulatory · **Cause-type (schema):** `other` · **Assessed against:** `BP-LEO` · **Illustrates:** RH-05

## Sponsor / cause
A regulator / accrediting authority reacting to an incident, audit finding, or geopolitical shift — not an attacker at all.

## Business objective (consequence, not technique)
**Freeze the Government & Defense segment** (30% of revenue) by suspending the security accreditation that gates new task orders — without any service outage.

## One plausible path (last steps)
An accreditation review (triggered by a breach, a failed audit, or [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|policy change]]) **suspends new task orders immediately**; after 30 consecutive degraded days, gov contracts carry a **termination right**.

## Detection
Immediate and explicit — a regulator's letter. Unlike cyber, there is no attribution delay; the consequence is contractual from day one.

## Three cases (→ P10 / P50 / P90)
| Case | EBIT y1 | EBIT y2 | EBIT y3 | EBIT total | FCF y1 | Op recovery | Fin recovery |
|---|---|---|---|---|---|---|---|
| **Best** (P10) | −18 | −6 | — | **−24** | −28 | n/a | 2 yrs |
| **Realistic** (P50) | −34 | −12 | −2 | **−48** | −55 | n/a | 3 yrs |
| **Pessimistic** (P90) | −58 | −18 | −4 | **−80** | −90 | n/a | 3 yrs |

## Mitigation objectives (`ADDRESSES`)
- Maintain the **accreditation enclave** integrity (audited, isolated)
- Pre-cleared **remediation playbook** to shorten suspension
- Diversify revenue away from 30% gov concentration ([[Canon & Figures Register|TCO-03]])

## 🔗 Interconnection (why it lives in a graph)
Demonstrates a **non-cyber, no-outage** family that still costs ~$48M — purely contractual/regulatory. It is **influenced by** both geopolitics ([[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]]) and a cyber incident ([[BST-S1 NOC Ground Compromise (Cyber)|S1]]) — a clean example of cross-family causation — and **feeds** [[BST-FN1 IPO Window Collapse (Financial)|FN1]].

**Influences:**
- [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — Strong (30% gov revenue freeze → EBIT miss → IPO)

**Influenced by:**
- [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] — Moderate (geopolitical tension tightens the regime)
- [[BST-S1 NOC Ground Compromise (Cyber)|S1]] — Moderate (a public incident triggers review)

## Graph anchoring
`CAUSED_BY` → SEC-04 · `ILLUSTRATES` → RH-05 · `ASSESSED_AGAINST` → BP-LEO. See [[Annex - RIM Anchoring]] · [[Data Dictionary]].
