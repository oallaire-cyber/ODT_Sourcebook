# SESSION-STATE — ODT Sourcebook
*Last updated: 2026-06-18 · by: Claude (annex port) · phase: **Wave 1 — data layer***

## Where we are
The vault **scaffold** exists: one minimal, schema-aligned, cross-linked exemplar per product line, plus the canon spine and this working set. Content is representative, not complete — the point is to show each document type's shape and how the pieces interlock.

## Decisions settled
- Slim Worldbook master + detachable annexes (Finance, Architecture, AURORA-GEO, RIM-anchoring).
- The 5 workshop scenarios become canonical `SpiceScenario`s; the bestiary is multi-family and extensible.
- AURORA-GEO is a full second context / second P&L perimeter.
- State A stays a one-slide payoff for now.
- English only.
- Single editable dataset source (workbook) → generated `demo_seed.cypher`.
- RPG framing = internal organising/identity device only.
- Bestiary families seeded now: Cyber, Supply Chain, Regulatory, Geopolitical, Financial(IPO) — **interconnected**, converging on FN1 / TCO-01.

## Inventory & status
| Area | Status | Notes |
|---|---|---|
| Worldbook Core + annexes | scaffolded (Core/AURORA/RIM-anchor `new`; Finance/Architecture `update` stubs) | port Context v2.2 detail into Finance & Architecture annexes |
| Cast | 9 full (Maya/Tom/Sofia/Marc/Diane + Henrik/Carlos/Yuki/Amara) + 3 stubs (Elena/Raj/Priya) | expand remaining stubs when a role is needed |
| Bestiary | index + template + 5 entries, **all graph-wired** | 15 SpiceScenario nodes + 15 mitigation objectives + 9 spice mitigations + SPICE edges now in the workbook/seed |
| Modules/GM/Player/Core/Chronicles/Session Zero | one exemplar each | fine as scaffolds |
| Engine Room | Data Dictionary + **workbook pipeline** | `_inputs/workbook.yaml` → `generate_seed.py` → `demo_seed.cypher` — **done** |
| External kit (workshop + THE NUMBER) | current | do not rework; converge onto its figures |

## Backlog (ordered)
1. ~~**Workbook source + generator**~~ ✅ `_inputs/workbook.yaml` is the single source; `09 - Engine Room/generate_seed.py` regenerates `demo_seed.cypher`. Never hand-edit the `.cypher` again.
2. ~~**Enrich S1 → SC1/RG1/GP1/FN1**~~ ✅ 5 families × 3 cases = 15 `SpiceScenario` nodes + 15 mitigation objectives + 9 spice mitigations, wired with ILLUSTRATES/CAUSED_BY/ASSESSED_AGAINST/OCCURS_AT/ADDRESSES/MITIGATED_BY_SPICE/FULFILS (realistic case = family representative). Generator extended; all validated. **Follow-ups:** SC1→TCO-01 only via objective hierarchy (see Data Dictionary gap); GP1 caused-by corrected; index lists GP1 illustrating RA-02 (entry has RH-04 only).
3. ~~**Port Context v2.2**~~ ✅ `_inputs/ODT_Context_v2.2_DualState.md` received & logged as a canonical input. §4.2–4.7 & §6.1–6.5 → `Annex - Finance & Unit Economics`; §7 (+§5.2) → `Annex - Security Architecture`. New canonical figures (full P&L, cash-flow statement, CAC payback, IPO-bridge assumption, segment counts) pushed to the Canon register **first**, then cited. Raised INC-04 (CapEx 77/72) and ENH-04 (missing perimeter nodes).
4. **AURORA-GEO** — flesh the annex to second-perimeter depth (objectives, supply chain, regulatory, its RA-* risks). *(Tied to CAN-02/CAN-03.)*
5. ~~**Expand cast stubs**~~ ✅ Carlos, Yuki, Amara, Henrik written to full character sheets (mandate, objectives, BEARS/STEWARDS aligned to workbook owner strings, bestiary cross-links). Roster updated. Owner→risk mapping now feeds DEC-02 (STEWARD/BEAR seeding). Remaining stubs: Elena, Raj, Priya.
6. **THE NUMBER — Season 2** outline (mitigation), pinned to S1 mitigation objectives.
7. **Sponsor surfaces** — live demo script, exec briefing, case-study one-pager.

## Open questions for the owner (resolve before deep production)
> All canon changes, inconsistencies, decisions and improvements now live in **[[Canon Change & Issue Register]]** (the demo's change-control log). Worked "business as in real life" once all lines are initialised. Highlights still open: BP-LEO baselines (CAN-01, deferred), BP-GEO perimeter (CAN-02), SC1 influence path (INC-03), `cause_type` enum (DEC-01), STEWARD/BEAR layer (DEC-02).
- Bestiary expansion order beyond the five: climate? hazard (debris/collision)? HR/key-person? *(also DEC-03)*

## Changelog
- 2026-06-18: cast stubs expanded — Henrik, Carlos, Yuki, Amara full sheets (BEARS/STEWARDS aligned to workbook owner strings + bestiary links); roster restructured; cast↔owner mapping noted on DEC-02 (incl. RH-02 bearer conflict).
- 2026-06-18: Context v2.2 ported — Finance annex (§4.2–4.7, §6.1–6.5) and Security-Architecture annex (§7, §5.2) built out; canon-first (new figures into Canon register before citing). v2.2 logged as canonical input. +INC-04, +ENH-04.
- 2026-06-18: SPICE layer seeded — 15 `SpiceScenario` nodes (5 bestiary families × 3 cases), 15 `mitigation_objective` + 9 `spice_mitigation` context nodes, 60 SPICE edges. Generator extended to emit them; full validation incl. EBIT-totals-vs-bestiary-tables, FULFILS coverage (gaps + over-coverage), and TCO-01 convergence. Bestiary frontmatter given `scenario-family-id`; GP1 caused-by corrected (ROE-01 → ROM-01/ROL-01); FN1 EBIT=0/FCF-priced noted.
- 2026-06-17: workbook pipeline built — `_inputs/workbook.yaml` (50 risks, 22 mitigations, 119 edges) + `09 - Engine Room/generate_seed.py`; `demo_seed.cypher` is now generated, never hand-edited. Data Dictionary updated.
- 2026-06-15: initial vault scaffold (40+ notes) + Claude Code working set.
