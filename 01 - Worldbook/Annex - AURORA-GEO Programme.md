---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: update
tags: [worldbook, aurora-geo, status/update]
aliases: ["AURORA-GEO", "AURORA"]
---
# 🛰️ Annex — AURORA-GEO Programme (full second context)
> [!info] The second P&L perimeter alongside HORIZON-LEO. Gives RIM its portfolio / cross-perimeter story: a programme whose risk metric is **schedule and co-funding**, not EBIT — yet which still drains into the same financing crunch.

## 1. What it is
**AURORA-GEO** — an early-development **GEO relay satellite** carrying **optical inter-satellite links (ISL)**, **co-funded by ESA/NASA** with ODT internal investment. It provides high-capacity optical backhaul/relay for the HORIZON-LEO fleet and third-party missions, turning the constellation from a connectivity provider into a **layered network operator**. Currently **Phase A/B pre-development**; the **Preliminary Design Review (PDR)** gate is targeted for **Q1 2027** with all subsystem definitions at **TRL 4+** (objective [[Canon & Figures Register|TPO-05]]).

It is the company's **diversification bet** — the second leg under the commercial-scale objective [[Canon & Figures Register|TCO-03]] — and the structural reason ODT is a *portfolio*, not a single programme.

## 2. Why it has a different risk profile
HORIZON-LEO is an **operator** perimeter: its risks are priced in **EBIT, FCF, SLA and churn** against a live P&L. AURORA-GEO is a **pre-revenue development** perimeter: it has no service, no SLA, no revenue. Its risks are priced in:
- **Programme schedule** — will it pass the PDR gate on time (Q1 2027)?
- **Technology maturity** — will the optical ISL reach the required TRL?
- **Co-funding integrity** — do the ESA/NASA partners and the budget hold?

This is the deliberate teaching contrast in the demo: **the same RIM method, two recovery metrics.** A slip on AURORA is not measured in lost EBIT but in lost milestones and lost co-funding — until it crosses into the company's cash position, at which point it *does* hit the IPO story (see §6).

> [!note] State-axis note
> AURORA-GEO is described at **State B (Jun 2028)** like the rest of the canon, but in development terms it behaves like a **State A** entity — runway, milestone slip, partner/dilution risk. It is the bridge that keeps the State-A risk vocabulary alive inside the State-B world. See [[ODT Worldbook - Core]] §"dual-state principle".

## 3. Objectives (graph anchors)
| Objective | What it is | Rolls up to |
|---|---|---|
| [[Canon & Figures Register\|TPO-05]] | AURORA-GEO passes the **PDR gate by Q1 2027**, all subsystems at TRL 4+ | `CONTRIBUTES_TO` → **TCO-03** (commercial scale & diversification) via edge `CTR-06` |

TPO-05 is the single programme objective the AURORA risks are assessed against (`IMPACTS_TPO`: RA-01, RA-03 *Critical*; RA-05 *Medium*). Because TPO-05 contributes to **TCO-03** (diversification), AURORA's *direct* objective exposure is to diversification, while its *cash* exposure reaches the **TCO-04 IPO apex** through the cross-perimeter influence in §6 (RA-02 → RC-02 → `IMPACTS_TCO` TCO-04).

## 4. Timeline & milestones
| Phase | Window | Gate / content |
|---|---|---|
| Phase A/B (current) | through 2026 | System-level trade studies, subsystem definition, optical ISL risk-reduction campaign |
| **PDR** | **Q1 2027** | Preliminary Design Review; all subsystems **TRL 4+** ([[Canon & Figures Register\|TPO-05]]) |
| Partner-commitment checkpoint | by **2026-12-31** | Activation decision date for the strategic-partner risk **RA-04** |

> [!info] Programme budget (canon)
> **~$50M** total Phase-A/B→PDR, co-funded **~60% ESA/NASA (~$30M) / ~40% ODT (~$20M)**. ODT's **FY2028 internal burn ≈ $10M** is the BP-GEO `fcf_baseline`. See [[Canon & Figures Register]] §"Programme (AURORA-GEO)".

## 5. Supply chain & partners
AURORA's supply chain is **partnership-led**, not component-volume-led like HORIZON-LEO's satellite production line:
- **ESA / NASA co-funding partners** — the programme depends on sustained agency co-investment. A partner exit (strategic realignment or M&A) is risk **RA-04 Strategic partner withdrawal** (*Contingent*; activation decision **2026-12-31**) — owned by the [[Henrik Sorensen (Program Director)|AURORA Program Director]].
- **Optical ISL technology supplier(s)** — the free-space optical terminal is the critical-path technology. Its maturation is **RA-03**, and the underlying engineering failure mode (pointing accuracy in the GEO thermal environment) is the operational risk **ROE-03** owned by the **AURORA Chief Engineer**.
- **Cross-border technology sharing** — non-US partners require technology transfer that is gated by US export control; see §7.

The supply-chain fragility here is **few partners, high dependency** — the inverse of HORIZON-LEO's *dual-sourcing* problem ([[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] family). It is the same family lens (Supply Chain) applied to a programme where the "supplier" is a sovereign space agency.

## 6. Regulatory — ITAR & export control
Because AURORA-GEO shares **optical and relay technology with non-US partners**, it sits squarely under **US export control (ITAR)**:
- **RA-05 ITAR export control blocking key partnerships** (*Legacy*, owned by [[Amara Diallo (VP Compliance & Quality)|VP Compliance & Quality]]) — the risk that export restrictions prevent the technology sharing the programme needs.
- It **influences RA-04** (edge `INF-31`, *Strong*): ITAR friction can push a partner to withdraw rather than navigate the controls.
- It **impacts TPO-05** (`IMP-12`, *Medium*): export blocks can stall partner contributions needed for the PDR.
- Mitigated by **MIT-20** (ITAR compliance system, `MIG-33`, *High*) — structured technology sharing within legal boundaries.

This is the **Geopolitical/Regulatory** family ([[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]], [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]]) reaching into the GEO perimeter: the same export-control mechanism that disrupts LEO launch slots constrains AURORA's partner technology flow.

## 7. The risk graph (its RA-* risks)
All AURORA-GEO risks, with their graph attributes (scores live in the [[Data Dictionary|workbook/graph]], not the Canon $-register):

| ID | Risk | Lvl | Family | Owner | P | S | Exp | Status |
|---|---|---|---|---|---|---|---|---|
| **RA-01** | PDR technical readiness delay | Bus | Programme/Product | [[Henrik Sorensen (Program Director)\|Program Director]] | 6 | 7 | 42 | Active |
| **RA-02** | Development budget overrun | Bus | Programme/Financial | [[Diane Marchetti (CFO)\|CFO]] | 7 | 6 | 42 | Active |
| **RA-03** | Optical ISL technology maturation failure | Bus | Programme/Product | [[Raj Patel (CTO)\|CTO]] | 5 | 9 | 45 | Active |
| **RA-04** | Strategic partner withdrawal | Bus | Programme/Supply Chain | [[Henrik Sorensen (Program Director)\|Program Director]] | 4 | 9 | 36 | Contingent |
| **RA-05** | ITAR export control blocking partnerships | Bus | Programme/Regulatory | [[Amara Diallo (VP Compliance & Quality)\|VP Compliance & Quality]] | 5 | 7 | 35 | Legacy |
| **ROE-03** | Optical terminal pointing-accuracy failure | Op | Product/Engineering | AURORA Chief Engineer | 5 | 8 | 40 | Active |

### The internal AURORA chain (why it's a graph, not a list)
```
ROE-03  ──INF-03 (Critical)──▶  RA-03  ──INF-30 (Critical)──▶  RA-01  ──IMP-10──▶  TPO-05
(pointing accuracy)            (optical maturation)          (PDR slip)            (PDR gate)

RA-05  ──INF-31 (Strong)──▶  RA-04        RA-03 ──IMP-11 (Critical)──▶ TPO-05
(ITAR)                       (partner exit)   RA-05 ──IMP-12 (Medium)──▶  TPO-05
```
The optical terminal's pointing-accuracy failure (**ROE-03**, the engineering root) cascades up into technology-maturation failure (**RA-03**), which blocks PDR readiness (**RA-01**), which threatens the PDR gate (**TPO-05**). The ITAR risk (**RA-05**) drives partner withdrawal (**RA-04**) on a parallel track. This is the AURORA worked example of the **interconnection thesis** — a single technical root that the graph traces all the way to the programme objective.

## 8. Cross-perimeter convergence (the portfolio story)
AURORA's importance to RIM is that, despite being a separate P&L perimeter, **it does not stay contained**:

- **RA-02 (budget overrun) → RC-02 (cash runway)** — edge `INF-29` (*Moderate*): "AURORA budget overrun consumes cash reserves allocated for HORIZON operations." **RC-02 `IMPACTS_TCO` the IPO apex TCO-04** (IMC-05) and also drives **RC-03** (investor-confidence loss, `INF-25`), which itself impacts TCO-04 (IMC-06) — the financing/IPO collapse scenario [[BST-FN1 IPO Window Collapse (Financial)|FN1]] / **TCO-04**.

So the path is:
```
AURORA dev overrun (RA-02) ──▶ company cash (RC-02) ──IMPACTS_TCO──▶ IPO objective (TCO-04 / FN1)
                                         └──▶ investor confidence (RC-03) ──IMPACTS_TCO──▶ TCO-04
```
This is the canonical demonstration that **a second perimeter with no EBIT can still threaten the IPO story** — the diversification bet and the financing crunch are the same balance sheet. It preserves the all-roads-converge-on-FN1/TCO-04 thesis ([[ODT Sourcebook Rules|Rule 4]]) from the GEO side, and is now **provable in the graph** (RA-02 reaches TCO-04 within the convergence query's hop budget). See [[Influence Map]].

## 9. The executive narrative (demo / workshop framing)
> [!abstract] Use this section when presenting AURORA-GEO to board/sponsor stakeholders. Written straight (no RPG flavour) per [[ODT Sourcebook Rules|Rule 5]].

**Why ODT funds a second programme at all.** ODT is about to IPO as a **LEO operator that just turned its first profit** (+$13M EBIT). Told alone, that reads to public markets as a **commodity-capacity play** — exposed to price wars and over-supply — which caps the multiple. AURORA-GEO is the **second act of the equity story**: an optical-relay layer that makes ODT a *layered network operator* (platform, not point product), opens a **new addressable market** (relay-as-a-service for third parties and government), and carries **ESA/NASA co-funding** as sovereign validation. AURORA is *why the IPO is a growth story, not just a profitability story.*

**The tension that makes it a decision.** The same programme that lifts the multiple also consumes the cash the IPO-readiness test depends on:

| Marker (canon) | Value | Meaning |
|---|---|---|
| FY2028 FCF — plan | **−$40M** | negative by design (Phase-4 CapEx) |
| FCF — IPO-bridge assumption | **≥ −$60M** | the plan the IPO bridge is built on |
| FCF — distressed-raise trigger | **−$100M** | below → forced raise *before* IPO = [[BST-FN1 IPO Window Collapse (Financial)\|FN1]] |

That is a **$20M cushion** between plan and bridge assumption, and AURORA's ODT-share burn (~$10M/yr, §11) sits inside it. The board question is real: **keep funding AURORA to protect the growth narrative, or throttle it to protect FCF discipline for the IPO window?**

**How it illustrates RIM.** A flat register shows AURORA's risks (RA-01..05) as a contained R&D programme — "immaterial to the P&L." RIM shows the wire the register hides: `RA-02 → RC-02 → RC-03 → FN1 / TCO-01`. The pitch line: *"Your register says AURORA is a $50M science project. The graph says it's wired to the one objective your whole valuation rests on."* It also makes the **portfolio point** — two perimeters, two recovery metrics (LEO in EBIT/FCF, GEO in schedule/TRL/co-funding), normalised onto the same enterprise objectives.

**How it illustrates SPICE (decision support).** SPICE prices the AURORA scenarios (overrun RA-02 / partner exit RA-04 / ITAR block RA-05) into a **cash impact** and tests both the dedicated controls (MIT-09/14/20) and the strategic levers (throttle/re-stage AURORA, draw the $60M facility, secure more agency co-fund, slip PDR). Its headline output is a **"risk budget" for AURORA in IPO-window terms**: *how much AURORA burn can ODT absorb while keeping FCF ≥ −$60M?* — the number the board actually needs to make the funding decision above.

## 10. Mitigations
| Mitigation | Type | Addresses | Effectiveness |
|---|---|---|---|
| **MIT-09** AURORA optical-link risk-reduction campaign | Dedicated | RA-03 (`MIG-15`) | High |
| **MIT-14** Cash-flow / variance monitoring | Dedicated | RA-02 (`MIG-23`) + RC-02 (`MIG-22`) | Medium |
| **MIT-20** ITAR compliance system | Dedicated | RA-05 (`MIG-33`) | High |

The two technology/regulatory risks carry **High**-effectiveness dedicated controls; the financial overrun risk is only **Medium**-covered — the deliberate residual that lets RA-02 leak into the cash path in §8.

## 11. Owners
| Role (workbook owner string) | Cast |
|---|---|
| AURORA Program Director | [[Henrik Sorensen (Program Director)]] |
| AURORA Chief Engineer | (reports to engineering leadership — [[Priya Nair (VP Engineering)]] / [[Raj Patel (CTO)]]) |
| CFO (RA-02) | [[Diane Marchetti (CFO)]] |
| CTO (RA-03) | [[Raj Patel (CTO)]] |
| VP Compliance & Quality (RA-05) | [[Amara Diallo (VP Compliance & Quality)]] |

## 12. Programme snapshot
| Field | Value |
|---|---|
| Stage | Phase A/B; PDR gate **Q1 2027** ([[Canon & Figures Register\|TPO-05]]) |
| Total budget | **~$50M** Phase-A/B→PDR |
| Funding split | **~60% ESA/NASA (~$30M) / ~40% ODT (~$20M)** |
| Key tech | GEO optical relay, inter-satellite links, **TRL 4+ at PDR** |
| Recovery metric | **schedule & co-funding** (not EBIT) |
| Perimeter | **BP-GEO** — `ebit_baseline 0` (pre-revenue), `fcf_baseline −10` (ODT FY2028 burn); LEO −30 + GEO −10 = consolidated **−40** |
| Convergence | RA-02 → RC-02 →`IMPACTS_TCO`→ **TCO-04 (IPO)** / [[BST-FN1 IPO Window Collapse (Financial)\|FN1]] |

## 13. Open items
> [!check] Resolved this pass (CAN-02 closed)
> Budget (~$50M), co-funding split (~60/40) and BP-GEO perimeter modelling (`ebit 0` / `fcf −10`) are now in [[Canon & Figures Register]]; the `BP-GEO` node is in the seed; consolidation reconciles (LEO −30 + GEO −10 = −40), closing **CAN-02** and the FCF half of **CAN-01**.

> [!check] SPICE on BP-GEO — done (2026-06-26)
> Family **[[BST-GA1 AURORA-GEO Development Overrun (Programme)|BST-GA1]]** (Development Overrun & Co-Funding Shock) is `ASSESSED_AGAINST` **BP-GEO** — illustrates RA-02/RA-04, caused-by ROE-03, three FCF cases (−6/−12/−24; pessimistic −64 consolidated breaches the −60 IPO-bridge), addresses MO-GA1-1/2/3, mitigated by SM-AURORA-DERISK/VARIANCE + the shared bridge facility. BP-GEO is now SPICE-covered; the portfolio heatmap lights up on platform load.

> [!check] ENH-05 resolved (2026-06-26) — by **TCO-04**, not an edge
> Rather than patch one path, the owner added **TCO-04 "successful IPO by H1 2029"** as the convergence apex. The financial-risk cluster **RC-01/RC-02/RC-03 now `IMPACTS_TCO` TCO-04** (IMC-04/05/06), so GA1 (RA-02 → RC-02 → TCO-04) and FN1 both provably reach the IPO objective. TCO-01 (EBITDA) stays as the IPO's headline enabler.

> [!check] Resolved 2026-06-26 (CAN-01 / INC-02 closed)
> - **CAN-01 (EBIT half) — closed.** AURORA dev-spend is treated as **capitalised** (hits FCF, not EBIT), so BP-GEO stays `ebit_baseline 0` and BP-LEO now carries the **true EBIT +13** (was the EBITDA-level 45). Consolidated EBIT = LEO 13 + GEO 0 = **+13** ✔, closing CAN-01 and the EBIT leg of CAN-03.
> - **INC-02 — superseded 2026-06-30.** GP1's direct `ILLUSTRATES` → RA-02 was reverted: [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] now `ILLUSTRATES` → **RH-01** (launch slip) + **RA-05** (export-control), the risks its own narrative names. AURORA's budget keeps GP1's cross-perimeter reach **indirectly** (RA-05 → RA-04 → RA-02 → RC-02 → FN1), so the GEO-perimeter convergence still holds.

---
*Changelog:*
- *v0.5 (2026-06-26) — convergence apex repointed to new **TCO-04 (IPO)**: RC-01/02/03 → TCO-04, RA-02 (GA1) now provably reaches the IPO objective; ENH-05 resolved. §3/§8/§11 updated.*
- *v0.4 (2026-06-26) — GEO SPICE case built: family BST-GA1 assessed against BP-GEO (bestiary entry + index + FN1 influenced-by updated; regenerated seed). BP-GEO now SPICE-covered. Raised ENH-05 (RC-02/RC-03→TCO-01 convergence-proof gap).*
- *v0.3 (2026-06-25) — figures landed (canon-first): ~$50M budget, ~60/40 ESA-NASA-ODT split, BP-GEO perimeter node (`ebit 0` / `fcf −10`) added to workbook + regenerated seed; consolidation reconciled (closes CAN-02 + FCF half of CAN-01). Added §9 executive/workshop narrative (equity second-act, FCF-cushion tension, RIM/SPICE decision-support framing). Open items trimmed to INC-02, CAN-01 EBIT half, and a future BP-GEO SPICE case.*
- *v0.2 (2026-06-25) — fleshed to second-perimeter depth: objectives (TPO-05→TCO-03), timeline, partnership-led supply chain, ITAR/export-control regulatory section, full RA-* risk graph with the ROE-03→RA-03→RA-01→TPO-05 chain, cross-perimeter convergence (RA-02→RC-02→RC-03→FN1), mitigations and owners.*
- *v0.1 — initial scaffold.*
