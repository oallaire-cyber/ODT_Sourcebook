---
type: canon
sourcebook-line: "00 - Index & Canon"
status: active
tags: [canon, governance, change-control, status/active]
aliases: ["Change Register", "Issue Register", "Demo Data CCB", "CCB Log"]
---
# 🗂️ Canon Change & Issue Register

> [!important] What this is
> The **change-control board (CCB) log** for canon and demo data. Every figure to revisit, inconsistency to fix, modelling decision to make, and improvement to consider is logged here as a ticket — so nothing is lost and nothing is silently "corrected."
>
> **Operating model — "business as in real life":** once all product lines are initialised, we work this register the way the fictional ODT works its own risk register — triage, decide, apply, close. The dataset becomes a *managed asset with a change history*, which is itself part of the demo's story.

## Operating rules
1. **Canon-first (Rule 1).** A number never changes in a note or the graph directly. It changes in [[Canon & Figures Register]] **first**, then the workbook is edited and `demo_seed.cypher` is **regenerated** ([[Data Dictionary]] → pipeline).
2. **Log, don't bury.** Found an inconsistency mid-task? Add a ticket here and keep moving; don't silently patch canon.
3. **Nothing is "wrong" until triaged.** Items are raised as observations. The owner decides intent (fix / accept-by-design / defer).
4. **Audit trail.** Applied changes stay in the register (status `Applied`) with the date — the demo keeps its own change history.

## Status legend
`Open` (raised, awaiting triage) · `Triaged` (understood, decision pending) · `Decided` (direction set, not yet applied) · `Applied` (done; kept for audit) · `Deferred` (parked, with a trigger) · `Accepted` (intentional; do not "fix").

**Types:** `CAN` canon figure/structure · `INC` inconsistency / data quality · `DEC` open decision / policy · `ENH` improvement / enhancement.

---

## Summary

| ID | Type | Title | Sev | Status | Trigger / next |
|---|---|---|---|---|---|
| [#CAN-01](#can-01) | CAN | BP-LEO `ebit_baseline`/`fcf_baseline` vs canon | Med | Deferred | After AURORA-GEO + other lines land |
| [#CAN-02](#can-02) | CAN | BP-GEO perimeter node missing | Med | Open | Backlog #4 (AURORA-GEO) |
| [#CAN-03](#can-03) | CAN | Consolidated figures are LEO-only | Med | Open | As lines are added |
| [#INC-01](#inc-01) | INC | GP1 `caused-by` was a software defect | Med | Applied | — (2026-06-18) |
| [#INC-02](#inc-02) | INC | GP1 `illustrates`: index vs entry | Low | Open | Decide RA-02 in/out |
| [#INC-03](#inc-03) | INC | SC1 reaches TCO-01 only via objectives | Med | Open | Decide add INFLUENCES edge |
| [#INC-04](#inc-04) | INC | CapEx $77M (commitment) vs $72M (FY28 cash) | Low | Open | Confirm intent / keep distinction |
| [#DEC-01](#dec-01) | DEC | `cause_type` enum gaps | Low | Open | Schema decision |
| [#DEC-02](#dec-02) | DEC | STEWARD/BEAR owner layer not seeded | Low | Open | Seed now vs platform |
| [#DEC-03](#dec-03) | DEC | Bestiary families beyond the five | Low | Open | Roadmap |
| [#ENH-01](#enh-01) | ENH | `crisis_management_days` null everywhere | Low | Open | When canon defines |
| [#ENH-02](#enh-02) | ENH | Single placeholder SPICE assessment date | Low | Open | SPICE exercise calendar |
| [#ENH-03](#enh-03) | ENH | Deprecated `scenario` SC-01 ↔ BST-SC1 overlap | Low | Open | After U17 migration |
| [#ENH-04](#enh-04) | ENH | NMS / NOC / billing not distinct perimeter nodes | Low | Open | Enrich graph from §7 |

**Accepted by design** (logged so they are not "fixed"): [over-coverage MO-FN1-2 = 120%](#accepted-by-design) · [coverage gaps MO-GP1-2 / MO-FN1-3](#accepted-by-design) · [FN1 `ebit_impact = 0`](#accepted-by-design).

---

## Canon figures & structure (CAN)

### CAN-01
**BP-LEO `ebit_baseline` / `fcf_baseline` vs the Canon register.** `Sev Med · Deferred`
The `BP-LEO` perimeter carries `ebit_baseline: 45.0` and `fcf_baseline: -30.0`. But [[Canon & Figures Register]] State B gives **EBIT +$13M**, **EBITDA +$45M**, **FCF −$40M** — so the field named `ebit_baseline` holds the *EBITDA* number, and FCF (−30) doesn't match canon (−40). The schema defines `ebit_baseline` as the **EBIT** target.
**Why deferred:** BP-LEO is the *LEO programme* perimeter, not the whole company; its baselines needn't equal company-level canon, and the consolidated picture will shift once AURORA-GEO and other lines have figures ([[#CAN-03]]). Owner chose to revisit then.
**Recommendation when triaged:** either rename intent (programme EBITDA, deliberately) or reset to the EBIT/FCF the LEO perimeter should bear, decided alongside consolidation.

### CAN-02
**BP-GEO perimeter node missing.** `Sev Med · Open`
Schema, [[Data Dictionary]] and canon all reference **BP-GEO** as the second P&L perimeter, and the AURORA-GEO risks (`RA-01..05`) exist — but `demo_seed.cypher` has only `BP-LEO`. No GEO perimeter node, no GEO `ebit_baseline`/`fcf_baseline`, no GEO-assessed SPICE scenarios.
**Linked to:** backlog #4 (flesh AURORA-GEO to second-perimeter depth).

### CAN-03
**Consolidated company figures are effectively LEO-only.** `Sev Med · Open`
Canon's State B P&L ($270M revenue, +$13M EBIT, −$40M FCF, etc.) is the consolidated company, but the graph currently models one perimeter (LEO). As AURORA-GEO ([[#CAN-02]]) and any further lines are added, the consolidated totals and per-perimeter splits must be reconciled so canon = sum of perimeters.
**Trigger:** each time a new business line/perimeter is added, re-reconcile against the Canon register.

---

## Inconsistencies / data quality (INC)

### INC-01
**GP1 `caused-by` was a software defect.** `Sev Med · Applied (2026-06-18)`
`BST-GP1` (geopolitical export-control / launch) was scaffolded with `caused-by: [ROE-01]` (payload-software defect) — semantically wrong. **Applied:** re-pointed to `ROM-01` (RF sole-source supplier failure) + `ROL-01` (launch availability gap), which GP1's own narrative names. Changed in `workbook.yaml` and the GP1 entry; graph regenerated. Kept for audit.

### INC-02
**GP1 `illustrates`: index vs entry.** `Sev Low · Open`
[[Bestiary Index]] lists GP1 as illustrating **RH-04 / RA-02**; the entry and graph have **RH-04 only**. Decide whether RA-02 (AURORA budget overrun) should be added as a second `ILLUSTRATES` target — sensible given GP1's launch-slip effect on AURORA, but pending [[#CAN-02]].

### INC-03
**SC1 reaches TCO-01 only through the objective hierarchy.** `Sev Med · Open`
`BST-SC1` illustrates **RH-02** (on-orbit degradation), which has **no outgoing `INFLUENCES`**. So SC1 converges on TCO-01 via RH-02 → `IMPACTS_TPO` → TPO-02 → `CONTRIBUTES_TO` → TCO-01 — *not* through risk→risk influence to the company financial risks. SC1's narrative ("Phase-4 slip → revenue miss → IPO") is therefore not literally represented in the influence graph.
**Recommendation:** add `INFLUENCES` RH-02 → RH-03 ("degraded/suspect capacity forces replacement units and shifts revenue"), **or** re-point SC1 to RH-01 (schedule). Both are canonical graph changes — left for the owner.

### INC-04
**CapEx $77M vs $72M.** `Sev Low · Open`
Context v2.2 states Phase-4 CapEx as **$77.0M** in the FY2028 P&L (§4.2) but **$72.0M** in the cash-flow statement (§4.6). Reconciliation: $77M = total Phase-4 *commitment* (programme budget Phase-4 line = $76.9M ≈ 77); $72M = the portion hitting *FY2028 cash*. Both carried in [[Canon & Figures Register]] with the distinction noted. Confirm this is the intended reading (commitment vs cash timing) and not a drafting slip.

---

## Open decisions / policy (DEC)

### DEC-01
**`cause_type` enum gaps.** `Sev Low · Open`
Schema enum = `security | climate | hazard | geopolitical | other`; it has no `regulatory` / `supply-chain` / `financial`. Current convention: use `other` + the markdown `family` tag (RG1 & FN1 = `other`, SC1 = `security`). Decide: extend the schema enum, or keep the tag convention.

### DEC-02
**STEWARD / BEAR owner layer not seeded.** `Sev Low · Open`
The mitigation-objective + SPICE layer is now seeded, but the owner accountability edges (`BEARS` owner→risk, `STEWARDS` owner→mitigation) defined in schema are still absent from the seed. Decide: seed now (ahead of the platform) or wait.
**Input now available:** the cast sheets ([[Cast Roster]]) define the intended owner→risk/mitigation mapping by role-title. Seeding will require (a) `owner` context nodes per named character, and (b) reconciling **one-bearer-per-risk** conflicts — e.g. RH-02 is owned by "VP Engineering" ([[Priya Nair (VP Engineering)|Priya]]) in the workbook, but [[Sofia Adler (VP Ground & Operations)|Sofia]]'s sheet also claims to bear it. Decide cause-owner vs consequence-bearer per risk.

### DEC-03
**Bestiary families beyond the five.** `Sev Low · Open`
Expansion candidates: climate, hazard (debris/collision), HR/key-person. Decide order and whether any are needed for the demo narrative.

---

## Improvements / enhancements (ENH)

### ENH-01
**`crisis_management_days` is null on every SpiceScenario.** `Sev Low · Open`
Left null because canon gives no acute-crisis durations (only op-recovery weeks and fin-recovery years, which *are* populated). Add when canon defines a crisis-management phase.

### ENH-02
**Single placeholder SPICE assessment date.** `Sev Low · Open`
All 5 families use `assessment_date: 2028-02-15`. Vary per family when a SPICE-exercise calendar is established (also feeds `exercise_date` / `exercise_version`).

### ENH-03
**Deprecated `scenario` SC-01 overlaps BST-SC1.** `Sev Low · Open`
The deprecated `scenario` context node `SC-01` (in the cyber kill-chain) conceptually overlaps the new `BST-SC1` `SpiceScenario`. Retained during the schema migration window; remove `SC-01` after the U17 Cypher migration runs.

### ENH-04
**NMS / NOC mission-control / billing-provisioning are not distinct `technical_perimeter` nodes.** `Sev Low · Open`
[[Annex - Security Architecture]] §7 (Context v2.2) describes several control-plane assets — NOC mission-control/TT&C, the network management system (NMS, "the commercial brain"), the ground gateways, and the billing/provisioning platform — but only `TP-PLM` exists as a `technical_perimeter` in the seed. Enrich the workbook with these nodes (and `OCCURS_AT` edges from the relevant SPICE scenarios, e.g. S1 → NOC) so the architecture annex maps 1:1 to the graph.

---

## Accepted by design
*Logged so a future pass does not "fix" them — they are intentional teaching points.*

- **Over-coverage MO-FN1-2 = 120%** (SM-CYBER-INS 80% + SM-BRIDGE-FACILITY 40%). Demonstrates RIM surfacing >100% declared contribution as over-coverage, not an error.
- **Coverage gaps: MO-GP1-2** (export-control compliance posture) and **MO-FN1-3** (IPO-file disclosure) have no `FULFILS`. These are governance/disclosure objectives you don't buy a control for — they show RIM flagging an unmitigated objective.
- **FN1 `ebit_impact = 0`.** FN1's loss is FCF/dilution (−60 / −100 / −140), not operating EBIT; the `hypothesis` field records why. The realistic −$100M case sits exactly on the canon liquidity trigger.

---

## Changelog
- 2026-06-18: +INC-04 (CapEx 77/72) and +ENH-04 (missing perimeter nodes), raised while porting Context v2.2 into the Finance & Security annexes.
- 2026-06-18: register created; seeded with 12 tickets + 3 accepted-by-design items from the workbook-pipeline and SPICE-layer work.
