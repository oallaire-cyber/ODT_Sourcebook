---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-S1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000001
family: cyber
cause-type: security
illustrates: [RC-05]
caused-by: [SEC-01, SEC-08]
assessed-against: BP-LEO
validated: business
tags: [bestiary, bestiary/cyber, status/new]
---
# 👹 BST-S1 — NOC / Ground-Segment Compromise
**Family:** cyber · **Cause-type (schema):** `security` · **Assessed against:** `BP-LEO` · **Illustrates:** RC-05

## Sponsor / cause
A state-aligned actor contesting ODT's government customers, or a competitor's covert proxy — well-resourced, attribution-averse.

## Business objective (consequence, not technique)
Make ODT **miss its FY2028 delivery promise and damage the IPO narrative** by taking the constellation offline long enough to break SLAs and shake government confidence. *Not* 'deploy ransomware.'

## One plausible path (last steps)
Entry via the **MSSP's privileged remote access** → the **shared Denver/Dublin identity/PAM plane** → the Network Management System. A corrupt beam/capacity config is pushed and operator credentials revoked; the fleet trips **fleet-wide safe-mode**. The backup NOC is *not* a backup against this. Last step: loss of legitimate control.

## Detection
Customers notice degraded service before ODT confirms cause; **attribution takes days** — delaying the insurance trigger and letting the press write the story.

## Three cases (→ P10 / P50 / P90)
| Case | EBIT y1 | EBIT y2 | EBIT y3 | EBIT total | FCF y1 | Op recovery | Fin recovery |
|---|---|---|---|---|---|---|---|
| **Best** (P10) | −34 | −5 | −1 | **−40** | −60 | 2 wks | 2 yrs |
| **Realistic** (P50) | −54 | −12 | −3 | **−69** | **−79** | 3 wks | 3 yrs |
| **Pessimistic** (P90) | −78 | −24 | −8 | **−110** | −118 | 6 wks | 3+ yrs |

## Mitigation objectives (`ADDRESSES`)
- Separate the Denver/Dublin **identity & privileged-access planes** (kills the single-plane weakness)
- Harden/segment **MSSP privileged remote access**
- Pre-built **clean control-plane recovery** capability (cut crisis days)

## 🔗 Interconnection (why it lives in a graph)
S1 is the **hero**: it converts a cyber event into the same financial wound any family produces. Its pessimistic case crosses the **−$100M FCF liquidity trigger** ([[Canon & Figures Register]]), forcing a distressed raise — i.e. it *becomes* [[BST-FN1 IPO Window Collapse (Financial)|FN1]]. Dramatised in [[THE NUMBER - Season 1 (external)|THE NUMBER]].

**Influences:**
- [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]] — Moderate (a public security incident triggers accreditation review)
- [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — Strong (outage → churn/EBIT miss → IPO story damage)

**Influenced by:**
- [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] — Weak (shared PLM/MSSP access widens the attack surface)

## Graph anchoring
`CAUSED_BY` → SEC-01, SEC-08 · `ILLUSTRATES` → RC-05 · `ASSESSED_AGAINST` → BP-LEO · `OCCURS_AT` → **TP-NOC** (W6). RC-05 (reputational damage — its definition explicitly covers "service outage") is the business consequence a NOC outage actually materialises; it converges on the IPO apex via **RC-05 → RC-03 (INF-28) → `IMPACTS_TCO` [[Canon & Figures Register|TCO-04]]** (IMC-06), and carries the government-confidence thread via RC-05 → TPO-04 (IMP-09). See [[Annex - RIM Anchoring]] · [[Data Dictionary]].

**Kill-chain (W6, now in the graph; 1:1 with [[Annex - Security Architecture]] §7):** `SPN-02` (state-aligned sponsor) `MANAGES` `ATK-02` (APT-Eclipse, capability 8) which `EXPLOITS` `EP-02` (MSSP privileged remote access, p≈0.5) and `COMPROMISES` `TP-IDP` (shared Denver/Dublin identity & PAM plane), `TP-NMS` (the "commercial brain"), and `TP-NOC` — `SEEKS` `FT-CTRL` (legitimate fleet command authority) → fleet-wide safe-mode. The mitigated version's `SM-IDENTITY-SPLIT` is exactly the fix for the `TP-IDP` single-plane flaw. **λ (W6):** SEC-01 0.20/yr, SEC-08 0.10/yr (the two causes); RCY-01 0.50, RCY-02 0.33.

> [!note] Changelog
> - 2026-06-30: `ILLUSTRATES` corrected **RH-04 → RC-05**. A NOC/ground-segment outage materialises as **reputational harm from broken SLAs** (RC-05's definition explicitly covers "service outage"), not loss of competitive positioning vs mega-constellations (RH-04, a market-structure risk). Convergence to the IPO apex is preserved and made cleaner: **RC-05 → RC-03 (INF-28) → `IMPACTS_TCO` TCO-04** (IMC-06); the government-confidence thread runs via **RC-05 → TPO-04** (IMP-09). INF-15 (SEC-01 → RC-05, Critical) already backed the cyber→reputational cause path.
