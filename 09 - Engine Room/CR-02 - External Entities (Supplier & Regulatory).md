---
type: change-request
sourcebook-line: "09 - Engine Room"
status: draft
tags: [engine-room, change-request, schema, supply-chain, regulatory, external, status/draft]
aliases: ["CR-02", "External Entities CR", "Supplier & Regulator nodes"]
---
# 📑 CR-02 — First-class External Entities (Supplier & Regulatory/Constraint nodes)
> **From:** ODT Sourcebook (data/narrative) · **To:** RIM platform (schema owner) · **Raised:** 2026-06-29 · **Status:** `Draft — discussion opened with RIM` · **Drives:** Wave 4 depth (W4 supply chain, W3 external constraints)
>
> *Cross-project process per `CLAUDE.md` → "Working with the RIM project": CRs may originate from either side; **RIM is the leading project and the authoritative tracker.** This ODT-side copy is the draft spec; the agreed position will live in RIM's exchange log (`2026-06-29-external-entities`). **Do not change `schema.yaml` until agreed.***

> [!info] One-line intent
> Two classes of **external party** — **suppliers** and **regulators/constraints** — currently exist only as *attributes on risks* (+ narrative annexes). Promote them to **first-class context nodes** so the graph can answer "**which production stops if this supplier fails?**" and "**what does this regulator govern?**" — turning two annex reads into graph traversals, without disturbing the risk model.

---

## 1. Why (the narrative driver)
Two Wave-4 workstreams surfaced the same shape of gap — an **external entity that several risks/activities depend on, but which the graph can't represent as one thing**:

- **W4 (Supply Chain).** ODT's build rests on a handful of tier-1 suppliers, **two single-source** (Teledyne RF, Saft batteries). Today that lives in the `supply_chain` risk subtype (`supplier_tier`/`criticality_class`/`single_source`) on each risk + the [[Annex - Supply Chain & Production]]. You **cannot ask the graph** "if Teledyne fails, which activities/outputs stop?" — because Teledyne is a string in a description, not a node feeding the production chain.
- **W3 (External Constraints).** A handful of regulators (**FCC, ITU, US DDTC/ITAR, DoD accreditation**) each gate **multiple** risks. Today that lives in the `regulatory_compliance` risk subtype (`regulatory_body`/`applicable_standard`/`licence_stage`) + the [[Annex - External Environment & Constraints]]. You **cannot ask the graph** "show everything the FCC governs" or "what is ODT's ITAR exposure across the portfolio?" — the regulator is a repeated string, not a shared node.

The alignment principle (`CLAUDE.md`): when a real risk-manager need can't be expressed in the schema, that's a legitimate driver for a schema change. Both needs are **concrete and canon-grounded** (see §5 worked examples).

## 2. Current state (what exists today)
| Concept | Modelled as | Where | Limit |
|---|---|---|---|
| Supplier | `supply_chain` risk subtype fields on ROM-01/02/03/04, ROL-01, SEC-02 | risk attributes + [[Annex - Supply Chain & Production]] | one supplier ↔ one risk; no supplier→production-chain edge; no blast-radius |
| Regulator / regime | `regulatory_compliance` risk subtype fields on RC-04, RH-05, RH-07, RA-05, ROH-02, ROR-01 | risk attributes + [[Annex - External Environment & Constraints]] | regulator repeated per risk; no shared node; no "governs N" view |
| Production chain | `business_activity` → `PRODUCES` → `functional_target` → `HOSTED_ON` → `technical_perimeter` | graph (W4) | exists, but no supplier feeds into it |

## 3. The proposed change *(two related node types — RIM may accept, split, or decline each)*

### A — `supplier` context node
- **New context node `supplier`** with fields: `name`, `tier` {Tier 1/2/3/Internal}, `criticality` {Critical/Important/Standard}, `single_source` {bool}, `country`/`home_state` (for geopolitical exposure), `lead_time` (optional), `description`.
- **New edge `SUPPLIES`**: `supplier → functional_target` (or `→ business_activity`) — "this supplier provides this input to the chain." Enables blast-radius: *supplier → FT-COMP → BA-MFG → FT-SAT → …*.
- **Optional edge `SOURCED_FROM`**: `risk → supplier` (or reuse `CONCERNS`) — ties the existing supply-chain risks to the supplier node.
- The `supply_chain` **risk subtype stays** (it describes the *risk*); the supplier node is the *entity*. (Or: retire the subtype's `supplier_tier`/`single_source` once they live on the node — RIM to choose; see §4.)

### B — `regulator` / `external_constraint` context node
- **New context node `external_constraint`** (covers regulators **and** non-regulatory constraints like the launch market / capital window) with fields: `name`, `kind` {regulator / export_control / accreditation / partnership / market / macro}, `authority` (e.g. FCC, US DDTC), `standard` (e.g. 47 CFR Part 25), `jurisdiction`, `description`.
- **New edge `GOVERNS`** (or `CONSTRAINS`): `external_constraint → risk` (and optionally `→ business_activity` / `→ business_perimeter`) — "this constraint bears on these risks/activities." Enables "everything the FCC governs" and a portfolio regulatory-exposure view.
- The `regulatory_compliance` **risk subtype stays** as the per-risk detail (`licence_stage` is risk-specific); the node carries the shared authority/standard.

## 4. Migration map (legacy → new)
| Today | → New |
|---|---|
| `supplier_tier`/`criticality_class`/`single_source` strings on 6 risks | `supplier` nodes: **Teledyne** (T1/Critical/sole, US), **Saft** (T1/Critical/sole, FR), **Northrop Grumman**, **Spirit Aero** (T1/Important, dual), **Moog**, **Orbital ATK** (T1/Important), **SpaceX**, **Rocket Lab** (launch) + `SUPPLIES`→FT-COMP / (launch→FT-CONST) |
| `regulatory_body`/`applicable_standard` strings on 6 risks | `external_constraint` nodes: **FCC** (47 CFR Part 25), **ITU** (Radio Regs), **US DDTC / ITAR** (22 CFR 120–130), **DoD accreditation**, **ESA/NASA partnership**, **capital-market window** + `GOVERNS`→ the risks above |
| (narrative only) launch market, IPO window | optional `external_constraint` {kind: market / macro} → FN1 / RC-01..03 |

Counts: ~8 supplier nodes, ~6 external-constraint nodes. No risk IDs change; existing subtype fields can stay (denormalised) or be retired per RIM's call.

## 5. Worked examples (the queries this unlocks)
1. **Supplier blast-radius:** `MATCH (s:supplier {name:'Teledyne'})-[:SUPPLIES]->(:functional_target)<-[:PRODUCES]-(a:business_activity)` → "Teledyne feeds FT-COMP → BA-MFG → the satellite" — and the `single_source` flag explains why ROM-01 is Critical. Today: unanswerable from the graph.
2. **Regulatory exposure:** `MATCH (c:external_constraint {authority:'US DDTC'})-[:GOVERNS]->(r:Risk)` → RA-05 + ROH-02 (+ GP1's path) — ODT's whole ITAR surface in one query, owned by [[Amara Diallo (VP Compliance & Quality)|Amara]]. Today: a manual annex read.
3. **Convergence from the outside in:** every `external_constraint` → its risks → the financial cluster (RC-01/02/03) → **TCO-04** — the IPO window as the place the external perimeter funnels to.
4. **Incident attribution (W5 evidence):** the new [[ODT Company History & Incident Log|incident log]] records **HX-01 caused by Teledyne** and **HX-05 governed by the FCC** — but only as *strings on the risk*. With the nodes, "show every incident **and** active risk involving Teledyne" or "everything the FCC has touched (HX-05 + ROR-01 + RH-07…)" is one traversal. History makes the attribution gap concrete: the same external entity recurs across *active risks and past incidents*, and today the graph can't link them.

## 6. Items for RIM to confirm
1. **Appetite & scope** — both node types, one, or neither? Is `external_constraint` (a general "boundary" node spanning regulator + market + macro) the right abstraction, or do you prefer a narrower `regulator`?
2. **Edge direction/naming** — `SUPPLIES` (supplier→target) and `GOVERNS` (constraint→risk): acceptable, or reuse existing edges?
3. **Subtype coexistence** — keep the `supply_chain` / `regulatory_compliance` risk subtypes alongside the nodes (denormalised), or migrate the shared fields onto the nodes and slim the subtypes?
4. **Engine impact** — do any analytical engines read these, or are they pure context (like `business_activity`/`functional_target`)? We assume **context-only** (no exposure/magnitude effect), mirroring the production-chain nodes.

## 7. Scope boundary
- **In scope:** two context node types + their edges (§3), migration of the existing string attributes (§4).
- **Out of scope:** any change to the risk exposure/magnitude model; the `owner`/BEARS/STEWARDS layer; the mitigation model (that was [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]]).
- **No ODT-side schema change until agreed.** If RIM declines, W3/W4 remain complete at L2 on the current subtype-fields + annex model (this CR is an *enhancement*, not a blocker).

## Changelog
- 2026-06-29: **Enriched by W5 (incident history).** The new incident log attributes **HX-01 to Teledyne** (supplier) and **HX-05 to the FCC** (regulator) — concrete evidence that the same external entity recurs across active risks *and* past incidents, which the current string-attribute model can't link. Added as worked example §5.4. Strengthens the case; no change to the proposal.
- 2026-06-29: **CR-02 drafted & discussion opened with RIM.** Two Wave-4 workstreams (W4 supply chain, W3 external constraints) each surfaced the same gap — an external entity multiple risks depend on, modelled only as a repeated risk attribute. Proposed first-class `supplier` and `external_constraint` context nodes with `SUPPLIES` / `GOVERNS` edges, grounded in canon (Teledyne/Saft choke points; FCC/ITU/ITAR/DoD regimes) with worked queries (§5). Opening exchange posted to RIM (`tasks/sourcebook_exchanges/2026-06-29-external-entities.md`). Status `Draft` — awaiting RIM appetite/scope decision; no ODT-side schema change until agreed.
