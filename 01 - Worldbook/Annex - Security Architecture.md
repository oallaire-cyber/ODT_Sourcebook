---
type: worldbook-annex
sourcebook-line: "01 - Worldbook"
status: active
tags: [worldbook, architecture, status/active]
---
# 🛰️ Annex — Security-Relevant Architecture (State B)
> [!info] Detachable annex of [[ODT Worldbook - Core]]; the **textual twin of the A4 workshop schema** and the structural source for the graph's `technical_perimeter` / `entry_point` / `functional_target` nodes ([[Data Dictionary]]). Ported from `ODT_Context_v2.2_DualState.md` §7 (+ §5.2 digital-dependency note).

This is where the **digital control of the business actually lives — the red-team hunting ground.** Each element below is tagged with the graph node type it maps to so the bestiary kill-chains ([[BST-S1 NOC Ground Compromise (Cyber)|S1]], [[BST-SC1 Supplier Build-Chain Intrusion (Supply Chain)|SC1]]) anchor to real nodes.

## 7.1 Control planes
- **Constellation control (TT&C).** Telemetry, tracking & command flows from the gateways to the NOC mission-control software. Commands are **signed**; key management is operated by the NOC engineering team. Satellites enter **autonomous safe-mode** if ground contact or command integrity is lost — the fleet-wide trip behind S1.
  *Graph:* `technical_perimeter` (NOC mission-control / TT&C). Risks `SEC-01` (APT on C2), `SEC-13` (command-auth key compromise), `SEC-12` (firmware mod).
- **Payload & network management (NMS).** The software-defined payload (beam plans, capacity allocation, routing) is reconfigured from the NOC through the network management system. **This is the commercial brain: it decides who gets service.**
  *Graph:* `technical_perimeter` (NMS). Risks `ROE-01` (payload reconfig defect), `SEC-05` (jamming/spoofing).
- **Ground infrastructure.** 4 gateways + 12 secondary stations, remotely administered from **Denver**; **Dublin** backup NOC synchronised near-real-time and **sharing the same identity and management plane** (single sign-on, common privileged-access tooling) — **a deliberate, realistic weakness** (the single-plane flaw behind S1).
  *Graph:* `technical_perimeter` (gateways, ground segment). Risks `SEC-04` (ransomware on ground), `SEC-07` (physical breach), `SEC-14` (IT→OT lateral movement).

## 7.2 Corporate & support systems
- **Corporate IT:** ERP (finance, supply chain), CRM, **billing & provisioning platform** (activates/deactivates customer terminals — a mass-deactivation here mimics an outage at low technical cost; see §8.2 chain 3), HR, email/collaboration.
  *Graph:* `technical_perimeter` (corporate IT). Risk `ROI-01` (NOC/IT outage), `SEC-10` (DDoS on portal/API).
- **Engineering environment:** **PLM**, satellite software build chain, test benches — **shared with tier-1 suppliers** (§5.2). This is `TP-PLM` (Teamcenter, Toulouse) in the graph, holding the satellite design master data (`FT-01`).
  *Graph:* `technical_perimeter` `TP-PLM` + `functional_target` `FT-01`. Risks `SEC-06` (IP exfiltration), `SEC-02` (supply-chain firmware), `RCY-02` (PLM compromise). Kill-chain: `EP-01` (engineering VPN) → `TP-PLM`.
- **Third-party access:** **MSSP (SOC)**, terminal-logistics provider, launch partners' mission-data interface, telco partners' wholesale APIs — all holding **privileged remote access**. The MSSP path is the entry point behind S1; the supplier/PLM path is behind SC1.
  *Graph:* `entry_point` (`EP-01` engineering VPN; MSSP privileged access). Risk `SEC-09` (social engineering), `SEC-03` (insider).

## 7.3 Stated security posture (State B)
The deliberately-imperfect posture that makes the scenarios plausible:
- **IT/OT segmentation** between corporate IT and mission control — *implemented 2027, never pressure-tested end-to-end.*
- **Backups:** corporate IT immutable backups (2027); **mission-control configuration backups sit on the shared management plane** (so they share S1's single-plane exposure).
- **Crisis management:** corporate plan exists; last constellation-scale exercise was a **2027 tabletop limited to IT** (not the constellation).
- **Gov accreditation enclave:** isolated, audited — and **contractually mandatory** (the asset RG1 threatens; mitigation objective `MO-RG1-1`).

## Critical supply chain — digital dependency (§5.2)
The links that turn a supplier problem into an ODT problem:
- **RF components** (transponders, amplifiers): **limited suppliers** — Teledyne, Airbus DS, few others (`ROM-01` sole-source; `MIT-02` dual-source qualification).
- **Batteries** (space-grade Li-ion): **Saft**, exclusive partner, 9–12 month lead time (`ROM-02`).
- **Attitude control:** 2 global suppliers (Moog, Orbital ATK).
- **Structures & composites:** tier-1 aerospace subcontractors (Northrop Grumman, Spirit Aero) (`ROM-03`).
- **Launch:** multi-sourced (SpaceX, Rocket Lab), committed 2025–2029 — price/schedule volatility (`ROL-01`; `MIT-01` multi-launcher).
- **Digital dependency:** tier-1 suppliers exchange design & test data with ODT engineering via the **shared PLM**; the **MSSP and terminal-logistics provider hold privileged remote access**. These are the SC1 / S1 entry surfaces.

## 🔗 RIM bridge — example influence chains (§8.2)
The chains the bestiary models, all terminating at the enterprise objectives (deliver the constellation, hold the AOP, reach the IPO):
- Supplier intrusion → engineering-data integrity doubt → launch hold → Phase-4 slip → gov milestone penalty → revenue miss *(SC1)*
- NOC compromise → constellation safe-mode → service outage → SLA credits + gov suspension → churn → EBIT/FCF miss → IPO delay → financing cost *(S1 → FN1)*
- Billing/provisioning compromise → mass terminal deactivation → outage perceived as ODT failure → identical commercial chain at lower technical cost
- Public security incident (any) → accreditation review → Defense intake freeze → 30% of revenue growth stalls *(RG1)*

> [!todo] Still open
> Render the A4 schema as a vault-native [[Influence Map|diagram]] and confirm each node above exists as the tagged graph type. NMS, NOC mission-control and billing/provisioning are **not yet distinct `technical_perimeter` nodes** in the seed (only `TP-PLM` is) — candidate enrichment, logged as [[Canon Change & Issue Register|ENH-04]].

---
## Changelog
- 2026-06-18: built out from Context v2.2 §7 (+ §5.2); each element tagged to its graph node type; flagged missing technical_perimeter nodes (ENH-04).
