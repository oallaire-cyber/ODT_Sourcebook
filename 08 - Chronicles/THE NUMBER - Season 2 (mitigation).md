---
type: chronicle
sourcebook-line: "08 - Chronicles"
status: new
season: 2
pinned-to: [BST-S1]
mitigation-objectives: [MO-S1-1, MO-S1-2, MO-S1-3, MO-FN1-1, MO-FN1-2]
spice-mitigations: [SM-IDENTITY-SPLIT, SM-CTRL-RECOVERY, SM-CYBER-INS]
cast: [Maya, Tom, Sofia, Marc, Diane, Elena, Amara]
tags: [chronicle, season-2, mitigation, status/new]
---
# 🛰️ THE NUMBER — Season 2 *(outline)*
**Season theme:** *Mitigation / return-on-spend.* Season 1 produced **the number** — a **$69M** realistic feared loss (P50) for [[BST-S1 NOC Ground Compromise (Cyber)|S1]], with a pessimistic tail of **−$110M EBIT / −$118M FCF** that crosses the **−$100M FCF liquidity trigger** ([[Canon & Figures Register]]) and *becomes* [[BST-FN1 IPO Window Collapse (Financial)|FN1]]. Season 2 asks the only question a board ever really asks back: **"so what do we spend, and what does it buy?"**

> [!important] The pivot from S1
> S1 was **quantification** — turning "we're afraid of a cyber attack" into a priced distribution. S2 is **decision-support** — turning that distribution into a *defensible spend*. The hero of S2 is not the threat; it is **the residual loss after mitigation**, and the proof that money moved the curve.

Pinned to S1's mitigation objectives — **MO-S1-1 / MO-S1-2 / MO-S1-3** (the three controls the S1 stat-block names) plus the financial-layer **MO-FN1-1 / MO-FN1-2** — and dramatised through the three S1 controls (core `Mitigation` registry, CR-01): **SM-IDENTITY-SPLIT**, **SM-CTRL-RECOVERY**, **SM-CYBER-INS**.

---

## The dramatic engine (three teaching beats)
1. **The comfortable answer fails.** The board's instinct is the **$50M cyber-insurance tower** (SM-CYBER-INS). But its **war/state-actor exclusion** is written against exactly S1's sponsor — *a state-aligned actor* — and attribution takes days. The tower they already pay for **does not pay for this**. This is **MO-FN1-2** ("insurance that *actually pays*") made dramatic: a control that looks like coverage and isn't.
2. **The controls that move the curve cost less than the tail.** SPICE models residual loss after each real control: **SM-IDENTITY-SPLIT** (kills the single Denver/Dublin plane → **MO-S1-1** 100% / **MO-S1-2** 40%) and **SM-CTRL-RECOVERY** (offline golden images cut crisis days → **MO-S1-3** 90%). Together they collapse the *pessimistic* path — the one that breaches the trigger and creates FN1.
3. **Disclosure beats denial.** Diane's lever (**MO-FN1-3**, an *un-purchasable* governance objective) returns: she would rather put a **small, modelled residual** into the IPO file than carry an unmodelled tail. The season ends with risk as a line the company **owns and discloses**, not one it hopes away.

---

## Cast
Same core as [[THE NUMBER - Season 1 (external)|Season 1]] — [[Maya Okonkwo (Facilitator)|Maya]] (facilitator), [[Tom Reuter (CISO)|Tom]] (CISO), [[Sofia Adler (VP Ground & Operations)|Sofia]] (ground/ops), [[Marc Lindqvist (Finance Controller)|Marc]] (the model), [[Diane Marchetti (CFO)|Diane]] (the lever) — promoted by the IPO stakes to add [[Elena Vasquez (CEO)|Elena]] (CEO; owns **TCO-04**, the IPO) and [[Amara Diallo (VP Compliance & Quality)|Amara]] (insurance wording + disclosure).

---

## Episode beat sheet (12, mirroring S1)

### Act I — The comfortable answer (Ep 1–4)
1. **"We have a number. Now write the cheque."** Cold open in the boardroom: S1's **$69M** is on the slide; Elena wants a one-line answer for the IPO roadshow. Diane refuses to sign a cheque without knowing what it *removes*. Maya reframes: we don't buy "security," we buy **movement in the distribution**.
2. **The tower.** Tom walks the **$50M insurance tower** ($50M limit, $5M deductible, BI cover after 72h). Relief in the room — until Amara reads the **war/state-actor exclusion** aloud against S1's own sponsor profile. The comfortable answer just evaporated. *(MO-FN1-2.)*
3. **Attribution time.** Sofia replays the S1 path: customers see degraded service before ODT confirms cause; **attribution takes days**, so the BI clock and the insurance trigger both start late. The tower's *fine print* and S1's *detection lag* are the same wound. The insurer's loss-adjuster, not the threat actor, becomes the antagonist.
4. **What's actually exposed.** Marc strips the slide back to the three S1 cases (best −$40M / realistic −$69M / pessimistic −$110M EBIT; FCF −60 / −79 / **−118**). The room sees it for the first time: the **pessimistic FCF breaches −$100M** → distressed raise → **FN1** → no IPO. The season's real stakes are named.

### Act II — Modelling the spend (Ep 5–8)
5. **Three candidate controls.** Maya puts the S1 stat-block's mitigation objectives on the wall: **MO-S1-1** split the planes, **MO-S1-2** harden MSSP access, **MO-S1-3** clean recovery. Tom maps them to buyable things: **SM-IDENTITY-SPLIT** and **SM-CTRL-RECOVERY** (both currently *planned*, not done).
6. **The single plane.** Deep dive on **SM-IDENTITY-SPLIT**: the shared Denver/Dublin identity/PAM plane is *why* one compromise trips the whole fleet. Break it and the **fleet-wide safe-mode** stops being a single move. SPICE shows it flattening the *severity* of every case at once. *(MO-S1-1 100% / MO-S1-2 40%.)*
7. **Buying days back.** **SM-CTRL-RECOVERY**: offline golden images + a rehearsed rebuild runbook turn "6 weeks" into "days." Crisis duration is what drives the y1 EBIT hit; cut the days, cut the tail. Sofia's ops team, not Tom's, owns this — the first cross-functional ownership beat. *(MO-S1-3 90%.)*
8. **Return on spend.** Marc runs the portfolio through SPICE: a **~$5.5M** control spend (SM-IDENTITY-SPLIT **~$4M** + SM-CTRL-RECOVERY **~$1.5M**, one-time capex) against the un-mitigated **$69M** realistic tail — roughly a **12× return** before you even count the *pessimistic* case it removes. The moment that matters: the **pessimistic case pulled back above −$100M**, so ODT *never becomes FN1*. The return isn't "fewer breaches"; it's **a preserved ~$250M IPO** for the price of a rounding error.

### Act III — The decision & the disclosure (Ep 9–12)
9. **The over-coverage trap.** A tempting move: stack the bridge facility behind the insurance and call it covered. RIM flags **>100% declared contribution** on MO-FN1-2 (the canon *over-coverage* teaching point) — paper coverage isn't real coverage. The board learns to read the heatmap, not the comfort.
10. **Residual, owned.** Diane reframes the leftover: after SM-IDENTITY-SPLIT + SM-CTRL-RECOVERY, a *modelled, bounded* residual remains. She'd rather **disclose** that than insure a tail no underwriter will honour. **MO-FN1-3** — her un-purchasable lever — becomes the plan. *(MO-FN1-1: hold FY2028 FCF above the trigger.)*
11. **The board signs.** Elena ties it to **TCO-04**: this is what makes the IPO bridge (FCF ≥ −$60M) credible to investors. The cheque Diane refused in Ep 1 is now written — for the *right* controls, with the *avoided loss* on the same slide. The "number" of S2 is the **return**, not the threat.
12. **"Do this again — with a different risk."** Closing beat carried over from S1: Diane's on-ramp line. The method that priced and then *retired* the cyber tail is pointed at the rest of the [[Bestiary Index|bestiary]] — supply chain, regulatory, geopolitical, financial, programme — all of which converge on the same **IPO apex (TCO-04)**. Sets up the **beyond-cyber spin-offs**.

---

## Canon anchoring (figures cited, not invented)
| Used in S2 | Value | Source |
|---|---|---|
| S1 realistic feared loss | **−$69M EBIT / −$79M FCF** | [[BST-S1 NOC Ground Compromise (Cyber)|S1]] P50 |
| S1 pessimistic tail | **−$110M EBIT / −$118M FCF** | S1 P90 (breaches trigger) |
| Liquidity trigger | **−$100M FCF** → distressed raise | [[Canon & Figures Register]] |
| IPO bridge assumption | **FCF ≥ −$60M** | Canon (State B) |
| Cyber insurance tower | **$50M limit / $5M deductible / BI after 72h / war-state exclusion** | Canon (Insurance) |
| Bridge facility + cash | **$60M facility + $85M** | Canon (State B) |
| The IPO being protected | **~$250M, Nasdaq, H1 2029** (TCO-04) | Canon |
| Control portfolio (the spend) | **~$4M + ~$1.5M = ~$5.5M** one-time | Canon (Mitigation costs — S1 controls) |

## 🔗 Interconnection
S2 is the **mitigation mirror** of S1: same scenario family, now read through `ADDRESSES` (MO-S1-1/2/3) and `MITIGATED_BY_SPICE` (SM-IDENTITY-SPLIT / SM-CTRL-RECOVERY / SM-CYBER-INS). Its through-line is the S1→FN1 edge: by pulling the **pessimistic FCF case back above −$100M**, the season *severs* the path from cyber event to [[BST-FN1 IPO Window Collapse (Financial)|FN1]] — i.e. it dramatises a mitigation **breaking an influence edge**, the single most important thing RIM lets a board do. Tees up the beyond-cyber spin-offs in [[Chronicles Index]].

## Governance note
Both sides of S2's return are now canonical: the **avoided loss** (S1 case deltas, the −$100M trigger, the $50M insurance limit) and the **control spend** — SM-IDENTITY-SPLIT **~$4M** + SM-CTRL-RECOVERY **~$1.5M** one-time (USD_M), carried as **`committed_budget`** while the controls are `planned` (→ `capex` on funding; CR-01), set canon-first in `demo_seed.cypher`. So the return ratio is quantitative (~12× on the realistic tail). The S2 payoff is now also a literal graph object: the **S1 mitigated version** (v2, projection) holds pessimistic FCF at **−82** (above −100), severing S1→FN1. Tracked as **ENH-06** (Applied) in [[Canon Change & Issue Register]]; the consolidation/version mechanism is **CR-01** (Applied). *(Figures are order-of-magnitude by design, Rule 6.)*

---
*Changelog*
- 2026-06-26: Season 2 outline created (backlog #6). Pinned to S1 mitigation objectives MO-S1-1/2/3 + MO-FN1-1/2 and the three S1 spice_mitigations; 12-episode beat sheet built on the insurance-exclusion irony and the FCF-trigger / FN1 severance. Raised ENH-06 (control mitigation pricing). [[Chronicles Index]] status flips S2 → outline.
