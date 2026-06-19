---
type: canon
sourcebook-line: "00 - Index & Canon"
status: new
tags: [canon, conventions, status/new]
---
# 🧭 Naming, ID & Versioning Conventions

## Risk IDs (graph + register)
| Prefix | Meaning | Example |
|---|---|---|
| `RC-##` | Company business risk | RC-01 Failure to achieve EBITDA+ |
| `RH-##` | HORIZON-LEO business risk | RH-04 Loss of competitive positioning |
| `RA-##` | AURORA-GEO business risk | RA-02 Development budget overrun |
| `ROE/ROM/ROL/...` | Operational risk by function (Eng/Mfg/Launch/…) | ROE-01 Payload software defect |
| `SEC-##` | Security operational risk | SEC-01 APT on C2 |
| `MIT-##` | Mitigation | MIT-04 Zero-Trust TT&C |
| `INF-##` | Influence edge | INF-01 |
| `TPO-## / TCO-##` | Programme / Company objective | TCO-01 |

## Sourcebook (vault) IDs
- **Scenarios / bestiary**: `BST-<family><n>` — e.g. `BST-S1` (cyber), `BST-SC1` (supply chain), `BST-RG1` (regulatory), `BST-GP1` (geopolitical), `BST-FN1` (financial).
- A bestiary entry maps to a `SpiceScenario` family (`scenario_family_id`, a UUID) with three `case_type` cases (best / realistic / pessimistic).

## Status values (frontmatter `status:`)
`current` · `update` · `new` — mirrored in tag `#status/<value>`.

## Versioning — silent revision
Canon notes are revised in place; the change log lives at the foot of the note, not in the filename. Only major restructures bump a visible version (e.g. Worldbook v3 → v4).

## Vault conventions
- Folders are numbered `00`–`10` to mirror the ten product lines.
- A leading `_` (e.g. `_Scenario Stat-Block Template`) marks a **template**, not an instance.
- Tags: `#worldbook` `#cast` `#bestiary/<family>` `#module` `#gm-kit` `#player-handbook` `#core-rules` `#chronicle` `#engine-room` `#session-zero`.
- Cross-family interconnection is expressed with `influences:` / `influenced-by:` frontmatter and rendered in [[Influence Map]].
