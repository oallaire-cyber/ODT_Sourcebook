---
type: sponsor-surface
sourcebook-line: "04 - Modules"
surface: live-demo-script
status: new
audience: presenter (to board / sponsor / exec)
pinned-to: [BST-S1, BST-FN1]
cites-canon: [Canon & Figures Register]
runtime: ~15-18 min + Q&A
tags: [sponsor-surface, demo-script, runbook, status/new]
---
# Live Demo Script — Animating the Risk Graph
### A ~15-minute RIM walkthrough that takes a sponsor from "we have a risk register" to "we made a board decision"

> Presenter runbook. Companions: [[Sponsor One-Pager - Pricing the Cyber Tail]] (leave-behind) and [[Sponsor Exec Briefing - Risks That Converge on the IPO]] (the full argument). All figures from the ODT canonical dataset, order-of-magnitude by design; ODT is an illustrative composite. **Format per beat:** `[SHOW]` = what's on screen · `[SAY]` = talking track · `[AHA]` = the point to land.

---

## Pre-flight (before the room)
- [ ] RIM loaded with the ODT demo graph (`demo_seed.cypher` — 6 SpiceScenario families, FN1 sink, TCO-01..04, BP-LEO + BP-GEO). Confirm node counts render.
- [ ] Three views bookmarked and ready: **(A)** flat risk list, **(B)** the influence graph, **(C)** the S1 scenario card with its three cases.
- [ ] Mitigation toggle for **SM-IDENTITY-SPLIT** + **SM-CTRL-RECOVERY** ready to apply live.
- [ ] One-pager open in a tab as the leave-behind. Cheat-card (below) on a sticky.
- [ ] **Know your audience's currency:** lead with EBIT/FCF and the IPO, not nodes and edges.

> [!tip] Golden rule of the demo
> The product is **not** the graph. The product is the **board decision** the graph makes possible. Every beat should move toward *"what do we spend, and what does it buy?"*

---

## Scene 1 — Open on the stake (≈1.5 min)
`[SHOW]` A single slide / panel: **Revenue $270M · EBIT +$13M · IPO ~$250M, H1 2029 · Liquidity trigger −$100M FCF.**
`[SAY]` "ODT has its first profitable year and a listing 18 months out. One line governs everything: free cash flow must stay above **−$100M**. Below it, you raise distressed and dilutive *before* you list, and the equity story is gone. Hold that number in your head — every risk we look at is a risk to *it*."
`[AHA]` Frame the whole demo as protecting **one objective**, in the board's currency.

## Scene 2 — The register that hides the truth (≈1.5 min)
`[SHOW]` **View A** — the flat risk list: cyber, supply chain, regulatory, geopolitical, programme, financial.
`[SAY]` "This is what most boards see — a list. It tells you each risk exists. It does *not* tell you they're connected, which ones matter most, or what to fund first. Watch what happens when we stop treating them as a list."
`[AHA]` The flat register is the *problem*, not the tool.

## Scene 3 — The graph: everything converges (≈2.5 min)
`[SHOW]` **View B** — the influence graph. Highlight the six families flowing into **FN1 (IPO Window Collapse)**, and FN1 → **TCO-04 (the IPO)**.
`[SAY]` "Same six risks — now as a causal network. A hacker, a supplier, a regulator, a geopolitical shift, a programme overrun — utterly different causes — and they **all land in the same place**: FN1, the collapsed IPO. FN1 has no arrows *out*; it's the sink. This convergence is invisible in a list and it's the single most important thing RIM shows you."
`[AHA]` Risk is a **graph with one sink** — and the sink is the listing.

## Scene 4 — Drill into the hero: pricing the cyber tail (≈2.5 min)
`[SHOW]` **View C** — the S1 scenario card with its three cases.
`[SAY]` "Take the cyber case, S1 — a compromise of the ground segment. We don't argue about how scary it is; we **price it**, in EBIT and cash, across three cases." Walk the row: "Realistic, it's a **−$69M** EBIT hit — it turns +$13M into roughly −$41M. Best case, absorbed. Pessimistic, **−$118M of free cash flow.**"
`[AHA]` Fear became a **distribution with numbers**, in the board's own units.

## Scene 5 — The edge that matters (≈1.5 min)
`[SHOW]` Trace the **S1 → FN1** edge live; overlay the **−$100M trigger** on the pessimistic FCF.
`[SAY]` "Here's the moment. In the pessimistic case, FCF hits **−$118M** — it **crosses the −$100M line.** A *cyber* event just became a *financing* event. That's not a metaphor; it's this edge, S1 into FN1. The IT incident is now an IPO incident."
`[AHA]` One arrow turns a technical risk into the company's worst financial outcome.

## Scene 6 — The decision: spend vs. tail (≈3 min)
`[SHOW]` First the **$50M insurance** node; read its exclusion. Then **apply the two controls live** and let the pessimistic case redraw above the trigger.
`[SAY]` "The comfortable answer is the **$50M insurance tower** — except its **war/state-actor exclusion** is written against exactly this attacker, and attribution takes days. It doesn't pay. Now watch the controls that *do* move the curve." → apply toggle → "Splitting the identity plane (~$4M) and a clean recovery capability (~$1.5M) — **~$5.5M, one-time** — pulls the pessimistic case **back above −$100M.** The edge to FN1 is severed." Land it: "**~$5.5M of spend removes a ~$69M realistic loss — about 12× — and protects a ~$250M IPO.** That's the decision, with the avoided loss on the same slide."
`[AHA]` From *"are we secure?"* to *"~$5.5M buys ~12× and saves the listing."* **This is the whole point of the demo.**

## Scene 7 — Why a graph pays off: commonality + the second bet (≈2 min)
`[SHOW]` Back to **View B**; highlight shared edges into FN1; then surface **GA1 / BP-GEO** as a second perimeter.
`[SAY]` "Because everything converges, the mitigations worth most sit on the **shared edges** — fund those and you buy down several families at once. And it's not one P&L: AURORA-GEO is a **second perimeter** (~$50M programme, ~$20M of it ODT's own cash) and its overrun risk lands on the *same* FN1 through RA-02 → RC-02. Same objective, same graph, same method — across both bets."
`[AHA]` RIM allocates capital by **leverage**, across perimeters, not line-by-line.

## Scene 8 — Close: the repeatable loop (≈1 min)
`[SHOW]` The one-pager (leave-behind) on screen.
`[SAY]` "We took one fear, priced it, found the edge that reaches the IPO, and bought it down for a rounding error — and we can disclose a *modelled* residual instead of hoping. Now point the same loop at the other five families. That's RIM: from *'are we secure?'* to *'what do we spend, and what does it buy?'* — for every risk that converges on the listing."
`[AHA]` The method is **repeatable**; today was one of six.

---

## Q&A backstops
- **"Are these numbers real?"** → Order-of-magnitude by design on an illustrative company; the *method and the graph* are the product, not the specific dollar values.
- **"Why not just buy more insurance?"** → Scene 6: the tower's exclusion doesn't pay for a state-aligned actor, and attribution lag delays the trigger anyway. Real controls move the curve; paper coverage doesn't.
- **"Isn't this just a risk register with arrows?"** → The arrows *are* the value: they reveal the convergence and tell you which mitigations protect several families at once. A list can't.
- **"What does it cost to run?"** → It's the same elicitation you already do for a register, captured as a graph; the marginal step is pricing in EBIT/FCF — which is what makes it a *board* tool.
- **If the live mitigation toggle fails** → fall back to the static before/after on the one-pager (−$118M → above −$100M) and keep talking; never debug on stage.

## Presenter cheat-card (canon figures)
| Item | Figure |
|---|---|
| Revenue / EBIT / FCF (FY2028) | $270M / +$13M / −$40M |
| IPO | ~$250M, Nasdaq, H1 2029 (TCO-04) |
| Liquidity trigger | −$100M FCF |
| S1 realistic / pessimistic | −$69M EBIT / **−$118M FCF** (breaches trigger) |
| Insurance | $50M limit, war/state-actor exclusion |
| Controls (spend) | ~$4M + ~$1.5M = **~$5.5M** one-time |
| Return | **≈ 12×** the realistic feared loss |
| AURORA-GEO / BP-GEO | ~$50M programme, ~$20M ODT cash, ~$10M FY2028 burn |

---
*Sources: [[Canon & Figures Register]]; [[Bestiary Index]] + [[Influence Map]] (the graph being demoed); [[Annex - RIM Anchoring]] + [[Data Dictionary]] (lore→graph crosswalk, demo dataset); [[BST-S1 NOC Ground Compromise (Cyber)|S1]] / [[BST-FN1 IPO Window Collapse (Financial)|FN1]]. Narrative companion: [[THE NUMBER - Season 1 (external)|THE NUMBER]] / [[THE NUMBER - Season 2 (mitigation)|Season 2]]. Figures order-of-magnitude by design (Rule 6); ODT is fictional.*

*Changelog*
- 2026-06-26: created — third and final **backlog #7 sponsor surface** (live demo script). 8-scene presenter runbook (SHOW/SAY/AHA) animating the convergence graph on the RIM platform: stake → flat register → graph → price S1 → S1→FN1 edge → apply controls live (~$5.5M, ~12×, sever the edge) → commonality + AURORA-GEO second perimeter → repeatable loop. Q&A backstops + canon cheat-card. Strictly professional (Rule 5), all figures canon-cited. **Closes backlog #7.**
