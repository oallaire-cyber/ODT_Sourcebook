---
type: change-request
sourcebook-line: "09 - Engine Room"
status: applied
tags: [engine-room, change-request, schema, supply-chain, regulatory, external, status/draft]
aliases: ["CR-02", "External Entities CR", "Supplier & Regulator nodes"]
---
# 📑 CR-02 — First-class External Entities (Supplier & Regulatory/Constraint nodes)
> **From:** ODT Sourcebook (data/narrative) · **To:** RIM platform (schema owner) · **Raised:** 2026-06-29 · **Status:** `APPLIED (2026-06-29) — RIM landed schema.canonical.yaml; ODT regenerated the seed` · **Drives:** Wave 4 depth (W4 supply chain, W3 external constraints)
>
> [!success] Final agreed contract — **spec CONVERGED 2026-06-29** (RIM ratified §9 of the exchange log `2026-06-29-external-entities`)
> Two **context** node types + three **context** edges (no engine impact):
> - **`supplier`**: `name` · `tier` {Tier 1/2/3/Internal} · `criticality` {Critical/Important/Standard} · `single_source` (bool) · `country` · `lead_time` (optional) · `description`
> - **`regulator`**: `name` · `kind` {regulator/export_control/accreditation/partnership} · `authority` · `standard` · `jurisdiction` · `description`
> - **`SUPPLIES`** : `supplier → business_activity` (**ratified** — not the FT; FT-COMP is BA-PROC's *output*) · **`GOVERNS`** : `regulator → risk` · **`SOURCED_FROM`** : `risk → supplier` (dedicated edge)
>
> Risk subtypes (`supply_chain`/`regulatory_compliance`) **unchanged, denormalised**. Market/macro deferred to a future `market_factor`. **Next:** RIM aligns `schema.yaml` → ODT regenerates the seed (~8 supplier + ~4–5 regulator).
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

## 8. RIM decision & ODT confirmation (2026-06-29) — agreed contract
**RIM accepted CR-02** with four refinements; **ODT accepted all four** and confirmed the one open item. The agreed model ODT will regenerate against once RIM aligns `schema.yaml`:

| # | RIM refinement | ODT response |
|---|---|---|
| Q1 | `external_constraint` → **narrow to `regulator`**; defer market/macro to a future `market_factor` type | **Accepted.** FCC/ITU/DDTC-ITAR/DoD = `regulator`; ESA/NASA = `kind: partnership`. Launch market + IPO window stay **narrative** (this annex + [[Annex - External Environment & Constraints]]) until canon justifies `market_factor`. Outside-in convergence to **TCO-04** unaffected. |
| Q2 | **Dedicated `SOURCED_FROM`** (risk → supplier), not a reuse of `CONCERNS` | **Accepted** — symmetric with `GOVERNS`; keeps `CONCERNS` for risk→asset only. |
| Q3 | **Keep subtype fields denormalised** (zero migration) | **Accepted** — new nodes purely additive; no risk IDs change; `supplier_tier`/`single_source` (risk) ↔ `tier`/`single_source` (node) duplication intentional. |
| Q4 | **Context-only** (no engine impact) | **Confirmed** — mirrors `business_activity`/`functional_target`. |

### §5.1 `SUPPLIES` target — ODT confirmation (a correction to RIM's tentative pick)
RIM's instinct ("supplier feeds the **input**, not the FT an activity outputs") is right — and the W4 chain shows the input is an **activity**, not a `functional_target`. `FT-COMP` is *already* an ODT output (`BA-PROC` PRODUCES it by qualifying raw supplier parts). So **`SUPPLIES` targets the consuming `business_activity`:**
- **Component/battery/structure/attitude suppliers** (Teledyne, Saft, Northrop Grumman, Spirit Aero, Moog, Orbital ATK) → `SUPPLIES` → **`BA-PROC`** → which `PRODUCES` `FT-COMP` → consumed by `BA-MFG` → `FT-SAT`.
- **Launch suppliers** (SpaceX, Rocket Lab) → `SUPPLIES` → **`BA-LAUNCH`** → `PRODUCES` `FT-CONST` (resolves RIM's launch→FT-CONST note — FT-CONST is the activity's *output*).
- *(MSSP = service supplier → optional `BA-SVC`; internal AIT clean-room = `BA-MFG` itself, not a supplier node.)*

This keeps the **entire W4 production chain intact** (no `PRODUCES` edge retired) — `supplier` nodes + `SUPPLIES` edges are purely additive. Needs RIM to allow `SUPPLIES: supplier → business_activity` (CR-02 §3A offered FT *or* activity, so inside the envelope). **Fallback** if RIM insists on an FT target: point at `FT-COMP` as input and retire `PRD-02`/`PRD-04` so it's unambiguously a procured input — costs two `PRODUCES` edges; ODT prefers the activity target.

### Regeneration scope (once RIM aligns the schema)
~8 `supplier` nodes + `SUPPLIES` → BA-PROC/BA-LAUNCH + optional `SOURCED_FROM` from the 6 supply-chain risks; ~4–5 `regulator` nodes + `GOVERNS` → the 6 `regulatory_compliance` risks; existing subtype strings unchanged.

## 9. Spec converged — final build contract (2026-06-29)
RIM **ratified `SUPPLIES → business_activity`** (and declined the FT-COMP fallback — no reason to mutate the intact W4 chain). Spec is **CONVERGED**; RIM now aligns the demo schema, then ODT regenerates. The contract ODT will build to:

| Element | Spec |
|---|---|
| **`supplier`** (context node) | `name` · `tier` {Tier 1/2/3/Internal} · `criticality` {Critical/Important/Standard} · `single_source` (bool) · `country` · `lead_time` (optional) · `description` |
| **`regulator`** (context node) | `name` · `kind` {regulator/export_control/accreditation/partnership} · `authority` · `standard` · `jurisdiction` · `description` |
| **`SUPPLIES`** (context edge) | `supplier → business_activity` — components/battery/structure/attitude → **BA-PROC**; launch → **BA-LAUNCH**; (optional MSSP → BA-SVC) |
| **`GOVERNS`** (context edge) | `regulator → risk` — the 6 `regulatory_compliance` risks |
| **`SOURCED_FROM`** (context edge) | `risk → supplier` — the 6 supply-chain risks (optional tie) |

**Blast-radius unlocked:** `(:supplier)-[:SUPPLIES]->(:business_activity)-[:PRODUCES]->(:functional_target)-[:HOSTED_ON]->(:technical_perimeter)`. Risk subtypes unchanged (denormalised); all context-only (no `core`, no `engine_contract.py`, no propagation math).

**Regeneration plan (ODT, on schema landing):** add `suppliers:`/`regulators:` blocks to `workbook.yaml` (~8 supplier + ~4–5 regulator) + the `SUPPLIES`/`GOVERNS`/`SOURCED_FROM` edges; extend `generate_seed.py` with node/edge emitters; regenerate `demo_seed.cypher`; update [[Annex - Supply Chain & Production]] §6 + [[Annex - External Environment & Constraints]] (supplier/regulator now graph nodes) + Data Dictionary + Canon register. No new canon figures expected (names/figures already canonical).

## Changelog
- 2026-06-29: **CR-02 APPLIED — RIM landed the schema; ODT regenerated.** RIM delivered the aligned **`schema.canonical.yaml`** (the secure canonical schema, replacing `schema.yaml`) carrying the ratified contract: `supplier` + `regulator` context nodes and `SUPPLIES` / `GOVERNS` / `SOURCED_FROM` context edges (plus the `financial_effect` enum tightened to {impact_reducing, recovery_accelerating} and the cosmetic `zone`/`border` UI hints dropped from `owner`/`mitigation_objective`). ODT ran the regeneration: added `suppliers:` (8 — Teledyne, Saft, Northrop Grumman, Spirit AeroSystems, Moog, Orbital ATK, SpaceX, Rocket Lab) and `regulators:` (5 — FCC, ITU, US DDTC/ITAR, DoD accreditation, ESA/NASA) blocks to `workbook.yaml`; wired **8 `SUPPLIES`** (→ BA-PROC / BA-LAUNCH), **6 `SOURCED_FROM`** (ROM-01/02/03, ROL-01, SEC-02, + incident HX-01; ROM-04 internal AIT has no supplier node per §8), **9 `GOVERNS`** (the 6 regulatory_compliance risks + multi-jurisdiction RC-04 fan-in + incident HX-05); extended `generate_seed.py` with `supplier_node`/`regulator_node` emitters; regenerated `demo_seed.cypher` (validated: all node_types/edges schema-conformant, zero dangling endpoints, financial_effect enum clean). Subtypes kept denormalised; all CR-02 entities context-only. Data Dictionary + project schema-pointers updated. Status `Spec CONVERGED` → **`APPLIED`**.
- 2026-06-29: **CR-02 spec CONVERGED — `SUPPLIES → business_activity` ratified by RIM.** RIM accepted ODT's §5.1 correction in full (FT-COMP is BA-PROC's output, so suppliers feed the consuming *activity*, not the FT) and declined the FT-COMP fallback. Final build contract pinned (§9): `supplier` + `regulator` context nodes; `SUPPLIES` (supplier→business_activity) / `GOVERNS` (regulator→risk) / `SOURCED_FROM` (risk→supplier) context edges; subtypes denormalised; context-only. Status `Accepted` → **`Spec CONVERGED`**. **Next:** RIM aligns `schema.yaml`, then ODT runs the regeneration (workbook + generator + seed + annex/dictionary updates). Exchange §9 + README index reflect convergence.
- 2026-06-29: **CR-02 ACCEPTED (with refinements) — RIM decision logged + ODT confirmation posted.** RIM accepted both node types: `supplier` as drafted; `external_constraint` **narrowed to `regulator`** (market/macro deferred to a future `market_factor`); dedicated **`SOURCED_FROM`** edge added; subtype fields **kept denormalised**; **context-only** confirmed. ODT accepted all four refinements and **confirmed the open §5.1 item with a correction**: `SUPPLIES` targets the consuming `business_activity` (**BA-PROC** for components, **BA-LAUNCH** for launch), not the FT — keeps the W4 chain intact (FT-COMP-as-input fallback documented). Status `Draft` → **`Accepted (with refinements)`**. Posted as §8 of the RIM exchange (`2026-06-29-external-entities`); README index updated. **Next:** RIM ratifies the `SUPPLIES` endpoint + aligns `schema.yaml`, then ODT regenerates the seed. Not a blocker meanwhile (W3/W4 complete at L2).
- 2026-06-29: **Enriched by W5 (incident history).** The new incident log attributes **HX-01 to Teledyne** (supplier) and **HX-05 to the FCC** (regulator) — concrete evidence that the same external entity recurs across active risks *and* past incidents, which the current string-attribute model can't link. Added as worked example §5.4. Strengthens the case; no change to the proposal.
- 2026-06-29: **CR-02 drafted & discussion opened with RIM.** Two Wave-4 workstreams (W4 supply chain, W3 external constraints) each surfaced the same gap — an external entity multiple risks depend on, modelled only as a repeated risk attribute. Proposed first-class `supplier` and `external_constraint` context nodes with `SUPPLIES` / `GOVERNS` edges, grounded in canon (Teledyne/Saft choke points; FCC/ITU/ITAR/DoD regimes) with worked queries (§5). Opening exchange posted to RIM (`tasks/sourcebook_exchanges/2026-06-29-external-entities.md`). Status `Draft` — awaiting RIM appetite/scope decision; no ODT-side schema change until agreed.
