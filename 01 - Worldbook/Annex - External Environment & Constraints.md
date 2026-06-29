---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: new
tags: [worldbook, external, regulatory, geopolitical, market, constraints, w3, status/new]
aliases: ["External Environment & Constraints", "Regulatory & External", "Constraints Annex"]
---
# 🌐 Annex — External Environment & Constraints
> [!info] The boundaries ODT operates **inside**. Risks don't arise in a vacuum — they are shaped by spectrum regulators, export-control regimes, a government accreditation gate, the ESA/NASA partnership, the launch market, and the capital-market window the whole story is racing toward. This annex names those constraints, ties each to the risks it bears on, and shows how the *external* perimeter funnels into the same IPO window the bestiary converges on. Every name, standard, and figure is canon-cited from [[Canon & Figures Register]]; this annex invents none. *(Workstream **W3**; target tier **L2**.)*

## 1. Why this annex exists
A board judges a New-Space company as much by the **regime it operates in** as by its technology: who licenses its spectrum, what export rules gate its partnerships, what accreditation gates its best revenue, and whether the IPO window will be open when it arrives. This annex makes that external perimeter explicit so the RIM can show a risk's *root cause living outside the company* — and so the regulatory/geopolitical families ([[BST-RG1 Accreditation Suspension (Regulatory)|RG1]], [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]]) anchor to real constraints.

> [!note] How constraints are modelled (schema-true)
> RIM v3.0 has **no `regulator` / `external_constraint` node**. Constraints are modelled two ways: (1) the **`regulatory_compliance` risk subtype** — `regulatory_body`, `applicable_standard`, `licence_stage` — populated on the six regulatory risks below; (2) this **narrative annex** for the regimes that aren't reducible to a single risk (ESA/NASA terms, launch market, macro). *A first-class constraint node (so one regulator can govern several risks/activities) is a candidate schema change — see [[CR-02 - External Entities (Supplier & Regulatory)|CR-02]], raised with RIM 2026-06-29.*

## 2. The six-layer external perimeter
| Layer | The constraint | Bears on (risks) | Canon |
|---|---|---|---|
| **Spectrum & licensing** | **FCC** Part 25 (Q3 2026 gate) · **ITU** frequency coordination / priority filing | ROR-01, RH-07, RC-04 | Programme; TPO-03 |
| **Export control** | **ITAR / EAR** (US DDTC, 22 CFR 120–130) — gates non-US tech transfer | RA-05, ROH-02, GP1 | AURORA §6 |
| **Government accreditation** | **DoD security accreditation** — gates 30% of revenue ($81M Gov & Defense) | RH-05, RG1 | RG1; Sec-Arch §7.3 |
| **Partnership terms** | **ESA/NASA** AURORA co-funding (~60/40), PDR gate Q1 2027 | RA-01..05, GA1 | AURORA §4 |
| **Launch market** | **SpaceX / Rocket Lab** (+ Axiom), committed 2025–2029; congestion | ROL-01, GP1 | Sec-Arch §7.2 |
| **Capital markets** | **IPO window H1 2029** (~$250M Nasdaq); −$100M trigger / −$60M bridge | RC-01/02/03, FN1 | Finance; State B |

## 3. Spectrum & licensing — FCC + ITU
- **FCC (47 CFR Part 25).** Operational approval targeted **Q3 2026** (TPO-03) — a prerequisite for Phase-1 launches. Tracked by **ROR-01** (`regulatory_body: FCC`, `licence_stage: Part 25 operational approval`); owner **[[Amara Diallo (VP Compliance & Quality)|Amara Diallo]]**.
- **ITU.** Frequency coordination / **priority filing** for the 80-satellite constellation; losing priority or failing coordination with incumbents limits accessible spectrum. Tracked by **RH-07** (`regulatory_body: ITU`).
- **Multi-jurisdiction.** **RC-04** is the company-level risk that FCC + ITU + ESA + national authorities **fail simultaneously** — compliance is distributed, so a coordinated stumble halts deployment.

## 4. Export control — ITAR / EAR (the AURORA tax)
Because **AURORA-GEO** shares optical & relay technology with **non-US partners**, it sits squarely under **US export control (ITAR)**. The friction is structural, not incidental:
- **RA-05** (`regulatory_body: US DDTC`, `ITAR 22 CFR 120–130`) — export rules block critical tech-sharing with partners. **`INFLUENCES` RA-04 (Strong, INF-31):** ITAR friction can push a partner to *withdraw* rather than navigate the controls — turning a compliance constraint into a co-funding shock ([[BST-GA1 AURORA-GEO Development Overrun (Programme)|GA1]]). Mitigated by **MIT-20** (ITAR compliance system).
- **ROH-02** — the **ITAR-cleared personnel shortage**: the deemed-export rules shrink the workforce that can legally touch the technology.
- **Geopolitical vector:** a tightening of ITAR/EAR, sanctions, or a sole-source supplier's home-state restriction is exactly [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]]'s root cause.

## 5. Government accreditation — the gate on the best revenue
A **DoD security accreditation** gates **new Government & Defense task orders** — **30% of revenue ($81M FY2028)**, the highest-ARPU segment ($5–25M ARR/contract). The enclave is *isolated, audited, and contractually mandatory* ([[Annex - Security Architecture]] §7.3). The threat is [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]]: an accreditation review (a breach, a failed audit, or a [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] policy shift) **suspends new task orders immediately** — no outage required — and after 30 degraded days, contracts carry a termination right. Tracked via **RH-05** (`regulatory_body: DoD accreditation authority`). Detection is *immediate and explicit* (a regulator's letter) — unlike cyber, there is no attribution delay.

## 6. Partnership terms — ESA / NASA (AURORA-GEO)
- **Co-funding:** ~**$50M** Phase-A/B→PDR budget, ~**60% ESA/NASA** (~$30M) / ~**40% ODT** (~$20M own-cash); ODT's FY2028 internal burn ~**$10M** (BP-GEO `fcf_baseline`).
- **Governance milestones:** **PDR gate Q1 2027** (TPO-05), subsystems at **TRL 4+**; **partner-commitment checkpoint 2026-12-31** (the RA-04 activation date).
- **Withdrawal:** **RA-04** (Contingent) — if a partner exits (export friction, M&A, reassessment), the budget ODT absorbs jumps from its ~40% share toward full programme cost → **RA-02 → RC-02 → TCO-04** (INF-47): a partnership-terms shock reaches the IPO.

## 7. Launch market
- **Providers:** **SpaceX Falcon 9** + **Rocket Lab Electron** (future **Axiom**), multi-sourced, **committed 2025–2029**; ~**$3.4M/sat incl. launch**.
- **Constraint:** manifest **congestion** (ROL-01 — a 6+ month slot gap) or an allied-launcher dispute / sanctions on a launcher's home state (GP1) slips Phase-4; a slip extends the Phase-4 CapEx burn ($77M total / $72M FY2028 cash) into the post-IPO period, pressing FCF toward the −$100M trigger. Mitigated by **MIT-01** (multi-launcher strategy).

## 8. Geopolitics & sanctions
GP1 is **"the most forecastable family, but the slowest to mitigate"** — policy signals (consultations, watchlists) precede the event, but the response window is months, not weeks. Vectors: ITAR/EAR tightening; sanctions; a **sole-source supplier's home-state** exposure — **Teledyne** (US, RF) and **Saft** (EU, batteries) are single points with 9–12 month lead times and no qualified alternates ([[Annex - Supply Chain & Production]]). GP1 illustrates **RH-04** (competitive positioning) and **RA-02** (cross-perimeter into AURORA).

## 9. Capital markets — the window everything races toward
The external constraint that makes all the others *converge*: the **H1 2029 ~$250M Nasdaq IPO**. The plan rests on FY2028 delivery (first **+$13M EBIT**, **$270M** revenue, 56 operational sats). Two canonical lines bound it:
- **−$100M FCF liquidity trigger** — below it, a **distressed raise before the IPO** (the FN1 sink).
- **−$60M IPO-bridge assumption** — the plan is underwritten against this.
Public markets **re-rate on churn** (LTV:CAC): a visible incident can move the multiple ODT trades at ([[Annex - Finance & Unit Economics]] §6.4). There is **no separate macro/recession risk node** (a known gap) — macro deterioration is captured only through FN1's distressed-raise branch.

## 10. How RIM reads this
- **Regulatory exposure:** filter risks by `regulatory_body` → the FCC / ITU / ITAR / DoD clusters surface; `licence_stage` shows where each sits (e.g. FCC "Part 25 approval, Q3 2026 gate").
- **External → internal:** the annex makes each family's *root cause outside the company* explicit — GP1 (export/launch), RG1 (accreditation), RA-04/05 (ESA-NASA/ITAR) — all threading to the **same IPO window** (TCO-04) via the financial cluster RC-01/02/03.
- **Owner:** the spectrum/export/accreditation perimeter is concentrated on **[[Amara Diallo (VP Compliance & Quality)|Amara Diallo]]** (FCC, ITU, ITAR/EAR, accreditation) — a named owner to interview/escalate.

## 11. Forward work
- **[[CR-02 - External Entities (Supplier & Regulatory)|CR-02]] (raised 2026-06-29)** — propose a first-class **`regulator`/`external_constraint`** node (+ a `supplier` node) so one regulator can `GOVERNS` several risks/activities and a regulatory-exposure view is a graph query, not an annex read. Until agreed, constraints stay on-risk (`regulatory_compliance` subtype) + this annex.
- **Macro risk node** — consider an explicit "capital-market / rate shock" risk feeding FN1 (today macro lives only in the FN1 narrative).
- **National launch-country authorities** — currently folded into RC-04; split out if a launch-licensing scenario is needed.

## Changelog
- 2026-06-29: **Annex created (W3 — external environment & constraints, target L2).** Documented the six-layer external perimeter (spectrum/FCC+ITU, export-control/ITAR, DoD accreditation, ESA/NASA partnership terms, launch market, capital-market/IPO window) and tied each to the risks it bears on. Populated the **`regulatory_compliance` subtype** (`regulatory_body`/`applicable_standard`/`licence_stage`) on **6 risks** — RC-04, RH-05, RH-07, RA-05, ROH-02, ROR-01 — in the workbook; generator extended to emit them; seed regenerated (`demo_seed.cypher`, 4296 lines). All names/figures canon-cited; **no new canon figures.** Wired into [[Sourcebook Index]]. Raised **[[CR-02 - External Entities (Supplier & Regulatory)|CR-02]]** with RIM (first-class supplier + regulator/constraint nodes). Open: macro risk node; national launch authorities.
