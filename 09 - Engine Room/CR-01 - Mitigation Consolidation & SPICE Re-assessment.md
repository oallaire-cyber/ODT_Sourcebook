---
type: change-request
sourcebook-line: "09 - Engine Room"
status: new
tags: [engine-room, change-request, schema, mitigation, spice, status/new]
aliases: ["CR-01", "Mitigation Consolidation CR"]
---
# 📑 CR-01 — Mitigation Consolidation & SPICE Re-assessment Model
> **From:** ODT Sourcebook (data/narrative) · **To:** RIM platform (schema owner) · **Raised:** 2026-06-28 · **Status:** `Submitted — awaiting schema alignment` · **Drives:** Wave 3 / **W2** (controls portfolio + decision support)
>
> *Cross-project process per `CLAUDE.md` → "Working with the RIM project": CRs may originate from either side; **RIM is the leading project and the authoritative tracker** of this exchange. This ODT-side copy is the draft spec; the agreed position lives in RIM's exchange log.*

> [!info] One-line intent
> **Collapse the two parallel mitigation concepts into a single `Mitigation` register, give it a real lifecycle + cost model, and formalise the analyst-authored "mitigated scenario version" as the mechanism that moves the financial number.** This re-homes pieces RIM already has (scenario versioning, FULFILS coverage matrix, scenario↔mitigation linking) rather than rebuilding — so it should sync cleanly. All four design questions are resolved per the RIM project's reply of 2026-06-28.

---

## 1. Why (the narrative driver)
A real ODT risk manager must reason over **one consolidated mitigation plan** — not an "operational controls" register in one silo and a "financial controls" register in another. The board funds **one** portfolio. Today the dataset splits them: a core `Mitigation` (acts on exposure, `MITIGATES` a risk) and a separate context-node `SpiceMitigation` (acts on the financial layer, `FULFILS` an objective). That split is an artefact of how the SPICE layer was seeded, not how the company runs. This CR removes it.

The decision the model must support: *"For this scenario, what do I already have, what's deploying, what's planned-and-budgeted, and what's the recommended gap — and what does buying the gap return?"* That is exactly the [[ODT Risk Status & Executive Decision Brief - 2026-06-28|risk-manager brief]]'s **D1** (fund the ~$5.5M cyber control tower vs accept the tail).

## 2. Current state (what exists today)
| Concept | Node / edge | Key fields | Acts on |
|---|---|---|---|
| Operational control | `Mitigation` (core) | types {dedicated, inherited, baseline}; status {proposed, in_progress, implemented, deferred}; **`capex`, `opex`** already present; `owner`, `source_entity` | **exposure** — via `MITIGATES` → risk (effectiveness {low/med/high/critical}) |
| Financial/SPICE control | `SpiceMitigation` (context) | `type` {impact_reducing, recovery_accelerating}; status {ongoing, planned, recommended}; `cost_capex`, `cost_opex`, `effectiveness_pct`, `coverage_amount` | **financial layer only** — via `FULFILS` → `mitigation_objective` (contribution_weight) and `MITIGATED_BY_SPICE` ← scenario |
| Scenario | `SpiceScenario` | **`scenario_family_id`, `version_number`, `case_type` {best/realistic/pessimistic}, `status_in_family` {draft/current/superseded}**, `ebit_impact_total`, `fcf_impact_total` | — |

**Inventory:** 22 `Mitigation` + 11 `SpiceMitigation` = **33** controls → become **one register of 33**. Owner accountability (`BEARS`/`STEWARDS`) already live (DEC-02).

> [!note] The good news
> `Mitigation` already carries `capex`/`opex`, and `SpiceScenario` already has the full **versioning** mechanism (`scenario_family_id` + `version_number` + `status_in_family`). The mitigated-version idea (§ C4) is therefore an **authoring convention on existing fields**, not a new schema feature.

---

## 3. The change

### C1 — Consolidate `SpiceMitigation` → `Mitigation` *(full merge)*
- **Retire** the `SpiceMitigation` context node. There is **one** mitigation type: the core `Mitigation` node.
- A control's **edges are independent**, not a mutually-exclusive class. A `Mitigation` may carry **`MITIGATES`** (acts on **exposure** — severity/likelihood), **and/or** the financial citation **`MITIGATED_BY`** + `FULFILS` (acts on the **financial layer** — the scenario consequence). Three patterns result:
  - **Operational-only** — `MITIGATES` only (e.g. ECSS quality framework). `financial_effect = null`.
  - **Financial-only** — `MITIGATED_BY`/`FULFILS`, **no** `MITIGATES` (cyber insurance, bridge facility, reserve fund). RIM's exposure engine sees no edge → zero exposure effect.
  - **Dual-acting** — **both** edges. A Business Continuity Plan, or increasing buffer-stock volume, **reduces exposure** (lower severity/likelihood) **and** shortens the **duration** of the consequence → lower FCF impact. Such a control has `MITIGATES` *and* a `MITIGATED_BY` citation, with a non-null `financial_effect`.
- **RIM already supports the dual case** (the two edges and the exposure/financial engines are independent), so this is a *modelling clarification*, not a new feature: `financial_effect` is **decoupled** from whether `MITIGATES` exists. Its `capex` counts in the ROCE denominator (§ C5) for any scenario it is cited on, regardless of its exposure effect.
- A `Mitigation` `FULFILS` a `mitigation_objective`; **`contribution_weight` stays on the `FULFILS` edge**. Over-coverage >100% per objective remains a surfaced flag (the canonical MO-FN1-2 = 120% case is preserved).
- **`STEWARDS`** simplifies to `owner → mitigation` only (drop the polymorphic `SpiceMitigation` target handling).

### C2 — `Mitigation` field model
| Field | Action | Spec |
|---|---|---|
| `status` | **REPLACE enum** | `{existing, on-going, planned, recommended}` — *existing* = operating; *on-going* = deploying; *planned* = decided + budgeted + roadmapped, not yet capitalised; *recommended* = identified gap, not yet decided. |
| `financial_effect` | **ADD** (promote from `SpiceMitigation.type`) | `{impact_reducing, recovery_accelerating}`, **nullable** (null = no financial-layer effect). **Decoupled from `MITIGATES`** — a dual-acting control (BCP, buffer stock) may set it *and* carry `MITIGATES`. Preserves the SM-CTRL-RECOVERY = *recovery_accelerating* distinction through consolidation. |
| `committed_budget` | **ADD** (float, nullable) | Committed spend for a *planned* control **before** it is capitalised — distinct from `capex`/`opex`. Lets a planned control show money + intent before it is fully costed (e.g. SM-IDENTITY-SPLIT "~$4M, decided in principle, not yet capitalised"). |
| `target_date` | **ADD** (date, nullable) | ETA / roadmap date for a *planned* control. |
| `roadmap_ref` | **ADD** (string, nullable, optional) | Free reference to the delivery roadmap/initiative. |
| `coverage_amount` | **KEEP** (carry from `SpiceMitigation`, float, nullable) | Insurance limit / contractual cap (e.g. the $50M cyber tower). |
| `capex`, `opex` | **KEEP** (already present) | ROCE inputs. Migrate `SpiceMitigation.cost_capex → capex`, `cost_opex → opex`. Populate when known. |
| `effectiveness_pct` | **RETIRE** *(confirm — see §5)* | Superseded: benefit is now the analyst-authored base−mitigated delta (§ C4/C5), not a stored % on the control. |
| `types` {dedicated, inherited, baseline} | **KEEP** | Unchanged. |

### C3 — Edges
| Edge | Action | Spec |
|---|---|---|
| `FULFILS` | **RE-HOME** | `from_node`: `spice_mitigation` → **`mitigation`**. `to_node` `mitigation_objective` and `contribution_weight` unchanged. |
| `MITIGATED_BY_SPICE` | **RENAME → `MITIGATED_BY`** *(confirm naming/direction)* | The direct, **additive** scenario↔control citation: *"this control is cited in this scenario's mitigated re-assessment."* Keep canonical direction **`SpiceScenario → Mitigation`**, read both ways. We propose dropping `_SPICE` (no longer a distinct node). **RIM to confirm so we don't duplicate the existing edge.** |
| `MITIGATES` | **UNCHANGED** | Operational controls only; financial controls omit it. |
| `STEWARDS` | **SIMPLIFY** | `owner → mitigation` (drop `SpiceMitigation` polymorphism). |

> The objective path (`Mitigation → mitigation_objective ← SpiceScenario`) is **kept** as strategic intent + coverage/over-coverage. The direct `MITIGATED_BY` edge is **additive** for traceability/justification — not a replacement.

### C4 — Mitigated scenario = a new **version**, per case *(authoring convention; no schema change)*
- The mitigated re-assessment is a **new `version_number`** within the same `scenario_family_id`, authored **per case** (best / realistic / pessimistic — each is already its own node). Minimum: the realistic case; **preferred: the full three-case mitigated version**, because the thesis is the **pessimistic tail crossing the −$100M trigger**.
- RIM retains the base version (`status_in_family: superseded`) so the **before/after stays visible**.
- **Realised vs projected rule** (the one nuance to encode): which version is `current` depends on the lifecycle status of the cited mitigations —
  - cited mitigations are **existing / on-going** (realised) → the **mitigated** version becomes `current` (benefit achieved);
  - cited mitigations are **planned / recommended** (projected) → the **base** version stays `current` and the mitigated version is a **projection** (`draft`/`superseded` as RIM's versioning dictates) — "benefit *if funded*." This is the brief's D1: the controls are *planned*, so the mitigated number is a projection until funded.

### C5 — ROCE / benefit are **computed, never stored** *(consistent with RIM's exposure rule)*
The analyst authors only: (a) the **mitigated impact** per case (via C4), and (b) **`capex`/`opex`** per mitigation. RIM derives:
- **Benefit** (per case) = `base.ebit/fcf_impact_total − mitigated.ebit/fcf_impact_total`
- **ROCE** = `Benefit ÷ Σ capex` of the mitigations cited on that scenario (via `MITIGATED_BY`).

So the dataset must provide: **base + mitigated versions per case · `FULFILS` weights · `MITIGATED_BY` citations · `capex`/`opex` per mitigation.** Nothing else is needed for the financial readout.

---

## 4. Migration map (legacy → new)
| Legacy node/value | Count | → New `Mitigation` value |
|---|---|---|
| `Mitigation.status = implemented` | 13 | `existing` |
| `Mitigation.status = in_progress` | 8 | `on-going` |
| `Mitigation.status = proposed` | 1 | `recommended` *(→ `planned` instead if it carries a `committed_budget`)* |
| `Mitigation.status = deferred` | 0 in use | `recommended` *(parked gap — see §5: on-hold nuance)* |
| `SpiceMitigation.status = ongoing` | 7 | `on-going` |
| `SpiceMitigation.status = planned` | 3 | `planned` |
| `SpiceMitigation.status = recommended` | 1 | `recommended` |
| `SpiceMitigation.type = impact_reducing` | 9 | `financial_effect = impact_reducing` |
| `SpiceMitigation.type = recovery_accelerating` | 2 | `financial_effect = recovery_accelerating` |
| *(all 22 operational controls)* | 22 | `financial_effect = null` *(current data — see note)* |
| `SpiceMitigation.cost_capex / cost_opex` | — | `capex / opex` |

**Post-migration register (33 controls):** status — `existing` 13 · `on-going` 15 · `planned` 3 · `recommended` 2. `financial_effect` set on the 11 ex-SPICE controls, null on the 22 operational.

> [!note] Dual-acting controls come in the W2 population pass, not the migration
> The clean "22 operational (null) / 11 financial (set)" split is a fact about **today's data**, not a model constraint — the schema permits **dual-acting** controls (§ C1) that carry `MITIGATES` *and* a non-null `financial_effect`. We will author those when populating the W2 controls portfolio (candidates: a **Business Continuity Plan** and **buffer-stock increase** — each lowers exposure *and* shortens consequence duration → FCF). The migration itself preserves the current values; no dual-acting control is invented at migration time.

---

## 5. Items for RIM to confirm
1. **`MITIGATED_BY` naming/direction** — accept rename from `MITIGATED_BY_SPICE`, keep `SpiceScenario → Mitigation`, read both ways (avoid creating a duplicate edge).
2. **`effectiveness_pct`** — retire (our recommendation), **or** keep as an optional analyst hint? It no longer feeds a calculation (C5), but it costs nothing to retain.
3. **`deferred` on-hold nuance** — the new enum has no on-hold state. Fold `deferred → recommended` (our default), or do you want an `on_hold` boolean to preserve "a known option, parked"?

## 6. Scope boundary
- **In scope:** consolidation (C1), field model (C2), edges (C3), mitigated-version convention (C4), computed ROCE (C5).
- **Out of scope — separate workstream:** **risk appetite / tolerance bands** (financial thresholds for risk-management decisions). To be synced separately. *(Maps to ROADMAP W1/W7 "risk-appetite statement" input.)*
- **Already built RIM-side (confirmed):** scenario versioning · objectives + `FULFILS` contribution-weight matrix + over-coverage flag · scenario↔mitigation linking · owner Bearer/Steward accountability. The quant gaps noted in the risk brief (no λ/magnitude, no loss-exceedance curve) are covered by RIM features **U16/U18/F34** — a separate, already-planned direction.

## 7. Impact on the sourcebook (after the schema lands)
Once RIM aligns the schema, the ODT side will:
1. Update `_inputs/schema.yaml` to the new contract.
2. Merge the 11 `spice_mitigations:` into the `mitigations:` block in `_inputs/workbook.yaml` (apply the §4 map; add `financial_effect`, `committed_budget`, `target_date`).
3. Re-home `FULFILS` + rename `MITIGATED_BY` in `09 - Engine Room/generate_seed.py`; drop `SpiceMitigation` emission; simplify `STEWARDS`.
4. Author the **mitigated scenario versions** (start with **S1**, the flagship D1 decision: three-case mitigated re-assessment citing SM-IDENTITY-SPLIT + SM-CTRL-RECOVERY, `planned` → projection).
5. Regenerate `demo_seed.cypher`; update [[Data Dictionary]] + [[Canon & Figures Register]] (no new figures — costs already canonical).
6. This is the **W2 controls portfolio** deliverable; it then feeds **W7** (the first worked decision = D1).

## Changelog
- 2026-06-28: **Reflected dual-acting controls** (owner note). A single `Mitigation` may carry **both** `MITIGATES` (exposure: severity/likelihood) **and** the financial citation (consequence duration → FCF) — e.g. a BCP or a buffer-stock increase. RIM already supports this; reframed C1 into three patterns (operational-only / financial-only / dual-acting), decoupled `financial_effect` from `MITIGATES`, and noted dual-acting controls are authored in the W2 population pass (not at migration).
- 2026-06-28: **CR-01 drafted** from the RIM project's answers to the four design questions (Q1 full consolidation · Q2 versioned mitigated scenario per case · Q3 additive scenario↔mitigation edge · Q4 status enum {existing/on-going/planned/recommended} + distinct budget fields). Current-state inventory + exact legacy→new migration map captured from `_inputs/workbook.yaml`. Status `Submitted` — awaiting RIM schema alignment, then the W2 regeneration pass (§7).
