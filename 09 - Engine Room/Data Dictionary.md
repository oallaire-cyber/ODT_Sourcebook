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
| `mitigations` | All Mitigation nodes (**33 total** — CR-01 consolidated: 22 operational MIT-01..21 + MIT-CY1, plus the 11 ex-`SpiceMitigation` financial/operational controls SM-*). The 11 financial-layer controls carry `financial_effect` + `fulfils:` |
| `owners` | **Accountability layer** — 18 `owner` nodes (one per distinct owner-string; 10 map to [[Cast Roster]] characters, 8 are functional-role owners). `key` = the owner-string matched on risks/mitigations |
| `context_nodes` | Business perimeters, scenarios, entry points, attackers, technical perimeters, sponsors, functional targets, business activities |
| `relationships.contributes_to` | TPO → TCO hierarchy (6 edges) |
| `relationships.impacts_tco` | Risk → TCO direct impacts (4 edges) |
| `relationships.influences` | INFLUENCES graph (46 edges across L1/L2/L3) |
| `relationships.impacts_tpo` | Risk → TPO impacts (14 edges) |
| `relationships.mitigates` | Mitigation → Risk coverage (37 edges) |
| `relationships.context_edges` | Kill-chain & business wiring (12 edges) |
| `spice.families` | 6 bestiary families → **21 `SpiceScenario` nodes** — 18 base (v1, best/realistic/pessimistic) + **3 S1 mitigated** (v2 projection, CR-01 §C4) — plus their bridge edges |
| `spice.mitigation_objectives` | 18 `mitigation_objective` context nodes (ADDRESSES targets) |
| *(retired)* `spice.spice_mitigations` | **Removed (CR-01).** The 11 controls are now core `Mitigation` nodes in `mitigations:` (see above); their FULFILS edges run from `Mitigation`, and each carries an `owner` (STEWARDS) |
| *generated: `BEARS`* | owner → risk, **one per risk** (50 edges, driven by each risk's `owner` field) |
| *generated: `STEWARDS`* | owner → **mitigation** (33 edges = the single consolidated registry); never targets a Risk |

### SPICE layer model (how families expand)
Each family in `spice.families` expands to **3 SpiceScenario nodes** (base version 1) sharing one `scenario_family_id`. The **realistic (P50, `status_in_family: current`)** case is the family representative and carries every bridge edge — `ILLUSTRATES`, `CAUSED_BY`, `ASSESSED_AGAINST`, `OCCURS_AT`, `ADDRESSES`, `MITIGATED_BY`. The **best** and **pessimistic** cases are data-only sibling records (grouped by `scenario_family_id`, read by the MagnitudeCalibrator). `FULFILS` runs **`Mitigation → mitigation_objective`** (CR-01 §C3, re-homed) with a `contribution_weight` (may sum >100% = over-coverage; objectives with no fulfiller = a coverage gap — both are valid, surfaced not errored).
EBIT/FCF figures are transcribed from the [[Bestiary Index|bestiary]] stat-block tables; the financial-layer controls' cost/coverage is populated only where the [[Canon & Figures Register]] states a figure.

**Mitigated versions (CR-01 §C4).** A family may declare a `mitigated:` block — the analyst-authored re-assessment as a **new `version_number`** (per case), same `scenario_family_id`. Benefit = base − mitigated is computed by RIM (§C5); the ROCE denominator is the Σ `capex`/`committed_budget` of the cited controls. **Realised-vs-projected:** if the cited controls are `existing`/`on-going` the mitigated version becomes `current` (base → `superseded`); if `planned`/`recommended` the base stays `current` and the mitigated version is a `draft` projection. **Seeded today:** the **S1** family (v2, `draft`) — citing the two `planned` cyber controls (SM-IDENTITY-SPLIT + SM-CTRL-RECOVERY); pessimistic FCF −118 → −82 (held above the −$100M trigger), severing S1 → FN1. Realises [[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]]'s "after."

## Core nodes
| Vault concept | Neo4j label | Key fields (schema) |
|---|---|---|
| Risk (business/operational) | `Risk` | level, categories[], status, probability, severity, `annual_probability` (λ), `magnitude_point_estimate/low/high` |
| Mitigation | `Mitigation` | type (Dedicated/Inherited/Baseline); **status** {existing/on-going/planned/recommended} (CR-01); `financial_effect` {impact_reducing/recovery_accelerating, nullable}; `capex`/`opex`/`committed_budget`/`coverage_amount`/`target_date` (ROCE + lifecycle); effectiveness on the `MITIGATES` edge |
| [[Bestiary Index|Scenario]] | `SpiceScenario` | `scenario_family_id`, `case_type` (best/realistic/pessimistic), `ebit_impact_y1..y6`, `fcf_impact_y1..y6`, `financial_recovery_years`, `validated`, `cause_type` |
| Objective | `ContextNode{tpo|tco}` | `CONTRIBUTES_TO` rolls TPO→TCO |
| Perimeter | `ContextNode{business_perimeter}` | BP-LEO, BP-GEO |
| Owner ([[Cast Roster|cast]]) | `ContextNode{owner}` | name, role, entity, email; `BEARS` risk, `STEWARDS` mitigation |

## Edges
`INFLUENCES` (level1/2/3; weak→critical) · `MITIGATES` · `IMPACTS_TPO` / `IMPACTS_TCO` · `CONTRIBUTES_TO` · accountability: `BEARS` `STEWARDS` · SPICE: `ILLUSTRATES` `CAUSED_BY` `ASSESSED_AGAINST` `OCCURS_AT` `ADDRESSES` `FULFILS` (now `Mitigation→objective`) `MITIGATED_BY` (CR-01, was `MITIGATED_BY_SPICE`) · cyber path: `SEEKS` `USES` `EXPLOITS` `COMPROMISES` `EXPOSES` `AFFECTS` `TARGETS` `HOSTED_ON`.

### Owner accountability layer (BEARS / STEWARDS)
The dual ownership model, seeded 2026-06-28 (resolves [[Canon Change & Issue Register#DEC-02|DEC-02]]):
- **`BEARS` — owner → Risk — "faces the consequence."** Polymorphic by currency: a **BusinessRisk** bearer absorbs the EBIT/FCF hit; an **OperationalRisk** bearer absorbs the technical/operational disruption. **At most one Bearer per risk** — driven by each risk's single `owner` field, so the invariant holds by construction (50 risks → 50 BEARS).
- **`STEWARDS` — owner → Mitigation — "runs the work."** Execution accountability over the single consolidated Mitigation registry (CR-01 — no more polymorphic `SpiceMitigation` target). **Never targets a Risk** (forbidden by design). A risk addressed by several mitigations therefore has several stewards *via its mitigations* — one accountable steward per mitigation.
- The **same owner may both BEAR and STEWARD** (common in lean teams — e.g. the CFO bears RC-02 and stewards the bridge facility).
- **Source of truth:** the `owner` *string* on each risk/mitigation; the `owners:` table maps each distinct string (its `key`) to an owner node (named cast character where one exists, else an owner-as-role). The generator's VERIFY block asserts both invariants (one-bearer-per-risk, no-STEWARDS-on-Risk) and prints a per-owner workload table.

## Known gaps to flag (forward work)
> [!warning] To resolve in production
> - `cause_type` enum = security/climate/hazard/geopolitical/other — has **no `regulatory`/`supply-chain`/`financial`**; bestiary entries use `other` + a `family` tag. Decide: extend enum or keep the tag convention. *(In effect now: RG1 & FN1 = `other`, SC1 = `security`.)*
> - ~~**Mitigation-Objective + SPICE-mitigation layer seeded**~~ **Consolidated (2026-06-29, CR-01):** the 11 `SpiceMitigation` context nodes merged into the single core `Mitigation` registry (33 controls); `FULFILS` re-homed to `Mitigation`, `MITIGATED_BY_SPICE`→`MITIGATED_BY`, `effectiveness_pct` retired, `deferred` folded into `recommended`. New fields `financial_effect`/`committed_budget`/`target_date`/`roadmap_ref`/`coverage_amount`. S1 mitigated version (v2) seeded. *(W2 controls portfolio — CR-01 Applied.)*
> - ~~**STEWARD/BEAR owner layer not seeded**~~ **Resolved (2026-06-28):** owner layer seeded — 18 `owner` nodes + 50 `BEARS` + 33 `STEWARDS`, invariants enforced (one bearer per risk; no STEWARDS on a Risk). See [Owner accountability layer](#owner-accountability-layer-bears-stewards). *(DEC-02 Applied.)*
> - ~~**SC1 narrative-vs-graph gap**~~ **Resolved (2026-06-26):** added `INFLUENCES` **RH-02 → RH-03** (INF-45), so SC1 now reaches the apex via risk→risk influence (RH-02→RH-03→RC-01→`IMPACTS_TCO` **TCO-04**), not only the objective hierarchy. Convergence apex is **TCO-04 (IPO)**; all 6 bestiary families provably converge. *(INC-03 Applied.)*
> - **GP1 `caused-by` corrected** from `ROE-01` (software defect) to `ROM-01`+`ROL-01` (RF supply + launch) to match its narrative.
