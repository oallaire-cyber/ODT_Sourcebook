# CLAUDE.md — working instructions for the ODT Sourcebook

> Read this first, then read `SESSION-STATE.md`, then `00 - Index & Canon/ODT Sourcebook Rules.md`. Update `SESSION-STATE.md` at the end of every working session.

## What this project is
The **ODT Sourcebook**: the complete fictional-company context for **Orbital Dynamics Technologies (ODT)**, serving the **RIM** platform and the **SPICE** method. One consistent world feeding six uses: RIM demo dataset, dev/use-case docs, training, risk-owner interviews, SPICE exercises, presentations, whitepaper.

## Your role
You are the **engine** that turns raw inputs (the owner's notes, the schema, the dataset) into sourcebook content. The owner runs an Obsidian "second brain" that handles vault structure/ingestion — so **optimise for content correctness, not Obsidian formatting**. Light wikilinks/frontmatter are welcome for navigation but are not constraints.

## Non-negotiable rules (full list in the Rules file)
1. **Canon is law.** Every figure comes from `00 - Index & Canon/Canon & Figures Register.md`. Never invent or drift a number. If a number must change, change it *there first*.
2. **Schema-align.** Match `schema.yaml` v3.0 (node labels, fields, enums) and the entity IDs in `demo_seed.cypher`. Don't guess field names.
3. **Single data source.** The editable workbook is the source of truth for the graph; `demo_seed.cypher` is *generated*. Never hand-edit both.
4. **Interconnection.** Every bestiary entry must declare `influences` / `influenced-by`. Risks are a graph, not a list — that is the entire thesis.
5. **RPG framing is internal only.** Worldbook/Cast/Bestiary/etc. organise the kit; board- and sponsor-facing artefacts stay strictly professional.
6. **English only. Fiction disclaimer applies.** Order-of-magnitude figures by design.

## Canonical inputs (ground truth — keep alongside the vault)
- `schema.yaml` — RIM schema v3.0 (entities, relationships, context nodes, SpiceScenario).
- `demo_seed.cypher` — current canonical demo graph (real risk/objective/perimeter IDs).
- External finished kit (PDF/PPTX/DOCX): SPICE workshop set + `THE NUMBER` serial — *current, do not rework*.

## The ten product lines (folders 00–10)
00 Index & Canon · 01 Worldbook · 02 Cast · 03 Bestiary · 04 Modules · 05 GM Kit · 06 Player Handbook · 07 Core Rules · 08 Chronicles · 09 Engine Room · 10 Session Zero. See `Sourcebook Index.md`.

## Working loop
1. Read `SESSION-STATE.md` → pick the top backlog item.
2. Check canon + schema before writing.
3. Produce/extend the note; wire its links and (for risks/scenarios) its influence edges.
4. Use the owner's "ask" capability to gather missing raw inputs rather than inventing them.
5. Log the change in the note's changelog and update `SESSION-STATE.md` (done / next / open questions).
