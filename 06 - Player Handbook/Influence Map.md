---
type: player-handbook
sourcebook-line: "06 - Player Handbook"
status: new
tags: [player-handbook, influence-map, status/new]
aliases: ["The World Map", "Causal Network"]
---
# 🗺️ Influence Map — how ODT's risks connect
> [!info] The cross-family causal network, the visible form of the RIM thesis. Edge labels are `INFLUENCES` strengths.

```mermaid
graph LR
  subgraph Causes
    GP1[GP1 Geopolitical]
    SEC1[SEC-01 APT on C2]
    SEC2[SEC-02 firmware]
    SEC4[SEC-04 enclave]
  end
  GP1 -->|Strong| SC1[SC1 Supply Chain]
  GP1 -->|Moderate| RG1[RG1 Regulatory]
  SEC2 --> SC1
  SEC1 --> S1[S1 Cyber outage]
  SEC4 --> RG1
  SC1 -->|Weak| S1
  S1 -->|Moderate| RG1
  SC1 -->|Strong| FN1((FN1 IPO collapse))
  RG1 -->|Strong| FN1
  S1  -->|Strong| FN1
  GP1 -->|Moderate| FN1
  FN1 -->|IMPACTS_TCO| TCO1{{TCO-01 EBITDA}}
  RG1 -->|IMPACTS_TCO| TCO2{{TCO-02 licenses}}
  classDef sink fill:#a93226,color:#fff;
  class FN1 sink;
```

## Read it like this
Four **different causes** (a hacker, a supplier, a regulator, a geopolitical shift) propagate through different families and **converge on FN1 / TCO-01**. The mitigations worth most are the ones on shared edges — the **commonality view**. Full entries in [[Bestiary Index]].
