---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: new
tags: [worldbook, governance, committee, decision-log, operating-rhythm, status/new]
aliases: ["Risk & Opportunity Committee", "ROC", "ODT Decision Log", "Operating Rhythm"]
---
# 🏛️ Annex — Risk & Opportunity Committee (the operating rhythm)
> [!info] The keystone of "run ODT for real" (ROADMAP **W7**). This annex makes the data **move**: a standing committee reads the RIM, **decides** (fund a control / accept a residual / defer / transfer / invest in an opportunity), and the graph updates — exposure and FCF headroom shift, an edge is severed, an owner is named. The demo's whole thesis — *dynamic risk intelligence supports business and management decisions* — is this loop running. It reuses the change-control discipline we already run for canon ([[Canon Change & Issue Register|CCB]]), pointed at **ODT's own business choices**.

## 1. Purpose & mandate
The **Risk & Opportunity Committee (ROC)** is ODT's executive forum for managing the converging risk-and-opportunity portfolio against the FY2028 plan and the **~$250M H1 2029 IPO** ([[Canon & Figures Register|TCO-04]] / [[Annex - Objectives & Opportunities|OPP-01]]). Its mandate:

- **Read the portfolio as a graph, not a list.** The [[ODT Risk Status & Executive Decision Brief - 2026-06-28|risk-manager brief]] is the standing input: six families converging on the same **−$100M** headroom.
- **Decide, and move the graph.** Every meaningful exposure becomes a logged decision with an owner, a cost, and a **before/after** the RIM can show.
- **Both sides of the ledger.** The ROC protects **value being created** ([[Annex - Objectives & Opportunities|OPP-01..05]]), not only loss avoided — an AURORA commit (OPP-02) is as much a committee item as a cyber control.
- **Hold the discipline.** No decision is "implicit": accept a residual *on the minute*, name an owner, or fund the control — but record it.

## 2. Membership & roles
Grounded in the [[Cast Roster]] — these are the named, interviewable owners who already **BEAR** the risks under discussion.

| Seat | Person | Standing role on the ROC |
|---|---|---|
| **Chair** | [[Elena Vasquez (CEO)\|Elena Vasquez]] (CEO) | Owns TCO-04 (IPO); breaks ties; sponsors company-defining decisions |
| **Finance** | [[Diane Marchetti (CFO)\|Diane Marchetti]] (CFO) | Funds controls; owns the −$100M/−$60M lines, the IPO file, insurance/financing |
| **Security** | [[Tom Reuter (CISO)\|Tom Reuter]] (CISO) | Bears 16/50 risks (the security cluster + S1); stewards the cyber controls |
| **Technology** | [[Raj Patel (CTO)\|Raj Patel]] (CTO) | Competitive positioning, optical-ISL maturation (AURORA) |
| **Programme** | [[Henrik Sorensen (Program Director)\|Henrik Sorensen]] (VP Programme) | The critical path; AURORA stage-gates |
| **Compliance** | [[Amara Diallo (VP Compliance & Quality)\|Amara Diallo]] | Accreditation, FCC/ITU, export-control posture |
| **Launch & Ops** | [[Yuki Tanaka (VP Launch Operations)\|Yuki Tanaka]] · [[Sofia Adler (VP Ground & Operations)\|Sofia Adler]] | Launch availability; service availability / NOC |
| **Supply chain** | [[Carlos Mendes (VP Manufacturing & Supply Chain)\|Carlos Mendes]] | Sole-source, build-chain integrity |
| **Secretariat** | Risk Management *(brief author)* | Prepares the RIM read, maintains the **Decision Log** (§6) |
| **Facilitator** *(attends for assessments)* | [[Maya Okonkwo (Facilitator)\|Maya Okonkwo]] | Runs the SPICE assessment that prices a scenario before the ROC decides |

## 3. Cadence & the operating loop
**Quarterly standing cycle**, plus **ad-hoc** sessions when a contingent risk's activation date fires (§ watch list in the brief) or a scenario re-prices through a trigger line.

```
   ① SPICE assessment            ② RIM read                ③ ROC decides
   (Maya + business set          (Secretariat: convergence  (fund / accept / defer /
    mitigation objectives,        graph, priced tail,        transfer / invest /
    price the scenario)           headroom vs −$100M)        name owner)
        │                              │                          │
        └──────────────▶──────────────┴───────────▶──────────────┘
                                                                  │
   ⑤ Review next cycle  ◀───────  ④ Graph updates  ◀─────────────┘
   (did exposure/FCF move          (mitigated scenario version, control
    as the decision intended?)      status, owner, edge severed)
```

Step ④ is where the RIM changes: a funded control flips status and a **mitigated scenario version** is authored (see [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] §C4) so the before/after is visible on the same family. Until a decision is taken and the control realised, that mitigated number is a **projection** (CR-01's realised-vs-projected rule) — which is exactly what a committee weighs.

## 4. Decision types (the mandate verbs)
| Verb | Meaning | Graph effect | Example |
|---|---|---|---|
| **Fund** | Capitalise a *planned/recommended* control | control → funded; mitigated version authored | DM-01 (S1 tower) |
| **Accept** | Take a residual knowingly, on the minute | risk annotated *accepted*; no control | D2 insurance-gap residual |
| **Defer / Watch** | Hold a contingent risk for a trigger | status stays *Contingent*; activation date set | DM-05 (RH-06 / RA-04) |
| **Transfer** | Move consequence to a third party | insurance/financing control cited | bridge facility / cyber tower |
| **Invest** | Commit to an **opportunity** | OPP advanced; its threat re-weighted | DM-03 (AURORA OPP-02) |
| **Assign owner** | Put a named executive on a gap | owner BEARS/STEWARDS edge | DM-07 (governance gaps) |

## 5. Risk appetite (current basis)
The ROC currently governs against **two canonical hard lines** — the de-facto appetite statement:
- **Liquidity trigger: FCF ≥ −$100M.** Below it → a distressed, dilutive raise *before* the IPO. This is the line the whole portfolio defends.
- **IPO-bridge assumption: FCF ≥ −$60M.** The plan the financing is underwritten against; the tighter working line.

> [!warning] `⟢ DATA GAP` — no per-type appetite yet
> Beyond these two aggregate lines there is **no stated appetite per risk type or tolerance band**, so "is *this* exposure acceptable?" is not yet answerable from data (risk-brief §9.3). A formal **risk-appetite statement** is a pending input for **W1/W7** — and is the natural companion to CR-01's out-of-scope "tolerance bands" workstream. The ROC operates on the two trigger lines until then.

## 6. The Decision Log
The ROC's standing register — ODT's own change-control, parallel to the [[Canon Change & Issue Register|CCB]]. Decisions are **DM-NN** (Decision, Management), seeded from the risk-brief slate (brief §7 D1–D7). One is fully worked as a before/after dossier; the rest are queued with a recommendation and an owner.

| ID | Decision | Type | Owner(s) | Recommend | Status |
|---|---|---|---|---|---|
| **[[Decision DM-01 - Fund the S1 Cyber Control Tower\|DM-01]]** | Fund the ~$5.5M S1 cyber control tower vs accept the tail | Fund | CISO steward · CFO fund · CEO sponsor | **Approve now** | ⭐ **Worked** — at ROC |
| **DM-02** | Close or consciously accept the insurance state-actor gap | Accept / Transfer | CFO | Decide explicitly | Queued |
| **DM-03** | Commit ODT's ~40% AURORA cash share now vs defer (stage-gate) | Invest (OPP-02) | CFO · Programme | Approve SM-AURORA-VARIANCE as funding condition | Queued |
| **DM-04** | Reduce the 30% government-revenue single-point dependency | Fund / Invest | Chief Commercial *(role)* | Fund SM-REVENUE-DIVERSIFY | Queued |
| **DM-05** | Resolve the two contingent-risk activations (RH-06, RA-04) | Defer / Watch | VP Ground · Programme | Go/no-go next cycle | Queued |
| **DM-06** | Address the CISO owner concentration (16/50) | Assign owner / Accept | CEO · CISO | Deputy plan **or** minute the acceptance | Queued |
| **DM-07** | Name executive owners for the 3 governance coverage-gaps | Assign owner | CEO | Name them (MO-GP1-2 / MO-FN1-3 / MO-GA1-3) | Queued |

> [!note] Why D1 is worked first
> It is the **highest-leverage decision in the portfolio** (brief §7): ~$5.5M severs the cyber→IPO path for ~**12×** the realistic feared loss, and the $50M insurance tower likely **won't pay** for the state-actor S1 cause — so the controls are the *primary* protection. It is also the cleanest **before/after** to animate on the RIM. The other six are real and queued; they convert to worked dossiers as the ROC takes them.

## 7. How the ROC maps to the RIM
- **Objectives & opportunities (W1):** every decision names the TCO/TPO it defends or the [[Annex - Objectives & Opportunities|OPP]] it advances.
- **Controls & owners (W2):** decisions act on the consolidated `Mitigation` register (status, capex/opex) and the `owner` BEARS/STEWARDS layer — the machinery [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] is standing up.
- **Scenario versions:** a "fund" decision authors a **mitigated scenario version** per case; the base stays visible (superseded) so the RIM shows the move.
- **The brief is the recurring read:** [[ODT Risk Status & Executive Decision Brief - 2026-06-28]] is cycle-one's input; each cycle re-reads the graph and appends to this log.

## Changelog
- 2026-06-28: **Annex created (W7).** Stood up the Risk & Opportunity Committee: mandate, cast-grounded membership, the quarterly operating loop (assess → read → decide → update → review), decision-type verbs, the current risk-appetite basis (−$100M / −$60M lines + flagged per-type gap), and the **Decision Log** seeded with **DM-01..07** from the risk-brief slate. **DM-01** (fund the S1 cyber tower) fully worked as a separate dossier ([[Decision DM-01 - Fund the S1 Cyber Control Tower]]). Ties W7 to W1 (opportunities), W2/[[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] (controls/owners + mitigated-version before/after) and the risk brief. All figures canon-cited; no new canon. Target tier **L2**.

> *Read alongside [[ODT Risk Status & Executive Decision Brief - 2026-06-28]] (the cycle-one read), [[Annex - Objectives & Opportunities]] (the upside it protects), [[Cast Roster]] (the members), and [[CR-01 - Mitigation Consolidation & SPICE Re-assessment]] (the controls/version mechanism the decisions move).*
