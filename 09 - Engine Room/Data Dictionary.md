---
type: engine-room
sourcebook-line: "09 - Engine Room"
status: active
tags: [engine-room, data-dictionary, status/active]
aliases: ["Schema Map", "Demo Dataset Guide"]
---
# ⚙️ Data Dictionary — sourcebook ↔ graph
> [!info] How the vault's content maps to `schema.yaml` v3.0 and loads via `demo_seed.cypher`. Source of truth for **data**: the editable workbook → generates the Cypher (one source, never two).

## Workbook → Cypher pipeline

| File | Role |
|---|---|
| `_inputs/workbook.yaml` | **Edit this** — single source of truth for all graph entities and relationships |
| `09 - Engine Room/generate_seed.py` | Run this to regenerate `demo_seed.cypher` from the workbook |
| `_inputs/demo_seed.cypher` | **Generated — do not hand-edit** |

**To make a change:** edit `workbook.yaml`, then run:
```
python "09 - Engine Room/generate_seed.py"
```

### Workbook sections
| Section | Content |
|---|---|
| `risks` | All Risk nodes (50 total: RC/RH/RA/ROE/ROM/ROL/ROC/ROF/ROH/ROR/ROI/SEC/RCY) |
| `objectives.tpo` | Top Programme Objectives (TPO-01..06) |
| `objectives.tco` | Top Company Objectives (TCO-01..04; TCO-04 = IPO apex, owner CEO) |
| `mitigations` | All Mitigation nodes (22 total: MIT-01..21 + MIT-CY1) |
| `context_nodes` | Business perimeters, scenarios, entry points, attackers, technical perimeters, sponsors, functional targets, business activities |
| `relationships.contributes_to` | TPO → TCO hierarchy (6 edges) |
| `relationships.impacts_tco` | Risk → TCO direct impacts (4 edges) |
| `relationships.influences` | INFLUENCES graph (46 edges across L1/L2/L3) |
| `relationships.impacts_tpo` | Risk → TPO impacts (14 edges) |
| `relationships.mitigates` | Mitigation → Risk coverage (37 edges) |
| `relationships.context_edges` | Kill-chain & business wiring (12 edges) |
| `spice.families` | 5 bestiary families → **15 `SpiceScenario` nodes** (best/realistic/pessimistic) + their bridge edges |
| `spice.mitigation_objectives` | 15 `mitigation_objective` context nodes (ADDRESSES targets) |
| `spice.spice_mitigations` | 9 `spice_mitigation` context nodes + their FULFILS edges |

### SPICE layer model (how families expand)
Each family in `spice.families` expands to **3 SpiceScenario nodes** sharing one `scenario_family_id`. The **realistic (P50, `status_in_family: current`)** case is the family representative and carries every bridge edge — `ILLUSTRATES`, `CAUSED_BY`, `ASSESSED_AGAINST`, `OCCURS_AT`, `ADDRESSES`, `MITIGATED_BY_SPICE`. The **best** and **pessimistic** cases are data-only sibling records (grouped by `scenario_family_id`, read by the MagnitudeCalibrator). `FULFILS` runs `spice_mitigation → mitigation_objective` with a `contribution_weight` (may sum >100% = over-coverage; objectives with no fulfiller = a coverage gap — both are valid, surfaced not errored).
EBIT/FCF figures are transcribed from the [[Bestiary Index|bestiary]] stat-block tables; `spice_mitigation` cost/coverage is populated only where the [[Canon & Figures Register]] states a figure.

## Core nodes
| Vault concept | Neo4j label | Key fields (schema) |
|---|---|---|
| Risk (business/operational) | `Risk` | level, categories[], status, probability, severity, `annual_probability` (λ), `magnitude_point_estimate/low/high` |
| Mitigation | `Mitigation` | type (Dedicated/Inherited/Baseline), effectiveness |
| [[Bestiary Index|Scenario]] | `SpiceScenario` | `scenario_family_id`, `case_type` (best/realistic/pessimistic), `ebit_impact_y1..y6`, `fcf_impact_y1..y6`, `financial_recovery_years`, `validated`, `cause_type` |
| Objective | `ContextNode{tpo|tco}` | `CONTRIBUTES_TO` rolls TPO→TCO |
| Perimeter | `ContextNode{business_perimeter}` | BP-LEO, BP-GEO |
| Owner ([[Cast Roster|cast]]) | `ContextNode{owner}` | `BEARS` risk, `STEWARDS` mitigation |

## Edges
`INFLUENCES` (level1/2/3; weak→critical) · `MITIGATES` · `IMPACTS_TPO` / `IMPACTS_TCO` · `CONTRIBUTES_TO` · SPICE: `ILLUSTRATES` `CAUSED_BY` `ASSESSED_AGAINST` `OCCURS_AT` `ADDRESSES` `FULFILS` `MITIGATED_BY_SPICE` · cyber path: `SEEKS` `USES` `EXPLOITS` `COMPROMISES` `EXPOSES` `AFFECTS` `TARGETS` `HOSTED_ON`.

## Known gaps to flag (forward work)
> [!warning] To resolve in production
> - `cause_type` enum = security/climate/hazard/geopolitical/other — has **no `regulatory`/`supply-chain`/`financial`**; bestiary entries use `other` + a `family` tag. Decide: extend enum or keep the tag convention. *(In effect now: RG1 & FN1 = `other`, SC1 = `security`.)*
> - **Mitigation-Objective + SPICE-mitigation layer now seeded** (18 objectives, 11 spice mitigations, ADDRESSES/MITIGATED_BY_SPICE/FULFILS). The **STEWARD/BEAR owner layer is still NOT seeded** — separate decision, deferred.
> - ~~**SC1 narrative-vs-graph gap**~~ **Resolved (2026-06-26):** added `INFLUENCES` **RH-02 → RH-03** (INF-45), so SC1 now reaches the apex via risk→risk influence (RH-02→RH-03→RC-01→`IMPACTS_TCO` **TCO-04**), not only the objective hierarchy. Convergence apex is **TCO-04 (IPO)**; all 6 bestiary families provably converge. *(INC-03 Applied.)*
> - **GP1 `caused-by` corrected** from `ROE-01` (software defect) to `ROM-01`+`ROL-01` (RF supply + launch) to match its narrative.
