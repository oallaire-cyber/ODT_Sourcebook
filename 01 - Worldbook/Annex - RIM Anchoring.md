---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: new
tags: [worldbook, rim, anchoring, status/new]
---
# 🔗 Annex — RIM Anchoring (lore → graph)
> [!info] The crosswalk between the **setting** and the **graph**. Pairs with [[Data Dictionary]].

| Worldbook concept | Graph object (schema) |
|---|---|
| ODT enterprise goals | `ContextNode{node_type:'tco'}` — TCO-01..04 (TCO-04 = IPO apex) |
| Programme objectives | `ContextNode{node_type:'tpo'}` → `CONTRIBUTES_TO` → TCO |
| HORIZON-LEO / AURORA-GEO as P&L units | `ContextNode{node_type:'business_perimeter'}` (BP-LEO, BP-GEO) |
| A risk owner ([[Cast Roster|the cast]]) | `ContextNode{node_type:'owner'}` → `BEARS`/`STEWARDS` |
| A feared event, priced | `SpiceScenario` family (3 cases) → see [[Bestiary Index]] |
| Cause→consequence propagation | `INFLUENCES` (level1/2/3, weak→critical) |
| The A4 architecture | `technical_perimeter` / `entry_point` / `functional_target` |

> [!example] One stitched chain
> [[Tom Reuter (CISO)|Tom]] `BEARS` SEC-01 → `INFLUENCES` RC-05 (INF-15) → `IMPACTS_TCO` TCO-03 (and on to the IPO apex TCO-04 via RC-05 → RC-03), and that same RC-05 risk is exactly what [[BST-S1 NOC Ground Compromise (Cyber)|S1]] `ILLUSTRATES`, `ASSESSED_AGAINST` BP-LEO.
