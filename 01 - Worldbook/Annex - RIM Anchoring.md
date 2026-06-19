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
| ODT enterprise goals | `ContextNode{node_type:'tco'}` — TCO-01..03 |
| Programme objectives | `ContextNode{node_type:'tpo'}` → `CONTRIBUTES_TO` → TCO |
| HORIZON-LEO / AURORA-GEO as P&L units | `ContextNode{node_type:'business_perimeter'}` (BP-LEO, BP-GEO) |
| A risk owner ([[Cast Roster|the cast]]) | `ContextNode{node_type:'owner'}` → `BEARS`/`STEWARDS` |
| A feared event, priced | `SpiceScenario` family (3 cases) → see [[Bestiary Index]] |
| Cause→consequence propagation | `INFLUENCES` (level1/2/3, weak→critical) |
| The A4 architecture | `technical_perimeter` / `entry_point` / `functional_target` |

> [!example] One stitched chain
> [[Tom Reuter (CISO)|Tom]] `BEARS` SEC-01 → `INFLUENCES` RH-04 → `IMPACTS_TCO` TCO-01, and the same risk family is priced by [[BST-S1 NOC Ground Compromise (Cyber)|S1]] which is `ASSESSED_AGAINST` BP-LEO.
