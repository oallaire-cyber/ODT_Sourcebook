---
type: bestiary-template
sourcebook-line: "03 - Bestiary"
status: new
tags: [bestiary, template, status/new]
---
# 🧩 _Scenario Stat-Block Template
> [!info] Copy this to create a new bestiary entry. Fields map 1:1 to the `SpiceScenario` schema + the cyber context-node pattern. Numbers come from [[Canon & Figures Register]]; never invent a baseline.

```yaml
---
type: bestiary-entry
sourcebook-line: "03 - Bestiary"
status: new
scenario-id: BST-XX1
scenario-family-id: <uuid>          # shared by all 3 cases + versions
family: <cyber|supply-chain|regulatory|geopolitical|financial|climate|...>
cause-type: <security|climate|hazard|geopolitical|other>   # schema enum
illustrates: [<Business Risk id>]   # ILLUSTRATES
caused-by: [<Operational Risk ids>] # CAUSED_BY
assessed-against: <BP-LEO|BP-GEO>   # ASSESSED_AGAINST (P&L perimeter)
addresses: [<Mitigation Objective ids>]   # ADDRESSES
influences: [<BST ids> with strength]      # cross-family INFLUENCES
influenced-by: [<BST ids> with strength]
validated: <proposed|business|technical|finance|approved>
tags: [bestiary, bestiary/<family>, status/new]
---
```
**Sponsor / cause** · **Business objective** (consequence, not technique) · **One plausible path** (last steps only) · **Detection assumption**.

**Three cases** (P10 / P50 / P90 → MagnitudeCalibrator):
| Case | EBIT y1 | y2 | y3 | EBIT total | FCF y1 | Crisis days | Op recovery | Fin recovery yrs |
|---|---|---|---|---|---|---|---|---|

**Mitigation objectives** (`ADDRESSES`) and **SPICE mitigations** (`MITIGATED_BY_SPICE` / `FULFILS`).
**Interconnection** — what it influences and is influenced by (the reason it's in a graph).
