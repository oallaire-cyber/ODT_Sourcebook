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
| [#CAN-01](#can-01) | CAN | BP-LEO `ebit_baseline`/`fcf_baseline` vs canon | Med | Partially Applied | FCF resolved by BP-GEO; EBIT-naming open |
| [#CAN-02](#can-02) | CAN | BP-GEO perimeter node missing | Med | Applied | — (2026-06-25) |
| [#CAN-03](#can-03) | CAN | Consolidated figures are LEO-only | Med | Open | Reconciled for FCF; re-check per new line |
| [#INC-01](#inc-01) | INC | GP1 `caused-by` was a software defect | Med | Applied | — (2026-06-18) |
| [#INC-02](#inc-02) | INC | GP1 `illustrates`: index vs entry | Low | Open | Decide RA-02 in/out |
| [#INC-03](#inc-03) | INC | SC1 reached apex only via objectives | Med | Applied | — (2026-06-26, INF-45 RH-02→RH-03) |
| [#INC-04](#inc-04) | INC | CapEx $77M (commitment) vs $72M (FY28 cash) | Low | Open | Confirm intent / keep distinction |
| [#DEC-01](#dec-01) | DEC | `cause_type` enum gaps | Low | Open | Schema decision |
| [#DEC-02](#dec-02) | DEC | STEWARD/BEAR owner layer not seeded | Low | Open | Seed now vs platform |
| [#DEC-03](#dec-03) | DEC | Bestiary families beyond the five | Low | Open | Roadmap |
| [#ENH-01](#enh-01) | ENH | `crisis_management_days` null everywhere | Low | Open | When canon defines |
| [#ENH-02](#enh-02) | ENH | Single placeholder SPICE assessment date | Low | Open | SPICE exercise calendar |
| [#ENH-03](#enh-03) | ENH | Deprecated `scenario` SC-01 ↔ BST-SC1 overlap | Low | Open | After U17 migration |
| [#ENH-04](#enh-04) | ENH | NMS / NOC / billing not distinct perimeter nodes | Low | Open | Enrich graph from §7 |
| [#ENH-05](#enh-05) | ENH | RC-02 / RC-03 don't reach the IPO apex (GA1/AURORA convergence proof) | Med | Applied | — (2026-06-26, via TCO-04) |
| [#ENH-06](#enh-06) | ENH | S1 control mitigations carry no cost (return-on-spend) | Low | Applied | — (2026-06-26, ~$4M + ~$1.5M capex) |

**Accepted by design** (logged so they are not "fixed"): [over-coverage MO-FN1-2 = 120%](#accepted-by-design) · [coverage gaps MO-GP1-2 / MO-FN1-3](#accepted-by-design) · [FN1 `ebit_impact = 0`](#accepted-by-design).

---

## Canon figures & structure (CAN)

### CAN-01
**BP-LEO `ebit_baseline` / `fcf_baseline` vs the Canon register.** `Sev Med · Partially Applied (2026-06-25)`
The `BP-LEO` perimeter carries `ebit_baseline: 45.0` and `fcf_baseline: -30.0`. But [[Canon & Figures Register]] State B gives **EBIT +$13M**, **EBITDA +$45M**, **FCF −$40M** — so the field named `ebit_baseline` holds the *EBITDA* number, and FCF (−30) didn't match canon (−40). The schema defines `ebit_baseline` as the **EBIT** target.
**FCF half — Applied (2026-06-25):** adding **BP-GEO** with `fcf_baseline −10.0` ([[#CAN-02]]) makes the perimeters sum to the canon consolidated **−40** (LEO −30 + GEO −10). FCF now reconciles; BP-LEO −30 is intentionally the LEO programme's share, not the company total.
**EBIT half — still open:** `ebit_baseline 45` on BP-LEO is EBITDA-level, not EBIT +13; BP-GEO is set to `0` (pre-revenue), so consolidated `ebit_baseline` = 45 (still EBITDA-shaped). Decide: rename intent (perimeter EBITDA, deliberately) or reset to true per-perimeter EBIT — and settle AURORA dev-opex expense-vs-capitalise so the EBIT lines consolidate. Tied to [[#CAN-03]].

### CAN-02
**BP-GEO perimeter node missing.** `Sev Med · Applied (2026-06-25)`
Schema, [[Data Dictionary]] and canon all reference **BP-GEO** as the second P&L perimeter, and the AURORA-GEO risks (`RA-01..05`) exist — but `demo_seed.cypher` had only `BP-LEO`.
**Applied (2026-06-25):** owner set the grounding figures (~$50M Phase-A/B budget, ~60% ESA/NASA / ~40% ODT, FY2028 ODT burn ~$10M). Pushed to [[Canon & Figures Register]] first (new "Programme (AURORA-GEO)" + "Business perimeters" sections), then added `BP-GEO` to `_inputs/workbook.yaml` (`ebit_baseline 0.0`, `fcf_baseline -10.0`, `currency USD_M`) and regenerated `demo_seed.cypher`. Detail in [[Annex - AURORA-GEO Programme]].
**Residual — Applied (2026-06-26):** the GEO SPICE family **BST-GA1** (AURORA-GEO Development Overrun & Co-Funding Shock) now exists, with its realistic case `ASSESSED_AGAINST` **BP-GEO** (+ MO-GA1-1/2/3, SM-AURORA-DERISK/VARIANCE). The static `spice_assessed` flag stays `false` in the seed **by convention** — it is platform-derived (schema: "set by F8 on scenario save"), exactly as BP-LEO carries `false` despite its 5 assessed scenarios. The structural edge is present, so F8/F36 will light up the coverage heatmap on load. See [[BST-GA1 AURORA-GEO Development Overrun (Programme)]].

### CAN-03
**Consolidated company figures are effectively LEO-only.** `Sev Med · Open (FCF reconciled 2026-06-25)`
Canon's State B P&L ($270M revenue, +$13M EBIT, −$40M FCF, etc.) is the consolidated company, but the graph modelled one perimeter (LEO). As AURORA-GEO ([[#CAN-02]]) and any further lines are added, the consolidated totals and per-perimeter splits must be reconciled so canon = sum of perimeters.
**Progress (2026-06-25):** with **BP-GEO** added, **FCF now reconciles** (LEO −30 + GEO −10 = canon −40); a "Business perimeters (P&L map)" table in [[Canon & Figures Register]] makes the consolidation explicit. **EBIT does not yet reconcile** (perimeter `ebit_baseline`s sum to EBITDA-level 45, not EBIT +13 — see [[#CAN-01]]); revenue is still 100% LEO (no GEO revenue, by design).
**Trigger:** each time a new business line/perimeter is added, re-reconcile against the Canon register; close once EBIT consolidation (CAN-01 EBIT half) is settled.

---

## Inconsistencies / data quality (INC)

### INC-01
**GP1 `caused-by` was a software defect.** `Sev Med · Applied (2026-06-18)`
`BST-GP1` (geopolitical export-control / launch) was scaffolded with `caused-by: [ROE-01]` (payload-software defect) — semantically wrong. **Applied:** re-pointed to `ROM-01` (RF sole-source supplier failure) + `ROL-01` (launch availability gap), which GP1's own narrative names. Changed in `workbook.yaml` and the GP1 entry; graph regenerated. Kept for audit.

### INC-02
**GP1 `illustrates`: index vs entry.** `Sev Low · Open`
[[Bestiary Index]] lists GP1 as illustrating **RH-04 / RA-02**; the entry and graph have **RH-04 only**. Decide whether RA-02 (AURORA budget overrun) should be added as a second `ILLUSTRATES` target — sensible given GP1's launch-slip effect on AURORA, but pending [[#CAN-02]].

### INC-03
**SC1 reached the apex only through the objective hierarchy.** `Sev Med · Applied (2026-06-26)`
**Applied:** added `INFLUENCES` **RH-02 → RH-03** (INF-45, Strong, conf 0.8) — "suspect/degraded on-orbit capacity forces replacement units and erodes the corporate revenue target." SC1 (illustrates RH-02) now reaches the apex via **RH-02 → RH-03 → RC-01 → `IMPACTS_TCO` TCO-04** (and → RC-02 → TCO-04). SC1's narrative is now literal in the influence graph, and **all 6 families provably reach TCO-04**. SC1's bestiary entry updated to declare the influence. Kept for audit:
`BST-SC1` illustrates **RH-02** (on-orbit degradation), which has **no outgoing `INFLUENCES`**. So SC1 converges on TCO-01 via RH-02 → `IMPACTS_TPO` → TPO-02 → `CONTRIBUTES_TO` → TCO-01 — *not* through risk→risk influence to the company financial risks. SC1's narrative ("Phase-4 slip → revenue miss → IPO") is therefore not literally represented in the influence graph.
**Recommendation:** add `INFLUENCES` RH-02 → RH-03 ("degraded/suspect capacity forces replacement units and shifts revenue"), **or** re-point SC1 to RH-01 (schedule). Both are canonical graph changes — left for the owner.
**Update (2026-06-26):** the convergence apex is now **TCO-04 (IPO)** ([[#ENH-05]]). SC1's RH-02 reaches TCO-01 (EBITDA) via the TPO hierarchy but **does not reach TCO-04** by any path — so SC1 shows `ReachesIPO = false` in the convergence-proof query until the RH-02 edge above is added. Same fix, now also needed for the IPO apex.

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

### ENH-05
**RC-02 / RC-03 don't reach the apex objective — AURORA (GA1) convergence not provable by the automated query.** `Sev Med · Applied (2026-06-26)`
**Applied — via a new objective, not an edge:** the owner added **TCO-04 "Achieve a successful IPO / liquidity event by H1 2029"** (owner CEO) as the convergence apex, and wired the whole financial-risk cluster to it: `IMPACTS_TCO` **RC-01→TCO-04 (IMC-04), RC-02→TCO-04 (IMC-05), RC-03→TCO-04 (IMC-06)**, plus `CONTRIBUTES_TO` **TPO-01→TCO-04 (CTR-07)**. Now GA1 (RA-02 → RC-02 → TCO-04) and FN1 (RC-01/02/03 → TCO-04) both provably reach the IPO objective, and the RC-03 dead-end is closed. The convergence-proof query and the Rule-4 / bestiary-thesis / Influence-Map text were repointed from TCO-01 (EBITDA) to **TCO-04 (IPO)**; TCO-01 remains as the IPO's headline enabler. This also reframes the prior issue correctly — the apex was never EBITDA, it was the IPO. Canon-first: figures/structure into [[Canon & Figures Register]] first, then workbook, then regenerated.
**Original observation (kept for audit):**
The "convergence proof" verification query (`generate_seed.py` VERIFY) checks each SPICE family illustrates a risk that reaches **TCO-01** via `INFLUENCES*0..4` → `IMPACTS_TCO`. **BST-GA1** illustrates **RA-02**, whose chain is `RA-02 →INF-29→ RC-02 →INF-25→ RC-03` — and **neither RC-02 (cash runway) nor RC-03 (investor confidence) has an `IMPACTS_TCO` edge**, so the chain dead-ends before TCO-01. (This is a **pre-existing** company-graph gap: it already shows for FN1's RC-02/RC-03 rows; FN1 only passes via RC-01.) GA1's convergence on the **FN1 financial sink** is structurally real (RA-02 → RC-02; FN1 illustrates RC-02), but the **TCO-01** leg isn't.
**Recommendation (owner — canonical graph change, cf. [[#INC-03]]):** add **one** edge to close the financial cluster — either `INFLUENCES` **RC-02 → RC-01** ("cash-runway pressure forces distressed actions / covenant breach that derail the EBITDA-positive milestone"; RC-01's own description already names covenant breach), or `IMPACTS_TCO` **RC-02 → TCO-01** ("cash exhaustion threatens *sustaining* positive EBITDA"). Either makes RA-02 (and FN1's RC-02/RC-03) reach TCO-01, and also closes the **RC-03 dead-end**.

### ENH-06
**S1 control mitigations carry no cost — the "return-on-spend" leg is one-sided.** `Sev Low · Applied (2026-06-26)`
Building [[THE NUMBER - Season 2 (mitigation)]] (a *return-on-spend* season) surfaced that the two real S1 controls — **SM-IDENTITY-SPLIT** (Denver/Dublin PAM split) and **SM-CTRL-RECOVERY** (clean control-plane recovery) — had **no cost** in the workbook (by the standing rule: cost is populated only where the Canon register states a figure). The *avoided loss* side was fully canonical (S1 case deltas, −$100M trigger, $50M insurance limit) but the *spend* side was not.
**Applied (2026-06-26):** owner set order-of-magnitude one-time capex — **SM-IDENTITY-SPLIT `cost_capex 4.0`** (~$4M) and **SM-CTRL-RECOVERY `cost_capex 1.5`** (~$1.5M), USD_M. Canon-first: new "Mitigation costs — S1 cyber controls" table in [[Canon & Figures Register]], then `_inputs/workbook.yaml`, then regenerated `demo_seed.cypher` (3468 lines). The **~$5.5M portfolio vs the −$69M realistic / −$118M FCF pessimistic tail** makes S2's return ratio (~12×) and the SPICE cost/benefit heatmap quantitative. S2 governance note updated.

---

## Accepted by design
*Logged so a future pass does not "fix" them — they are intentional teaching points.*

- **Over-coverage MO-FN1-2 = 120%** (SM-CYBER-INS 80% + SM-BRIDGE-FACILITY 40%). Demonstrates RIM surfacing >100% declared contribution as over-coverage, not an error.
- **Coverage gaps: MO-GP1-2** (export-control compliance posture), **MO-FN1-3** (IPO-file disclosure) and **MO-GA1-3** (ESA/NASA co-funding continuity / partner commitment) have no `FULFILS`. These are governance/relationship objectives you don't buy a control for — they show RIM flagging an unmitigated objective.
- **FN1 `ebit_impact = 0`.** FN1's loss is FCF/dilution (−60 / −100 / −140), not operating EBIT; the `hypothesis` field records why. The realistic −$100M case sits exactly on the canon liquidity trigger.

---

## Changelog
- 2026-06-26: **ENH-06 Applied** — owner priced the two S1 controls (SM-IDENTITY-SPLIT ~$4M, SM-CTRL-RECOVERY ~$1.5M, `cost_capex`, USD_M). Canon-first → workbook → regenerated seed (3468 lines). S2 return-on-spend now quantitative (~$5.5M vs −$69M/−$118M tail).
- 2026-06-26: **+ENH-06** — S1 control mitigations (SM-IDENTITY-SPLIT / SM-CTRL-RECOVERY) carry no cost; raised while building [[THE NUMBER - Season 2 (mitigation)]] so the return-on-spend ratio can be made quantitative once the owner prices them.
- 2026-06-26: **INC-03 Applied** — added INFLUENCES RH-02→RH-03 (INF-45); SC1 now reaches the TCO-04 apex via the risk graph. All 6 families provably converge. SC1 bestiary entry + Data Dictionary updated. Regenerated seed (3466 lines, 124 relationships).
- 2026-06-26: **TCO-04 (IPO) added as convergence apex** — owner's call to fix ENH-05 structurally rather than by an edge. New TCO-04 (owner CEO, H1 2029); RC-01/02/03 `IMPACTS_TCO`→TCO-04 (IMC-04/05/06), TPO-01 `CONTRIBUTES_TO`→TCO-04 (CTR-07). Convergence-proof query + Rule 4 + Bestiary Index + Influence Map + FN1/GA1 entries + AURORA annex repointed TCO-01→TCO-04. **ENH-05 Applied.** Regenerated seed (3456 lines, 123 relationships).
- 2026-06-26: **GEO SPICE case built** — family **BST-GA1** assessed against BP-GEO (closes the CAN-02 residual); bestiary entry + index + FN1 influenced-by updated. +**ENH-05** (RC-02/RC-03 don't reach TCO-01 — AURORA convergence proof needs one owner edge). MO-GA1-3 added to accepted-by-design coverage gaps.
- 2026-06-25: **CAN-02 Applied** — BP-GEO perimeter node added (owner figures: ~$50M budget, ~60/40 ESA-NASA/ODT split, FY28 burn ~$10M; canon-first → workbook → regenerated seed). **CAN-01** FCF half resolved (LEO −30 + GEO −10 = −40), EBIT half still open. **CAN-03** FCF reconciled; EBIT/revenue consolidation still pending. See [[Annex - AURORA-GEO Programme]].
- 2026-06-18: +INC-04 (CapEx 77/72) and +ENH-04 (missing perimeter nodes), raised while porting Context v2.2 into the Finance & Security annexes.
- 2026-06-18: register created; seeded with 12 tickets + 3 accepted-by-design items from the workbook-pipeline and SPICE-layer work.
