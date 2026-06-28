# ROADMAP — ODT Sourcebook

> The forward plan. `SESSION-STATE.md` holds the *active* backlog and where we are right now; this file holds *where we are going and why*. Read this after `SESSION-STATE.md`. Re-rate it at every **Depth & Completeness Review** (see §3).
>
> *Created 2026-06-27 · supersedes the original "scaffold → seven backlog items" arc, which is complete (commit `b9dcad6`).*

---

## 1. North Star

Build the **most real ODT we can** — a fictional New-Space company with a coherent strategy, P&L, supply chain, history, and operating rhythm — so that its risk-and-opportunity graph is rich enough to *drive decisions*, not just illustrate them. Everything we add must make ODT feel like a company a board would actually recognise.

**The thesis we are dramatising:** *dynamic risk intelligence supports business and management decisions.* So the dataset is not a static catalogue — it is a company **mid-decision**, and the RIM is the instrument the management team reads to make the call.

### The six uses this serves (success = all six are well-fed)
1. **RIM demo dataset** — test data dense and interconnected enough to exercise every RIM feature (exposure, LEC, coverage heatmap, scope traversal, lifecycle).
2. **Dev / use-case docs** — a worked, schema-true example for the platform team.
3. **Training materials** — onboarding a new risk analyst into a believable company.
4. **Risk-owner interviews** — named owners with mandates you can role-play.
5. **SPICE exercises & crisis exercises** — runnable scenarios with injects and decisions.
6. **Presentations / whitepaper** — sponsor-facing surfaces, strictly professional.

---

## 2. Operating posture — "run ODT for real"

From here we work **as if we were ODT's risk & strategy function.** Concretely:

- **Decisions, not just descriptions.** Every meaningful addition should answer "what decision does this inform?" Risks exist because they threaten an objective or an opportunity; mitigations exist because someone chose to spend on them; constraints exist because they bound a choice.
- **Both sides of the ledger.** We have modelled the downside (risks → IPO). We now also model the **upside** ODT is reaching for (the IPO itself, the AURORA-GEO second act, new commercial contracts) — the *opportunities* the risk intelligence protects.
- **An operating rhythm.** ODT runs a risk-&-opportunity cadence (committee → triage → decide → apply). We already do this for canon via the [[Canon Change & Issue Register|CCB]]; we extend the same discipline to the company's own management decisions (Workstream W7).
- **Canon stays law.** Growth does not relax Rule 1. New figures land in [[Canon & Figures Register]] **first**, then the workbook, then a regenerated `demo_seed.cypher`. The register is also ODT's own change history — part of the story.

---

## 3. The Depth Dial — how we decide "how complete is enough"

The owner's standing question: *we must regularly decide how deep to go.* This is the mechanism.

### 3.1 The completeness ladder (rate every artefact / workstream)

| Tier | Name | Definition | Good enough for |
|---|---|---|---|
| **L0** | Stub | Exists, named, linked. Placeholder content. | Navigation only |
| **L1** | Scaffold | One schema-aligned exemplar; shows the *shape* of the doc/data. | "What does this look like?" |
| **L2** | Operational | Enough real, consistent, interconnected data to **use live** with no embarrassing gaps; owners, costs, edges populated; survives a facilitator's follow-up questions. | RIM demo, SPICE/crisis exercise, interview |
| **L3** | Stress-tested | Validated against the platform **and** run in a live exercise; figures reconciled; canon-clean; battle-tested. | Whitepaper, flagship demo, paying workshop |

Most of the vault is **L1** today. The graph data (risks/SPICE) is **L2 → L3**. The job of the waves below is to lift the *company-context* layers from L1 to L2, and the flagship demo path to L3.

### 3.2 The cadence (the recurring decision)

- **At every wave boundary** (and no less than every ~3 work sessions) we run a **Depth & Completeness Review**: re-rate each workstream's tier in §4, confirm the *target* tier is still right, and decide where the next sessions invest. Log the verdict in `SESSION-STATE.md`.
- **Default rule:** breadth before depth *within a wave* (get everything to its target tier) — but never let a single workstream race to L3 while its neighbours sit at L1, because the demo's whole point is interconnection. Lift the *web*, not one strand.
- **Stop rule:** an artefact is "done" when it reaches its **target** tier in this file — not L3 by default. Over-building a stub that the demo never shows is waste; record the decision to *stop* explicitly so a later pass doesn't reopen it.

---

## 4. Workstreams

Eight streams (W1–W8) plus governance (W0). Each maps the owner's wants to concrete schema entities we have **not yet populated**, with a current and target tier.

| # | Workstream | Owner's want | Current | Target |
|---|---|---|---|---|
| W0 | Governance & data integrity | (keep canon coherent as it grows) | L2 | L3 |
| W1 | Strategy, Objectives & **Opportunities** | "business objectives" | L1→L2 | L3 |
| W2 | Mitigations, Controls & **Owners** | "mitigations" | L1 | L2 |
| W3 | External Constraints & Environment | "external constraints" | L1 | L2 |
| W4 | Supply Chain | "a supply chain" | L0→L1 | L2 |
| W5 | History & Past Incidents | "some past incidents" | L0 | L2 |
| W6 | Operational & Technical Data | "operational-level info with usable data" | L1 | L2 |
| W7 | Management Operating Rhythm (decision support) | (the core thesis) | L0 | L2 |
| W8 | Consumption Surfaces (workshop / crisis / training) | "workshop, crisis exercise, training" | L1 | L2 |

### W0 — Governance & data integrity *(continuous)*
Keep the spine clean while the rest grows. Canon-first, CCB triage of the open tickets ([INC-04](00%20-%20Index%20%26%20Canon/Canon%20Change%20%26%20Issue%20Register.md), DEC-03, ENH-01/02/03/04), generator validation on every regeneration, the Depth Reviews of §3.
**Schema anchors:** the whole register + `generate_seed.py` VERIFY pass.

### W1 — Strategy, Objectives & Opportunities
The "why" the company exists and what it is reaching for. Today we have TCO-01..04 and TPO-01..05 as a thin objective tree converging on the IPO. Lift it to a real strategy spine **and add the upside**: an explicit **Opportunity register** (IPO liquidity, AURORA-GEO second P&L, target commercial contracts) so the RIM visibly protects *value being created*, not only loss being avoided.
**Schema anchors:** `tco` / `tpo` context nodes, `CONTRIBUTES_TO`, `IMPACTS_TCO/TPO` (populated); opportunity framing is new narrative wired onto the existing objective tree.
**Deliverables:** Objectives & Opportunities annex; every Business Risk threads to an objective; opportunity ↔ risk pairing (each upside names the downside that threatens it).

### W2 — Mitigations, Controls & Owners
We priced the two S1 SPICE controls (ENH-06) but the **core `Mitigation` entity** (dedicated/inherited/baseline, `capex`/`opex`, `MITIGATES` effectiveness, lifecycle proposed→implemented) is thin, and the **owner layer is empty** (DEC-02 deferred — but the cast-sheet mapping is the spec). Build the real controls portfolio and *put names on it.*
**Schema anchors:** `mitigation` core entity + `MITIGATES`; `owner` context node + `BEARS` (owner→risk) / `STEWARDS` (owner→mitigation).
**Deliverables:** a controls catalogue (cost, status, effectiveness); seed `owner` nodes from [[Cast Roster]] with the cause-owner-BEARS / consequence-owner-STEWARDS rule; lights up the RIM Mitigations + responsibility-scope views. *(Re-opens DEC-02 — confirm with owner before seeding.)*

### W3 — External Constraints & Environment
The boundaries ODT operates inside: regulators (FCC/ITU spectrum, ITAR/export control, ESA/NASA partnership terms), geopolitics, the launch market, macro (rates → the IPO window). Feeds the RG and GP families and the AURORA ITAR story with real texture.
**Schema anchors:** `regulatory_compliance` subtype fields (`regulatory_body`, `applicable_standard`, `licence_stage`); `sponsor` / `attacker` (threat environment); narrative annex.
**Deliverables:** "External Environment & Constraints" annex; constraint → risk wiring; named regulatory bodies and standards on the relevant risks.

### W4 — Supply Chain
Today suppliers exist only as prose inside risk descriptions (RF sole-source ROM-01, launch availability ROL-01). Make the supply chain a **graph**: tiered suppliers, single-source flags, and the production chain that turns supplier input into the service ODT sells.
**Schema anchors:** `supply_chain` risk subtype (`supplier_tier`, `criticality_class`, `single_source`); the **entirely unpopulated** `business_activity` → `PRODUCES` → `functional_target` → `HOSTED_ON` → `technical_perimeter` chain, and `business_perimeter` `USES` `business_activity`.
**Deliverables:** supplier map (Tier-1 critical suppliers as owners/nodes); the activity→target→asset production chain for the LEO service; SC1/ROM-01/ROL-01 wired to it.

### W5 — History & Past Incidents
A real company has a past. Add an **incident log** — what has already happened to ODT — plus the risk-lifecycle states that encode history: closed/archived/legacy risks, *accepted* risks being *watched* for a trigger to re-activate. This is where realism compounds and where the "watching → trigger fires → re-activates" RIM lifecycle gets exercised.
**Schema anchors:** risk `status` (archived/closed/accepted/watching/suppressed), `origin: legacy`, `acceptance_date`/`acceptance_owner`/`archive_date`, `trigger_condition`; ties to [[Chronicles Index]].
**Deliverables:** Company History / Incident Log note; 3–5 seeded legacy & closed risks with post-mortems and a watched-with-trigger example; reconcile with THE NUMBER S1/S2.

### W6 — Operational & Technical Data (usable)
Make the operational layer dense enough to *query*. Populate the **cyber kill-chain** (attacker/sponsor/entry_point/functional_target with EXPLOITS/COMPROMISES/TARGETS/SEEKS) behind S1; add the missing `technical_perimeter` nodes (ENH-04: NOC mission-control/TT&C, NMS, ground gateways, billing/provisioning); and give risks **usable quantitative data** (`annual_probability` λ, `magnitude_point_estimate`/low/high) so the RIM's frequency and magnitude engines have something real to chew on.
**Schema anchors:** `attacker`/`sponsor`/`entry_point`/`functional_target` context nodes + their edges; `technical_perimeter` (multiple); risk `annual_probability` + magnitude fallbacks; `OCCURS_AT` from SPICE scenarios.
**Deliverables:** full S1 kill-chain in the graph; ≥4 new technical perimeters mapped 1:1 to the Security Architecture annex; a calibrated frequency/magnitude pass on the headline risks. *(Closes ENH-04; feeds ENH-01/02.)*

### W7 — Management Operating Rhythm (the decision-support thesis)
The keystone. Simulate ODT **running** its risk-&-opportunity process so the demo shows the RIM *changing a decision*. A recurring "ODT Risk & Opportunity Committee" with a decision log: scenario surfaces → committee reads the RIM → chooses (buy control / accept / defer / invest in opportunity) → graph updates → exposure moves. Reuses the CCB discipline we already run for canon, pointed at the *company's* choices.
**Schema anchors:** synthesises W1+W2 (objectives, mitigations, owners) into worked decisions; no new node type — it is the *narrative + decision log* that makes the data move.
**Deliverables:** Risk & Opportunity Committee charter + decision log; 2–3 fully worked management decisions (e.g. "fund the $5.5M S1 control tower vs accept the tail"; "commit ODT's 40% AURORA share now vs defer") each shown as a before/after on the graph.

### W8 — Consumption Surfaces (workshop / crisis / training)
With the deeper company in place, deepen the kit that *uses* it: a runnable **crisis-exercise** pack (injects, timeline, decision points) on top of a SPICE family; fuller Modules / GM Kit / Player Handbook / Core Rules / Session Zero; a training path that walks a new analyst from Session Zero into the live graph.
**Schema anchors:** consumes everything above; no new schema.
**Deliverables:** one full crisis-exercise module (likely S1 cyber); lift the weakest scaffold lines to L2; training path wired end-to-end.

---

## 5. Wave plan (sequencing)

Breadth-first within each wave; Depth & Completeness Review at every boundary.

### Wave 3 — *"ODT as a living company: the spine"*  ← **next**
Stand up the decision-support backbone. **W1** (objectives + opportunity register), **W2** (controls portfolio + owner layer), **W7** (committee + first worked decision). Outcome: the RIM can be shown *informing a management choice*, with named owners and both sides of the ledger.

### Wave 4 — *"Depth where the demo bites"*
The data-dense layer. **W4** (supply-chain graph), **W6** (kill-chain + perimeters + usable quant), **W3** (external constraints). Outcome: the graph is dense and queryable; the architecture annex maps 1:1; suppliers and regulators are first-class.

### Wave 5 — *"History & the runnable kit"*
**W5** (incident log + lifecycle history), **W8** (crisis-exercise pack + deepen scaffolds + training path). Outcome: ODT has a believable past and a kit you can actually run a workshop/crisis exercise from.

*(W0 governance and the Depth Reviews run continuously across all waves.)*

---

## 6. How a work session runs (unchanged loop, new source)

1. Read `SESSION-STATE.md` → pick the top item of the **active wave** below.
2. Check canon + schema before writing (Rule 1, Rule 2).
3. Produce/extend the note; wire its links and influence/context edges; if a number is involved, **canon-first → workbook → regenerate**.
4. Use the owner's "ask" capability for missing real inputs (figures, supplier names, decisions) rather than inventing.
5. Log the change in the note's changelog **and** `SESSION-STATE.md`; raise CCB tickets for anything found.
6. At wave boundaries / every ~3 sessions: run the **Depth & Completeness Review** (§3.2) and record the tier verdicts.

---

## 7. Open strategic questions for the owner
*(resolve as they come up; not blocking Wave 3 start)*
- ~~**Owner layer (DEC-02):** seed `owner` BEARS/STEWARDS now?~~ ✅ **Resolved 2026-06-28** — owner said seed it; 18 owners + 50 BEARS + 33 STEWARDS now live (DEC-02 Applied).
- **Opportunity modelling (W1):** model opportunities purely as narrative wired onto the existing objective tree, or does the owner want a distinct register/section in canon?
- **Realism inputs:** as we go, which real figures will the owner provide (supplier names, control costs, incident history, committee decisions) vs. which stay order-of-magnitude placeholders?
- **Depth ceiling:** which single path do we take all the way to **L3** first for the flagship demo — the S1 cyber decision, or the AURORA-GEO commitment decision?
