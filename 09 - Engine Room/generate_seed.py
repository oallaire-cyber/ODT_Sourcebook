#!/usr/bin/env python3
"""
generate_seed.py — ODT Demo Dataset Generator
Reads _inputs/workbook.yaml → writes _inputs/demo_seed.cypher

Usage (from any directory):
    python "09 - Engine Room/generate_seed.py"

Rule: edit workbook.yaml, then run this script.
      Never hand-edit both workbook.yaml and demo_seed.cypher.
"""
from __future__ import annotations
import sys
import yaml
from datetime import datetime
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
WORKBOOK = ROOT / "_inputs" / "workbook.yaml"
OUTPUT = ROOT / "_inputs" / "demo_seed.cypher"


# ─── Cypher value serialiser ──────────────────────────────────────────────────

def esc(v: object) -> str:
    """Escape a string for single-quoted Cypher literals."""
    return str(v).replace("\\", "\\\\").replace("'", "\\'")


def cypher_val(v: object) -> str:
    """Serialise a Python value as a Cypher literal."""
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, int):
        return str(v)
    if isinstance(v, float):
        return repr(v)
    if isinstance(v, list):
        return "[" + ", ".join(f"'{esc(i)}'" for i in v) + "]"
    return f"'{esc(v)}'"


# ─── Node generators ──────────────────────────────────────────────────────────

def risk_node(r: dict) -> str:
    var = r["id"].lower().replace("-", "")
    fields: dict[str, object] = {
        "id": r["id"],
        "name": r["name"],
        "description": r.get("description"),
        "level": r["level"],
        "scope": r["scope"],
        "status": r["status"],
        "origin": r["origin"],
        "categories": r.get("categories"),
        "owner": r.get("owner"),
        "probability": r.get("probability"),
        "severity": r.get("severity"),
        "exposure": r.get("exposure"),
        "current_score_type": r.get("current_score_type", "Qualitative_4x4"),
    }
    for opt in ("activation_condition", "activation_decision_date",
                "annual_probability", "magnitude_point_estimate",
                "magnitude_low", "magnitude_high",
                # supply_chain risk subtype (W4): supplier dependency descriptors
                "supplier_tier", "criticality_class", "single_source"):
        if r.get(opt) is not None:
            fields[opt] = r[opt]

    # datetime fields rendered literally (not as strings)
    review_days = r.get("review_days", 90)
    lines = [f"  {k}: {cypher_val(v)}" for k, v in fields.items() if v is not None]
    lines += [
        "  created_at: datetime()",
        "  updated_at: datetime()",
        "  last_review_date: datetime()",
        f"  next_review_date: datetime() + duration({{days: {review_days}}})",
    ]
    return f"CREATE ({var}:Risk {{\n" + ",\n".join(lines) + "\n});"


def tpo_node(t: dict) -> str:
    var = t["id"].lower().replace("-", "")
    lines = [
        f"  node_type: 'tpo'",
        f"  id: {cypher_val(t['id'])}",
        f"  reference: {cypher_val(t['id'])}",
        f"  name: {cypher_val(t['name'])}",
        f"  cluster: {cypher_val(t.get('cluster', ''))}",
        f"  description: {cypher_val(t.get('description', ''))}",
        "  created_at: datetime()",
        "  updated_at: datetime()",
    ]
    return f"CREATE ({var}:ContextNode {{\n" + ",\n".join(lines) + "\n});"


def tco_node(t: dict) -> str:
    var = t["id"].lower().replace("-", "")
    lines = [
        f"  node_type: 'tco'",
        f"  id: {cypher_val(t['id'])}",
        f"  reference: {cypher_val(t['id'])}",
        f"  name: {cypher_val(t['name'])}",
        f"  description: {cypher_val(t.get('description', ''))}",
    ]
    if t.get("owner"):
        lines.append(f"  owner: {cypher_val(t['owner'])}")
    if t.get("time_horizon"):
        lines.append(f"  time_horizon: {cypher_val(t['time_horizon'])}")
    lines += ["  created_at: datetime()", "  updated_at: datetime()"]
    return f"CREATE ({var}:ContextNode {{\n" + ",\n".join(lines) + "\n});"


def mitigation_node(m: dict) -> str:
    var = m["id"].lower().replace("-", "")
    lines = [
        f"  id: {cypher_val(m['id'])}",
        f"  name: {cypher_val(m['name'])}",
        f"  type: {cypher_val(m['type'])}",
        f"  status: {cypher_val(m['status'])}",
    ]
    # CR-01 consolidated financial-layer attribute (nullable; null = operational-only)
    if m.get("financial_effect") is not None:
        lines.append(f"  financial_effect: {cypher_val(m['financial_effect'])}")
    # ROCE / budget inputs — emitted only where a figure is known
    for fld in ("capex", "opex", "committed_budget", "coverage_amount"):
        if m.get(fld) is not None:
            lines.append(f"  {fld}: {cypher_val(float(m[fld]))}")
    if m.get("target_date") is not None:
        lines.append(f"  target_date: date({cypher_val(m['target_date'])})")
    if m.get("roadmap_ref") is not None:
        lines.append(f"  roadmap_ref: {cypher_val(m['roadmap_ref'])}")
    lines += [
        f"  description: {cypher_val(m.get('description', ''))}",
        f"  owner: {cypher_val(m.get('owner', ''))}",
        f"  source_entity: {cypher_val(m.get('source_entity', ''))}",
        "  created_at: datetime()",
        "  updated_at: datetime()",
    ]
    return f"CREATE ({var}:Mitigation {{\n" + ",\n".join(lines) + "\n});"


def context_node_stmt(n: dict, node_type: str) -> str:
    var = n["id"].lower().replace("-", "")
    fields = ["name", "pl_holder", "ebit_baseline", "fcf_baseline", "currency",
              "spice_assessed", "description", "division",
              "annual_probability", "ebit_impact_expected", "recovery_days",
              "exploitability", "capability_level", "type", "location",
              "criticality", "external_id", "classification",
              "importance_rank", "effectiveness_rank"]
    lines = [
        f"  node_type: '{node_type}'",
        f"  id: {cypher_val(n['id'])}",
    ]
    for f in fields:
        if f in n and n[f] is not None:
            lines.append(f"  {f}: {cypher_val(n[f])}")
    lines += ["  created_at: datetime()", "  updated_at: datetime()"]
    return f"CREATE ({var}:ContextNode {{\n" + ",\n".join(lines) + "\n});"


# ─── SPICE node generators ────────────────────────────────────────────────────

def _var(node_id: str) -> str:
    return node_id.lower().replace("-", "")


def spice_scenario_node(s: dict) -> str:
    """One SpiceScenario node (a single case of a family)."""
    ebit = s["ebit"]          # list y1..yN (may contain None)
    fcf  = s["fcf"]           # list y1..yN (may contain None)
    lines = [
        f"  id: {cypher_val(s['id'])}",
        f"  name: {cypher_val(s['name'])}",
        f"  scenario_family_id: {cypher_val(s['family_id'])}",
        f"  version_number: {int(s.get('version_number', 1))}",
        f"  case_type: {cypher_val(s['case_type'])}",
        f"  status_in_family: {cypher_val(s['status_in_family'])}",
        f"  assessment_date: date({cypher_val(s['assessment_date'])})",
        f"  validated: {cypher_val(s['validated'])}",
    ]
    if s.get("cause_description"):
        lines.append(f"  cause_description: {cypher_val(s['cause_description'])}")
    if s.get("cause_type"):
        lines.append(f"  cause_type: {cypher_val(s['cause_type'])}")
    if s.get("hypothesis"):
        lines.append(f"  hypothesis: {cypher_val(s['hypothesis'])}")
    for i, v in enumerate(ebit, start=1):
        if v is not None:
            lines.append(f"  ebit_impact_y{i}: {cypher_val(float(v))}")
    lines.append(f"  ebit_impact_total: {cypher_val(float(sum(v for v in ebit if v is not None)))}")
    for i, v in enumerate(fcf, start=1):
        if v is not None:
            lines.append(f"  fcf_impact_y{i}: {cypher_val(float(v))}")
    if any(v is not None for v in fcf):
        lines.append(f"  fcf_impact_total: {cypher_val(float(sum(v for v in fcf if v is not None)))}")
    if s.get("crisis_days") is not None:
        lines.append(f"  crisis_management_days: {int(s['crisis_days'])}")
    if s.get("op_recovery_days") is not None:
        lines.append(f"  operational_recovery_days: {int(s['op_recovery_days'])}")
    lines.append(f"  financial_recovery_years: {int(s['fin_recovery_years'])}")
    lines += ["  created_at: datetime()", "  updated_at: datetime()"]
    return f"CREATE ({_var(s['id'])}:SpiceScenario {{\n" + ",\n".join(lines) + "\n});"


def mitigation_objective_node(o: dict) -> str:
    lines = [
        f"  node_type: 'mitigation_objective'",
        f"  id: {cypher_val(o['id'])}",
        f"  name: {cypher_val(o['name'])}",
    ]
    if o.get("description"):
        lines.append(f"  description: {cypher_val(o['description'])}")
    if o.get("importance_rank") is not None:
        lines.append(f"  importance_rank: {int(o['importance_rank'])}")
    if o.get("effectiveness_rank") is not None:
        lines.append(f"  effectiveness_rank: {int(o['effectiveness_rank'])}")
    lines += ["  created_at: datetime()", "  updated_at: datetime()"]
    return f"CREATE ({_var(o['id'])}:ContextNode {{\n" + ",\n".join(lines) + "\n});"


def owner_node(o: dict) -> str:
    """Accountability-layer owner (schema `owner` context node)."""
    lines = [
        f"  node_type: 'owner'",
        f"  id: {cypher_val(o['id'])}",
        f"  name: {cypher_val(o['name'])}",
    ]
    for fld in ("role", "entity", "email"):
        if o.get(fld):
            lines.append(f"  {fld}: {cypher_val(o[fld])}")
    lines += ["  created_at: datetime()", "  updated_at: datetime()"]
    return f"CREATE ({_var(o['id'])}:ContextNode {{\n" + ",\n".join(lines) + "\n});"


# ─── Relationship generators ──────────────────────────────────────────────────

def contributes_to(r: dict) -> str:
    return (
        f"MATCH (tpo:ContextNode {{id: '{esc(r['from'])}'}}), "
        f"(tco:ContextNode {{id: '{esc(r['to'])}'}})\n"
        f"CREATE (tpo)-[:CONTRIBUTES_TO {{id: '{esc(r['id'])}', "
        f"created_at: datetime()}}]->(tco);"
    )


def impacts_tco(r: dict) -> str:
    return (
        f"MATCH (r:Risk {{id: '{esc(r['from'])}'}}), "
        f"(tco:ContextNode {{id: '{esc(r['to'])}'}})\n"
        f"CREATE (r)-[:IMPACTS_TCO {{\n"
        f"  id: '{esc(r['id'])}',\n"
        f"  impact_level: '{esc(r['impact_level'])}',\n"
        f"  description: {cypher_val(r.get('description', ''))},\n"
        f"  created_at: datetime()\n"
        f"}}]->(tco);"
    )


def influence(r: dict) -> str:
    return (
        f"MATCH (source:Risk {{id: '{esc(r['from'])}'}}), "
        f"(target:Risk {{id: '{esc(r['to'])}'}})\n"
        f"CREATE (source)-[:INFLUENCES {{\n"
        f"  id: '{esc(r['id'])}',\n"
        f"  influence_type: '{esc(r['type'])}',\n"
        f"  strength: '{esc(r['strength'])}',\n"
        f"  description: {cypher_val(r.get('description', ''))},\n"
        f"  confidence: {r.get('confidence', 0.8)},\n"
        f"  created_at: datetime(),\n"
        f"  last_validated: datetime()\n"
        f"}}]->(target);"
    )


def impacts_tpo(r: dict) -> str:
    return (
        f"MATCH (r:Risk {{id: '{esc(r['from'])}'}}), "
        f"(t:ContextNode {{id: '{esc(r['to'])}'}})\n"
        f"CREATE (r)-[:IMPACTS_TPO {{\n"
        f"  id: '{esc(r['id'])}',\n"
        f"  impact_level: '{esc(r['impact_level'])}',\n"
        f"  description: {cypher_val(r.get('description', ''))},\n"
        f"  created_at: datetime()\n"
        f"}}]->(t);"
    )


def mitigates(r: dict) -> str:
    return (
        f"MATCH (m:Mitigation {{id: '{esc(r['from'])}'}}), "
        f"(r:Risk {{id: '{esc(r['to'])}'}})\n"
        f"CREATE (m)-[:MITIGATES {{\n"
        f"  id: '{esc(r['id'])}',\n"
        f"  effectiveness: '{esc(r['effectiveness'])}',\n"
        f"  description: {cypher_val(r.get('description', ''))},\n"
        f"  created_at: datetime()\n"
        f"}}]->(r);"
    )


def context_edge(r: dict) -> str:
    rel = r["rel_type"]
    src_id, tgt_id, edge_id = esc(r["from"]), esc(r["to"]), esc(r["id"])

    # Determine node labels for MATCH
    src_label = "Risk" if r.get("from_label") == "Risk" else "ContextNode"
    tgt_label = "Risk" if r.get("to_label") == "Risk" else "ContextNode"

    base_props = f"id: '{edge_id}', created_at: datetime()"

    extra = ""
    if rel == "EXPLOITS" and r.get("success_probability") is not None:
        extra = f", success_probability: {r['success_probability']}"
    elif rel == "COMPROMISES" and r.get("technique"):
        extra = f", technique: {cypher_val(r['technique'])}"

    return (
        f"MATCH (a:{src_label} {{id: '{src_id}'}}), "
        f"(b:{tgt_label} {{id: '{tgt_id}'}})\n"
        f"CREATE (a)-[:{rel} {{{base_props}{extra}}}]->(b);"
    )


def bears(owner_id: str, risk_id: str, edge_id: str) -> str:
    """BEARS  owner -> Risk  (consequence-bearer; at most one per risk)."""
    return (
        f"MATCH (o:ContextNode {{id: '{esc(owner_id)}'}}), "
        f"(r:Risk {{id: '{esc(risk_id)}'}})\n"
        f"CREATE (o)-[:BEARS {{id: '{esc(edge_id)}', created_at: datetime()}}]->(r);"
    )


def stewards(owner_id: str, tgt_id: str, tgt_label: str, edge_id: str) -> str:
    """STEWARDS  owner -> Mitigation  (execution accountability; never a Risk)."""
    return (
        f"MATCH (o:ContextNode {{id: '{esc(owner_id)}'}}), "
        f"(m:{tgt_label} {{id: '{esc(tgt_id)}'}})\n"
        f"CREATE (o)-[:STEWARDS {{id: '{esc(edge_id)}', created_at: datetime()}}]->(m);"
    )


def spice_edge(rel: str, src_id: str, src_label: str, tgt_id: str,
               tgt_label: str, edge_id: str, extra: str = "") -> str:
    """Generic SPICE-layer edge (ILLUSTRATES / CAUSED_BY / ASSESSED_AGAINST /
    OCCURS_AT / ADDRESSES / MITIGATED_BY / FULFILS)."""
    return (
        f"MATCH (a:{src_label} {{id: '{esc(src_id)}'}}), "
        f"(b:{tgt_label} {{id: '{esc(tgt_id)}'}})\n"
        f"CREATE (a)-[:{rel} {{id: '{esc(edge_id)}', created_at: datetime(){extra}}}]->(b);"
    )


# ─── Static verification queries ─────────────────────────────────────────────

VERIFY = """
// =============================================================================
// VERIFICATION QUERIES
// =============================================================================

// Count risks by level and scope
MATCH (r:Risk)
RETURN r.level as Level, r.scope as Scope, count(r) as Count
ORDER BY Level, Scope;

// Count risks by category
MATCH (r:Risk)
UNWIND r.categories AS cat
RETURN cat as Category, count(r) as Count
ORDER BY Count DESC;

// Count risks by status
MATCH (r:Risk)
RETURN r.status as Status, count(r) as Count
ORDER BY Status;

// Count influences by type
MATCH ()-[i:INFLUENCES]->()
RETURN i.influence_type as Type, count(i) as Count
ORDER BY Type;

// Display contingent risks
MATCH (r:Risk {status: 'Contingent'})
RETURN r.id, r.name, r.scope, r.activation_condition, r.activation_decision_date;

// Count Top Objectives by cluster
MATCH (t:ContextNode {node_type: 'tpo'})
RETURN t.cluster as Cluster, count(t) as Count
ORDER BY Cluster;

// Display Top Objectives and their impact count
MATCH (t:ContextNode {node_type: 'tpo'})
OPTIONAL MATCH (r:Risk)-[i:IMPACTS_TPO]->(t)
RETURN t.reference as TPO, t.name as Name, t.cluster as Cluster,
       count(i) as ImpactCount
ORDER BY t.reference;

// Count mitigations by type and status
MATCH (m:Mitigation)
RETURN m.type as Type, m.status as Status, count(m) as Count
ORDER BY Type, Status;

// Display most mitigated risks
MATCH (r:Risk)
OPTIONAL MATCH (m:Mitigation)-[rel:MITIGATES]->(r)
RETURN r.id as ID, r.name as Risk, r.level as Level, r.scope as Scope,
       count(rel) as MitigationCount
ORDER BY count(rel) DESC
LIMIT 15;

// Security risk analysis - attack chains
MATCH path = (r1:Risk)-[:INFLUENCES*1..3]->(r2:Risk)
WHERE r1.id STARTS WITH 'SEC' AND r2.level = 'Business'
RETURN r1.id as AttackOrigin, r1.name as AttackName,
       [n IN nodes(path) | n.id] as Chain,
       r2.id as BusinessImpact, r2.name as ImpactName
ORDER BY length(path) DESC;

// Global statistics
MATCH (r:Risk) WITH count(r) as risks
MATCH (t:ContextNode {node_type: 'tpo'}) WITH risks, count(t) as tpos
MATCH (m:Mitigation) WITH risks, tpos, count(m) as mitigations
MATCH ()-[i:INFLUENCES]->() WITH risks, tpos, mitigations, count(i) as influences
MATCH ()-[it:IMPACTS_TPO]->() WITH risks, tpos, mitigations, influences, count(it) as tpo_impacts
MATCH ()-[mt:MITIGATES]->()
RETURN risks as Risks, tpos as TPOs, mitigations as Mitigations,
       influences as Influences, tpo_impacts as TPO_Impacts, count(mt) as Mitigates_Links;

// --- SPICE layer ---

// Scenario families: 3 cases each, with EBIT/FCF totals per case
MATCH (s:SpiceScenario)
RETURN s.scenario_family_id AS Family, s.case_type AS Case,
       s.ebit_impact_total AS EBIT_total, s.fcf_impact_total AS FCF_total,
       s.financial_recovery_years AS FinRecYrs
ORDER BY Family, Case;

// SPICE bridge coverage: which Business Risk each scenario illustrates,
// and the perimeter it is assessed against
MATCH (s:SpiceScenario)-[:ILLUSTRATES]->(r:Risk)
OPTIONAL MATCH (s)-[:ASSESSED_AGAINST]->(bp:ContextNode)
RETURN s.id AS Scenario, r.id AS BusinessRisk, bp.id AS Perimeter
ORDER BY Scenario;

// Mitigation-objective fulfilment: total declared contribution per objective
// (MAY exceed 100% — surfaced as over-coverage, not an error). CR-01: FULFILS now
// originates from the consolidated core Mitigation registry.
MATCH (m:Mitigation)-[f:FULFILS]->(o:ContextNode {node_type: 'mitigation_objective'})
RETURN o.id AS Objective, o.name AS Name,
       collect(m.id) AS Mitigations, sum(f.contribution_weight) AS TotalWeightPct
ORDER BY Objective;

// CR-01 consolidation check: financial-layer controls (carry FULFILS and/or a
// MITIGATED_BY citation) are now core Mitigation nodes. List them with their
// financial_effect, lifecycle status, and committed/coverage figures.
MATCH (m:Mitigation)
WHERE m.financial_effect IS NOT NULL
RETURN m.id AS Mitigation, m.type AS Type, m.status AS Status,
       m.financial_effect AS FinancialEffect,
       m.committed_budget AS CommittedBudget, m.coverage_amount AS Coverage
ORDER BY m.id;

// Scenario mitigated-re-assessment citations (MITIGATED_BY → Mitigation)
MATCH (s:SpiceScenario)-[:MITIGATED_BY]->(m:Mitigation)
RETURN s.id AS Scenario, collect(m.id) AS CitedMitigations
ORDER BY Scenario;

// Convergence proof: every scenario family ultimately illustrates a risk that
// influences the IPO objective (TCO-04) — the bestiary thesis. TCO-04 is the
// apex; the financial-risk cluster (RC-01/RC-02/RC-03) IMPACTS_TCO it directly.
MATCH (s:SpiceScenario)-[:ILLUSTRATES]->(r:Risk)
OPTIONAL MATCH path = (r)-[:INFLUENCES*0..4]->(:Risk)-[:IMPACTS_TCO]->(tco:ContextNode {id: 'TCO-04'})
RETURN s.scenario_family_id AS Family, r.id AS IllustratedRisk,
       count(path) > 0 AS ReachesIPO
ORDER BY Family;

// --- Owner accountability layer (BEARS / STEWARDS) ---

// Bearer cardinality: distribution of Bearers-per-risk. The model invariant is
// AT MOST ONE Bearer per risk — any row with BearersPerRisk > 1 is a violation.
MATCH (r:Risk)
OPTIONAL MATCH (:ContextNode {node_type: 'owner'})-[b:BEARS]->(r)
WITH r, count(b) AS bearers
RETURN bearers AS BearersPerRisk, count(r) AS RiskCount
ORDER BY BearersPerRisk;

// Risks with no Bearer (should be empty — every risk's consequence is owned)
MATCH (r:Risk)
WHERE NOT ( (:ContextNode {node_type: 'owner'})-[:BEARS]->(r) )
RETURN r.id AS RiskWithoutBearer, r.name AS Name
ORDER BY r.id;

// STEWARDS must NEVER target a Risk (forbidden by design) — must return 0
MATCH (:ContextNode {node_type: 'owner'})-[:STEWARDS]->(x:Risk)
RETURN count(*) AS IllegalStewardsOnRisk;

// Owner workload: risks borne and mitigations stewarded per owner
MATCH (o:ContextNode {node_type: 'owner'})
OPTIONAL MATCH (o)-[:BEARS]->(r:Risk)
OPTIONAL MATCH (o)-[:STEWARDS]->(m)
RETURN o.id AS Owner, o.name AS Name,
       count(DISTINCT r) AS Bears, count(DISTINCT m) AS Stewards
ORDER BY Bears DESC, Stewards DESC;
"""


# ─── Section helpers ──────────────────────────────────────────────────────────

def banner(title: str) -> str:
    bar = "=" * 77
    return f"// {bar}\n// {title}\n// {bar}\n"


def sub_banner(title: str) -> str:
    return f"// --- {title} ---\n"


# ─── Main ─────────────────────────────────────────────────────────────────────

def main() -> None:
    if not WORKBOOK.exists():
        sys.exit(f"ERROR: workbook not found at {WORKBOOK}")

    wb: dict = yaml.safe_load(WORKBOOK.read_text(encoding="utf-8"))
    ts = datetime.now().strftime("%Y-%m-%d %H:%M")
    out: list[str] = []

    # File header
    out.append(f"""\
// =============================================================================
// Orbital Dynamics Technologies — Risk Influence Map Demo Dataset (CANONICAL)
// Space Industry Use Case: LEO Constellation & GEO Relay Programs
//
// !! GENERATED FILE — DO NOT EDIT DIRECTLY !!
//    Source  : _inputs/workbook.yaml
//    Script  : 09 - Engine Room/generate_seed.py
//    Built   : {ts}
//
// To make changes: edit workbook.yaml, then re-run generate_seed.py
// Execute in Neo4j Browser or via cypher-shell.
// =============================================================================

// 1. PURGE (optional — uncomment if you need to start fresh)
MATCH (n) DETACH DELETE n;
""")

    # ── RISKS ──────────────────────────────────────────────────────────────────
    _RISK_GROUPS: list[tuple[str, str]] = [
        ("Company Business Risks",               "RC"),
        ("HORIZON-LEO Programme Business Risks", "RH"),
        ("AURORA-GEO Programme Business Risks",  "RA"),
        ("Operational — Engineering",             "ROE"),
        ("Operational — Manufacturing & Supply Chain", "ROM"),
        ("Operational — Launch Operations",       "ROL"),
        ("Operational — Commercial",              "ROC"),
        ("Operational — Finance, HR & Legal",     "ROF ROH ROR ROI"),
        ("Operational — Security",                "SEC"),
        ("Cyber Kill-Chain Risks",                "RCY"),
    ]

    risks: list[dict] = wb.get("risks", [])

    def prefix_matches(rid: str, prefixes: str) -> bool:
        return any(rid.startswith(p) for p in prefixes.split())

    out.append(banner("RISKS"))
    for group_name, prefixes in _RISK_GROUPS:
        group = [r for r in risks if prefix_matches(r["id"], prefixes)]
        if group:
            out.append(sub_banner(group_name))
            for r in group:
                out.append(risk_node(r))
                out.append("")

    # ── OBJECTIVES ─────────────────────────────────────────────────────────────
    objectives = wb.get("objectives", {})

    out.append(banner("TOP PROGRAMME OBJECTIVES (TPOs)"))
    for t in objectives.get("tpo", []):
        out.append(tpo_node(t))
        out.append("")

    out.append(banner("TOP COMPANY OBJECTIVES (TCOs)"))
    for t in objectives.get("tco", []):
        out.append(tco_node(t))
        out.append("")

    # ── MITIGATIONS ────────────────────────────────────────────────────────────
    out.append(banner("MITIGATIONS"))
    _MIT_TYPES = ["Dedicated", "Inherited", "Baseline"]
    mits: list[dict] = wb.get("mitigations", [])
    for mt in _MIT_TYPES:
        group = [m for m in mits if m.get("type") == mt]
        if group:
            out.append(sub_banner(f"{mt} Mitigations"))
            for m in group:
                out.append(mitigation_node(m))
                out.append("")
    # catch any that didn't match (e.g. MIT-CY1)
    others = [m for m in mits if m.get("type") not in _MIT_TYPES]
    if others:
        out.append(sub_banner("Other / Specialised Mitigations"))
        for m in others:
            out.append(mitigation_node(m))
            out.append("")

    # ── CONTEXT NODES ──────────────────────────────────────────────────────────
    _SECTION_TYPE_MAP: list[tuple[str, str, str]] = [
        ("business_perimeters", "business_perimeter", "Business Perimeters"),
        ("scenarios",           "scenario",            "Scenarios (deprecated — retained for migration)"),
        ("entry_points",        "entry_point",          "Entry Points"),
        ("attackers",           "attacker",             "Attackers"),
        ("technical_perimeters","technical_perimeter",  "Technical Perimeters"),
        ("sponsors",            "sponsor",              "Sponsors"),
        ("functional_targets",  "functional_target",    "Functional Targets"),
        ("business_activities", "business_activity",    "Business Activities"),
        ("mitigation_objectives","mitigation_objective","Mitigation Objectives"),
    ]
    cn = wb.get("context_nodes", {})
    has_any = any(cn.get(k) for k, _, _ in _SECTION_TYPE_MAP)
    if has_any:
        out.append(banner("CONTEXT NODES"))
        for section, node_type, label in _SECTION_TYPE_MAP:
            nodes = cn.get(section, [])
            if nodes:
                out.append(sub_banner(label))
                for n in nodes:
                    out.append(context_node_stmt(n, node_type))
                out.append("")

    # ── OWNERS (accountability layer) ──────────────────────────────────────────
    owners: list[dict] = wb.get("owners", [])
    owner_by_key: dict[str, str] = {}
    for o in owners:
        key = o.get("key")
        if not key:
            sys.exit(f"ERROR: owner {o.get('id')} has no `key` (owner-string to match).")
        if key in owner_by_key:
            sys.exit(f"ERROR: duplicate owner key '{key}' "
                     f"({owner_by_key[key]} and {o['id']}).")
        owner_by_key[key] = o["id"]

    if owners:
        out.append(banner("OWNERS  (accountability layer — BEARS / STEWARDS)"))
        for o in owners:
            out.append(owner_node(o))
        out.append("")

    # ── RELATIONSHIPS ──────────────────────────────────────────────────────────
    rels = wb.get("relationships", {})

    out.append(banner("CONTRIBUTES_TO  (TPO → TCO hierarchy)"))
    for r in rels.get("contributes_to", []):
        out.append(contributes_to(r))
    out.append("")

    out.append(banner("IMPACTS_TCO  (Risk → Company Objective)"))
    for r in rels.get("impacts_tco", []):
        out.append(impacts_tco(r))
    out.append("")

    out.append(banner("INFLUENCES  (Op→Bus | Bus→Bus | Op→Op)"))
    for r in rels.get("influences", []):
        out.append(influence(r))
    out.append("")

    out.append(banner("IMPACTS_TPO  (Risk → Programme Objective)"))
    for r in rels.get("impacts_tpo", []):
        out.append(impacts_tpo(r))
    out.append("")

    out.append(banner("MITIGATES  (Mitigation → Risk)"))
    for r in rels.get("mitigates", []):
        out.append(mitigates(r))
    out.append("")

    out.append(banner("CONTEXT EDGES  (kill-chain, business wiring, risk-concern)"))
    for r in rels.get("context_edges", []):
        out.append(context_edge(r))
    out.append("")

    # ── SPICE LAYER (bestiary scenarios) ─────────────────────────────────────
    # Each family expands to 3 SpiceScenario nodes (best/realistic/pessimistic),
    # sharing scenario_family_id. The realistic (current/P50) case is the family
    # representative and carries every bridge edge; best/pessimistic are data-only
    # sibling records grouped by scenario_family_id and read by the calibrator.
    spice = wb.get("spice", {})
    families = spice.get("families", [])
    mobjs = spice.get("mitigation_objectives", [])
    default_assess = spice.get("assessment_date", "2028-02-15")

    # CR-01: the financial/operational controls (ex-SpiceMitigation) now live in the
    # single core `mitigations:` register. The ones carrying FULFILS / scenario
    # citations are exactly those with a `fulfils` block (financial-layer effect).
    fulfilling_mits = [m for m in mits if m.get("fulfils")]

    n_spice_scen = 0
    n_spice_edges = 0

    if families or mobjs:
        out.append(banner("SPICE — MITIGATION OBJECTIVES (ADDRESSES targets)"))
        for o in mobjs:
            out.append(mitigation_objective_node(o))
        out.append("")

        out.append(banner("SPICE — SCENARIOS  (bestiary families × best/realistic/pessimistic)"))
        realistic_id: dict[str, str] = {}
        for fam in families:
            out.append(sub_banner(f"{fam['scenario_id']} — {fam['name']}"))
            # Base (assessed) version — version_number 1.
            base_status = fam.get("base_status_in_family", "current")
            for case_type in ("best", "realistic", "pessimistic"):
                c = fam["cases"][case_type]
                node_id = f"{fam['scenario_id']}-{case_type}"
                if case_type == "realistic":
                    realistic_id[fam["scenario_id"]] = node_id
                s = {
                    "id": node_id,
                    "name": f"{fam['name']} ({case_type})",
                    "family_id": fam["family_id"],
                    "version_number": 1,
                    "case_type": case_type,
                    "status_in_family": base_status,
                    "assessment_date": fam.get("assessment_date", default_assess),
                    "validated": fam.get("validated", "business"),
                    "cause_description": fam.get("cause_description"),
                    "cause_type": fam.get("cause_type"),
                    "hypothesis": c.get("hypothesis") or fam.get("hypothesis"),
                    "ebit": c["ebit"],
                    "fcf": c["fcf"],
                    "crisis_days": c.get("crisis_days"),
                    "op_recovery_days": c.get("op_recovery_days"),
                    "fin_recovery_years": c["fin_recovery_years"],
                }
                out.append(spice_scenario_node(s))
                n_spice_scen += 1

            # CR-01 §C4 — analyst-authored mitigated re-assessment as a new VERSION,
            # per case. Same scenario_family_id; benefit = base − mitigated is computed
            # by RIM across versions. Realised-vs-projected (which version is `current`)
            # is encoded by the workbook: planned/recommended controls → base stays
            # `current` and the mitigated version is a `draft` projection.
            mit = fam.get("mitigated")
            if mit:
                mit_status = mit.get("status_in_family", "draft")
                mit_ver = int(mit.get("version_number", 2))
                for case_type in ("best", "realistic", "pessimistic"):
                    mc = mit["cases"][case_type]
                    s = {
                        "id": f"{fam['scenario_id']}-{case_type}-mitigated",
                        "name": f"{fam['name']} ({case_type}, mitigated)",
                        "family_id": fam["family_id"],
                        "version_number": mit_ver,
                        "case_type": case_type,
                        "status_in_family": mit_status,
                        "assessment_date": fam.get("assessment_date", default_assess),
                        "validated": fam.get("validated", "business"),
                        "cause_description": mit.get("note") or fam.get("cause_description"),
                        "cause_type": fam.get("cause_type"),
                        "hypothesis": fam.get("hypothesis"),
                        "ebit": mc["ebit"],
                        "fcf": mc["fcf"],
                        "crisis_days": mc.get("crisis_days"),
                        "op_recovery_days": mc.get("op_recovery_days"),
                        "fin_recovery_years": mc["fin_recovery_years"],
                    }
                    out.append(spice_scenario_node(s))
                    n_spice_scen += 1
            out.append("")

        out.append(banner("SPICE EDGES  (ILLUSTRATES / CAUSED_BY / ASSESSED_AGAINST / OCCURS_AT)"))
        for fam in families:
            rid, sid = realistic_id[fam["scenario_id"]], fam["scenario_id"]
            illus = fam["illustrates"]
            if not isinstance(illus, list):
                illus = [illus]
            for bus in illus:
                out.append(spice_edge("ILLUSTRATES", rid, "SpiceScenario", bus, "Risk", f"ILL-{sid}-{bus}"))
                n_spice_edges += 1
            for op in fam.get("caused_by", []):
                out.append(spice_edge("CAUSED_BY", rid, "SpiceScenario", op, "Risk", f"CBY-{sid}-{op}"))
                n_spice_edges += 1
            out.append(spice_edge("ASSESSED_AGAINST", rid, "SpiceScenario", fam["assessed_against"], "ContextNode", f"ASG-{sid}"))
            n_spice_edges += 1
            if fam.get("occurs_at"):
                out.append(spice_edge("OCCURS_AT", rid, "SpiceScenario", fam["occurs_at"], "ContextNode", f"OCC-{sid}"))
                n_spice_edges += 1
        out.append("")

        out.append(banner("SPICE EDGES  (ADDRESSES / MITIGATED_BY — realistic case)"))
        # MITIGATED_BY (CR-01, renamed from MITIGATED_BY_SPICE): SpiceScenario → Mitigation,
        # the direct "cited in this scenario's mitigated re-assessment" link. The target is
        # the consolidated core Mitigation node (same SM-* id, now in `mitigations:`).
        for fam in families:
            rid, sid = realistic_id[fam["scenario_id"]], fam["scenario_id"]
            for mo in fam.get("addresses", []):
                out.append(spice_edge("ADDRESSES", rid, "SpiceScenario", mo, "ContextNode", f"ADR-{sid}-{mo}"))
                n_spice_edges += 1
            for sm in fam.get("mitigated_by", []):
                out.append(spice_edge("MITIGATED_BY", rid, "SpiceScenario", sm, "Mitigation", f"MBY-{sid}-{sm}"))
                n_spice_edges += 1
        out.append("")

        out.append(banner("SPICE EDGES  (FULFILS — mitigation → objective; re-homed CR-01)"))
        # FULFILS now runs from the core Mitigation registry (CR-01 §C3): from_node Mitigation.
        for m in fulfilling_mits:
            for fl in m.get("fulfils", []):
                w = fl.get("contribution_weight")
                extra = f", contribution_weight: {cypher_val(float(w))}" if w is not None else ""
                out.append(spice_edge("FULFILS", m["id"], "Mitigation", fl["objective"], "ContextNode", f"FUL-{m['id']}-{fl['objective']}", extra))
                n_spice_edges += 1
        out.append("")

    # ── OWNER ACCOUNTABILITY EDGES (BEARS / STEWARDS) ──────────────────────────
    # Emitted after every Risk / Mitigation / SpiceScenario-layer node exists.
    # BEARS    = each risk's single `owner` string  → one bearer per risk.
    # STEWARDS = each mitigation's `owner`          → never targets a Risk
    #            (CR-01: single consolidated Mitigation registry — one loop).
    n_bears = n_stewards = 0
    missing_keys: list[str] = []

    def resolve(key: str, ctx: str) -> str | None:
        oid = owner_by_key.get(key)
        if oid is None:
            missing_keys.append(f"{ctx}: owner-string '{key}' has no owner node")
        return oid

    if owners:
        out.append(banner("BEARS  (owner → risk; consequence-bearer, one per risk)"))
        for r in risks:
            key = r.get("owner")
            if not key:
                missing_keys.append(f"risk {r['id']}: no owner field (cannot assign a Bearer)")
                continue
            oid = resolve(key, f"risk {r['id']}")
            if oid:
                out.append(bears(oid, r["id"], f"BEARS-{r['id']}"))
                n_bears += 1
        out.append("")

        out.append(banner("STEWARDS  (owner → mitigation; never a risk)"))
        for m in mits:
            oid = resolve(m.get("owner", ""), f"mitigation {m['id']}")
            if oid:
                out.append(stewards(oid, m["id"], "Mitigation", f"STW-{m['id']}"))
                n_stewards += 1
        out.append("")

    if missing_keys:
        sys.exit("ERROR: owner layer could not be resolved:\n  - "
                 + "\n  - ".join(missing_keys))

    out.append(VERIFY)

    text = "\n".join(out)
    OUTPUT.write_text(text, encoding="utf-8")

    n_lines = text.count("\n")
    n_risks = len(risks)
    n_mits = len(mits)
    n_rels = sum(len(rels.get(k, [])) for k in
                 ("contributes_to", "impacts_tco", "influences",
                  "impacts_tpo", "mitigates", "context_edges"))
    n_fin_mits = len(fulfilling_mits)
    print(f"OK Generated {OUTPUT.name}")
    print(f"   {n_lines} lines  |  {n_risks} risks  |  {n_mits} mitigations "
          f"({n_fin_mits} financial-layer, ex-SpiceMitigation)  |  {n_rels} relationships")
    print(f"   SPICE: {n_spice_scen} scenario cases  |  {len(mobjs)} mitigation objectives  |  "
          f"{n_spice_edges} spice edges")
    print(f"   OWNERS: {len(owners)} owner nodes  |  {n_bears} BEARS  |  {n_stewards} STEWARDS")


if __name__ == "__main__":
    main()
