---
type: briefing
sourcebook-line: "_inputs"
status: draft
prepared-by: Risk Management, Orbital Dynamics Technologies
reporting-position: "State B — Operator phase (FY2028 plan)"
produced: 2026-06-28
revised: 2026-06-29
classification: Executive Committee / Board Risk Committee
tags: [risk-status, executive-brief, rim, spice, status/draft]
---

# ODT — Enterprise Risk Status & Executive Decision Brief

**Prepared by:** Risk Management · **For:** Executive Committee & Board Risk Committee
**Reporting position:** State B — Operator phase, FY2028 Annual Operating Plan
**Produced:** 28 June 2026 · **Revised:** 29 June 2026 (rev. 2)

> [!note] Scope & provenance
> This brief reports ODT's risk position **exclusively** from the managed risk dataset (the RIM graph generated from `_inputs/workbook.yaml`) and the figures in the [[Canon & Figures Register]]. Every number is traceable to a node, an edge, or a canon line; nothing is estimated outside the dataset. Where a decision would benefit from data we do **not** yet hold, the point is flagged **`⟢ DATA GAP`** and collected in §12. Figures are order-of-magnitude by design (fiction disclaimer applies).

> [!tip] Revision 2 — what changed since the 28 June first issue
> The intervening week's risk-management programme materially upgraded the instrument behind this brief. **Five of the seven data gaps the first issue flagged are now closed or substantially addressed:** the portfolio now carries **quantified frequency (λ) and magnitude** (loss-exceedance is computable — §3.3), an **incident history** (§7), a **supply-chain graph** and **external-constraint map** (§6), and the **S1 cyber kill-chain** is wired end-to-end. The mitigation model has been **consolidated** (one register of 33 controls; platform change [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]], applied), and the flagship decision **D1 has been formally worked** by the new Risk & Opportunity Committee as [[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]], with the funded "after" now visible on the graph as a projected scenario version. The headline finding — **convergence on the IPO** — is unchanged; it is now fully evidenced rather than asserted.

---

## 1. Executive summary

ODT enters its first profitable year in a deceptively strong position and a structurally fragile one at the same time. The FY2028 plan delivers **+$13M EBIT** — the first positive year, and the headline of the IPO story — on **$270M revenue**. But free cash flow is **−$40M by design**, and our own liquidity covenant trips a distressed, dilution-forcing raise if FCF falls below **−$100M**. We run with roughly **$60M of cash-flow headroom** between the plan and the event that would derail the **~$250M H1 2029 IPO** (TCO-04).

The central finding is not any single risk. It is **convergence**. The graph shows **six independent risk families — cyber, supply-chain, regulatory, geopolitical, programme (AURORA-GEO) and the financial sink — all draining, by different routes, into the same three company financial risks** (EBITDA miss, cash-runway exhaustion, loss of investor confidence), which bear directly on the IPO. No one of them is, in isolation, a company-ending event. **Several landing in the same year is.** That is what the −$100M trigger exists to catch, and what the SPICE-priced scenarios in §4 quantify. As of this revision the convergence is **fully instrumented**: each family's path is traceable node-by-node from an external cause, through the kill-chain or supply chain, to the −$100M line.

The single most consequential decision remains **funding the ~$5.5M cyber control tower** — and it has now been worked end-to-end. The realistic cyber scenario (S1) costs ≈**$69M** and turns our +$13M EBIT into ≈**−$41M**; the pessimistic case puts FCF at **−$118M, past the −$100M trigger.** Two controls totalling ~$5.5M pull that pessimistic tail back to **−$82M (above the trigger)** and **sever the path** from a cyber incident to a forced raise — a projected outcome the RIM now holds as a distinct scenario version (§5). Both controls remain **un-funded (status: planned)**; approving the spend is what converts the projection into the realised position. The full slate is in §9.

---

## 2. The position we are protecting

ODT is no longer a pre-revenue scale-up; it is an operator with 56 satellites in service. The numbers we defend (State B, FY2028 plan):

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

Two structural features make this fragile rather than comfortable. First, the **~75% fixed-cost share** means lost availability or revenue flows almost directly to the bottom line. Second, the headroom is thin and *cumulative*: the bridge assumes FCF no worse than −$60M; the plan is at −$40M; a single material scenario can consume the gap, and the scenarios are not mutually exclusive.

---

## 3. The risk landscape — what the graph shows

The managed portfolio holds **55 risks**: **50 active/contingent** — 17 business-level and 33 operational, across HORIZON-LEO (operating), AURORA-GEO (development) and company scope — plus **5 historical risks** (HX-01…05, §7) retained for audit at non-active lifecycle states (excluded from live exposure). Two active risks are **Contingent**, awaiting a formal activation decision (§10).

### 3.1 Highest-exposure risks (likelihood × severity, RIM scoring)

The schema's alert line treats **exposure ≥ 50 as high**. Ten risks sit at or above it (unchanged from first issue; the five historical risks are non-active and do not enter this ranking):

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

The portfolio also carries a long **tail** of catastrophic-severity, lower-likelihood risks — most of the security cluster (SEC-01 APT C2, SEC-12/13 firmware/key, ROL-02 debris) scores severity **9–10**. These do not dominate the likelihood×severity ranking, but they are exactly the events SPICE prices, because their *financial* tail threatens the IPO.

### 3.2 The convergence thesis (the core insight)

Operational causes propagate up into programme/business risks, which feed three **company financial risks** that all impact the IPO objective directly:

```
external cause ─▶ operational ─▶ business risks ─▶  RC-01  EBITDA miss     ┐
(export, breach,    (cyber,                          RC-02  cash runway     ├▶ TCO-04 IPO
 accreditation,      supply,                         RC-03  investor conf.  ┘  (H1 2029, ~$250M)
 partner, market)    launch…)                             ▲
                                            BST-FN1 = the scenario of failing here
```

Each family illustrates a business risk whose influence chain reaches that financial cluster:

- **S1 (cyber)** → RH-04 → RH-03 → RC-01/RC-02 *(now wired as a full kill-chain — §3.3)*
- **SC1 (supply-chain)** → RH-02 → RH-03 → RC-01 *(now on a supplier→production graph — §6)*
- **RG1 (regulatory)** → RH-05 government pipeline → RC-01
- **GP1 (geopolitical)** → RH-04 *and* RA-02 → RC-02 — the cross-perimeter reach
- **GA1 (AURORA-GEO)** → RA-02 / RA-04 → RC-02
- **FN1 (financial)** → RC-01/02/03 directly — the sink where the others land

The practical consequence: **mitigations that look unrelated compete for the same headroom.** A cyber outage, a launch slip, and an AURORA overrun threaten the *same* −$100M line, additively. Managing them as one converging portfolio is the entire reason we run the RIM.

### 3.3 Frequency & annualised view *(new — closes first-issue gap #1)*

The first issue could only rank risks qualitatively (likelihood × severity). The portfolio now carries **quantified frequency** — `annual_probability` (λ, events/year) on **every** risk, via a calibrated likelihood→λ mapping (owner-confirmed "Moderate" band; [[Canon & Figures Register]] "Frequency & magnitude calibration") — and a **magnitude** Tier-2 fallback (P10/P50/P90 loss) on the seven business risks not covered by a SPICE scenario. **The RIM can now compute an aggregate loss-exceedance curve**; the inputs that were missing are populated.

Illustrative λ on headline risks (events/year): **ROL-01** launch-gap 0.50 (~1-in-2yr) · **RH-01** Phase-3 slip 0.70 · **SEC-01** APT-on-C2 0.20 · **ROM-01** RF sole-source 0.20 · **SEC-02** supply-chain firmware 0.10. Read with the §4 magnitudes, these say the *frequent* risks (launch, schedule) are moderate-magnitude, while the *rare* risks (state-actor cyber, debris) carry the catastrophic tail — the classic shape the −$100M trigger is set against. *(λ/magnitude are order-of-magnitude by design; the aggregate curve is computed by the platform, not asserted here.)*

---

## 4. The priced tail — what failure costs

SPICE quantifies each family across three independently-assessed cases, as EBIT and FCF trajectories on the bearing perimeter. **Bold FCF figures breach a control line.**

| Family (scenario) | Illustrates | Realistic EBIT | Realistic FCF | Pessimistic FCF | Note |
|---|---|---:|---:|---:|---|
| **S1** NOC / ground compromise (cyber) | RH-04 | **−$69M** | −$79M | **−$118M** | hero scenario; pess. breaches −$100M |
| **SC1** Supplier build-chain intrusion | RH-02 | −$36M | −$42M | −$70M | no outage; schedule + IP + integrity |
| **RG1** Accreditation suspension | RH-05 | −$48M | −$55M | −$90M | freezes $81M of gov task orders |
| **GP1** Export-control & launch disruption | RH-04, RA-02 | −$30M | −$34M | −$62M | cross-perimeter into AURORA |
| **GA1** AURORA-GEO overrun & co-funding shock | RA-02, RA-04 | $0 (capitalised) | −$12M | −$24M | **consolidated −$64M breaches −$60M bridge** |
| **FN1** IPO-window collapse (the sink) | RC-01/02/03 | $0 | **−$100M** | **−$140M** | realistic sits *on* the trigger |

Three readings for the Committee:

1. **The hero scenario alone consumes the year.** S1 realistic (≈$69M; direct $17M + indirect $52M) turns +$13M EBIT into ≈−$41M. The realistic case loses the profitable year; we do not need the pessimistic one.
2. **Two families touch a control line in their *realistic* case.** FN1 realistic lands *on* −$100M; GA1 consolidated (−$40M + −$24M = −$64M) breaches the −$60M bridge in the pessimistic case. Almost no slack.
3. **The insurance we count on does not cover the scenario we most fear.** The $50M cyber tower carries a **war/state-actor exclusion**, and S1's modelled cause is a *state-aligned* actor (the kill-chain in §3.3/§6 names a state-aligned sponsor). In an attribution dispute the tower may not pay. The protection against S1 is the **controls**, not the policy — which is why D1 matters and why MO-FN1-2's headline 120% coverage is partly illusory (§5).

### 4.1 The S1 "after" — funded outcome now on the graph *(new)*

D1 (fund the ~$5.5M controls) is no longer only a recommendation; the RIM now holds the **funded re-assessment** of S1 as a distinct scenario version (a *projection*, because the controls are still `planned`):

| S1 case | Base (current) EBIT / FCF | Mitigated (projected) EBIT / FCF | FCF benefit |
|---|---:|---:|---:|
| best | −40 / −60 | −23 / −38 | +22 |
| realistic | −69 / −79 | −40 / −54 | +25 |
| **pessimistic** | −110 / **−118** | −64 / **−82** | **+36** |

The pessimistic FCF moves from **−118 (a trigger breach)** to **−82 (above −100)** — **severing the S1 → FN1 path**. Benefit ≈ **12× the realistic feared loss** for ~$5.5M of capital. The base version stays `current` until the controls are funded and deployed; approving D1 is what makes the mitigated version real.

---

## 5. Mitigation posture — coverage, cost, and gaps

Following the [[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] platform change (applied), the operational and financial controls are now **one consolidated register of 33 mitigations** (previously a 22-core + 11-SPICE split). Lifecycle status across the register: **existing 13 · on-going 15 · planned 3 · recommended 2.** Three things demand executive attention.

**(a) The controls that matter most are not yet funded.** The two S1 controls that sever the cyber→IPO path are both **status: planned** — decided in principle, carried as `committed_budget`, not yet capitalised:

| Control | Status | Committed | Effect |
|---|---|---:|---|
| **SM-IDENTITY-SPLIT** — Denver/Dublin identity & PAM plane separation | planned | ~$4M | breaks the shared privileged-access plane (the kill-chain's pivot — §6) |
| **SM-CTRL-RECOVERY** — clean control-plane recovery (golden images + runbook) | planned | ~$1.5M | recovery-accelerating; buys crisis days back |
| **Portfolio** | — | **~$5.5M** | removes the −$118M pessimistic S1 tail → holds FCF above −$100M → severs S1→FN1 (~**12×**; §4.1) |

The other two **planned** controls are **SM-REVENUE-DIVERSIFY** (gov-concentration, D4) and the **recommended** pair are **MIT-10** (supply-chain hardware integrity verification) and **SM-CLEAN-BUILD** (SC1 recovery).

**(b) Three objectives are deliberately unmitigated — governance items, not purchasable controls.** RIM flags them as gaps: **MO-GP1-2** export-control posture; **MO-FN1-3** IPO-file disclosure (a CFO lever); **MO-GA1-3** ESA/NASA co-funding continuity. Each needs a named executive owner and a plan (D7), precisely because there is no line-item to point at.

**(c) One objective shows >100% declared coverage** (MO-FN1-2 at 120%: cyber insurance 80% + bridge facility 40%). Per §4, the insurance leg is subject to the state-actor exclusion, so the *effective* coverage of "liquidity that survives a state-actor event" is weaker than the headline.

> [!note] How the "after" is modelled (CR-01)
> A funded decision authors a **mitigated scenario version** per case; benefit = base − mitigated (computed by RIM, not stored). While the cited controls are `planned`, the mitigated version is a **projection** (the base stays current). This is the mechanism behind §4.1 and the worked [[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]].

---

## 6. Supply-chain & external-constraint exposure *(new — W3/W4)*

The portfolio's *external* roots are now first-class in the dataset.

**Supply chain (a graph, not prose).** The LEO service rests on a production chain (procurement → AIT integration → launch → service) fed by tier-1 suppliers, **two of them single-source on the critical path**:

| Input | Supplier | Tier / criticality | Single-source? |
|---|---|---|---|
| Ku/Ka RF transponders | **Teledyne** | 1 / Critical | **Yes** (Airbus DS dual-source *on-going*, MIT-02) |
| Space-grade batteries | **Saft** | 1 / Critical | **Yes** — *no qualified alternate* |
| Composite structures | Northrop / Spirit | 1 / Important | No (dual) |
| Launch | SpaceX / Rocket Lab | 1 / Important | No (multi) |

The **Saft** dependency has no second source and is a standing acceptance item (a candidate ROC decision). A supplier failure or sanction concentrates on the AIT line (ROM-01/02 → Phase-4 slip) and is the root of **GP1**.

**External constraints (the boundary we operate inside).** A six-layer regulatory/market perimeter, each tied to the risks it bears on: **FCC** Part 25 (granted Q3 2026, ongoing conditions → ROR-01) · **ITU** coordination (RH-07) · **ITAR/EAR** export control (RA-05, ROH-02 — and the AURORA partner-withdrawal path RA-05→RA-04) · **DoD accreditation** gating 30% of revenue (RH-05/RG1) · **ESA/NASA** partnership terms (~60/40 co-funding, PDR Q1 2027, partner checkpoint 2026-12-31) · **capital-market window** (the IPO itself). Compliance is concentrated on **Amara Diallo (VP Compliance & Quality)**.

**Cyber kill-chain (S1) now traceable.** The hero scenario is wired node-by-node: a **state-aligned sponsor** → attacker → **MSSP privileged remote access** → the **shared Denver/Dublin identity plane** → the Network Management System and NOC → seizure of legitimate fleet command → fleet-wide safe-mode. Crucially, **the Dublin backup is not a backup against this** (it shares the identity plane) — which is exactly what SM-IDENTITY-SPLIT fixes.

---

## 7. What has happened before — incident history *(new — closes first-issue gap #2)*

The first issue noted we had no record of past events. The portfolio now carries an **incident log** (five historical risks, non-active lifecycle states) — minor by design, consistent with on-schedule Phase 1–3 delivery and no major breach, but enough to show the Committee "this has happened before" and to exercise the accept/watch/close lifecycle:

| ID | Year | Incident | State | Lesson |
|---|---|---|---|---|
| **HX-01** | 2026 | Teledyne RF lot quality escape — caught at inspection, re-screened | Closed | the **sole-source** exposure is real (→ MIT-02) |
| **HX-02** | 2027 | Credential-phishing attempt — **blocked** by MFA + SOC | Closed | everyday controls hold; **S1 is the un-handled tail**, not this |
| **HX-03** | (legacy) | Single-NOC design (pre-Dublin) | Archived | explains today's shared-identity-plane weakness |
| **HX-04** | 2027 | Orbital-debris conjunction residual — accepted, monitored | **Watching** | the accept-and-watch lifecycle: a close-approach trigger re-activates ROL-02 |
| **HX-05** | 2026 | FCC Part 25 approval risk — approval granted | Suppressed | retired risk, retained; conditions live on as ROR-01 |

The log usefully **separates the routine from the tail**: HX-02 shows a blocked everyday attempt; S1 is the scenario the everyday controls do *not* stop (a state-actor through the identity-plane flaw). It is not a contradiction of the "first quantification" framing — it is the evidence for it.

---

## 8. Accountability — who carries the portfolio

Every risk has exactly one **Bearer** (faces the consequence) and every mitigation a **Steward** (runs the work). This makes a structural concern immediately visible:

> [!warning] Owner concentration on the CISO
> **Tom Reuter (CISO) is the sole Bearer of 16 of the 50 active risks** — the entire SEC-01…14 cluster plus the RCY cyber kill-chain — and Stewards a large share of the security controls. That is exactly the highest-stakes part of the portfolio (the catastrophic tail and the S1 hero scenario). It warrants either a deputy/redundancy plan or an explicit Board acknowledgement that the concentration is accepted (D6).

Other bearers are more evenly loaded: the **CFO** bears the cash leg (RC-02, RA-02, ROF-01/02); the **CEO** bears the company-defining risks (RC-01/03/05); **VP Launch Ops**, **VP Sales** *(unnamed)*, and **VP Compliance & Quality** each bear 3–4. **Eight functional roles remain owners-as-role with no named individual** — adequate for the graph, but several bear or steward material items (e.g. VP Sales bears RH-03, exposure 42) and should be named for interview/escalation (gap #6, §12).

---

## 9. Decisions for the Executive Committee

Seven decisions, ordered by urgency and consequence. The new **Risk & Opportunity Committee (ROC)** is now the standing body that owns this slate; **D1 has already been worked there as [[Decision DM-01 - Fund the S1 Cyber Control Tower|DM-01]]**.

### D1 — Fund the cyber control tower (~$5.5M). **Recommend: approve now (worked as DM-01).**
The two S1 controls are *planned* but un-capitalised. They take the pessimistic S1 case from **−$118M FCF (trigger breach) to −$82M (above the trigger)**, severing the cyber→FN1→IPO path for ~12× the realistic feared loss (§4.1). Because the $50M tower likely **will not pay** for a state-actor S1 (D2), these controls are the *primary* protection. **The highest-leverage decision in the portfolio** — the funded "after" is already modelled (§4.1, §5); approval realises it.

### D2 — Close, or consciously accept, the insurance state-actor gap. **Recommend: decide explicitly.**
The war/state-actor exclusion means our most likely catastrophic cyber cause may be uninsured. Options: (a) rely on D1 controls + the bridge facility and *accept* the residual; (b) pursue difference-in-conditions / attribution-dispute cover. Leaving it implicit is not an option. **`⟢ DATA GAP`** — the cost/availability of additional cover is still not in the dataset (§12).

### D3 — Stage-gate ODT's AURORA-GEO cash share. **Recommend: approve SM-AURORA-VARIANCE as the funding condition.**
AURORA is the "smaller second bet" (~$50M, ~60% ESA/NASA-funded), but **ODT's ~40% (~$20M) share drains company cash** (RA-02 → RC-02) while FCF discipline gates the IPO. Pessimistic GA1 puts consolidated FCF at **−$64M, through the −$60M bridge.** Release funds against PDR/sub-system stage-gates with monthly variance control. Note co-funding continuity (MO-GA1-3) is unmitigated and partner withdrawal (RA-04) is a watch item (§10), with an **ITAR→withdrawal** path (RA-05→RA-04, §6).

### D4 — Reduce government-revenue single-point dependency. **Recommend: move SM-REVENUE-DIVERSIFY from *planned* to funded.**
A **single security accreditation gates $81M (30%) of revenue**; its suspension (RG1) costs −$48M realistic / −$90M pessimistic. Diversification is only *planned*; the accreditation-enclave control carries the load alone. Concentration risk hiding in a healthy-looking revenue line.

### D5 — Resolve the two contingent-risk activation decisions. **Recommend: next ROC agenda (§10).**
**RH-06** (ground-capacity bottleneck) and **RA-04** (AURORA partner withdrawal) are Contingent with stated conditions/dates. They need a go/no-go. **`⟢ DATA GAP`** — recorded activation dates (2026) predate the State B position; reconcile the calendar (§12).

### D6 — Address the CISO owner concentration. **Recommend: deputy/redundancy plan or formal Board acceptance.**
One individual bears 16 of 50 active risks, including the highest-stakes cluster (§8).

### D7 — Assign named executive owners to the three governance coverage-gaps. **Recommend: name them.**
MO-GP1-2 (export-control posture), MO-FN1-3 (IPO-file disclosure), MO-GA1-3 (co-funding continuity) have no purchasable control; they need a named owner and a plan at Committee level.

### D8 — Qualify a second battery source (Saft). **Recommend: ROC decision — qualify vs. accept.** *(new)*
Saft is the sole space-grade battery supplier with **no qualified alternate** and a 9–12 month lead time (§6); HX-01 showed the sole-source exposure is real. Either fund a second-source qualification (as with RF/Airbus DS) or **explicitly accept and minute** the dependency.

---

## 10. Watch list — contingent and near-term

| Item | Type | Trigger / date (as recorded) | Action |
|---|---|---|---|
| **RH-06** Ground-capacity bottleneck | Contingent risk | Phase-3 sats > 40 active beams/sat; decision date **2026-06-30** | D5 — go/no-go |
| **RA-04** AURORA partner withdrawal | Contingent risk | confirmed partner M&A / strategic review; date **2026-12-31** | D5; ties to D3/MO-GA1-3 (ITAR path RA-05→RA-04) |
| **HX-04** Debris-conjunction residual | Watching (accepted) | predicted sub-1km conjunction → re-activate ROL-02 | monitor; the live accept-and-watch case |
| **HX-05** FCC approval | Suppressed | material new Part 25 condition → re-activate | conditions tracked by ROR-01 |
| **FN1 realistic = −$100M** | Trigger proximity | sits *on* the liquidity trigger | the whole portfolio's headroom; review every cycle |
| **GA1 pessimistic = −$64M consolidated** | Bridge proximity | through the −$60M bridge | D3 |

---

## 11. Crisis readiness *(new — W8)*

The S1 scenario is now backed by a **runnable crisis-exercise pack** ([[Crisis Exercise - S1 NOC Compromise]]): a 90-minute facilitated tabletop that runs the incident on the live RIM graph, with the ROC seats, an inject timeline (detection → fleet-wide safe-mode → insurance exclusion → the bill → the D1 call), and two endings (funded vs accept). It is the rehearsal of D1 under pressure, and it closes the readiness gap left by the IT-only 2027 tabletop. *(The acute `crisis_management_days` field remains unpopulated in the data — gap #7, §12.)*

---

## 12. Information gaps feeding the roadmap

Status of the seven gaps the first issue raised, plus what remains:

1. ~~No quantified likelihood/frequency.~~ ✅ **Addressed (W6)** — λ on every risk + magnitude fallback on uncovered business risks; loss-exceedance is computable (§3.3).
2. ~~No incident history.~~ ✅ **Addressed (W5)** — incident log HX-01…05 (§7).
3. **`⟢ DATA GAP` — No company risk-appetite / tolerance statement.** Still open. Beyond the −$100M trigger and −$60M bridge, there is no per-type appetite or aggregate tolerance band, so "is this exposure acceptable?" is not yet answerable from data. → *ROADMAP W1 / W7.*
4. **`⟢ DATA GAP` — Insurance/finance options not fully modelled.** *Partly addressed* — the regulatory/market/macro perimeter is now mapped (§6, W3), but the **cost of additional state-actor cover** (D2) and the bridge-facility covenant terms are still not in the dataset. → *W2 / W3.*
5. **`⟢ DATA GAP` — Contingent-risk calendar predates the reporting position.** Still open (RH-06/RA-04 dates are 2026; we report from FY2028). → [[Canon Change & Issue Register]] INC-05.
6. **`⟢ DATA GAP` — Eight owners are roles, not people.** Still open; several bear/steward material items (§8). → *W1 / W2 (name the stubs).*
7. **`⟢ DATA GAP` — `crisis_management_days` unpopulated (ENH-01).** Still open; recovery is modelled in operational days and financial years, but the acute war-room phase is null. A runnable crisis exercise now exists (§11), but the data field is unset. → *canon / W8.*

> [!note] Platform evolving to serve the risk manager
> Two schema change requests have been raised with the RIM platform team. **[[CR-01 - Mitigation Consolidation & SPICE Re-assessment|CR-01]] (applied)** consolidated the mitigation model and added the mitigated-scenario-version mechanism behind §4.1/§5. **[[CR-02 - External Entities (Supplier & Regulatory)|CR-02]] (in discussion)** would make suppliers and regulators first-class graph nodes, so "everything involving Teledyne" or "everything the FCC governs" — across active risks *and* the incident log — becomes a single query (the §6/§7 attribution we currently hold only as text).

---

> [!info] How to read this brief against the graph
> Risk and objective IDs (RC-/RH-/RA-/SEC-/RCY-/RO*-/HX-, TCO-/TPO-, BST-/SM-/MO-) are live nodes in the RIM. Bearers/Stewards are the BEARS/STEWARDS edges; the S1 kill-chain is the SPN-/ATK-/EP-/TP-/FT- node path; λ/magnitude are the `annual_probability` / `magnitude_*` risk fields. Source of every figure: [[Canon & Figures Register]] and `_inputs/workbook.yaml`.
>
> *Fiction disclaimer: Orbital Dynamics Technologies is a fictional company; all figures are order-of-magnitude and illustrative by design.*

---

## Revision history
- **Rev. 2 — 2026-06-29.** Refreshed for the Wave 3–5 risk-management programme: closed gaps #1 (λ/magnitude, §3.3) and #2 (incident history, §7); added the S1 funded "after" (§4.1), the consolidated 33-control register and CR-01 mechanism (§5), supply-chain & external-constraint exposure and the wired S1 kill-chain (§6), crisis readiness (§11), and a new decision D8 (Saft second source). Updated portfolio count to 55 (50 active + 5 historical). Noted the ROC as the standing decision body and DM-01 as the worked D1. Recorded the CR-01/CR-02 platform evolution. No canon figures changed; all additions trace to the graph/canon.
- **Rev. 1 — 2026-06-28.** First issue: convergence thesis, the priced tail, owner accountability, the seven-decision slate, and the seven information gaps.
