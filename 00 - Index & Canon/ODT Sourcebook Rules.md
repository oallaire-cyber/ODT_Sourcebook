---
type: canon
sourcebook-line: "00 - Index & Canon"
status: new
tags: [canon, rules, governance, status/new]
aliases: ["Production Rules", "Style Guide"]
---
# 📜 ODT Sourcebook — Production Rules

The governance for building and maintaining the set. Companion to `CLAUDE.md` and `SESSION-STATE.md`.

## 1. Canon governance (anti-drift)
- [[Canon & Figures Register]] is the **only** source of figures. Derived notes cite it; they never restate a different number.
- Entities (risks, objectives, perimeters, owners) use the **real IDs** from `demo_seed.cypher`. New IDs follow [[Naming & Conventions]].
- Schema fields/enums come from `schema.yaml` v3.0 — do not invent attributes.

## 2. The ten product lines
A note belongs to exactly one line (its folder). Cross-line links are encouraged; cross-line *content duplication* is not — link instead.

## 3. Document anatomy (what each type must contain)
- **Worldbook**: slim narrative + links to annexes; no raw figure tables (those live in the Register).
- **Character** ([[Cast Roster]]): role, reports-to, mandate, objectives owned, fears, "their language", `BEARS`/`STEWARDS` footprint, serial appearances.
- **Bestiary entry**: the [[_Scenario Stat-Block Template]] — sponsor/cause, business objective, one path, detection, **three cases** (EBIT/FCF), mitigation objectives, **and `influences`/`influenced-by`**.
- **Module**: the six-step wrapper, inputs, output.
- **Core Rules**: method/mechanics only; defer derivations to annexes.
- **Engine Room**: schema mapping; flags enum/seed gaps.

## 4. The interconnection principle (the thesis)
Risks **influence each other across families**. No bestiary entry ships without its influence edges. The convergence on the financing/IPO objective ([[BST-FN1 IPO Window Collapse (Financial)|FN1]] / TCO-01) is the canonical demonstration and must be preserved as entries are added. Render in [[Influence Map]].

## 5. Tone & framing
- RPG vocabulary (Worldbook, Cast, Bestiary, GM Kit, Module) is an **internal** organising device.
- Anything a sponsor/board sees (whitepaper, exec briefing, consolidated report) is written **straight** — no RPG flavour.
- Fiction disclaimer on outward-facing artefacts; figures are order-of-magnitude by design.

## 6. Working with the owner
- When raw input is missing, **ask** rather than invent (the owner supplies the substance; Claude is the engine).
- Update [[SESSION-STATE|SESSION-STATE.md]] every session; keep the backlog ordered and the open questions current.

## 7. Definition of done (per note)
Canon-consistent · schema-aligned · linked into the graph · (for risks/scenarios) influence edges declared · changelog line added · `SESSION-STATE` updated.
