---
type: character
sourcebook-line: "02 - Cast"
status: new
role: "VP Manufacturing & Supply Chain"
reports-to: "[[Elena Vasquez (CEO)]] (via COO); programme dotted-line to [[Henrik Sorensen (Program Director)]]"
bears: "ROM-01 (RF sole-source), ROM-02 (battery delay)"
stewards: "MIT-02 (RF dual-sourcing); SPICE: SM-DUAL-SOURCE, SM-PLM-INTEGRITY, SM-CLEAN-BUILD"
tags: [cast, character, status/new]
---
# 🧑‍🏭 Carlos Mendes
**Role:** VP Manufacturing & Supply Chain · **Reports to:** [[Elena Vasquez (CEO)]] (via COO); programme dotted-line to [[Henrik Sorensen (Program Director)]]

> [!quote] In character
> "I can build you a satellite a month. What I can't do is *prove* the ones we already built are clean — not without re-opening the line." The man who turns a supplier headline into a production decision.

## Mandate
Owns **production, suppliers, quality and logistics** for HORIZON-LEO — the satellite build line, the tier-1 supplier relationships (Teledyne and Airbus DS for RF, Saft for batteries, Northrop Grumman / Spirit Aero for structures), and the **shared PLM/engineering platform that suppliers plug into** ([[Annex - Security Architecture]] §5.2). His line feeds [[Yuki Tanaka (VP Launch Operations)|Yuki]]'s manifest; his clean-build integrity is what [[Tom Reuter (CISO)|Tom]] worries about.

## Objectives owned
- [[Canon & Figures Register|TPO-02]] — Phase 3 deployment, via on-time, clean production (rolls to TCO-01).
- Yield and qualification gates for Phase 4 manufacturing (the $77M CapEx line).

## What keeps them up at night
A **sole-source RF supplier going dark** with no qualified second source mid-Phase-4. And the SC1 nightmare: *"a supplier breach notice lands, and I cannot certify which Phase-4 units are clean — so do we slip the schedule or fly something we're not sure of?"*

## Risk footprint (graph)
- **`BEARS`**: ROM-01 (RF component sole-source supplier failure), ROM-02 (battery supplier delivery delay). Oversees ROM-03 (composite quality, *Quality Manager*) and ROM-04 (clean-room contamination, *Plant Director*).
- **`STEWARDS`**: MIT-02 (RF dual-sourcing qualification). SPICE-layer: **SM-DUAL-SOURCE** (RF dual-source + multi-launcher framework), **SM-PLM-INTEGRITY** (PLM integrity monitoring & supplier access governance), **SM-CLEAN-BUILD** (re-verification / clean-build line).
- **Bestiary**: bears the supplier/build-chain risks behind [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]]; his ROM-01 is a named cause of [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] (export control hitting RF supply).

## Their language
Lead times, qualification, single-source, yield, clean-room class, certificate of conformance, tamper-evidence. Translates 'attack' into *"can I ship a clean satellite on schedule?"*

## Appears in
Scenarios: [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]] (owner), [[BST-GP1 Export-Control & Launch Disruption (Geopolitical)|GP1]] (supply cause).
