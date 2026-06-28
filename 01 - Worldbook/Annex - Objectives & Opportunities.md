---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: new
tags: [worldbook, objectives, opportunities, strategy, status/new]
aliases: ["Objectives & Opportunities", "Strategy Spine", "Opportunity Register"]
---
# 🎯 Annex — Objectives & Opportunities (the strategy spine)
> [!info] Both sides of the ledger. The bestiary models the **downside** (risks → IPO); this annex models the **upside** the RIM protects — the value ODT is *creating*. Every meaningful risk exists because it threatens an **objective** ODT must hold or an **opportunity** ODT is reaching for. The convergence thesis read from the *upside in*: every risk family threatens at least one opportunity. Numbers are canon-cited from [[Canon & Figures Register]]; this annex invents none.

## 1. Why this annex exists (the operating posture)
ODT is a company **mid-decision**, not a static catalogue. The RIM is the instrument management reads to make the call — so the data must answer *"what decision does this inform?"* A risk only matters because it puts a **value** at stake. This annex names those values and pairs each to the downside that threatens it, so the demo can show the RIM protecting **value being created**, not only loss being avoided. See [[ROADMAP]] §2 ("run ODT for real") and the W1 workstream.

> [!note] How opportunities are modelled
> RIM schema v3.0 has **no `opportunity` node type** (Rule 2 — don't invent schema). Opportunities are therefore **canonical narrative anchors** — `OPP-` IDs registered in [[Canon & Figures Register#Opportunity Register (the upside the RIM protects)|the Canon register]] and wired here onto the existing objective tree. They are not graph nodes; the *objectives* (`tco`/`tpo`) and the *risks* that impact them are the graph. *(Owner-confirmed model, 2026-06-28: distinct OPP register with IDs.)*

---

## 2. The objective tree (the strategy spine)
Two layers: **Top Company Objectives (TCO)** — the enterprise "why" — and **Top Programme Objectives (TPO)** — the dated, programme-level proof points that roll up to them via `CONTRIBUTES_TO`. A Business Risk threads to an objective via `IMPACTS_TCO` / `IMPACTS_TPO` (or reaches one through the influence graph).

### 2.1 Top Company Objectives
| TCO | Objective | Owner | Horizon | Role in the story |
|---|---|---|---|---|
| **TCO-01** | Reach & sustain **positive EBITDA** | CFO — [[Diane Marchetti (CFO)\|Diane]] | 2028 | The **first-profit** story; headline **enabler** of the IPO |
| **TCO-02** | Maintain **operating licenses & flawless safety record** | Chief Compliance Officer — cf. [[Amara Diallo (VP Compliance & Quality)\|Amara]] | Ongoing | Licence-to-operate; a breach here is existential, not financial |
| **TCO-03** | Achieve **commercial scale & customer diversification** | Chief Commercial Officer *(role-only)* | 2027–2029 | The growth + diversification leg under the IPO |
| **TCO-04** | Achieve a **successful IPO / liquidity event by H1 2029** | CEO — [[Elena Vasquez (CEO)\|Elena]] | H1 2029 | **The apex.** Every family converges here ([[Canon & Figures Register\|TCO-04]]) |

### 2.2 Top Programme Objectives → rollup
| TPO | Objective (dated) | `CONTRIBUTES_TO` | Edge |
|---|---|---|---|
| **TPO-01** | HORIZON-LEO revenue ramp / EBITDA breakeven by Q4'28 | TCO-01 **and** TCO-04 | `CTR-01`, `CTR-07` |
| **TPO-02** | Complete Phase-3 deployment by Q2'27 | TCO-01 | `CTR-02` |
| **TPO-03** | Secure FCC operational licence by Q3'26 | TCO-02 | `CTR-03` |
| **TPO-04** | Win first **$10M+ Government contract** by Q4'26 | TCO-03 | `CTR-05` |
| **TPO-05** | **AURORA-GEO** passes PDR gate by Q1'27 (TRL 4+) | TCO-03 | `CTR-06` |
| **TPO-06** | Maintain zero debris-generation incidents | TCO-02 | `CTR-04` |

> [!important] The apex
> **TPO-01** is the only programme objective that contributes to **TCO-04** directly (`CTR-07`) — the revenue/EBITDA ramp is the headline IPO proof point. Everything else reaches the IPO through the **risk** graph: the financial-risk cluster **RC-01/RC-02/RC-03** `IMPACTS_TCO` → **TCO-04**. [[BST-FN1 IPO Window Collapse (Financial)|FN1]] is the scenario of failing it.

---

## 3. The Opportunity Register (the upside, paired to its downside)
Each opportunity **advances** an objective and is **threatened by** a named downside family — the principle that *every upside names the downside that threatens it*. Canonical IDs and values live in [[Canon & Figures Register#Opportunity Register (the upside the RIM protects)|the Canon register]]; the pairings are elaborated here.

### OPP-01 — IPO / liquidity event *(the prize)*
- **Value:** ~$250M, Nasdaq, **H1 2029** · **Advances:** TCO-04 (apex) · **Bearer:** [[Elena Vasquez (CEO)|Elena]] / [[Diane Marchetti (CFO)|Diane]] (the IPO file).
- **Threatened by:** [[BST-FN1 IPO Window Collapse (Financial)|FN1]] directly — and, through the convergence, by **every** family. S1/SC1/RG1/GP1/GA1 all funnel into **RC-01/RC-02/RC-03**, which impact TCO-04. The IPO is sold on a credible first-profit story (OPP-05), diversified scaling revenue (OPP-03/04) and a second-act narrative (OPP-02); break any of those and the apex wobbles.
- **The headroom it competes for:** the **−$100M FCF** liquidity trigger and the **−$60M** IPO-bridge assumption. The whole graph is a fight over this headroom.

### OPP-02 — AURORA-GEO second P&L *(the equity second act)*
- **Value:** ~$50M programme (~$20M ODT share); the **BP-GEO** perimeter · **Advances:** TCO-03 (via TPO-05 PDR); **reinforces TCO-04** as the growth narrative · **Bearer:** [[Henrik Sorensen (Program Director)|Henrik]] / AURORA Program Director.
- **Threatened by:** [[BST-GA1 AURORA-GEO Development Overrun (Programme)|GA1]] / **RA-02** (development budget overrun) / **RA-04** (strategic-partner withdrawal). Partner withdrawal forces ODT to absorb a larger share of the budget (now wired `RA-04 → RA-02`, ENH-07), which drains into company cash (`RA-02 → RC-02`) — the cross-perimeter path onto the IPO.
- See [[Annex - AURORA-GEO Programme]] §6 (cross-perimeter convergence) and §9 (the equity second-act narrative).

### OPP-03 — Anchor Government contract *(diversification beachhead)*
- **Value:** **$10M+ ARR** by Q4 2026 · **Advances:** TCO-03 (via TPO-04) · **Bearer:** Chief Commercial Officer / VP Sales *(role-only)*.
- **Threatened by:** [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]] (accreditation suspension freezes new task orders) / [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] (export-control + launch disruption) / **RH-05** (government pipeline failure). The Gov segment is the highest-ARPU revenue (~$5–25M ARR/contract) but accreditation-gated — the upside and its threat are the same regulatory surface.

### OPP-04 — Commercial scale & diversification *(reduce the 30% gov concentration)*
- **Value:** corporate backlog growth (~$1.2M ARR/account, **LTV:CAC ~4.8:1**, CAC payback ~13 mo) · **Advances:** TCO-03 · **Bearer:** Chief Commercial Officer *(role-only)*.
- **Threatened by:** [[BST-S1 NOC Ground Compromise (Cyber)|S1]] — a **severe public incident adds +15–25 pts of churn**, which compounds over the multi-year SLA base — plus **RC-05** (reputational damage) and **RH-04** (competitive positioning vs mega-constellations). Diversification is both the goal (less single-segment dependency) and the thing an incident erodes fastest.

### OPP-05 — First profitable year *(the IPO story itself)*
- **Value:** **+$13M EBIT** (FY2028) — the first positive year · **Advances:** TCO-01 (the headline IPO enabler) · **Bearer:** [[Diane Marchetti (CFO)|Diane]].
- **Threatened by:** [[BST-S1 NOC Ground Compromise (Cyber)|S1]] most sharply — **$69M** turns **+$13M EBIT into ≈ −$41M**, erasing the entire first-profit story — plus SC1, **RH-01** (Phase-3 slip → revenue) and **RH-03** (corporate revenue miss). With ~75% fixed costs, an outage hits margin almost 1:1.

> [!note] One upside, many threats — the convergence read from the top
> | Opportunity | Advances | Threatened by (families) |
> |---|---|---|
> | OPP-01 IPO | TCO-04 | FN1 + all (convergence) |
> | OPP-02 AURORA-GEO | TCO-03 / TCO-04 | GA1 (RA-02 / RA-04) |
> | OPP-03 Gov contract | TCO-03 | RG1 / GP1 / RH-05 |
> | OPP-04 Diversification | TCO-03 | S1 / RC-05 / RH-04 |
> | OPP-05 First profit | TCO-01 | S1 / SC1 / RH-01 / RH-03 |
>
> Read down the right column: **every bestiary family appears.** That is the convergence thesis stated from the upside — the RIM protects a portfolio of value, and the risks gang up on it.

---

## 4. Threading completeness — every Business Risk reaches an objective
A W1 invariant: **every business-level risk threads to an objective**, directly or through the influence graph. Verified 2026-06-28 across all 17 business risks (RC-01..05, RH-01..07, RA-01..05).

| Reaches an objective… | Risks |
|---|---|
| **Directly** (`IMPACTS_TCO` / `IMPACTS_TPO`) | RC-01, RC-02, RC-03, RC-04, RC-05, RH-01, RH-02, RH-03, RH-05, RH-07, RA-01, RA-03, RA-05 |
| **Via the influence graph** | RH-04 → RH-03 → TPO-01 · RA-02 → RC-02 → TCO-04 · **RH-06 → RH-03 → TPO-01** *(new)* · **RA-04 → RA-02 → RC-02 → TCO-04** *(new)* |

> [!warning] Gap found & closed — ENH-07 (2026-06-28)
> Two contingent business risks had **no path to any objective**: **RH-06** (ground-segment capacity bottleneck) and **RA-04** (strategic-partner withdrawal). Closed by adding two `INFLUENCES` edges in the workbook — **INF-46** (`RH-06 → RH-03`) and **INF-47** (`RA-04 → RA-02`) — regenerated `demo_seed.cypher` (3883 lines, 126 relationships). Now **17/17** business risks thread to an objective. Logged as [[Canon Change & Issue Register#ENH-07|ENH-07 Applied]].

---

## 5. How RIM reads this
- **Objectives view:** the `tco`/`tpo` tree with `CONTRIBUTES_TO` rollups; risks hang off via `IMPACTS_*`. The apex **TCO-04** is where every scope eventually points — see [[Annex - RIM Anchoring]].
- **Opportunity framing:** OPP-IDs are reporting/narrative anchors, not nodes — used in board surfaces ([[Sponsor Exec Briefing - Risks That Converge on the IPO]]) and the risk-manager brief to say *"this exposure threatens OPP-01, our ~$250M IPO."*
- **Decision support (W7):** an opportunity + its paired threat is a ready-made committee item — *"fund the control that protects OPP-05's first-profit story, or accept the S1 tail?"* The brief's **D1** is exactly this.

## Changelog
- 2026-06-28: **Annex created (W1).** Strategy spine (TCO/TPO tree + rollups + owners) + **Opportunity Register OPP-01..05** wired to the objective tree and paired each to its threatening family. Owner-confirmed model (distinct OPP IDs in canon). Documented threading completeness and the **ENH-07** fix (RH-06/RA-04 now thread; INF-46/INF-47 added; seed regenerated). All figures canon-cited (no new canon figures). Target tier **L2**.

> *Read alongside [[Canon & Figures Register]] (figures + OPP register), [[Bestiary Index]] (the downside families), [[Annex - AURORA-GEO Programme]] (OPP-02 depth) and [[Annex - RIM Anchoring]] (how the tree renders in RIM).*
