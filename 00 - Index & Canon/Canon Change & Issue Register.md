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
| [#CAN-01](#can-01) | CAN | BP-LEO `ebit_baseline`/`fcf_baseline` vs canon | Med | Applied | — (2026-06-26; capitalise → BP-LEO EBIT 13) |
| [#CAN-02](#can-02) | CAN | BP-GEO perimeter node missing | Med | Applied | — (2026-06-25) |
| [#CAN-03](#can-03) | CAN | Consolidated figures are LEO-only | Med | Applied | — (2026-06-26; EBIT+FCF reconcile; re-check per new perimeter) |
| [#INC-01](#inc-01) | INC | GP1 `caused-by` was a software defect | Med | Applied | — (2026-06-18) |
| [#INC-02](#inc-02) | INC | GP1 `illustrates`: index vs entry | Low | Applied | — (2026-06-26; RA-02 added) |
| [#INC-03](#inc-03) | INC | SC1 reached apex only via objectives | Med | Applied | — (2026-06-26, INF-45 RH-02→RH-03) |
| [#INC-04](#inc-04) | INC | CapEx $77M (commitment) vs $72M (FY28 cash) | Low | Open | Confirm intent / keep distinction |
| [#INC-05](#inc-05) | INC | Contingent activation dates (2026) predate State B (2028) | Low | Open | Reconcile date axis / SPICE calendar |
| [#DEC-01](#dec-01) | DEC | `cause_type` enum gaps | Low | Accepted | Keep `other` + family tag (Rule 2) |
| [#DEC-02](#dec-02) | DEC | STEWARD/BEAR owner layer not seeded | Low | Applied | — (2026-06-28; 18 owners, 50 BEARS, 33 STEWARDS) |
| [#DEC-03](#dec-03) | DEC | Bestiary families beyond the five | Low | Open | Roadmap |
| [#ENH-01](#enh-01) | ENH | `crisis_management_days` null everywhere | Low | Open | When canon defines |
| [#ENH-02](#enh-02) | ENH | Single placeholder SPICE assessment date | Low | Open | SPICE exercise calendar |
| [#ENH-03](#enh-03) | ENH | Deprecated `scenario` SC-01 ↔ BST-SC1 overlap | Low | Open | After U17 migration |
| [#ENH-04](#enh-04) | ENH | NMS / NOC / billing not distinct perimeter nodes | Low | **Applied 2026-06-29 (W6)** | 4 new perimeters + S1 kill-chain |
| [#ENH-05](#enh-05) | ENH | RC-02 / RC-03 don't reach the IPO apex (GA1/AURORA convergence proof) | Med | Applied | — (2026-06-26, via TCO-04) |
| [#ENH-06](#enh-06) | ENH | S1 control mitigations carry no cost (return-on-spend) | Low | Applied | — (2026-06-26, ~$4M + ~$1.5M capex) |
| [#ENH-07](#enh-07) | ENH | RH-06 / RA-04 thread to no objective (W1 completeness) | Low | Applied | — (2026-06-28, INF-46/INF-47) |

**Accepted by design** (logged so they are not "fixed"): [over-coverage MO-FN1-2 = 120%](#accepted-by-design) · [coverage gaps MO-GP1-2 / MO-FN1-3](#accepted-by-design) · [FN1 `ebit_impact = 0`](#accepted-by-design) · [`cause_type` = `other` for regulatory/supply-chain/financial (DEC-01)](#accepted-by-design).

---

## Canon figures & structure (CAN)

### CAN-01
**BP-LEO `ebit_baseline` / `fcf_baseline` vs the Canon register.** `Sev Med · Applied (2026-06-26)`
The `BP-LEO` perimeter carried `ebit_baseline: 45.0` and `fcf_baseline: -30.0`. But [[Canon & Figures Register]] State B gives **EBIT +$13M**, **EBITDA +$45M**, **FCF −$40M** — so the field named `ebit_baseline` held the *EBITDA* number, and FCF (−30) didn't match canon (−40). The schema defines `ebit_baseline` as the **EBIT** target.
**FCF half — Applied (2026-06-25):** adding **BP-GEO** with `fcf_baseline −10.0` ([[#CAN-02]]) makes the perimeters sum to the canon consolidated **−40** (LEO −30 + GEO −10). FCF reconciles; BP-LEO −30 is intentionally the LEO programme's share, not the company total.
**EBIT half — Applied (2026-06-26):** owner decision — treat AURORA-GEO's FY2028 dev-spend as **capitalised** (it hits FCF, not EBIT), so BP-GEO stays `ebit_baseline 0` (pre-revenue) and **BP-LEO's `ebit_baseline` is reset 45 → 13.0** to hold the *true* EBIT. Consolidated EBIT now = LEO 13 + GEO 0 = **+13** ✔, and the baseline is in the same unit as the EBIT-denominated SPICE case deltas. Canon-first: [[Canon & Figures Register]] "Business perimeters" table + reconciliation note updated, then `_inputs/workbook.yaml` (BP-LEO `ebit_baseline 13.0`), then regenerated `demo_seed.cypher` (3470 lines). Closes [[#CAN-03]] EBIT leg.

### CAN-02
**BP-GEO perimeter node missing.** `Sev Med · Applied (2026-06-25)`
Schema, [[Data Dictionary]] and canon all reference **BP-GEO** as the second P&L perimeter, and the AURORA-GEO risks (`RA-01..05`) exist — but `demo_seed.cypher` had only `BP-LEO`.
**Applied (2026-06-25):** owner set the grounding figures (~$50M Phase-A/B budget, ~60% ESA/NASA / ~40% ODT, FY2028 ODT burn ~$10M). Pushed to [[Canon & Figures Register]] first (new "Programme (AURORA-GEO)" + "Business perimeters" sections), then added `BP-GEO` to `_inputs/workbook.yaml` (`ebit_baseline 0.0`, `fcf_baseline -10.0`, `currency USD_M`) and regenerated `demo_seed.cypher`. Detail in [[Annex - AURORA-GEO Programme]].
**Residual — Applied (2026-06-26):** the GEO SPICE family **BST-GA1** (AURORA-GEO Development Overrun & Co-Funding Shock) now exists, with its realistic case `ASSESSED_AGAINST` **BP-GEO** (+ MO-GA1-1/2/3, SM-AURORA-DERISK/VARIANCE). The static `spice_assessed` flag stays `false` in the seed **by convention** — it is platform-derived (schema: "set by F8 on scenario save"), exactly as BP-LEO carries `false` despite its 5 assessed scenarios. The structural edge is present, so F8/F36 will light up the coverage heatmap on load. See [[BST-GA1 AURORA-GEO Development Overrun (Programme)]].

### CAN-03
**Consolidated company figures are effectively LEO-only.** `Sev Med · Applied (2026-06-26)`
Canon's State B P&L ($270M revenue, +$13M EBIT, −$40M FCF, etc.) is the consolidated company, but the graph originally modelled one perimeter (LEO). As AURORA-GEO ([[#CAN-02]]) and any further lines are added, the consolidated totals and per-perimeter splits must be reconciled so canon = sum of perimeters.
**Applied (2026-06-26):** with **BP-GEO** added (2025-06-25, FCF leg) and the EBIT leg settled via [[#CAN-01]] (capitalise → BP-LEO 13 / BP-GEO 0), **both EBIT and FCF now reconcile** as the sum of perimeters: EBIT 13 + 0 = **+13** ✔, FCF −30 + −10 = **−40** ✔. The "Business perimeters (P&L map)" table in [[Canon & Figures Register]] is the explicit consolidation. **Revenue is 100% LEO by design** (GEO is pre-revenue) — not a gap.
**Standing trigger (kept):** each time a *new* business line/perimeter is added, re-reconcile against the Canon register and re-open if it doesn't sum.

---

## Inconsistencies / data quality (INC)

### INC-01
**GP1 `caused-by` was a software defect.** `Sev Med · Applied (2026-06-18)`
`BST-GP1` (geopolitical export-control / launch) was scaffolded with `caused-by: [ROE-01]` (payload-software defect) — semantically wrong. **Applied:** re-pointed to `ROM-01` (RF sole-source supplier failure) + `ROL-01` (launch availability gap), which GP1's own narrative names. Changed in `workbook.yaml` and the GP1 entry; graph regenerated. Kept for audit.

### INC-02
**GP1 `illustrates`: index vs entry.** `Sev Low · Applied (2026-06-26)`
[[Bestiary Index]] listed GP1 as illustrating **RH-04 / RA-02**; the entry and graph had **RH-04 only**.
**Applied (2026-06-26):** owner decision — **add RA-02** (AURORA budget overrun) as a second `ILLUSTRATES` target. A launch / export-control disruption slips AURORA and pressures its budget, so GP1 now also illustrates the GEO-perimeter risk, giving it **cross-perimeter reach** (RA-02 → RC-02 → FN1). `_inputs/workbook.yaml` GP1 `illustrates: [RH-04, RA-02]` → regenerated seed (new edge `ILL-BST-GP1-RA-02`; 73 spice edges). GP1 entry frontmatter/header/anchoring updated; index and entry now agree.

### INC-03
**SC1 reached the apex only through the objective hierarchy.** `Sev Med · Applied (2026-06-26)`
**Applied:** added `INFLUENCES` **RH-02 → RH-03** (INF-45, Strong, conf 0.8) — "suspect/degraded on-orbit capacity forces replacement units and erodes the corporate revenue target." SC1 (illustrates RH-02) now reaches the apex via **RH-02 → RH-03 → RC-01 → `IMPACTS_TCO` TCO-04** (and → RC-02 → TCO-04). SC1's narrative is now literal in the influence graph, and **all 6 families provably reach TCO-04**. SC1's bestiary entry updated to declare the influence. Kept for audit:
`BST-SC1` illustrates **RH-02** (on-orbit degradation), which has **no outgoing `INFLUENCES`**. So SC1 converges on TCO-01 via RH-02 → `IMPACTS_TPO` → TPO-02 → `CONTRIBUTES_TO` → TCO-01 — *not* through risk→risk influence to the company financial risks. SC1's narrative ("Phase-4 slip → revenue miss → IPO") is therefore not literally represented in the influence graph.
**Recommendation:** add `INFLUENCES` RH-02 → RH-03 ("degraded/suspect capacity forces replacement units and shifts revenue"), **or** re-point SC1 to RH-01 (schedule). Both are canonical graph changes — left for the owner.
**Update (2026-06-26):** the convergence apex is now **TCO-04 (IPO)** ([[#ENH-05]]). SC1's RH-02 reaches TCO-01 (EBITDA) via the TPO hierarchy but **does not reach TCO-04** by any path — so SC1 shows `ReachesIPO = false` in the convergence-proof query until the RH-02 edge above is added. Same fix, now also needed for the IPO apex.

### INC-04
**CapEx $77M vs $72M.** `Sev Low · Open`
Context v2.2 states Phase-4 CapEx as **$77.0M** in the FY2028 P&L (§4.2) but **$72.0M** in the cash-flow statement (§4.6). Reconciliation: $77M = total Phase-4 *commitment* (programme budget Phase-4 line = $76.9M ≈ 77); $72M = the portion hitting *FY2028 cash*. Both carried in [[Canon & Figures Register]] with the distinction noted. Confirm this is the intended reading (commitment vs cash timing) and not a drafting slip.

### INC-05
**Contingent-risk activation dates predate the canonical reporting position.** `Sev Low · Open`
Raised 2026-06-28 while writing the [[ODT Risk Status & Executive Decision Brief - 2026-06-28|risk-manager brief]]. The two Contingent risks carry `activation_decision_date` values in **2026** — RH-06 (ground-segment capacity) **2026-06-30**, RA-04 (AURORA partner withdrawal) **2026-12-31** — but the canonical demo "present" is **State B = Jun 2028** (Operator phase). A reader at State B would see both decision dates already in the past. Related to the single placeholder SPICE `assessment_date 2028-02-15` ([[#ENH-02]]).
**Options:** (a) shift the activation dates into the State-B timeline (e.g. H2 2028 / 2029); (b) define an explicit demo "as-of" date axis so 2025/2026/2028 artefacts coexist coherently; (c) accept as a known abstraction. Decide alongside the SPICE-exercise calendar (ENH-02) when the time axis is next worked.

---

## Open decisions / policy (DEC)

### DEC-01
**`cause_type` enum gaps.** `Sev Low · Accepted (2026-06-26)`
Schema enum = `security | climate | hazard | geopolitical | other`; it has no `regulatory` / `supply-chain` / `financial`. Convention: use `other` + the markdown `family` tag (RG1 & FN1 = `other`, SC1 = `security`).
**Accepted (2026-06-26):** owner decision — **keep the tag convention; do not extend the schema enum.** Rationale: `schema.yaml` is the RIM v3.0 platform contract ([[ODT Sourcebook Rules|Rule 2]] — schema-align, don't fork the enums); the markdown `family` taxonomy already carries the richer cause classification without diverging the demo from the real platform. Logged in [Accepted by design](#accepted-by-design).

### DEC-02
**STEWARD / BEAR owner layer not seeded.** `Sev Low · Applied (2026-06-28)`
The mitigation-objective + SPICE layer was seeded, but the owner accountability edges (`BEARS` owner→risk, `STEWARDS` owner→mitigation) defined in schema were absent from the seed.
**Applied (2026-06-28):** owner decision — **seed it now** (un-deferred; Wave 3 / W2 of the [[ROADMAP]]). Added an `owners:` section to the workbook: **18 `owner` nodes** keyed by the existing owner-string on each risk/mitigation — 10 mapped to [[Cast Roster]] characters (Elena/Diane/Raj/Tom/Amara/Yuki/Priya/Carlos/Sofia/Henrik), 8 as functional-role owners (VP Sales, Lead Software Architect, Thermal Subsystem Lead, AURORA Chief Engineer, Quality Manager, Plant Director, HR Director, IT Director). Generator emits **50 `BEARS`** (one per risk, from each risk's single `owner` field → the one-bearer invariant holds by construction) and **33 `STEWARDS`** (22 core mitigations + 11 spice_mitigations, each given an `owner`). Regenerated `demo_seed.cypher` (**3863 lines**). VERIFY block now asserts both model invariants (≤1 bearer/risk; STEWARDS never targets a Risk) and prints a per-owner workload table.
**The one-bearer conflict, resolved cleanly:** the workbook's single `owner` field is the **Bearer** source — so RH-02 → "VP Engineering" → [[Priya Nair (VP Engineering)|Priya]] bears it (one bearer, no contest); [[Sofia Adler (VP Ground & Operations)|Sofia]] participates by **stewarding** the relevant mitigations, not by bearing the risk. This is exactly the resolution rule (cause-owner BEARS / consequence-owner STEWARDS), enforced structurally rather than by hand.
**Polymorphic by design:** a BusinessRisk Bearer absorbs the EBIT/FCF consequence; an OperationalRisk Bearer absorbs the technical/operational consequence. The same owner may both BEAR and STEWARD. See [[Data Dictionary#owner-accountability-layer-bears-stewards]].

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
**NMS / NOC mission-control / billing-provisioning are not distinct `technical_perimeter` nodes.** `Sev Low · Applied 2026-06-29 (W6)`
[[Annex - Security Architecture]] §7 (Context v2.2) describes several control-plane assets — NOC mission-control/TT&C, the network management system (NMS, "the commercial brain"), the ground gateways, and the billing/provisioning platform — but only `TP-PLM` existed as a `technical_perimeter`. **Resolved (W6):** added `TP-NOC` (W4) + `TP-IDP`, `TP-NMS`, `TP-GW`, `TP-BILL` (7 perimeters total), wired the S1 NOC kill-chain and `OCCURS_AT` (S1 → TP-NOC), and mapped each ground-segment `SEC-*` risk via `CONCERNS`. Architecture annex §7 now cites the node IDs 1:1.

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

### ENH-07
**Two business risks thread to no objective — W1 completeness gap.** `Sev Low · Applied (2026-06-28)`
Building the W1 [[Annex - Objectives & Opportunities]] surfaced that, of the 17 business-level risks, **RH-06** (ground-segment capacity bottleneck) and **RA-04** (strategic-partner withdrawal) had **no path to any objective** — no `IMPACTS_TCO`/`IMPACTS_TPO` edge and no outgoing `INFLUENCES` to a risk that reaches one. The W1 invariant is that every Business Risk threads to an objective, so these two were invisible to any objective-rooted RIM view.
**Applied (2026-06-28):** added two `INFLUENCES` edges in `_inputs/workbook.yaml` — **INF-46** (`RH-06 → RH-03`, Moderate: ground throughput ceiling constrains the corporate revenue ramp → TPO-01) and **INF-47** (`RA-04 → RA-02`, Strong: partner withdrawal forces ODT to absorb a larger AURORA budget share → RC-02 → TCO-04, tying RA-04 into the established cross-perimeter convergence). Regenerated `demo_seed.cypher` (**3883 lines, 126 relationships**). No canon figures changed (relationship structure only). **17/17** business risks now thread to an objective.

---

## Accepted by design
*Logged so a future pass does not "fix" them — they are intentional teaching points.*

- **Over-coverage MO-FN1-2 = 120%** (SM-CYBER-INS 80% + SM-BRIDGE-FACILITY 40%). Demonstrates RIM surfacing >100% declared contribution as over-coverage, not an error.
- **Coverage gaps: MO-GP1-2** (export-control compliance posture), **MO-FN1-3** (IPO-file disclosure) and **MO-GA1-3** (ESA/NASA co-funding continuity / partner commitment) have no `FULFILS`. These are governance/relationship objectives you don't buy a control for — they show RIM flagging an unmitigated objective.
- **FN1 `ebit_impact = 0`.** FN1's loss is FCF/dilution (−60 / −100 / −140), not operating EBIT; the `hypothesis` field records why. The realistic −$100M case sits exactly on the canon liquidity trigger.
- **`cause_type` = `other` for regulatory / supply-chain / financial families** ([[#DEC-01]], 2026-06-26). The RIM v3.0 schema enum has no such values; we keep `other` + the markdown `family` tag rather than fork the platform contract (Rule 2). Not a data-quality gap.

---

## Changelog
- 2026-06-29: **ENH-04 Applied + λ/magnitude calibration + generator bug fix (W6).** Wired the **S1 NOC kill-chain** in the graph (SPN-02→ATK-02→EP-02→COMPROMISES TP-IDP/TP-NMS/TP-NOC→SEEKS FT-CTRL) and added **4 new `technical_perimeter` nodes** (TP-IDP, TP-NMS, TP-GW, TP-BILL — closes **ENH-04**; 7 perimeters total), S1 `OCCURS_AT` TP-NOC, and 6 `SEC-* CONCERNS` asset edges. Added the **frequency/magnitude calibration** (new canon section): **λ** via the `likelihood_to_lambda` **Moderate** band (owner-confirmed) on every risk; **magnitude** Tier-2 fallback on the 7 SPICE-uncovered business risks. **Generator bug fixed:** `prefix_matches` treated `RC` as a prefix of `RCY`, double-emitting RCY-01/02 as duplicate Risk nodes — now matches on `prefix + "-"` (50 risk nodes, was emitting 52). Regenerated `demo_seed.cypher` (4278 lines, 159 relationships). All figures order-of-magnitude (Rule 6); λ band owner-confirmed 2026-06-29. Still open: **ENH-01** (`crisis_management_days` null — canon doesn't define war-room duration).
- 2026-06-28: **ENH-07 raised & Applied — risk→objective threading completed (W1).** Building [[Annex - Objectives & Opportunities]] surfaced two orphaned business risks (RH-06, RA-04) with no path to any objective. Added `INFLUENCES` INF-46 (RH-06→RH-03) + INF-47 (RA-04→RA-02); regenerated `demo_seed.cypher` (3883 lines, 126 relationships). 17/17 business risks now thread. No canon figures changed. *(Same session: added the canonical **Opportunity Register OPP-01..05** to [[Canon & Figures Register]] — narrative anchors, no schema change — per the owner-confirmed distinct-OPP model.)*
- 2026-06-28: **+INC-05** — contingent activation dates (2026) predate the State B (2028) reporting position; raised while writing the risk-manager brief. Parked with ENH-02 for the next time-axis pass.
- 2026-06-28: **DEC-02 Applied — owner accountability layer seeded** (Wave 3 / W2). Un-deferred per owner decision. Added `owners:` to the workbook (18 owner nodes, 10 named cast + 8 functional roles, keyed by the existing owner-strings); gave each spice_mitigation an `owner`; extended `generate_seed.py` to emit `BEARS` (50, one per risk) and `STEWARDS` (33 = 22 core + 11 SPICE) plus VERIFY invariants. Regenerated `demo_seed.cypher` (3863 lines). One-bearer-per-risk holds by construction; STEWARDS never targets a Risk. [[Data Dictionary]] + Cast Roster updated. Not yet committed.
- 2026-06-26: **Owner-decision triage pass — CAN-01, CAN-03, INC-02, DEC-01, DEC-02 closed.** **CAN-01 EBIT half Applied** (capitalise AURORA dev-spend → BP-LEO `ebit_baseline` 45→13, GEO stays 0; consolidated EBIT +13 ✔; canon-first → workbook → regenerated seed 3470 lines). **CAN-03 Applied** (EBIT + FCF both reconcile as sum of perimeters; revenue 100% LEO by design; standing per-perimeter trigger kept). **INC-02 Applied** (GP1 `illustrates` += RA-02, cross-perimeter reach; new edge `ILL-BST-GP1-RA-02`, 73 spice edges). **DEC-01 Accepted** (keep `other` + family tag, don't fork RIM v3.0 enum; added to Accepted-by-design). **DEC-02 Deferred** (wait for platform; cast-sheet map = spec; resolution rule set: cause-owner BEARS / consequence-owner STEWARDS). Open tickets remaining: INC-04, DEC-03, ENH-01/02/03/04.
- 2026-06-26: **ENH-06 Applied** — owner priced the two S1 controls (SM-IDENTITY-SPLIT ~$4M, SM-CTRL-RECOVERY ~$1.5M, `cost_capex`, USD_M). Canon-first → workbook → regenerated seed (3468 lines). S2 return-on-spend now quantitative (~$5.5M vs −$69M/−$118M tail).
- 2026-06-26: **+ENH-06** — S1 control mitigations (SM-IDENTITY-SPLIT / SM-CTRL-RECOVERY) carry no cost; raised while building [[THE NUMBER - Season 2 (mitigation)]] so the return-on-spend ratio can be made quantitative once the owner prices them.
- 2026-06-26: **INC-03 Applied** — added INFLUENCES RH-02→RH-03 (INF-45); SC1 now reaches the TCO-04 apex via the risk graph. All 6 families provably converge. SC1 bestiary entry + Data Dictionary updated. Regenerated seed (3466 lines, 124 relationships).
- 2026-06-26: **TCO-04 (IPO) added as convergence apex** — owner's call to fix ENH-05 structurally rather than by an edge. New TCO-04 (owner CEO, H1 2029); RC-01/02/03 `IMPACTS_TCO`→TCO-04 (IMC-04/05/06), TPO-01 `CONTRIBUTES_TO`→TCO-04 (CTR-07). Convergence-proof query + Rule 4 + Bestiary Index + Influence Map + FN1/GA1 entries + AURORA annex repointed TCO-01→TCO-04. **ENH-05 Applied.** Regenerated seed (3456 lines, 123 relationships).
- 2026-06-26: **GEO SPICE case built** — family **BST-GA1** assessed against BP-GEO (closes the CAN-02 residual); bestiary entry + index + FN1 influenced-by updated. +**ENH-05** (RC-02/RC-03 don't reach TCO-01 — AURORA convergence proof needs one owner edge). MO-GA1-3 added to accepted-by-design coverage gaps.
- 2026-06-25: **CAN-02 Applied** — BP-GEO perimeter node added (owner figures: ~$50M budget, ~60/40 ESA-NASA/ODT split, FY28 burn ~$10M; canon-first → workbook → regenerated seed). **CAN-01** FCF half resolved (LEO −30 + GEO −10 = −40), EBIT half still open. **CAN-03** FCF reconciled; EBIT/revenue consolidation still pending. See [[Annex - AURORA-GEO Programme]].
- 2026-06-18: +INC-04 (CapEx 77/72) and +ENH-04 (missing perimeter nodes), raised while porting Context v2.2 into the Finance & Security annexes.
- 2026-06-18: register created; seeded with 12 tickets + 3 accepted-by-design items from the workbook-pipeline and SPICE-layer work.
