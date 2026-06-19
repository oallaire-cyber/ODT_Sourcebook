---
type: moc
sourcebook-line: "03 - Bestiary"
status: new
tags: [bestiary, moc, status/new]
aliases: ["Adversary Codex", "Scenario Database"]
---
# 👹 Bestiary — Scenario & Threat Database

Each entry is a **priced feared-event** — a `SpiceScenario` family (three cases) attached to a Business Risk and assessed against a P&L perimeter. The bestiary is **multi-family and extensible**: cyber is just the first family.

## Families seeded
| Entry | Family | Illustrates | Cause | ≈ Realistic cost |
|---|---|---|---|---|
| [[BST-S1 NOC Ground Compromise (Cyber)|S1]] | Cyber | RH-04 / RC-01 | security | **$69M** |
| [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] | Supply Chain | RH-02 | security (supply-chain) | $36M |
| [[BST-RG1 Accreditation Suspension (Regulatory)|RG1]] | Regulatory | RH-05 | other (regulatory) | $48M |
| [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] | Geopolitical | RH-04 / RA-02 | geopolitical | $30M |
| [[BST-FN1 IPO Window Collapse (Financial)|FN1]] | Financial / IPO | RC-01 / RC-02 / RC-03 | other (financial) | dilution-priced |

## The interconnection — why this is a graph, not a list
> [!important] The thesis
> These are **not independent monsters.** Every family eventually **converges on the financing/IPO objective** ([[Canon & Figures Register|TCO-01]]). A flat register hides this; RIM surfaces it. This is the single most important thing the bestiary demonstrates.

```mermaid
graph LR
  GP1[GP1 · Geopolitical<br/>export control / launch] -->|Strong| SC1[SC1 · Supply Chain<br/>build-chain intrusion]
  GP1 -->|Moderate| RG1[RG1 · Regulatory<br/>accreditation suspension]
  SC1 -->|Weak| S1[S1 · Cyber<br/>NOC / ground compromise]
  S1 -->|Moderate| RG1
  SC1 -->|Strong| FN1((FN1 · Financial<br/>IPO window collapse))
  RG1 -->|Strong| FN1
  S1  -->|Strong| FN1
  classDef sink fill:#a93226,color:#fff,stroke:#7b241c;
  class FN1 sink;
```
*Edge labels are `INFLUENCES` strengths (weak 0.25 / moderate 0.5 / strong 0.75 / critical 1.0). Rendered full in [[Influence Map]].*

## How to add a family
Copy [[_Scenario Stat-Block Template]], fill the three cases, declare `illustrates` / `caused-by` / `assessed-against`, and — crucially — wire `influences` / `influenced-by` to existing entries. Tracked in [[SESSION-STATE]].
