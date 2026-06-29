---
type: chronicle
sourcebook-line: "08 - Chronicles"
status: new
tags: [chronicles, history, incidents, timeline, lifecycle, w5, status/new]
aliases: ["Company History", "Incident Log", "ODT History"]
---
# 📜 ODT — Company History & Incident Log
> [!info] A real company has a past. This note is ODT's **factual history** (the timeline) and its **incident log** — the small operational events that have already happened, each carried in the graph as a risk in a **lifecycle state** (closed / archived / accepted-watching / suppressed). It is the counterpart to the bestiary's *forward-looking* feared losses: those are what ODT fears; these are what ODT has actually lived. All dates/figures are canon-cited from [[Canon & Figures Register]]; the incidents are owner-confirmed **operational texture** (2026-06-29) — deliberately minor, consistent with on-schedule Phase 1–3 delivery and **no major breach**. *(Workstream **W5**; target tier **L2**.)*

## 1. Timeline (founding → IPO window)
| Year | Milestone |
|---|---|
| **2019** | Founded (San José, CA); **Seed $8M** |
| **2021** | **Series A $45M** |
| **2023** | **Series B $120M** — funds Phase 1 |
| **2025–26** | **Phase 1** (12 sats, 4 launches) — *complete, in service* |
| **2026** | **Series C $190M** (post-first-launch); **FCC Part 25 granted** (Q3 2026); **CISO function created** (DoD-contract condition); **CFO** external hire; **Dublin backup NOC** online |
| **2026–27** | **Phase 2** (20 sats) — *complete, in service* |
| **2027** | **IT/OT segmentation** + immutable backups implemented; **$60M venture-debt facility** committed; **2027 tabletop** (IT-only) |
| **2027–28** | **Phase 3** (24 sats) — *launched, commissioning ramp* |
| **Jun 2028 (State B)** | **56 sats operational** + 8 commissioning; **first EBIT+ year (+$13M)**, revenue $270M; **Phase 4** deploying (3 of 7 launches done) |
| **Q1 2027 → ongoing** | **AURORA-GEO** PDR gate (TRL 4+); partner-commitment checkpoint 2026-12-31 |
| **H1 2029** | **IPO target** (~$250M, Nasdaq) |

Headcount **285 → 540** across the window; cash **$78M → $85M + $60M undrawn facility**.

## 2. Incident log (what has actually happened)
Five logged items — minor by design. Each is a `Risk` in a **non-active lifecycle state** (excluded from live exposure, retained for audit), so the RIM shows history without polluting the active register.

| ID | Year | Incident | Lifecycle state | Touches |
|---|---|---|---|---|
| **HX-01** | 2026 | **Teledyne RF transponder lot quality escape** — solder process drift caught at incoming inspection; lot quarantined & re-screened; minor margin used, no flight impact | **Closed** (`archive_date 2026-08-31`) | `CONCERNS` TP-AIT; supplier **Teledyne** (single-source) |
| **HX-02** | 2027 | **Contained credential-phishing attempt** — an engineer's password phished; VPN login **blocked by MFA + device posture**, flagged by SOC. No access, no data | **Closed** (`2027-05-31`) | `CONCERNS` EP-01; validated MIT-CY1 / MIT-13 |
| **HX-03** | (legacy) | **Single-NOC design** — control ran from Denver alone, no geographic backup | **Archived** (`2026-11-30`, superseded by Dublin) | `CONCERNS` TP-NOC |
| **HX-04** | 2027 | **Orbital-debris conjunction residual** — unavoidable collision exposure; ROC formally accepted it and monitors screening | **Watching** (`acceptance 2027-03-31`, Yuki Tanaka) | `trigger → ROL-02` |
| **HX-05** | 2026 | **FCC Part 25 operational-approval risk** — the risk of *not* getting approval; approval granted Q3 2026 | **Suppressed** (`2026-09-30`) | regulator **FCC**; conditions → ROR-01 |

## 3. Post-mortems (the one-paragraph version)
- **HX-01 — Teledyne lot escape (Closed).** The sole-source RF dependency (ROM-01) showed its teeth in a *small* way: a process drift at Teledyne, caught by incoming inspection. Lesson: incoming screening works, but the **single-source exposure is real** — this is the operational evidence behind the [[Annex - Supply Chain & Production|Teledyne dual-source program]] (MIT-02, Airbus DS).
- **HX-02 — Phishing attempt (Closed).** The controls held: MFA + device posture + SOC detection stopped a credential attack at the door. Importantly, this is **not** the origin of the cyber-quantification story — [[THE NUMBER - Season 1 (external)|THE NUMBER]] remains the *forward-looking* pricing of the feared S1 loss, not a post-mortem. HX-02 is the reassuring counter-case: routine attempts are handled; **S1 is the un-handled tail** (a state-actor, the identity-plane flaw).
- **HX-03 — Single-NOC design (Archived).** A genuine *resolved* structural risk: before Dublin, Denver was a single point. Adding the backup retired it — but the **shared identity/PAM plane** the two NOCs use is the residual weakness now carried forward in the [[BST-S1 NOC Ground Compromise (Cyber)|S1]] kill-chain (TP-IDP). History explains why the flaw exists.
- **HX-04 — Debris conjunction (Watching).** The textbook **accept-and-watch**: you cannot eliminate debris exposure, so the ROC accepted it with a **trigger** — a sub-1 km predicted conjunction re-activates the ROL-02 collision-avoidance response. This is the lifecycle the RIM is built to run: *accepted → watching → (trigger) → re-activated*.
- **HX-05 — FCC approval (Suppressed).** The approval risk is **retired** (granted Q3 2026), so exposure dropped below threshold and it was suppressed — but retained, with a trigger to re-activate if a material new condition lands. The *ongoing* licence-conditions risk lives on as ROR-01. Shows **suppressed ≠ deleted**.

## 4. How RIM reads this (the lifecycle on the graph)
- **Active register stays clean:** all five are `is_active: false`, so they don't inflate the live exposure or the convergence view — but they're queryable as history (`MATCH (r:Risk) WHERE r.status IN ['Closed','Archived','Suppressed','Watching']`).
- **Watching → trigger → re-activate:** HX-04 carries a `trigger_condition`; the RIM's lifecycle is exactly "an accepted risk you watch until a condition fires." HX-05 (Suppressed) carries one too — suppression is reversible.
- **Audit trail:** `archive_date` / `acceptance_date` / `acceptance_owner` give each item a date and a name, so a workshop can ask "who accepted the debris residual, and when?" and the graph answers (Yuki Tanaka, 2027-03-31).

## 5. Reconciliation with THE NUMBER
[[THE NUMBER - Season 1 (external)|S1]] and [[THE NUMBER - Season 2 (mitigation)|S2]] are **unchanged**: ODT prices its feared cyber tail *prospectively*. HX-02 (a blocked attempt) sits *beneath* that story — it shows the everyday controls working, which is precisely why the **un-handled** S1 tail (state-actor + identity-plane flaw, outside the insurance) is the one worth quantifying. No incident in this log is a breach; none re-writes the forward-looking premise.

## 6. CR-02 enrichment (a note for the schema discussion)
This log sharpens the [[CR-02 - External Entities (Supplier & Regulatory)|CR-02]] case: **HX-01 was caused by a specific supplier (Teledyne)** and **HX-05 was governed by a specific regulator (FCC)** — but the graph can only record those as *strings on the risk*, not edges to a **supplier**/**external_constraint** node. With those nodes, "show every incident (and active risk) involving Teledyne" or "everything the FCC has touched" becomes one query. *(Incidents themselves need no new node type — they are adequately modelled as `Closed`/`Archived` risks, per the schema's "retained for audit" intent.)*

## Changelog
- 2026-06-29: **Created (W5 — company history & incident log, target L2).** Authored ODT's first canonical past as **operational texture** (owner-confirmed): timeline (2019 founding → State B 2028 → IPO 2029) + **5 incidents** (HX-01..05) each in a RIM lifecycle state — Closed×2, Archived, Watching (accept-and-watch showcase), Suppressed — added to `_inputs/workbook.yaml` with lifecycle fields (`trigger_condition`/`acceptance_date`/`acceptance_owner`/`archive_date`) and 3 `CONCERNS` edges (HX-01→TP-AIT, HX-02→EP-01, HX-03→TP-NOC). Generator extended to emit the lifecycle fields + a "Historical Incidents" risk group. Seed regenerated (4433 lines, 55 risks). Consistent with on-schedule Phase 1–3 delivery and no major breach; THE NUMBER's forward-looking premise intact. Enriches CR-02 (supplier/regulator incident attribution). Wired into [[Chronicles Index]] + [[Sourcebook Index]]. No new canon *figures*; the timeline transcribes existing canon.
