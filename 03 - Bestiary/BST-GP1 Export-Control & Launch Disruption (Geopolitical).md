---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-GP1
scenario-family-id: a1e6b2c0-1f47-4c8e-9b21-000000000004
family: geopolitical
cause-type: geopolitical
illustrates: [RH-01, RA-05]
caused-by: [ROM-01, ROL-01]
assessed-against: BP-LEO
validated: business
tags: [bestiary, bestiary/geopolitical, status/new]
---
# 👹 BST-GP1 — Export-Control Tightening & Launch Disruption
**Family:** geopolitical · **Cause-type (schema):** `geopolitical` · **Assessed against:** `BP-LEO` · **Illustrates:** RH-01, RA-05

## Sponsor / cause
No sponsor — a **shift in the geopolitical environment**: ITAR/EAR tightening, sanctions, an allied-launcher dispute, or a supplier's home-state restriction.

## Business objective (consequence, not technique)
**Cut or constrain access** to critical RF components, launch slots, or international partners — slowing deployment and raising cost of capital, without anyone attacking ODT.

## One plausible path (last steps)
An export-control change or sanction restricts a **tier-1 RF supplier** (Teledyne/Saft class) or a **launch partner**; committed 2025–2029 launch slots slip; data-handling constraints disrupt the shared PLM. Phase 4 stalls.

## Detection
Policy signals precede the event (consultations, watchlists) — the **most forecastable** family, but the slowest to mitigate.

## Three cases (→ P10 / P50 / P90)
| Case | EBIT y1 | EBIT y2 | EBIT y3 | EBIT total | FCF y1 | Op recovery | Fin recovery |
|---|---|---|---|---|---|---|---|
| **Best** (P10) | −9 | −3 | — | **−12** | −14 | n/a | 1 yr |
| **Realistic** (P50) | −22 | −8 | — | **−30** | −34 | n/a | 2 yrs |
| **Pessimistic** (P90) | −40 | −15 | — | **−55** | −62 | n/a | 3 yrs |

## Mitigation objectives (`ADDRESSES`)
- **Dual-source** RF components (MIT-02 class) & multi-launcher strategy
- Export-control **compliance & scenario monitoring**
- Geographic supplier diversification

## 🔗 Interconnection (why it lives in a graph)
GP1 is **upstream of three families** — it influences supply-chain (SC1), regulatory (RG1) and financing (FN1). It is the clearest case that *causes propagate across domains*: a policy change with no attacker still lands on the IPO. The root of the convergence web in [[Bestiary Index]].

**Influences:**
- [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] — Strong (supplier access disruption)
- [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]] — Moderate (regime tightening)
- [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — Moderate (schedule slip → revenue miss)

**Influenced by:**
- (none)

## Graph anchoring
`CAUSED_BY` → ROM-01, ROL-01 · `ILLUSTRATES` → RH-01, RA-05 · `ASSESSED_AGAINST` → BP-LEO. GP1's two halves now map to the risks its own narrative names: **launch disruption → RH-01** (Phase-3 schedule delay) and **export-control tightening → RA-05** (ITAR blocking partnerships). LEO path to the apex: **RH-01 → RC-01 (INF-21) → `IMPACTS_TCO` [[Canon & Figures Register|TCO-04]]** (IMC-04). Cross-perimeter reach to AURORA's budget is preserved *indirectly*: **RA-05 → RA-04 (INF-31) → RA-02 (INF-47) → RC-02 → TCO-04** (IMC-05). See [[Annex - RIM Anchoring]] · [[Data Dictionary]].
> [!note] Changelog
> - 2026-06-30 (supersedes INC-02): `ILLUSTRATES` re-pointed **[RH-04, RA-02] → [RH-01, RA-05]**. The prior targets were both indirect — RH-04 is a market-structure risk and RA-02 a *downstream* budget consequence — leaving the obvious launch-disruption risk (RH-01) and export-control risk (RA-05) unillustrated. The corrected links match GP1's own two-part narrative; AURORA budget (RA-02) stays reachable indirectly via **RA-05 → RA-04 → RA-02 → RC-02 → FN1**, so cross-perimeter reach is retained, not lost.
> - 2026-06-26 (INC-02 Applied — *now superseded by the 2026-06-30 correction above*): added **RA-02** (AURORA budget overrun) as a second `ILLUSTRATES` target — a launch/export-control disruption slips AURORA and pressures its budget, giving GP1 **cross-perimeter reach** (RA-02 → RC-02 → FN1, into the GEO perimeter) and aligning this entry + the graph with the [[Bestiary Index]]. Closes the index-vs-entry mismatch.
> - 2026-06-18 (scaffold correction): `caused-by` was `ROE-01` (a payload-software defect) — semantically wrong for a geopolitical/supplier scenario. Re-pointed to **ROM-01** (RF sole-source supplier failure) + **ROL-01** (launch availability gap), which GP1's own narrative names.
