---
type: gm-kit
sourcebook-line: "05 - GM Kit"
status: new
tags: [gm-kit, crisis-exercise, tabletop, s1, cyber, runnable, w8, status/new]
aliases: ["S1 Crisis Exercise", "Crisis Exercise", "NOC Compromise Tabletop"]
---
# 🚨 Crisis Exercise — S1 NOC / Ground-Segment Compromise
> [!info] A **runnable tabletop**: a 90-minute facilitated crisis simulation of [[BST-S1 NOC Ground Compromise (Cyber)|S1]] in which the team reads the RIM graph under pressure and makes the call ([[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]]) live. Distinct from the [[Module Template|SPICE elicitation workshop]] (which *prices* a scenario) — this exercise *runs* the priced scenario as an incident, so participants feel the **service-vs-financial recovery gap** and the **insurance exclusion trap**. Every figure is canon-cited from [[Canon & Figures Register]]; nothing here is invented. *(Workstream **W8**; target tier **L2**.)*

## 0. At a glance
| | |
|---|---|
| **Duration** | 90 min (60 min compressed; 120 min with full debrief) |
| **Players** | 5–8 (the [[Annex - Risk & Opportunity Committee|ROC]] membership) + 1 facilitator |
| **Mode** | Tabletop / inject-driven; the RIM graph is projected and queried live |
| **Setting** | **State B, Jun 2028** — 56 sats operational, first EBIT+ year (+$13M), IPO H1 2029 |
| **Pre-read** | [[BST-S1 NOC Ground Compromise (Cyber)|S1 entry]] · [[Annex - Security Architecture]] §7 · the [[#9. Facilitator cheat-card|cheat-card]] below |
| **You will need** | the RIM loaded with `demo_seed.cypher`; the cheat-card; the [[#10. Inject cards (printable)|inject cards]] |

## 1. Learning objectives
1. **Read the graph under pressure** — find the S1 kill-chain (EP-02 → TP-IDP → TP-NMS → TP-NOC → FT-CTRL) and the path to the IPO (RC-01/02/03 → TCO-04) *while the clock runs.*
2. **Feel the recovery gap** — service restoration (days) ≠ financial recovery (years); 75% fixed cost means revenue loss flows ~1:1 to margin.
3. **Make the DM-01 call live** — fund the ~$5.5M controls vs accept the tail, *knowing the insurance won't pay.*
4. **See the trigger** — watch the pessimistic case cross **−$100M FCF** and the S1→FN1 path light up.

## 2. Roles (cast-grounded)
| Seat | Cast | In-exercise job |
|---|---|---|
| **Incident Commander** | [[Tom Reuter (CISO)\|Tom Reuter, CISO]] | runs containment; bears 16/50 risks; stewards the controls |
| **Chair / accountable** | [[Cast Roster\|Elena Vasquez, CEO]] | owns TCO-04 (the IPO); makes the final call |
| **Finance** | [[Diane Marchetti (CFO)\|Diane Marchetti, CFO]] | reads FCF vs the −$100M trigger; funds (or not) |
| **Operations** | [[Sofia Adler (VP Ground & Ops)\|Sofia Adler]] | the NOC floor; service-restoration reality |
| **Comms / facilitator-in-world** | [[Cast Roster\|Maya Okonkwo]] | customer & press narrative; attribution pressure |
| **Compliance** | [[Amara Diallo (VP Compliance & Quality)\|Amara Diallo]] | the DoD-accreditation angle (RG1 adjacency) |
| *(optional)* Insurer / Board observer | facilitator NPC | delivers the exclusion ruling (Inject 4) |

## 3. Facilitator pre-brief (read aloud, 3 min)
> "It's a Tuesday in June 2028. The constellation is 56 birds strong, you're cash-flow negative by plan (−$40M FCF) but EBIT-positive for the first time, and the IPO window opens in ~9 months. At 09:14 the NOC sees something wrong with the beam plan. This is not a drill — well, it is, but play it like it isn't. The RIM is on the screen; use it."

**Starting state on the graph:** S1 base version is `current` (controls are `planned`, un-funded). The two cyber controls (SM-IDENTITY-SPLIT ~$4M, SM-CTRL-RECOVERY ~$1.5M) sit un-capitalised. The $50M cyber tower is in force. HX-02 (a *blocked* phishing attempt, 2027) is in the log — "routine attempts we handle." This is not that.

## 4. The timeline & injects
Run the injects in order; after each, ask the table "**what does the RIM show, and what do you decide?**" Hold ~12–15 min per inject.

| T | Inject | What the RIM shows (SHOW) | The decision it forces |
|---|---|---|---|
| **T+0** | **Detection.** NMS beam/capacity config is wrong; operators see fleet anomalies | `TP-NMS` lit; trace `EP-02` (MSSP access) → `TP-IDP` (shared identity plane) → `TP-NMS`/`TP-NOC` | Declare incident? Pull MSSP access? Who's IC? |
| **T+2h** | **Escalation.** Operator credentials revoked by the attacker; fleet trips **fleet-wide safe-mode** | `FT-CTRL` (legitimate command) seized; **Dublin is not a backup** (shares `TP-IDP`) | Fail over (won't help — same plane) or rebuild control plane? |
| **T+1d** | **The exclusion.** Insurer signals the **war/state-actor exclusion**; attribution points state-aligned | the $50M tower's coverage is **illusory here** (MO-FN1-2's 120% partly fictional) | Stop banking on insurance — what's the *real* protection? |
| **T+3d** | **The bill.** Service degraded; churn + SLA credits + gov-confidence hit accumulate | S1 cases: realistic **−$69M EBIT / −$79M FCF**; **pessimistic −$118M FCF** | Is this realistic or pessimistic? Watch the trigger. |
| **T+decision** | **The call (DM-01).** Fund ~$5.5M controls, or accept the tail? | base vs **projected mitigated v2**: pess FCF **−118 → −82** (held above −100), S1→FN1 **severed** | **Fund / Accept / Partial** — minute it |
| **T+debrief** | **Resolution.** Service back in ~3 wks; financial recovery 2–3 yrs | the recovery gap; TCO-04 protected (or not) | What do we change before the IPO? |

## 5. The decision points (facilitator depth)
- **D1 — Fund vs accept (the [[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]] call).** Option A fund both (~$5.5M) → pessimistic held above −$100M, S1→FN1 severed, ~12× the realistic feared loss. Option B accept → exposed to the exclusion; one pessimistic S1 = trigger breach (must be **minuted as explicit acceptance** → DM-02). Option C partial (identity-split only) → keeps slow recovery.
- **D2 — The insurance gap.** The $50M tower carries the **war/state-actor exclusion**; S1's actor is state-aligned → **the controls are the primary protection, not a supplement.** This is the trap most tables fall into: "we're insured." (Pair with DM-02.)
- **D3 — Comms & attribution.** Attribution takes **days**; customers notice degraded service *before* ODT confirms cause → the press writes the story first. Maya's call: what to say, when.
- **D4 — Accreditation adjacency.** A public breach can trigger a DoD accreditation **review** ([[BST-RG1 Accreditation Suspension (Regulatory)|RG1]]) → 30% gov revenue at risk. Amara flags the second-order family.

## 6. The two endings
- **Funded (the projection realised).** Controls deployed → the mitigated v2 becomes `current`; pessimistic FCF held at **−82** (above −100); the **S1→FN1 path severs**; the ~$250M IPO (TCO-04) is protected. The ~$5.5M bought ~$66M of tail relief on the pessimistic FCF (and ~12× vs the realistic feared loss).
- **Accepted (the tail bites).** No spend; a pessimistic S1 takes FCF to **−$118M**, breaching the **−$100M** trigger → **FN1**: a distressed, dilutive raise *before* the IPO, or the window slips. Minute it as an explicit risk acceptance.

## 7. Debrief (15 min)
1. **Graph literacy:** could the table trace EP-02 → … → TCO-04 unaided? (If not, that's the training gap.)
2. **The recovery gap:** service back in weeks, money back in years — did the room feel it?
3. **The insurance lesson:** the comfortable answer evaporated (D2). Controls, not cover.
4. **History contrast:** HX-02 (2027) was a *blocked* attempt — routine, handled. S1 is the **un-handled tail** (state-actor + identity-plane flaw). The exercise is about the tail, not the everyday.
5. **What changes:** fund the controls? separate the identity plane (TP-IDP)? pressure-test the IT-only 2027 tabletop at constellation scale? (the real gap, per [[Annex - Security Architecture]] §7.3).

## 8. Variants
- **Fast (60'):** injects T+0, T+1d (exclusion), T+decision only.
- **Supply-chain swap:** re-skin on [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] (no outage, certification doubt) — same structure, different family.
- **Board mode:** start at T+decision; the table *is* the [[Annex - Risk & Opportunity Committee|ROC]] voting DM-01.

## 9. Facilitator cheat-card *(all canon)*
- **S1 cases (EBIT / FCF):** best −40 / −60 · realistic **−69 / −79** · pessimistic **−110 / −118**. Recovery: op ~3 wks (realistic), fin 2–3 yrs.
- **Triggers:** **−$100M FCF** = distressed raise (→FN1); **−$60M** = IPO-bridge assumption.
- **Controls:** SM-IDENTITY-SPLIT ~$4M + SM-CTRL-RECOVERY ~$1.5M = **~$5.5M** (`committed_budget`, planned). Mitigated pess FCF **−82** (above −100).
- **Insurance:** $50M limit, $5M deductible, BI after 72h, **war/state-actor exclusion**.
- **Economics:** revenue ~$0.74M/day (corp+gov ~$0.52M/day); **~75% fixed cost** → outage hits margin ~1:1; baseline EBIT **+$13M**.
- **Kill-chain:** `SPN-02`→`ATK-02`→`EP-02` (MSSP)→`TP-IDP`/`TP-NMS`/`TP-NOC`→`FT-CTRL` → safe-mode. Dublin shares TP-IDP (not a backup).
- **Apex:** S1 illustrates RH-04; RC-01/02/03 `IMPACTS_TCO` **TCO-04** (the IPO).

## 10. Inject cards (printable)
> **INJECT 1 — T+0 DETECTION.** "NMS shows a beam/capacity config none of you pushed. Three enterprise customers report degraded service. Is this an incident?"
>
> **INJECT 2 — T+2h ESCALATION.** "Operator credentials are being revoked faster than you can re-issue them. The fleet is entering safe-mode. Dublin can't take over — it's the same identity plane."
>
> **INJECT 3 — T+1d EXCLUSION.** "Your broker calls: early read is a state-aligned actor. The cyber tower's war/state-actor exclusion is in play. Do not assume the $50M pays."
>
> **INJECT 4 — T+3d THE BILL.** "Churn signals are spiking; SLA credits are mounting; a gov customer asks about your accreditation. Finance: where does FCF land — realistic, or pessimistic?"
>
> **INJECT 5 — DECISION (DM-01).** "ROC is convened. Fund the ~$5.5M control tower, accept the tail, or go partial? You have 10 minutes. Minute the decision."

## Changelog
- 2026-06-29: **Created (W8 — runnable crisis-exercise pack, target L2).** First full crisis tabletop: a 90-min inject-driven simulation of S1 run on the RIM graph, with cast-grounded roles ([[Annex - Risk & Opportunity Committee|ROC]] seats), a 6-inject timeline, 4 decision points (the DM-01 fund-vs-accept call + the insurance-exclusion trap + comms/attribution + RG1 accreditation adjacency), two endings (funded projection vs accept→FN1), a debrief, variants, a canon cheat-card, and printable inject cards. Consumes W2/W6/W3/W5 layers (kill-chain, controls, mitigated version, history); **no schema/graph change**. All figures canon-cited; no new canon. Wired into [[Sourcebook Index]] + the [[Training Path]] (capstone).
