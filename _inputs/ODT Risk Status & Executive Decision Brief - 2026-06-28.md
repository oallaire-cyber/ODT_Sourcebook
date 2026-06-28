---
type: briefing
sourcebook-line: "_inputs"
status: draft
prepared-by: Risk Management, Orbital Dynamics Technologies
reporting-position: "State B — Operator phase (FY2028 plan)"
produced: 2026-06-28
classification: Executive Committee / Board Risk Committee
tags: [risk-status, executive-brief, rim, spice, status/draft]
---

# ODT — Enterprise Risk Status & Executive Decision Brief

**Prepared by:** Risk Management · **For:** Executive Committee & Board Risk Committee
**Reporting position:** State B — Operator phase, FY2028 Annual Operating Plan
**Produced:** 28 June 2026

> [!note] Scope & provenance
> This brief reports ODT's risk position **exclusively** from the managed risk dataset (the RIM graph generated from `_inputs/workbook.yaml`) and the figures in the [[Canon & Figures Register]]. Every number is traceable to a node, an edge, or a canon line; nothing is estimated outside the dataset. Where a decision would benefit from data we do **not** yet hold, the point is flagged **`⟢ DATA GAP`** and collected in §9 to feed the [[ROADMAP]] — it is not filled with invention. Figures are order-of-magnitude by design (fiction disclaimer applies).

---

## 1. Executive summary

ODT enters its first profitable year in a deceptively strong position and a structurally fragile one at the same time. The FY2028 plan delivers **+$13M EBIT** — the first positive year, and the headline of the IPO story — on **$270M revenue**. But free cash flow is **−$40M by design**, and our own liquidity covenant trips a distressed, dilution-forcing raise if FCF falls below **−$100M**. We are running, in other words, with roughly **$60M of cash-flow headroom** between the plan and the event that would derail the **~$250M H1 2029 IPO** (TCO-04) we are building toward.

The central finding of this assessment is not any single risk. It is **convergence**. The risk graph shows **six independent risk families — cyber, supply-chain, regulatory, geopolitical, programme (AURORA-GEO) and the financial sink — all draining, by different routes, into the same three company financial risks** (EBITDA miss, cash-runway exhaustion, loss of investor confidence), which in turn bear directly on the IPO. No one of them is, in isolation, a company-ending event. **Several of them landing in the same year is.** That is what the −$100M trigger exists to catch, and what the SPICE-priced scenarios in §4 quantify.

The single most consequential decision in front of the Committee is therefore not abstract: **fund the ~$5.5M cyber control tower now.** The realistic cyber scenario (S1) costs ≈**$69M** and turns our +$13M EBIT into ≈**−$41M**; the pessimistic case puts FCF at **−$118M — past the −$100M trigger.** Two controls totalling ~$5.5M pull that pessimistic tail back above the trigger and sever the path from a cyber incident to a forced raise — roughly a **12× return** against the realistic feared loss. Both controls are presently **un-funded (status: planned)**. Detail and the full decision slate are in §7.

---

## 2. The position we are protecting

ODT is no longer a pre-revenue scale-up; it is an operator with 56 satellites in service. The numbers we are defending (State B, FY2028 plan):

| What | Figure | Why it matters to risk |
|---|---|---|
| Revenue | **$270M** | 70% of it is corporate + government (SLA- and accreditation-gated) |
| EBIT | **+$13M** | first positive year — *the* IPO proof point (TCO-01 enables TCO-04) |
| EBITDA | **+$45M** | 16.7% margin; ~75% of costs are fixed, so an outage hits margin almost 1:1 |
| Free cash flow | **−$40M** | negative by design (Phase-4 CapEx); the metric the IPO bridge is built on |
| IPO-bridge assumption | FCF ≥ **−$60M** | the plan the financing is underwritten against |
| Liquidity trigger | **−$100M FCF** | below this → distressed raise *before* the IPO window |
| Cash | **$85M + $60M facility** | the buffer; the facility (SM-BRIDGE-FACILITY) is the last line |
| IPO | **~$250M, Nasdaq, H1 2029** | the value the whole portfolio exists to protect |

Two structural features make this position fragile rather than comfortable. First, the **~75% fixed-cost share** means lost availability or lost revenue flows almost directly to the bottom line — there is little variable cost to shed in a downturn. Second, the headroom is thin and *cumulative*: the IPO bridge assumes FCF no worse than −$60M; the plan is at −$40M; a single material scenario can consume the gap, and the scenarios are not mutually exclusive.

---

## 3. The risk landscape — what the graph shows

The managed portfolio holds **50 risks** — 17 business-level (programme and company) and 33 operational — across three scopes: the operating **HORIZON-LEO** constellation, the **AURORA-GEO** development programme (our pre-revenue second perimeter), and **company**-level corporate/financial risk. Two risks are **Contingent**, awaiting a formal activation decision (§8); the rest are Active.

### 3.1 Highest-exposure risks (likelihood × severity, RIM scoring)

The schema's own alert line treats **exposure ≥ 50 as high**. Ten risks sit at or above it:

| Risk | Exposure | Bearer (accountable) | Scope |
|---|---:|---|---|
| **RC-01** Failure to reach EBITDA-positive | **60** | Elena Vasquez (CEO) | Company |
| **RH-01** Phase-3 launch schedule delay | **56** | Yuki Tanaka (VP Launch Ops) | LEO |
| **RC-02** Cash-runway exhaustion | **50** | Diane Marchetti (CFO) | Company |
| **ROH-01** Key engineering-talent attrition | **49** | HR Director *(unnamed)* | Company |
| **RH-04** Loss of competitive positioning | **48** | Raj Patel (CTO) | LEO |
| **ROL-01** Launch-vehicle availability gap | **48** | Yuki Tanaka (VP Launch Ops) | LEO |
| **SEC-04** Ransomware on ground segment | **45** | Tom Reuter (CISO) | LEO |
| **SEC-06** Engineering-data exfiltration | **45** | Tom Reuter (CISO) | Company |
| **RCY-02** PLM compromise (design data) | **45** | Tom Reuter (CISO) | Security Ops |
| **RA-03** Optical-ISL maturation failure | **45** | Raj Patel (CTO) | GEO |

The portfolio also carries a long **tail** of catastrophic-severity, lower-likelihood risks — most of the security cluster (SEC-01 APT command-and-control, SEC-12/13 firmware/key compromise, ROL-02 debris collision) scores severity **9–10**. These do not dominate the likelihood×severity ranking, but they are precisely the events that SPICE prices, because their *financial* tail is what threatens the IPO.

### 3.2 The convergence thesis (the core insight)

Read as a graph rather than a list, the portfolio has a shape. Operational causes propagate up into programme/business risks, which feed three **company financial risks** that all impact the IPO objective directly:

```
operational causes ─▶ business risks ─▶  RC-01  EBITDA miss      ┐
(cyber, supply,                          RC-02  cash runway      ├▶ TCO-04  IPO (H1 2029, ~$250M)
 launch, regulatory,                     RC-03  investor conf.   ┘
 AURORA overrun)                              ▲
                                    BST-FN1 = the scenario of failing here
```

Each of the six bestiary families illustrates a business risk whose influence chain reaches that financial cluster:

- **S1 (cyber)** → RH-04 competitive positioning → RH-03 revenue → RC-01/RC-02
- **SC1 (supply-chain)** → RH-02 on-orbit degradation → RH-03 → RC-01
- **RG1 (regulatory)** → RH-05 government pipeline → RC-01
- **GP1 (geopolitical)** → RH-04 *and* RA-02 (AURORA budget) → RC-02 — the cross-perimeter reach
- **GA1 (AURORA-GEO)** → RA-02 overrun / RA-04 partner → RC-02
- **FN1 (financial)** → RC-01/RC-02/RC-03 directly — the sink where the others land

The practical consequence: **mitigations that look unrelated are competing for the same headroom.** A cyber outage, a launch slip, and an AURORA overrun do not threaten three different objectives — they threaten the *same* −$100M line, additively. Managing them as one converging portfolio, not five separate registers, is the entire reason we run the RIM.

---

## 4. The priced tail — what failure costs

SPICE quantifies each family across three independently-assessed cases (best / realistic / pessimistic), as EBIT and FCF trajectories on the bearing perimeter. The table below is the heart of the financial risk picture. **Bold FCF figures breach a control line.**

| Family (scenario) | Illustrates | Realistic EBIT | Realistic FCF | Pessimistic FCF | Note |
|---|---|---:|---:|---:|---|
| **S1** NOC / ground-segment compromise (cyber) | RH-04 | **−$69M** | −$79M | **−$118M** | hero scenario; pess. breaches −$100M trigger |
| **SC1** Supplier build-chain intrusion | RH-02 | −$36M | −$42M | −$70M | no outage; schedule + IP + integrity cost |
| **RG1** Security-accreditation suspension | RH-05 | −$48M | −$55M | −$90M | freezes $81M of gov task orders |
| **GP1** Export-control & launch disruption | RH-04, RA-02 | −$30M | −$34M | −$62M | cross-perimeter into AURORA |
| **GA1** AURORA-GEO overrun & co-funding shock | RA-02, RA-04 | $0 (capitalised) | −$12M | −$24M | **consolidated −$64M breaches −$60M bridge** |
| **FN1** IPO-window collapse (the sink) | RC-01/02/03 | $0 | **−$100M** | **−$140M** | realistic case sits *exactly* on the trigger |

Three readings the Committee should take from this:

1. **The hero scenario alone consumes the year.** S1 realistic (≈$69M, direct $17M + indirect $52M) turns +$13M EBIT into ≈−$41M. We do not need the pessimistic case to lose the profitable year — the realistic one does it.
2. **Two families already touch a control line in their *realistic* case.** FN1 realistic lands *on* the −$100M trigger; GA1's consolidated FCF (plan −$40M + GA1 −$24M = −$64M) breaches the −$60M IPO-bridge assumption in the pessimistic case. There is almost no slack.
3. **The insurance we count on does not cover the scenario we most fear.** The $50M cyber tower carries a **war/state-actor exclusion** — and S1's modelled cause is a *state-aligned* actor. In an attribution dispute, the tower may not pay. The protection against S1 is therefore the **controls**, not the policy. (This also makes the apparent 120% over-coverage of objective MO-FN1-2 partly illusory — see §5.)

---

## 5. Mitigation posture — coverage, cost, and gaps

The portfolio carries **22 core mitigations** (Dedicated / Inherited / Baseline) plus **11 SPICE financial-operational controls**. Coverage is broad, but three things demand executive attention.

**(a) The controls that matter most are not yet funded.** The two S1 controls that sever the cyber→IPO path are both **status: *planned*** — i.e. decided in principle, not yet capitalised:

| Control | Status | Cost | Effect |
|---|---|---:|---|
| **SM-IDENTITY-SPLIT** — Denver/Dublin identity & PAM plane separation | planned | ~$4M | breaks the shared privileged-access plane so one compromise cannot trip the fleet |
| **SM-CTRL-RECOVERY** — clean control-plane recovery (golden images + runbook) | planned | ~$1.5M | buys crisis days back; recovery-accelerating |
| **Portfolio** | — | **~$5.5M** | removes the −$118M pessimistic S1 tail → holds FCF above −$100M → severs S1→FN1 (~**12×**) |

Other not-yet-implemented controls of note: **SM-CLEAN-BUILD** (SC1 recovery) is *recommended*; **SM-REVENUE-DIVERSIFY** (gov-concentration) is *planned*; **MIT-10** (supply-chain hardware integrity verification) is *proposed*.

**(b) Three objectives are deliberately unmitigated — and they are governance items, not purchasable controls.** RIM flags them as coverage gaps:
- **MO-GP1-2** export-control compliance posture (geopolitical) — no control you can buy; a monitoring/forecasting posture.
- **MO-FN1-3** quantified, disclosed risk in the IPO file — a disclosure lever owned by the CFO, not a spend.
- **MO-GA1-3** ESA/NASA co-funding continuity / partner commitment — a relationship to be managed, not insured.

These are real exposures that need a *named executive owner and a plan*, precisely because there is no line-item control to point at.

**(c) One objective shows >100% declared coverage** (MO-FN1-2 at 120%: cyber insurance 80% + bridge facility 40%). RIM surfaces this as over-coverage — but, per §4, the insurance leg is subject to the state-actor exclusion, so the *effective* coverage of "liquidity that survives a state-actor event" is weaker than the headline suggests.

---

## 6. Accountability — who carries the portfolio

The graph now carries the **owner accountability layer**: every risk has exactly one **Bearer** (faces the consequence), and every mitigation has a **Steward** (runs the work). This makes a structural concern visible immediately:

> [!warning] Owner concentration on the CISO
> **Tom Reuter (CISO) is the sole Bearer of 16 of the 50 risks** — the entire SEC-01…14 security cluster plus the RCY cyber kill-chain — and Stewards a large share of the security mitigations. The security cluster is also where the catastrophic-severity tail and the hero scenario (S1) live. This is a single point of organisational concentration on exactly the highest-stakes part of the portfolio. It warrants either a deputy/redundancy plan or an explicit Board acknowledgement that this concentration is accepted.

Other bearers are more evenly loaded: the **CFO (Diane Marchetti)** bears the financial cluster's cash leg (RC-02, RA-02, ROF-01/02); the **CEO (Elena Vasquez)** bears the company-defining risks (RC-01/03/05); **VP Launch Ops (Yuki Tanaka)**, **VP Sales** *(unnamed)*, and **VP Compliance & Quality (Amara Diallo)** each bear 3–4. **Eight functional roles are owners-as-role with no named individual yet** (VP Sales, Lead Software Architect, Thermal Subsystem Lead, AURORA Chief Engineer, Quality Manager, Plant Director, HR Director, IT Director) — adequate for the graph, but several of them bear or steward material items (e.g. VP Sales bears RH-03 revenue-miss, exposure 42) and should be named individuals for interview and escalation purposes.

---

## 7. Decisions for the Executive Committee

Seven decisions, ordered by urgency and consequence. Each is grounded in the data above.

### D1 — Fund the cyber control tower (~$5.5M). **Recommend: approve now.**
The two S1 controls (SM-IDENTITY-SPLIT ~$4M, SM-CTRL-RECOVERY ~$1.5M) are *planned* but un-capitalised. They take the pessimistic S1 case from **−$118M FCF (trigger breach) back above −$100M**, severing the cyber→FN1→IPO path for ~12× the realistic feared loss. Given that the $50M insurance tower likely **will not pay** for a state-actor S1 event (D2), these controls are the *primary* protection, not a supplement. **This is the highest-leverage decision in the portfolio.**

### D2 — Close, or consciously accept, the insurance state-actor gap. **Recommend: decide explicitly.**
The cyber tower's war/state-actor exclusion means our most likely catastrophic cyber cause may be uninsured. Options on the data: (a) rely on D1 controls + the bridge facility and *accept* the residual; (b) pursue difference-in-conditions / attribution-dispute cover. Either is defensible — but leaving it implicit is not. **`⟢ DATA GAP`** — the cost/availability of additional cover is not in the dataset (§9).

### D3 — Impose stage-gate discipline on ODT's AURORA-GEO cash share. **Recommend: approve SM-AURORA-VARIANCE as the funding condition.**
AURORA is the "smaller second bet" (~$50M, ~60% ESA/NASA-funded), but **ODT's own ~40% (~$20M) share drains company cash** (RA-02 → RC-02) exactly while FCF discipline gates the IPO. The pessimistic GA1 case puts consolidated FCF at **−$64M, through the −$60M bridge assumption.** Releasing AURORA funds against PDR/sub-system stage-gates with monthly variance control (SM-AURORA-VARIANCE) keeps an overrun from breaching the envelope. Note also that **co-funding continuity (MO-GA1-3) is unmitigated** — partner withdrawal (RA-04) is a watch item (§8).

### D4 — Reduce government-revenue single-point dependency. **Recommend: move SM-REVENUE-DIVERSIFY from *planned* to funded.**
A **single security accreditation gates $81M (30%) of revenue**; its suspension (RG1) costs −$48M realistic / −$90M FCF pessimistic and freezes new gov task orders. Diversification (SM-REVENUE-DIVERSIFY) is only *planned*, and the accreditation-enclave control (SM-ACCRED-ENCLAVE) carries the load alone. This is concentration risk hiding inside a healthy-looking revenue line.

### D5 — Resolve the two contingent-risk activation decisions. **Recommend: place on the next Committee agenda (see §8).**
**RH-06** (ground-segment capacity bottleneck) and **RA-04** (AURORA strategic-partner withdrawal) are formally Contingent, each with a stated activation condition and decision date. They need a go/no-go, not indefinite "watching." **`⟢ DATA GAP`** — the recorded activation dates predate the State B reporting position; the calendar needs reconciling (§9).

### D6 — Address the CISO owner concentration. **Recommend: deputy/redundancy plan or formal Board acceptance.**
One individual bears 16 of 50 risks, including the highest-stakes cluster (§6). Decide whether to distribute accountability (e.g. split OT/ground-segment security to VP Ground & Operations as Bearer) or to accept and minute the concentration.

### D7 — Assign named executive owners to the three governance coverage-gaps. **Recommend: name them.**
MO-GP1-2 (export-control posture), MO-FN1-3 (IPO-file disclosure), MO-GA1-3 (co-funding continuity) have no purchasable control. They need a named owner and a plan at Committee level, or they will remain quietly unmanaged.

---

## 8. Watch list — contingent and near-term

| Item | Type | Trigger / date (as recorded) | Action |
|---|---|---|---|
| **RH-06** Ground-segment capacity bottleneck | Contingent risk | activates if Phase-3 sats exceed 40 active beams/sat in high-demand zones; decision date recorded **2026-06-30** | D5 — go/no-go |
| **RA-04** AURORA strategic-partner withdrawal | Contingent risk | activates on confirmed partner M&A / strategic review; decision date recorded **2026-12-31** | D5 — go/no-go; ties to D3/MO-GA1-3 |
| **FN1 realistic = −$100M** | Trigger proximity | sits *on* the liquidity trigger | the whole portfolio's headroom; review every cycle |
| **GA1 pessimistic = −$64M consolidated** | Bridge proximity | through the −$60M IPO-bridge assumption | D3 |

---

## 9. Information gaps feeding the roadmap

Per the operating instruction, points where a better decision needs data we do **not** yet hold in the sourcebook. Each is tagged for the [[ROADMAP]]; none was filled with invention in this brief.

1. **`⟢ DATA GAP` — No quantified likelihood/frequency.** Exposure is qualitative likelihood×severity only; `annual_probability` (λ) and `magnitude_point_estimate` are unpopulated on the risks. A board-grade brief should carry an aggregate/annualised loss view (a loss-exceedance curve), which the RIM can compute but which has no canon input yet. → *ROADMAP W6 (usable operational/quant data).*
2. **`⟢ DATA GAP` — No incident history.** There is no record of past events to calibrate likelihoods or to show the Committee "this has happened before." → *ROADMAP W5 (history & past incidents).*
3. **`⟢ DATA GAP` — No company risk-appetite / tolerance statement.** Beyond the −$100M liquidity trigger and the −$60M bridge assumption, there is no stated appetite per risk type or aggregate tolerance band — so "is this exposure acceptable?" cannot be answered from data. → *ROADMAP W1 (objectives) / W7 (operating rhythm).*
4. **`⟢ DATA GAP` — Insurance/finance options not modelled.** D2 and the bridge facility's terms (cost of additional cover, facility covenants) are not in the dataset. → *ROADMAP W3 (external constraints) / W2 (controls portfolio).*
5. **`⟢ DATA GAP` — Contingent-risk calendar inconsistent with reporting position.** RH-06 / RA-04 activation dates (2026) predate the State B (FY2028) position this brief reports from. → tag to the [[Canon Change & Issue Register]] (cf. ENH-02 date variation).
6. **`⟢ DATA GAP` — Eight owners are roles, not people.** VP Sales, Lead Software Architect, Thermal Subsystem Lead, AURORA Chief Engineer, Quality Manager, Plant Director, HR Director, IT Director bear/steward material items without a named individual to interview or escalate to. → *ROADMAP W1/W2 (name the stubs).*
7. **`⟢ DATA GAP` — `crisis_management_days` unpopulated.** Recovery is modelled in operational days and financial years, but the acute crisis-management phase is null across scenarios (ENH-01) — so "how long are we in the war room?" is unanswered. → *Canon register / ROADMAP W8 (crisis exercise).*

---

> [!info] How to read this brief against the graph
> Risk and objective IDs (RC-/RH-/RA-/SEC-/RCY-/RO*-, TCO-/TPO-, BST-/SM-/MO-) are live nodes in the RIM. Bearers/Stewards are the BEARS/STEWARDS edges seeded 2026-06-28. SPICE figures are the EBIT/FCF case trajectories on each family. Source of every figure: [[Canon & Figures Register]] and `_inputs/workbook.yaml`.
>
> *Fiction disclaimer: Orbital Dynamics Technologies is a fictional company; all figures are order-of-magnitude and illustrative by design.*
