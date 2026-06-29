// =============================================================================
// Orbital Dynamics Technologies — Risk Influence Map Demo Dataset (CANONICAL)
// Space Industry Use Case: LEO Constellation & GEO Relay Programs
//
// !! GENERATED FILE — DO NOT EDIT DIRECTLY !!
//    Source  : _inputs/workbook.yaml
//    Script  : 09 - Engine Room/generate_seed.py
//    Built   : 2026-06-29 11:35
//
// To make changes: edit workbook.yaml, then re-run generate_seed.py
// Execute in Neo4j Browser or via cypher-shell.
// =============================================================================

// 1. PURGE (optional — uncomment if you need to start fresh)
MATCH (n) DETACH DELETE n;

// =============================================================================
// RISKS
// =============================================================================

// --- Company Business Risks ---

CREATE (rc01:Risk {
  id: 'RC-01',
  name: 'Failure to achieve EBITDA positive by 2028',
  description: 'Risk that ODT does not reach positive EBITDA within the investor-committed timeline, triggering covenant breach and potential forced restructuring',
  level: 'Business',
  scope: 'Company',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Corporate', 'Financial'],
  owner: 'CEO',
  probability: 6.0,
  severity: 10.0,
  exposure: 60.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (rc02:Risk {
  id: 'RC-02',
  name: 'Cash runway exhaustion before revenue ramp',
  description: 'Risk of depleting available cash reserves before recurring revenue from constellation services reaches sustainability threshold',
  level: 'Business',
  scope: 'Company',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Corporate', 'Financial'],
  owner: 'CFO',
  probability: 5.0,
  severity: 10.0,
  exposure: 50.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (rc03:Risk {
  id: 'RC-03',
  name: 'Loss of investor confidence',
  description: 'Risk that key investors lose confidence in ODT execution capability, blocking Series C funding or triggering down-round valuation',
  level: 'Business',
  scope: 'Company',
  status: 'Active',
  origin: 'New',
  categories: ['Corporate', 'Financial'],
  owner: 'CEO',
  probability: 4.0,
  severity: 9.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rc04:Risk {
  id: 'RC-04',
  name: 'Multi-jurisdiction regulatory non-compliance',
  description: 'Risk of simultaneous regulatory failures across FCC, ITU, ESA and national authorities blocking global service deployment',
  level: 'Business',
  scope: 'Company',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Corporate', 'Regulatory'],
  owner: 'VP Compliance & Quality',
  probability: 4.0,
  severity: 8.0,
  exposure: 32.0,
  current_score_type: 'Qualitative_4x4',
  regulatory_body: 'FCC / ITU / ESA / national authorities',
  applicable_standard: 'Multiple (cross-jurisdiction)',
  licence_stage: 'Various — concurrent obligations',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (rc05:Risk {
  id: 'RC-05',
  name: 'Reputational damage from on-orbit incident',
  description: 'Risk that a satellite collision, debris generation event, or service outage causes lasting reputational harm affecting customer acquisition and investor relations',
  level: 'Business',
  scope: 'Company',
  status: 'Active',
  origin: 'New',
  categories: ['Corporate', 'Product'],
  owner: 'CEO',
  probability: 3.0,
  severity: 9.0,
  exposure: 27.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- HORIZON-LEO Programme Business Risks ---

CREATE (rh01:Risk {
  id: 'RH-01',
  name: 'Phase 3 launch schedule delay',
  description: 'Risk of delay in Phase 3 deployment (24 satellites) due to launch vehicle availability, integration issues, or regulatory holdups',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'Industrial'],
  owner: 'VP Launch Operations',
  probability: 7.0,
  severity: 8.0,
  exposure: 56.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 22.0,
  magnitude_low: 11.0,
  magnitude_high: 45.0,
  annual_probability: 0.7,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (rh02:Risk {
  id: 'RH-02',
  name: 'On-orbit satellite performance degradation',
  description: 'Risk of premature degradation of Phase 1/2 satellites reducing constellation capacity before Phase 3 compensates',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Product'],
  owner: 'VP Engineering',
  probability: 5.0,
  severity: 7.0,
  exposure: 35.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rh03:Risk {
  id: 'RH-03',
  name: 'Corporate segment revenue target miss',
  description: 'Risk of missing corporate connectivity revenue targets due to slower-than-expected enterprise customer acquisition',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Commercial'],
  owner: 'VP Sales',
  probability: 6.0,
  severity: 7.0,
  exposure: 42.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 14.0,
  magnitude_low: 7.0,
  magnitude_high: 28.0,
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (rh04:Risk {
  id: 'RH-04',
  name: 'Loss of competitive positioning vs mega-constellations',
  description: 'Risk that Starlink, Kuiper, or OneWeb achieve price/performance levels that commoditise ODT offering before differentiation is established',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'Commercial'],
  owner: 'CTO',
  probability: 6.0,
  severity: 8.0,
  exposure: 48.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rh05:Risk {
  id: 'RH-05',
  name: 'Government & Defense contract pipeline failure',
  description: 'Risk of failing to secure targeted DoD and allied government contracts due to security certification gaps or competitor incumbency',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Commercial'],
  owner: 'VP Sales',
  probability: 5.0,
  severity: 8.0,
  exposure: 40.0,
  current_score_type: 'Qualitative_4x4',
  regulatory_body: 'DoD / US government accreditation authority',
  applicable_standard: 'Security accreditation (task-order gate)',
  licence_stage: 'Accreditation maintenance — suspension freezes new task orders',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rh06:Risk {
  id: 'RH-06',
  name: 'Ground segment capacity bottleneck',
  description: 'Risk that ground station throughput becomes the limiting factor for constellation service quality as satellite count scales',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Contingent',
  origin: 'New',
  categories: ['Programme', 'Product'],
  owner: 'VP Ground & Ops',
  probability: 5.0,
  severity: 6.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  activation_condition: 'If Phase 3 satellites exceed 40 active beams per satellite in high-demand zones',
  activation_decision_date: '2026-06-30',
  magnitude_point_estimate: 8.0,
  magnitude_low: 4.0,
  magnitude_high: 16.0,
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (rh07:Risk {
  id: 'RH-07',
  name: 'ITU frequency coordination failure',
  description: 'Risk of losing priority filing or failing coordination with incumbent operators, restricting available spectrum in key markets',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'Regulatory'],
  owner: 'VP Compliance & Quality',
  probability: 4.0,
  severity: 8.0,
  exposure: 32.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 22.0,
  magnitude_low: 11.0,
  magnitude_high: 45.0,
  regulatory_body: 'ITU',
  applicable_standard: 'ITU Radio Regulations (frequency coordination)',
  licence_stage: 'Priority filing / coordination with incumbent operators',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- AURORA-GEO Programme Business Risks ---

CREATE (ra01:Risk {
  id: 'RA-01',
  name: 'PDR technical readiness delay',
  description: 'Risk of Preliminary Design Review schedule slip due to incomplete system-level trade studies or immature subsystem definitions',
  level: 'Business',
  scope: 'AURORA-GEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Product'],
  owner: 'AURORA Program Director',
  probability: 6.0,
  severity: 7.0,
  exposure: 42.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 14.0,
  magnitude_low: 7.0,
  magnitude_high: 28.0,
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (ra02:Risk {
  id: 'RA-02',
  name: 'Development budget overrun',
  description: 'Risk of exceeding allocated Phase A/B development budget due to technology maturation challenges or scope creep',
  level: 'Business',
  scope: 'AURORA-GEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Financial'],
  owner: 'CFO',
  probability: 7.0,
  severity: 6.0,
  exposure: 42.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.7,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (ra03:Risk {
  id: 'RA-03',
  name: 'Optical inter-satellite link technology maturation failure',
  description: 'Risk that free-space optical communication technology does not achieve required BER and pointing accuracy within timeline',
  level: 'Business',
  scope: 'AURORA-GEO',
  status: 'Active',
  origin: 'New',
  categories: ['Programme', 'Product'],
  owner: 'CTO',
  probability: 5.0,
  severity: 9.0,
  exposure: 45.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 35.0,
  magnitude_low: 18.0,
  magnitude_high: 70.0,
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (ra04:Risk {
  id: 'RA-04',
  name: 'Strategic partner withdrawal',
  description: 'Risk that key technology or co-investment partner withdraws from AURORA program due to strategic realignment or M&A activity',
  level: 'Business',
  scope: 'AURORA-GEO',
  status: 'Contingent',
  origin: 'New',
  categories: ['Programme', 'Supply Chain'],
  owner: 'AURORA Program Director',
  probability: 4.0,
  severity: 9.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  activation_condition: 'If partner M&A activity is confirmed or strategic review initiated',
  activation_decision_date: '2026-12-31',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (ra05:Risk {
  id: 'RA-05',
  name: 'ITAR export control blocking key partnerships',
  description: 'Risk that US export control restrictions prevent critical technology sharing with non-US partners essential for AURORA development',
  level: 'Business',
  scope: 'AURORA-GEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'Regulatory'],
  owner: 'VP Compliance & Quality',
  probability: 5.0,
  severity: 7.0,
  exposure: 35.0,
  current_score_type: 'Qualitative_4x4',
  magnitude_point_estimate: 14.0,
  magnitude_low: 7.0,
  magnitude_high: 28.0,
  regulatory_body: 'US DDTC (State Dept)',
  applicable_standard: 'ITAR 22 CFR 120–130',
  licence_stage: 'Technology-transfer authorisation (non-US AURORA partners)',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- Operational — Engineering ---

CREATE (roe01:Risk {
  id: 'ROE-01',
  name: 'Payload reconfiguration software critical defect',
  description: 'Undetected software defect in payload reconfiguration engine causing beam misallocation or service interruption across active satellites',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Product', 'Engineering'],
  owner: 'Lead Software Architect',
  probability: 4.0,
  severity: 9.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (roe02:Risk {
  id: 'ROE-02',
  name: 'Thermal design margin exceedance on Phase 3 batch',
  description: 'Risk that thermal analysis margins are insufficient for Phase 3 orbital configuration, leading to premature component degradation',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Product', 'Engineering'],
  owner: 'Thermal Subsystem Lead',
  probability: 5.0,
  severity: 7.0,
  exposure: 35.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (roe03:Risk {
  id: 'ROE-03',
  name: 'Optical terminal pointing accuracy failure',
  description: 'Risk that AURORA inter-satellite optical link terminal cannot maintain required pointing accuracy in GEO thermal environment',
  level: 'Operational',
  scope: 'AURORA-GEO',
  status: 'Active',
  origin: 'New',
  categories: ['Product', 'Engineering'],
  owner: 'AURORA Chief Engineer',
  probability: 5.0,
  severity: 8.0,
  exposure: 40.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

// --- Operational — Manufacturing & Supply Chain ---

CREATE (rom01:Risk {
  id: 'ROM-01',
  name: 'RF component sole-source supplier failure',
  description: 'Failure or force majeure event at Teledyne, sole source for Ku/Ka-band transponder modules, halting satellite production',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Supply Chain', 'Industrial'],
  owner: 'VP Manufacturing & Supply Chain',
  probability: 4.0,
  severity: 9.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Critical',
  single_source: true,
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rom02:Risk {
  id: 'ROM-02',
  name: 'Battery supplier critical delivery delay',
  description: 'Risk that Saft Batteries fails to deliver qualified space-grade lithium-ion cells within 12-month lead time window',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Supply Chain'],
  owner: 'VP Manufacturing & Supply Chain',
  probability: 5.0,
  severity: 7.0,
  exposure: 35.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Critical',
  single_source: true,
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rom03:Risk {
  id: 'ROM-03',
  name: 'Composite structure quality deviation',
  description: 'Progressive quality drift in composite satellite bus structures from tier-1 subcontractor, risking structural integrity',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Industrial', 'Supply Chain'],
  owner: 'Quality Manager',
  probability: 4.0,
  severity: 7.0,
  exposure: 28.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Important',
  single_source: false,
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (rom04:Risk {
  id: 'ROM-04',
  name: 'Clean room contamination event',
  description: 'Particulate or chemical contamination event in satellite AIT clean room forcing production halt and decontamination',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Industrial'],
  owner: 'Plant Director',
  probability: 3.0,
  severity: 7.0,
  exposure: 21.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Internal',
  criticality_class: 'Critical',
  single_source: false,
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- Operational — Launch Operations ---

CREATE (rol01:Risk {
  id: 'ROL-01',
  name: 'Launch vehicle availability gap',
  description: 'Risk of SpaceX or Rocket Lab manifest congestion creating 6+ month gap in available launch slots for Phase 3 deployment',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'Supply Chain'],
  owner: 'VP Launch Operations',
  probability: 6.0,
  severity: 8.0,
  exposure: 48.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Important',
  single_source: false,
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (rol02:Risk {
  id: 'ROL-02',
  name: 'Orbital debris collision during deployment',
  description: 'Risk of collision with tracked or untracked debris during constellation deployment manoeuvres in congested LEO regime',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Product'],
  owner: 'VP Launch Operations',
  probability: 2.0,
  severity: 10.0,
  exposure: 20.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.05,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- Operational — Commercial ---

CREATE (roc01:Risk {
  id: 'ROC-01',
  name: 'Key enterprise customer churn',
  description: 'Risk of losing top-5 enterprise customers to competitor offering due to pricing pressure or SLA underperformance',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Commercial'],
  owner: 'VP Sales',
  probability: 5.0,
  severity: 6.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (roc02:Risk {
  id: 'ROC-02',
  name: 'Channel partner underperformance',
  description: 'Risk that contracted satellite integrators and managed service providers fail to deliver committed customer acquisition volumes',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Commercial'],
  owner: 'VP Sales',
  probability: 6.0,
  severity: 5.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

// --- Operational — Finance, HR & Legal ---

CREATE (rof01:Risk {
  id: 'ROF-01',
  name: 'Foreign exchange exposure on international contracts',
  description: 'Risk of significant FX losses on EUR/GBP/SGD-denominated contracts without adequate hedging, eroding margins',
  level: 'Operational',
  scope: 'Company',
  status: 'Active',
  origin: 'New',
  categories: ['Financial'],
  owner: 'CFO',
  probability: 6.0,
  severity: 5.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (rof02:Risk {
  id: 'ROF-02',
  name: 'On-orbit asset insurance coverage gap',
  description: 'Risk that underwriters reduce coverage limits or increase premiums making satellite constellation insurance economically unviable',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Financial'],
  owner: 'CFO',
  probability: 4.0,
  severity: 7.0,
  exposure: 28.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (roh01:Risk {
  id: 'ROH-01',
  name: 'Key engineering talent attrition',
  description: 'Risk of losing critical satellite design and payload software engineers to competitor new space companies',
  level: 'Operational',
  scope: 'Company',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'HR'],
  owner: 'HR Director',
  probability: 7.0,
  severity: 7.0,
  exposure: 49.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.7,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (roh02:Risk {
  id: 'ROH-02',
  name: 'ITAR-cleared personnel shortage',
  description: 'Risk that insufficient ITAR-cleared engineers are available for Government & Defense program work, blocking contract execution',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['HR', 'Regulatory'],
  owner: 'HR Director',
  probability: 6.0,
  severity: 6.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  regulatory_body: 'US DDTC (State Dept)',
  applicable_standard: 'ITAR 22 CFR 120–130 (deemed-export rules)',
  licence_stage: 'Personnel clearance — limits the ITAR-cleared workforce',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (ror01:Risk {
  id: 'ROR-01',
  name: 'FCC spectrum license conditions breach',
  description: 'Risk of unintentional breach of FCC license conditions triggering investigation, fine, or license suspension',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Regulatory'],
  owner: 'VP Compliance & Quality',
  probability: 3.0,
  severity: 9.0,
  exposure: 27.0,
  current_score_type: 'Qualitative_4x4',
  regulatory_body: 'FCC',
  applicable_standard: '47 CFR Part 25',
  licence_stage: 'Granted Q3 2026 — ongoing deployment-milestone conditions (the breach risk)',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (roi01:Risk {
  id: 'ROI-01',
  name: 'NOC system extended outage',
  description: 'Major failure of Network Operations Center systems causing loss of constellation monitoring and customer service management',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Programme', 'IT'],
  owner: 'IT Director',
  probability: 3.0,
  severity: 8.0,
  exposure: 24.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

// --- Operational — Security ---

CREATE (sec01:Risk {
  id: 'SEC-01',
  name: 'APT attack on satellite command and control system',
  description: 'Advanced persistent threat actor gains access to TT&C (telemetry, tracking and command) systems enabling unauthorized satellite commands',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Product'],
  owner: 'CISO',
  probability: 4.0,
  severity: 10.0,
  exposure: 40.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (sec02:Risk {
  id: 'SEC-02',
  name: 'Supply chain compromise - malicious firmware insertion',
  description: 'State-sponsored actor inserts malicious firmware or hardware backdoor into satellite components during manufacturing supply chain',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Supply Chain'],
  owner: 'CISO',
  probability: 3.0,
  severity: 10.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Critical',
  single_source: false,
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec03:Risk {
  id: 'SEC-03',
  name: 'Insider threat - privileged TT&C access abuse',
  description: 'Malicious or compromised insider with privileged access to satellite command systems executes unauthorized operations',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security'],
  owner: 'CISO',
  probability: 3.0,
  severity: 9.0,
  exposure: 27.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec04:Risk {
  id: 'SEC-04',
  name: 'Ransomware attack on ground segment infrastructure',
  description: 'Ransomware deployment across ground station control systems and NOC, causing complete loss of constellation management capability',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Security', 'IT'],
  owner: 'CISO',
  probability: 5.0,
  severity: 9.0,
  exposure: 45.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (sec05:Risk {
  id: 'SEC-05',
  name: 'RF signal jamming and spoofing attack',
  description: 'Deliberate jamming or spoofing of customer communication links degrading service quality in targeted geographic regions',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Product'],
  owner: 'CISO',
  probability: 5.0,
  severity: 7.0,
  exposure: 35.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec06:Risk {
  id: 'SEC-06',
  name: 'Engineering data exfiltration by state-sponsored actor',
  description: 'Competitor- or state-sponsored actor exfiltrates proprietary payload design, beam-forming algorithms, or reconfiguration IP from PLM/engineering systems',
  level: 'Operational',
  scope: 'Company',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Security', 'Product'],
  owner: 'CISO',
  probability: 5.0,
  severity: 9.0,
  exposure: 45.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

CREATE (sec07:Risk {
  id: 'SEC-07',
  name: 'Physical security breach at ground station',
  description: 'Unauthorized physical access to ground station facility enabling equipment tampering, data theft, or sabotage',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security'],
  owner: 'CISO',
  probability: 2.0,
  severity: 8.0,
  exposure: 16.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.05,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (sec08:Risk {
  id: 'SEC-08',
  name: 'Cloud provider compromise affecting NOC services',
  description: 'Compromise of third-party cloud infrastructure hosting NOC orchestration and customer management platforms',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'IT'],
  owner: 'CISO',
  probability: 3.0,
  severity: 7.0,
  exposure: 21.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec09:Risk {
  id: 'SEC-09',
  name: 'Social engineering targeting launch operations staff',
  description: 'Targeted phishing or social engineering campaign against launch operations team to obtain credentials or operational intelligence',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'HR'],
  owner: 'CISO',
  probability: 6.0,
  severity: 6.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec10:Risk {
  id: 'SEC-10',
  name: 'DDoS on customer portal and API gateway',
  description: 'Distributed denial-of-service attack overwhelming customer-facing portal, provisioning APIs, and billing systems',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Commercial'],
  owner: 'CISO',
  probability: 6.0,
  severity: 5.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec11:Risk {
  id: 'SEC-11',
  name: 'Satellite telemetry interception and analysis',
  description: 'Adversary intercepts and analyses unencrypted or weakly encrypted satellite telemetry to derive operational intelligence',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security'],
  owner: 'CISO',
  probability: 5.0,
  severity: 6.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec12:Risk {
  id: 'SEC-12',
  name: 'Unauthorized firmware modification via maintenance backdoor',
  description: 'Exploitation of maintenance or debug interfaces left active in flight software to inject unauthorized firmware updates',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Product'],
  owner: 'CISO',
  probability: 3.0,
  severity: 10.0,
  exposure: 30.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec13:Risk {
  id: 'SEC-13',
  name: 'Cryptographic key compromise for satellite command auth',
  description: 'Compromise of cryptographic keys used for satellite command authentication, enabling unauthorized command injection',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'New',
  categories: ['Security'],
  owner: 'CISO',
  probability: 2.0,
  severity: 10.0,
  exposure: 20.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.05,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (sec14:Risk {
  id: 'SEC-14',
  name: 'IT-to-OT lateral movement into ground segment',
  description: 'Attacker pivots from corporate IT network into operational technology network controlling ground station equipment',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Active',
  origin: 'Legacy',
  categories: ['Security', 'IT'],
  owner: 'CISO',
  probability: 4.0,
  severity: 9.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 30})
});

// --- Cyber Kill-Chain Risks ---

CREATE (rcy01:Risk {
  id: 'RCY-01',
  name: 'Initial compromise of engineering VPN entry point',
  description: 'Adversary gains an initial foothold via the internet-facing engineering VPN',
  level: 'Operational',
  scope: 'Security Operations',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'IT'],
  owner: 'CISO',
  probability: 6.0,
  severity: 6.0,
  exposure: 36.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

CREATE (rcy02:Risk {
  id: 'RCY-02',
  name: 'PLM compromise - satellite design data integrity & exfiltration',
  description: 'Adversary reaches the PLM via lateral movement, exfiltrating and corrupting design data',
  level: 'Operational',
  scope: 'Security Operations',
  status: 'Active',
  origin: 'New',
  categories: ['Security', 'Product'],
  owner: 'CISO',
  probability: 5.0,
  severity: 9.0,
  exposure: 45.0,
  current_score_type: 'Qualitative_4x4',
  annual_probability: 0.33,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 60})
});

// --- Historical Incidents & Closed Risks ---

CREATE (hx01:Risk {
  id: 'HX-01',
  name: '[2026] Teledyne RF transponder lot quality escape',
  description: 'A Ku/Ka-band transponder lot from Teledyne showed an out-of-spec solder process drift; caught at incoming inspection, quarantined and re-screened. Minor schedule margin consumed; no flight impact. Closed.',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Closed',
  origin: 'Legacy',
  categories: ['Supply Chain', 'Industrial'],
  owner: 'Quality Manager',
  probability: 4.0,
  severity: 4.0,
  exposure: 16.0,
  current_score_type: 'Qualitative_4x4',
  supplier_tier: 'Tier 1',
  criticality_class: 'Critical',
  single_source: true,
  archive_date: '2026-08-31',
  annual_probability: 0.2,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 365})
});

CREATE (hx02:Risk {
  id: 'HX-02',
  name: '[2027] Contained credential-phishing attempt on the engineering VPN',
  description: 'A targeted phishing campaign harvested an engineer\'s password; the attempted VPN login was blocked by MFA + device-posture checks and flagged by the SOC. No access gained, no data touched — validated MIT-CY1 / MIT-13. Not a breach, and not the trigger for the cyber-quantification programme (that remains a forward-looking SPICE exercise).',
  level: 'Operational',
  scope: 'Security Operations',
  status: 'Closed',
  origin: 'New',
  categories: ['Security'],
  owner: 'CISO',
  probability: 6.0,
  severity: 3.0,
  exposure: 18.0,
  current_score_type: 'Qualitative_4x4',
  archive_date: '2027-05-31',
  annual_probability: 0.5,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 365})
});

CREATE (hx03:Risk {
  id: 'HX-03',
  name: '[legacy] Single-NOC design — no geographic control backup',
  description: 'Before the Dublin backup NOC came online, constellation control ran from a single Denver site with no geographic redundancy. Superseded when Dublin was established; archived. (The residual shared-identity-plane weakness is carried forward in the S1 kill-chain via TP-IDP, not here.)',
  level: 'Operational',
  scope: 'Security Operations',
  status: 'Archived',
  origin: 'Legacy',
  categories: ['Programme', 'Product'],
  owner: 'VP Ground & Ops',
  probability: 3.0,
  severity: 8.0,
  exposure: 24.0,
  current_score_type: 'Qualitative_4x4',
  archive_date: '2026-11-30',
  annual_probability: 0.1,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 365})
});

CREATE (hx04:Risk {
  id: 'HX-04',
  name: 'Orbital-debris conjunction residual (accepted, watching)',
  description: 'The residual collision exposure during deployment cannot be eliminated; the ROC formally accepted it and monitors conjunction screening. Watched for a close-approach trigger that re-activates the ROL-02 collision-avoidance response — the showcase of the accepted → watching → re-activate lifecycle.',
  level: 'Operational',
  scope: 'HORIZON-LEO',
  status: 'Watching',
  origin: 'Legacy',
  categories: ['Product'],
  owner: 'VP Launch Operations',
  probability: 2.0,
  severity: 10.0,
  exposure: 20.0,
  current_score_type: 'Qualitative_4x4',
  trigger_condition: 'Predicted conjunction probability above the manoeuvre threshold (sub-1km close approach on 18th SDS conjunction data) → re-activate ROL-02.',
  acceptance_date: '2027-03-31',
  acceptance_owner: 'Yuki Tanaka (VP Launch Operations)',
  annual_probability: 0.05,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 90})
});

CREATE (hx05:Risk {
  id: 'HX-05',
  name: 'FCC Part 25 operational-approval risk (suppressed)',
  description: 'The risk of not securing FCC Part 25 operational approval — a Phase-1 launch gate. Approval was granted (Q3 2026), so the exposure dropped below the acceptance threshold; suppressed and retained for audit. Ongoing licence conditions remain a live risk (ROR-01).',
  level: 'Business',
  scope: 'HORIZON-LEO',
  status: 'Suppressed',
  origin: 'Legacy',
  categories: ['Regulatory'],
  owner: 'VP Compliance & Quality',
  probability: 2.0,
  severity: 7.0,
  exposure: 14.0,
  current_score_type: 'Qualitative_4x4',
  regulatory_body: 'FCC',
  applicable_standard: '47 CFR Part 25',
  licence_stage: 'Granted Q3 2026 — approval risk retired (conditions tracked by ROR-01)',
  trigger_condition: 'Material new Part 25 condition or a filing lapse → re-activate as an approval-status risk.',
  archive_date: '2026-09-30',
  annual_probability: 0.05,
  created_at: datetime(),
  updated_at: datetime(),
  last_review_date: datetime(),
  next_review_date: datetime() + duration({days: 180})
});

// =============================================================================
// TOP PROGRAMME OBJECTIVES (TPOs)
// =============================================================================

CREATE (tpo01:ContextNode {
  node_type: 'tpo',
  id: 'TPO-01',
  reference: 'TPO-01',
  name: 'HORIZON-LEO: 48 operational satellites & $120M ARR by 2028',
  cluster: 'HORIZON-LEO Programme',
  description: 'Programme revenue ramp that underpins company EBITDA breakeven (rolls up to TCO-01)',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tpo02:ContextNode {
  node_type: 'tpo',
  id: 'TPO-02',
  reference: 'TPO-02',
  name: 'Complete Phase 3 deployment by Q2 2027',
  cluster: 'Programme Delivery',
  description: 'Successfully deploy all 24 Phase 3 satellites to operational orbit with service activation',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tpo03:ContextNode {
  node_type: 'tpo',
  id: 'TPO-03',
  reference: 'TPO-03',
  name: 'Secure FCC full operational license by Q3 2026',
  cluster: 'Regulatory',
  description: 'Obtain full FCC operational license for HORIZON-LEO constellation including all frequency allocations',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tpo04:ContextNode {
  node_type: 'tpo',
  id: 'TPO-04',
  reference: 'TPO-04',
  name: 'Win first $10M+ Government contract by Q4 2026',
  cluster: 'Commercial',
  description: 'Secure at least one multi-year government or defense contract exceeding $10M ARR',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tpo05:ContextNode {
  node_type: 'tpo',
  id: 'TPO-05',
  reference: 'TPO-05',
  name: 'AURORA-GEO pass PDR gate by Q1 2027',
  cluster: 'Programme Delivery',
  description: 'Successfully pass Preliminary Design Review for AURORA-GEO relay satellite with all subsystem definitions at TRL 4+',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tpo06:ContextNode {
  node_type: 'tpo',
  id: 'TPO-06',
  reference: 'TPO-06',
  name: 'Maintain zero debris generation incidents',
  cluster: 'Safety & Compliance',
  description: 'Achieve and maintain zero debris generation events across entire constellation lifecycle, meeting IADC guidelines',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// TOP COMPANY OBJECTIVES (TCOs)
// =============================================================================

CREATE (tco01:ContextNode {
  node_type: 'tco',
  id: 'TCO-01',
  reference: 'TCO-01',
  name: 'Reach and sustain positive company EBITDA',
  description: 'Company-wide financial objective: positive, sustained EBITDA across all programmes',
  owner: 'CFO',
  time_horizon: '2028',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tco02:ContextNode {
  node_type: 'tco',
  id: 'TCO-02',
  reference: 'TCO-02',
  name: 'Maintain operating licenses & flawless safety record',
  description: 'Company-wide license & safety objective: retain all regulatory authorisations and avoid safety/debris incidents',
  owner: 'Chief Compliance Officer',
  time_horizon: 'Ongoing',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tco03:ContextNode {
  node_type: 'tco',
  id: 'TCO-03',
  reference: 'TCO-03',
  name: 'Achieve commercial scale & customer diversification',
  description: 'Company-wide commercial objective: diversified backlog across commercial and government customers',
  owner: 'Chief Commercial Officer',
  time_horizon: '2027-2029',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (tco04:ContextNode {
  node_type: 'tco',
  id: 'TCO-04',
  reference: 'TCO-04',
  name: 'Achieve a successful IPO / liquidity event by H1 2029',
  description: 'Company-wide capstone objective: complete the planned IPO (~$250M, Nasdaq, H1 2029). The convergence apex — the company financial-risk cluster (RC-01/RC-02/RC-03) impacts it directly, and the revenue ramp (TPO-01) contributes to it. TCO-01 (positive EBITDA) is the headline enabler. BST-FN1 is the scenario of failing this objective.',
  owner: 'CEO',
  time_horizon: 'H1 2029',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// MITIGATIONS
// =============================================================================

// --- Dedicated Mitigations ---

CREATE (mit01:Mitigation {
  id: 'MIT-01',
  name: 'Multi-launcher diversification strategy',
  type: 'Dedicated',
  status: 'existing',
  description: 'Contracted launch slots with SpaceX, Rocket Lab, and Arianespace providing 3 independent launch paths for Phase 3',
  owner: 'VP Launch Operations',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit02:Mitigation {
  id: 'MIT-02',
  name: 'RF component dual-sourcing qualification',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Qualification of Airbus DS as second source for Ku/Ka transponder modules with framework contract negotiation',
  owner: 'VP Manufacturing & Supply Chain',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit03:Mitigation {
  id: 'MIT-03',
  name: 'Satellite engineering talent retention program',
  type: 'Dedicated',
  status: 'existing',
  description: 'Equity incentive program, technical career ladder, and competitive retention packages for top 50 critical engineers',
  owner: 'HR Director',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit04:Mitigation {
  id: 'MIT-04',
  name: 'Ground segment Zero Trust architecture',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Redesign of ground segment network following Zero Trust principles with micro-segmentation between IT and OT domains',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit05:Mitigation {
  id: 'MIT-05',
  name: 'Satellite command authentication hardening',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Implementation of post-quantum cryptographic command authentication with hardware security module key management',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit06:Mitigation {
  id: 'MIT-06',
  name: 'Enterprise customer success program',
  type: 'Dedicated',
  status: 'existing',
  description: 'Dedicated customer success managers for top-20 enterprise accounts with quarterly business reviews and SLA monitoring',
  owner: 'VP Sales',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit07:Mitigation {
  id: 'MIT-07',
  name: 'Autonomous collision avoidance system',
  type: 'Dedicated',
  status: 'existing',
  description: 'AI-driven autonomous collision avoidance using 18th Space Defense Squadron conjunction data with sub-1km threshold manoeuvres',
  owner: 'VP Launch Operations',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit08:Mitigation {
  id: 'MIT-08',
  name: 'Payload software independent V&V program',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Independent verification and validation of payload reconfiguration software by third-party per ECSS-E-ST-40C',
  owner: 'Lead Software Architect',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit09:Mitigation {
  id: 'MIT-09',
  name: 'AURORA optical link risk reduction campaign',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Pre-PDR breadboard testing and thermal vacuum simulation of optical terminal pointing mechanism',
  owner: 'AURORA Chief Engineer',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit10:Mitigation {
  id: 'MIT-10',
  name: 'Supply chain hardware integrity verification',
  type: 'Dedicated',
  status: 'recommended',
  description: 'X-ray inspection and firmware hash verification protocol for all mission-critical components received from tier-1 suppliers',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit11:Mitigation {
  id: 'MIT-11',
  name: 'Anti-jamming adaptive beam-forming',
  type: 'Dedicated',
  status: 'on-going',
  description: 'Software-defined anti-jamming capability using adaptive null-steering on phased array to mitigate targeted RF interference',
  owner: 'VP Engineering',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit12:Mitigation {
  id: 'MIT-12',
  name: 'Ransomware-specific incident response plan',
  type: 'Dedicated',
  status: 'existing',
  description: 'Dedicated ransomware playbook with offline backups, network isolation procedures, and pre-negotiated incident response retainer',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mitcy1:Mitigation {
  id: 'MIT-CY1',
  name: 'Zero-trust VPN + MFA hardening',
  type: 'Dedicated',
  status: 'existing',
  description: 'Enforce MFA and device posture on the engineering VPN to reduce initial compromise',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smctrlrecovery:Mitigation {
  id: 'SM-CTRL-RECOVERY',
  name: 'Clean control-plane recovery capability',
  type: 'Dedicated',
  status: 'planned',
  financial_effect: 'recovery_accelerating',
  committed_budget: 1.5,
  description: 'Offline golden images + rebuild runbook to restore legitimate control fast.',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smidentitysplit:Mitigation {
  id: 'SM-IDENTITY-SPLIT',
  name: 'Denver/Dublin identity & PAM plane separation',
  type: 'Dedicated',
  status: 'planned',
  financial_effect: 'impact_reducing',
  committed_budget: 4.0,
  description: 'Break the shared identity/privileged-access plane so one compromise cannot trip the fleet.',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smcleanbuild:Mitigation {
  id: 'SM-CLEAN-BUILD',
  name: 'Clean-build & unit re-verification line',
  type: 'Dedicated',
  status: 'recommended',
  financial_effect: 'recovery_accelerating',
  description: 'Re-qualify suspect Phase-4 units to certified-clean state.',
  owner: 'VP Manufacturing & Supply Chain',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smplmintegrity:Mitigation {
  id: 'SM-PLM-INTEGRITY',
  name: 'PLM integrity monitoring & supplier access governance',
  type: 'Dedicated',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  description: 'Tamper-evidence on build/test/config records + supplier least-privilege.',
  owner: 'CISO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smaccredenclave:Mitigation {
  id: 'SM-ACCRED-ENCLAVE',
  name: 'Audited accreditation enclave + remediation playbook',
  type: 'Dedicated',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  description: 'Isolated, continuously-audited accredited environment with a pre-cleared remediation plan.',
  owner: 'VP Compliance & Quality',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smdualsource:Mitigation {
  id: 'SM-DUAL-SOURCE',
  name: 'RF dual-source + multi-launcher framework',
  type: 'Dedicated',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  description: 'Pre-negotiated second-source RF framework and multi-launcher slots (financial-layer counterpart of MIT-01 / MIT-02) plus buffer stock.',
  owner: 'VP Manufacturing & Supply Chain',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smrevenuediversify:Mitigation {
  id: 'SM-REVENUE-DIVERSIFY',
  name: 'Commercial / government revenue diversification program',
  type: 'Dedicated',
  status: 'planned',
  financial_effect: 'impact_reducing',
  description: 'Reduce 30% gov-segment concentration; broaden commercial backlog.',
  owner: 'VP Sales',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smauroraderisk:Mitigation {
  id: 'SM-AURORA-DERISK',
  name: 'AURORA optical-link risk-reduction campaign',
  type: 'Dedicated',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  description: 'Pre-PDR breadboard + thermal-vacuum testing of the optical pointing mechanism to retire ISL maturation risk early (financial-layer counterpart of MIT-09).',
  owner: 'AURORA Chief Engineer',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Inherited Mitigations ---

CREATE (mit13:Mitigation {
  id: 'MIT-13',
  name: 'Corporate SOC 24/7 monitoring',
  type: 'Inherited',
  status: 'existing',
  description: 'Shared Security Operations Center providing 24/7 threat detection, SIEM correlation, and incident response with SLA <15min',
  owner: 'CISO',
  source_entity: 'Corporate IT Security Division',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit14:Mitigation {
  id: 'MIT-14',
  name: 'Corporate financial planning and analysis process',
  type: 'Inherited',
  status: 'existing',
  description: 'Monthly rolling forecast, variance analysis, and cash flow monitoring with board-level escalation on >5% deviation',
  owner: 'CFO',
  source_entity: 'Corporate Finance',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit15:Mitigation {
  id: 'MIT-15',
  name: 'Corporate IT disaster recovery',
  type: 'Inherited',
  status: 'existing',
  description: 'Multi-region disaster recovery infrastructure with RTO 4h / RPO 1h for critical business systems',
  owner: 'IT Director',
  source_entity: 'Corporate IT Division',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit16:Mitigation {
  id: 'MIT-16',
  name: 'Corporate security awareness training',
  type: 'Inherited',
  status: 'existing',
  description: 'Mandatory quarterly security awareness training and monthly phishing simulation campaigns for all employees',
  owner: 'CISO',
  source_entity: 'Corporate HR & Security',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smcyberins:Mitigation {
  id: 'SM-CYBER-INS',
  name: 'Cyber insurance tower',
  type: 'Inherited',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  coverage_amount: 50.0,
  description: '$50M limit, $5M deductible, BI cover after 72h, war/state-actor exclusion (Canon: Insurance). Pays down financial impact but not attribution-disputed loss.',
  owner: 'CFO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smbridgefacility:Mitigation {
  id: 'SM-BRIDGE-FACILITY',
  name: 'Committed bridge financing facility',
  type: 'Inherited',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  coverage_amount: 60.0,
  description: 'Drawable facility to hold FCF above the -$100M trigger ahead of the IPO.',
  owner: 'CFO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (smauroravariance:Mitigation {
  id: 'SM-AURORA-VARIANCE',
  name: 'AURORA stage-gate funding & budget variance control',
  type: 'Inherited',
  status: 'on-going',
  financial_effect: 'impact_reducing',
  description: 'Release AURORA funds against PDR/sub-system stage-gates with monthly variance analysis, catching an overrun before it breaches the company FCF envelope (financial-layer counterpart of MIT-14).',
  owner: 'CFO',
  source_entity: '',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Baseline Mitigations ---

CREATE (mit17:Mitigation {
  id: 'MIT-17',
  name: 'ECSS Space Product Assurance framework',
  type: 'Baseline',
  status: 'on-going',
  description: 'Compliance with ECSS-Q-ST-20C (quality assurance) and ECSS-Q-ST-80C (software product assurance) for all flight hardware and software',
  owner: 'VP Compliance & Quality',
  source_entity: 'ECSS Standards',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit18:Mitigation {
  id: 'MIT-18',
  name: 'NIST Cybersecurity Framework implementation',
  type: 'Baseline',
  status: 'existing',
  description: 'Full implementation of NIST CSF 2.0 across all IT and OT systems with annual maturity assessment',
  owner: 'CISO',
  source_entity: 'NIST CSF 2.0',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit19:Mitigation {
  id: 'MIT-19',
  name: 'FCC regulatory compliance program',
  type: 'Baseline',
  status: 'on-going',
  description: 'Systematic compliance tracking for all FCC license conditions with automated reporting and exception management',
  owner: 'VP Compliance & Quality',
  source_entity: 'FCC 47 CFR Parts 25 & 97',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit20:Mitigation {
  id: 'MIT-20',
  name: 'ITAR compliance management system',
  type: 'Baseline',
  status: 'existing',
  description: 'Comprehensive ITAR compliance program including technology control plans, deemed export procedures, and annual audit',
  owner: 'VP Compliance & Quality',
  source_entity: 'ITAR 22 CFR Parts 120-130',
  created_at: datetime(),
  updated_at: datetime()
});

CREATE (mit21:Mitigation {
  id: 'MIT-21',
  name: 'ISO 27001 ISMS certification',
  type: 'Baseline',
  status: 'existing',
  description: 'Certified Information Security Management System covering all ODT operations with annual surveillance audits',
  owner: 'CISO',
  source_entity: 'ISO/IEC 27001:2022',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// CONTEXT NODES
// =============================================================================

// --- Business Perimeters ---

CREATE (bpleo:ContextNode {
  node_type: 'business_perimeter',
  id: 'BP-LEO',
  name: 'HORIZON-LEO Programme',
  pl_holder: 'HORIZON-LEO Business Unit',
  ebit_baseline: 13.0,
  fcf_baseline: -30.0,
  currency: 'USD_M',
  spice_assessed: false,
  description: 'P&L-bearing unit for the HORIZON-LEO constellation programme. ebit_baseline 13.0 = the company\'s canon EBIT, borne entirely by LEO (GEO is pre-revenue, ebit 0); fcf_baseline -30 is LEO\'s share of the canon consolidated -40 FCF. (CAN-01/CAN-03 EBIT leg closed 2026-06-26: AURORA dev-spend capitalised, so consolidated EBIT = LEO 13 + GEO 0.)',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bpgeo:ContextNode {
  node_type: 'business_perimeter',
  id: 'BP-GEO',
  name: 'AURORA-GEO Programme',
  pl_holder: 'AURORA-GEO Programme',
  ebit_baseline: 0.0,
  fcf_baseline: -10.0,
  currency: 'USD_M',
  spice_assessed: false,
  description: 'Pre-revenue development perimeter for the AURORA-GEO optical-relay programme. ebit_baseline 0 (no service revenue yet); fcf_baseline -10 is ODT\'s FY2028 internal-share development burn (Phase-C ramp) of a ~$50M Phase-A/B->PDR budget co-funded ~60% by ESA/NASA. Consolidates with BP-LEO (-30) to the canon company FCF of -40. Risk metric is schedule & co-funding (TPO-05 PDR gate), not EBIT.',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Scenarios (deprecated — retained for migration) ---

CREATE (sc01:ContextNode {
  node_type: 'scenario',
  id: 'SC-01',
  name: 'Satellite design IP exfiltration & production halt',
  description: 'Adversary exfiltrates satellite design data and corrupts the PLM, halting production',
  annual_probability: 0.15,
  ebit_impact_expected: 28.0,
  recovery_days: 120,
  created_at: datetime(),
  updated_at: datetime()
});

// --- Entry Points ---

CREATE (ep01:ContextNode {
  node_type: 'entry_point',
  id: 'EP-01',
  name: 'Internet-facing engineering VPN',
  description: 'Remote-access VPN used by engineering and suppliers, with broad internal reach',
  exploitability: 'High',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ep02:ContextNode {
  node_type: 'entry_point',
  id: 'EP-02',
  name: 'MSSP privileged remote access',
  description: 'The managed-security provider\'s (SOC) privileged remote access into the ground segment — the S1 entry vector. Broad reach into the shared identity plane; abused via stolen/over-scoped MSSP credentials.',
  exploitability: 'High',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Attackers ---

CREATE (atk01:ContextNode {
  node_type: 'attacker',
  id: 'ATK-01',
  name: 'APT-Stellar (state-sponsored)',
  description: 'Well-resourced state-sponsored actor targeting space IP and supply chains',
  capability_level: 9,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (atk02:ContextNode {
  node_type: 'attacker',
  id: 'ATK-02',
  name: 'APT-Eclipse (state-aligned, service-denial)',
  description: 'State-aligned, attribution-averse actor contesting ODT\'s government customers — objective is to take the constellation offline (break SLAs, shake government confidence), not to deploy ransomware. The S1 actor.',
  capability_level: 8,
  created_at: datetime(),
  updated_at: datetime()
});

// --- Technical Perimeters ---

CREATE (tpplm:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-PLM',
  name: 'PLM system (Teamcenter)',
  description: 'Product Lifecycle Management system holding satellite design master data',
  type: 'Engineering IT',
  location: 'Toulouse data centre',
  criticality: 5,
  external_id: 'PLM-PROD-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpait:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-AIT',
  name: 'Satellite AIT clean-room facility',
  description: 'Assembly-Integration-Test clean room where tier-1 components are received, integrated into the satellite bus and qualified to the Phase-4 certification gate. Single integration line on the deployment critical path (ROM-04 owner: Plant Director). Location not pinned in canon.',
  type: 'Manufacturing / AIT',
  criticality: 5,
  external_id: 'AIT-CR-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpnoc:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-NOC',
  name: 'NOC / mission control & service operations',
  description: 'Network Operations Centre commanding the on-orbit constellation (TT&C) and running the LEO broadband service (capacity allocation, provisioning). Denver primary / Dublin backup share an identity/PAM plane (the S1 weakness).',
  type: 'Ground segment / Mission control',
  location: 'Denver (primary) / Dublin (backup)',
  criticality: 5,
  external_id: 'NOC-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpidp:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-IDP',
  name: 'Shared Denver/Dublin identity & PAM plane',
  description: 'The single identity / privileged-access-management plane spanning both NOCs — a deliberate, realistic weakness: one compromise cascades to both sites, so the Dublin backup is NOT a backup against an identity-plane attack (the S1 flaw).',
  type: 'Identity & access management',
  location: 'Denver / Dublin (single sign-on + common privileged-access tooling)',
  criticality: 5,
  external_id: 'IDP-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpnms:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-NMS',
  name: 'Network Management System (NMS)',
  description: '"The commercial brain" — payload reconfiguration, beam plans, capacity allocation and routing. A corrupt beam/capacity config pushed here trips fleet-wide safe-mode (S1).',
  type: 'OT / Service management',
  location: 'NOC (Denver primary / Dublin backup)',
  criticality: 5,
  external_id: 'NMS-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpgw:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-GW',
  name: 'Ground gateways & secondary stations',
  description: 'Gateway and secondary ground stations remotely administered from Denver (Dublin backup). Ransomware / IT→OT lateral movement targets (SEC-04/14).',
  type: 'Ground segment',
  location: 'Fairbanks, Tromsø, Singapore, Perth (+ 12 secondary)',
  criticality: 4,
  external_id: 'GW-01',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (tpbill:ContextNode {
  node_type: 'technical_perimeter',
  id: 'TP-BILL',
  name: 'Billing & provisioning platform',
  description: 'Activates / deactivates customer terminals. Mass deactivation can mimic an outage at low technical cost — the S1 backup path; DDoS/API-abuse target (SEC-10).',
  type: 'Corporate IT / Cloud',
  location: 'Corporate IT / cloud',
  criticality: 3,
  external_id: 'BILL-01',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Sponsors ---

CREATE (spn01:ContextNode {
  node_type: 'sponsor',
  id: 'SPN-01',
  name: 'Foreign Intelligence Agency',
  description: 'State sponsor directing the intrusion to acquire satellite design IP',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (spn02:ContextNode {
  node_type: 'sponsor',
  id: 'SPN-02',
  name: 'State-aligned sponsor (government-contract contestation)',
  description: 'State-aligned backer of the S1 disruption — motive is to deny ODT legitimate fleet control long enough to break SLAs and shake government confidence, damaging the IPO narrative. Attribution-averse (and conveniently inside the cyber tower\'s war/state-actor exclusion).',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Functional Targets ---

CREATE (ft01:ContextNode {
  node_type: 'functional_target',
  id: 'FT-01',
  name: 'New satellite design information',
  description: 'Master design data the adversary seeks (the attack motive)',
  classification: 'Proprietary / ITAR-controlled',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ftctrl:ContextNode {
  node_type: 'functional_target',
  id: 'FT-CTRL',
  name: 'Legitimate fleet command authority (TT&C)',
  description: 'Authoritative command & control of the constellation (signed TT&C). The S1 objective: seize or deny it so the fleet trips fleet-wide safe-mode — "loss of legitimate control."',
  classification: 'Mission-critical / OT',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ftcomp:ContextNode {
  node_type: 'functional_target',
  id: 'FT-COMP',
  name: 'Qualified flight components',
  description: 'Tier-1 supplier components qualified for flight — RF transponders (Teledyne), space-grade batteries (Saft), composite bus structures (Northrop/Spirit), attitude control (Moog/Orbital ATK). The supply-chain inputs to the build.',
  classification: 'Flight hardware / ITAR-controlled',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ftsat:ContextNode {
  node_type: 'functional_target',
  id: 'FT-SAT',
  name: 'Integrated & tested satellite (flight unit)',
  description: 'A satellite assembled, integrated and tested through the AIT line and passed through the Phase-4 certification gate — the ~$3.4M/sat unit (incl. launch).',
  classification: 'Flight hardware / ITAR-controlled',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ftconst:ContextNode {
  node_type: 'functional_target',
  id: 'FT-CONST',
  name: 'Deployed on-orbit constellation capacity',
  description: 'The 80-satellite HORIZON-LEO constellation (8 polar planes, 550 km) once launched and commissioned — the capacity that carries the service.',
  classification: 'Operational asset',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ftsvc:ContextNode {
  node_type: 'functional_target',
  id: 'FT-SVC',
  name: 'LEO broadband service',
  description: 'The connectivity service ODT sells (corporate / government / wholesale telco) — the revenue-bearing output of the whole production chain.',
  classification: 'Commercial service',
  created_at: datetime(),
  updated_at: datetime()
});

// --- Business Activities ---

CREATE (ba01:ContextNode {
  node_type: 'business_activity',
  id: 'BA-01',
  name: 'Engineering - Design',
  description: 'Design engineering activity that produces and uses the satellite design data',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (baproc:ContextNode {
  node_type: 'business_activity',
  id: 'BA-PROC',
  name: 'Supplier procurement & component qualification',
  description: 'Sourcing and qualifying tier-1 flight components; manages the Teledyne / Saft single-source dependencies and the Airbus DS dual-source qualification.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bamfg:ContextNode {
  node_type: 'business_activity',
  id: 'BA-MFG',
  name: 'Satellite manufacturing, assembly & test (AIT)',
  description: 'Integration of qualified components into the satellite bus and test to the Phase-4 certification gate — the AIT line (target ~1 satellite/month).',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (balaunch:ContextNode {
  node_type: 'business_activity',
  id: 'BA-LAUNCH',
  name: 'Launch & early-orbit operations',
  description: 'Manifesting flight units on SpaceX / Rocket Lab, launch, and commissioning into the constellation — the launch-availability dependency (ROL-01).',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (basvc:ContextNode {
  node_type: 'business_activity',
  id: 'BA-SVC',
  name: 'Constellation operations & service delivery',
  description: 'Operating the on-orbit fleet (TT&C) and delivering the LEO broadband service — capacity allocation, provisioning, SLAs.',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// OWNERS  (accountability layer — BEARS / STEWARDS)
// =============================================================================

CREATE (ownceo:ContextNode {
  node_type: 'owner',
  id: 'OWN-CEO',
  name: 'Elena Vasquez',
  role: 'CEO / co-founder',
  entity: 'Executive',
  email: 'elena.vasquez@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (owncfo:ContextNode {
  node_type: 'owner',
  id: 'OWN-CFO',
  name: 'Diane Marchetti',
  role: 'CFO',
  entity: 'Finance',
  email: 'diane.marchetti@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (owncto:ContextNode {
  node_type: 'owner',
  id: 'OWN-CTO',
  name: 'Raj Patel',
  role: 'CTO / co-founder',
  entity: 'Engineering & Technology',
  email: 'raj.patel@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownciso:ContextNode {
  node_type: 'owner',
  id: 'OWN-CISO',
  name: 'Tom Reuter',
  role: 'CISO',
  entity: 'Office of the CISO (→ CTO)',
  email: 'tom.reuter@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvpcq:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPCQ',
  name: 'Amara Diallo',
  role: 'VP Compliance & Quality',
  entity: 'Compliance & Quality',
  email: 'amara.diallo@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvplo:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPLO',
  name: 'Yuki Tanaka',
  role: 'VP Launch Operations',
  entity: 'Launch Operations',
  email: 'yuki.tanaka@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvpeng:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPENG',
  name: 'Priya Nair',
  role: 'VP Engineering',
  entity: 'Engineering',
  email: 'priya.nair@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvpmsc:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPMSC',
  name: 'Carlos Mendes',
  role: 'VP Manufacturing & Supply Chain',
  entity: 'Manufacturing & Supply Chain',
  email: 'carlos.mendes@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvpgo:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPGO',
  name: 'Sofia Adler',
  role: 'VP Ground & Operations',
  entity: 'Ground & Operations',
  email: 'sofia.adler@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownapd:ContextNode {
  node_type: 'owner',
  id: 'OWN-APD',
  name: 'Henrik Sorensen',
  role: 'VP Program Management (AURORA-GEO)',
  entity: 'Program Management',
  email: 'henrik.sorensen@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownvpsales:ContextNode {
  node_type: 'owner',
  id: 'OWN-VPSALES',
  name: 'VP Sales',
  role: 'VP Sales',
  entity: 'Commercial / Sales',
  email: 'vp.sales@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownlsa:ContextNode {
  node_type: 'owner',
  id: 'OWN-LSA',
  name: 'Lead Software Architect',
  role: 'Lead Software Architect',
  entity: 'Engineering — Payload Software',
  email: 'payload.swlead@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (owntsl:ContextNode {
  node_type: 'owner',
  id: 'OWN-TSL',
  name: 'Thermal Subsystem Lead',
  role: 'Thermal Subsystem Lead',
  entity: 'Engineering — Thermal',
  email: 'thermal.lead@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownace:ContextNode {
  node_type: 'owner',
  id: 'OWN-ACE',
  name: 'AURORA Chief Engineer',
  role: 'AURORA Chief Engineer',
  entity: 'Engineering — AURORA-GEO',
  email: 'aurora.ce@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownqm:ContextNode {
  node_type: 'owner',
  id: 'OWN-QM',
  name: 'Quality Manager',
  role: 'Quality Manager',
  entity: 'Compliance & Quality',
  email: 'quality.mgr@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownpd:ContextNode {
  node_type: 'owner',
  id: 'OWN-PD',
  name: 'Plant Director',
  role: 'Plant Director',
  entity: 'Manufacturing (AIT)',
  email: 'plant.director@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownhrd:ContextNode {
  node_type: 'owner',
  id: 'OWN-HRD',
  name: 'HR Director',
  role: 'HR Director',
  entity: 'Human Resources',
  email: 'hr.director@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (ownitd:ContextNode {
  node_type: 'owner',
  id: 'OWN-ITD',
  name: 'IT Director',
  role: 'IT Director',
  entity: 'Corporate IT',
  email: 'it.director@orbitaldynamics.example',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// CONTRIBUTES_TO  (TPO → TCO hierarchy)
// =============================================================================

MATCH (tpo:ContextNode {id: 'TPO-01'}), (tco:ContextNode {id: 'TCO-01'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-01', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-02'}), (tco:ContextNode {id: 'TCO-01'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-02', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-03'}), (tco:ContextNode {id: 'TCO-02'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-03', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-06'}), (tco:ContextNode {id: 'TCO-02'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-04', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-04'}), (tco:ContextNode {id: 'TCO-03'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-05', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-05'}), (tco:ContextNode {id: 'TCO-03'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-06', created_at: datetime()}]->(tco);
MATCH (tpo:ContextNode {id: 'TPO-01'}), (tco:ContextNode {id: 'TCO-04'})
CREATE (tpo)-[:CONTRIBUTES_TO {id: 'CTR-07', created_at: datetime()}]->(tco);

// =============================================================================
// IMPACTS_TCO  (Risk → Company Objective)
// =============================================================================

MATCH (r:Risk {id: 'RC-01'}), (tco:ContextNode {id: 'TCO-01'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-01',
  impact_level: 'Critical',
  description: 'Funding shortfall directly threatens company EBITDA trajectory',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RC-04'}), (tco:ContextNode {id: 'TCO-02'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-02',
  impact_level: 'Critical',
  description: 'Regulatory non-compliance jeopardises operating licenses',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RC-05'}), (tco:ContextNode {id: 'TCO-03'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-03',
  impact_level: 'High',
  description: 'Reputational damage undermines commercial and government pipeline',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RH-01'}), (tco:ContextNode {id: 'TCO-01'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-CY1',
  impact_level: 'High',
  description: 'Phase-3 slip erodes revenue ramp and the company EBITDA trajectory',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RC-01'}), (tco:ContextNode {id: 'TCO-04'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-04',
  impact_level: 'Critical',
  description: 'No first-profit (EBITDA) story means no credible IPO',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RC-02'}), (tco:ContextNode {id: 'TCO-04'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-05',
  impact_level: 'Critical',
  description: 'Cash-runway exhaustion forces a distressed, dilutive raise before the IPO window',
  created_at: datetime()
}]->(tco);
MATCH (r:Risk {id: 'RC-03'}), (tco:ContextNode {id: 'TCO-04'})
CREATE (r)-[:IMPACTS_TCO {
  id: 'IMC-06',
  impact_level: 'Critical',
  description: 'Loss of investor confidence collapses the valuation multiple or pulls the IPO (down-round)',
  created_at: datetime()
}]->(tco);

// =============================================================================
// INFLUENCES  (Op→Bus | Bus→Bus | Op→Op)
// =============================================================================

MATCH (source:Risk {id: 'ROE-01'}), (target:Risk {id: 'RH-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-01',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'Payload software defect directly degrades satellite performance',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROE-02'}), (target:Risk {id: 'RH-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-02',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'Thermal margin exceedance accelerates satellite degradation',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROE-03'}), (target:Risk {id: 'RA-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-03',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'Pointing accuracy failure is the core technical risk for optical ISL maturation',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROM-01'}), (target:Risk {id: 'RH-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-04',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'RF component supplier failure halts satellite production',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROM-02'}), (target:Risk {id: 'RH-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-05',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'Battery delivery delay blocks satellite integration',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROM-03'}), (target:Risk {id: 'RH-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-06',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Moderate',
  description: 'Structure quality deviation may cause premature satellite degradation',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROL-01'}), (target:Risk {id: 'RH-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-07',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'Launch vehicle unavailability directly blocks Phase 3 deployment schedule',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROL-02'}), (target:Risk {id: 'RC-05'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-08',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'Debris collision would generate severe reputational damage',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROC-01'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-09',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'Enterprise customer churn directly reduces corporate segment revenue',
  confidence: 0.9,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROC-02'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-10',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'Channel underperformance reduces customer acquisition pipeline',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROH-01'}), (target:Risk {id: 'RH-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-11',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'Talent loss erodes competitive technological differentiation',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROH-02'}), (target:Risk {id: 'RH-05'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-12',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'ITAR personnel shortage blocks government contract execution capability',
  confidence: 0.9,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROR-01'}), (target:Risk {id: 'RC-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-13',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'FCC breach directly contributes to multi-jurisdiction compliance failure',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROI-01'}), (target:Risk {id: 'RH-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-14',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'NOC outage degrades ability to monitor and manage constellation performance',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-01'}), (target:Risk {id: 'RC-05'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-15',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'APT compromising satellite command would be catastrophic reputational event',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-04'}), (target:Risk {id: 'RH-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-16',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'Ransomware on ground segment causes loss of constellation management',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-06'}), (target:Risk {id: 'RH-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-17',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Critical',
  description: 'IP exfiltration eliminates competitive technological advantage',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-05'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-18',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'RF jamming degrades service quality causing customer revenue impact',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-10'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-19',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Moderate',
  description: 'DDoS on portal disrupts customer onboarding and billing',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROF-01'}), (target:Risk {id: 'RC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-20',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Moderate',
  description: 'FX losses erode margins impacting EBITDA target',
  confidence: 0.75,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-01'}), (target:Risk {id: 'RC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-21',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Critical',
  description: 'Phase 3 delay pushes revenue ramp',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-03'}), (target:Risk {id: 'RC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-22',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Critical',
  description: 'Revenue miss directly impacts EBITDA achievement',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-03'}), (target:Risk {id: 'RC-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-23',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Revenue shortfall accelerates cash burn rate',
  confidence: 0.9,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-04'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-24',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Lost competitive positioning reduces customer win rates',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-02'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-45',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Suspect/degraded on-orbit capacity forces replacement units and erodes the corporate revenue target (makes SC1\'s narrative literal — INC-03)',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RC-02'}), (target:Risk {id: 'RC-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-25',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Critical',
  description: 'Cash runway exhaustion directly triggers investor confidence loss',
  confidence: 1.0,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RC-04'}), (target:Risk {id: 'RH-07'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-26',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Multi-jurisdiction issues compound ITU coordination challenges',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-07'}), (target:Risk {id: 'RH-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-27',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Spectrum limitations reduce service capability vs competitors',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RC-05'}), (target:Risk {id: 'RC-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-28',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Critical',
  description: 'Reputational damage directly erodes investor confidence',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RA-02'}), (target:Risk {id: 'RC-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-29',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Moderate',
  description: 'AURORA budget overrun consumes cash reserves allocated for HORIZON operations',
  confidence: 0.75,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RA-03'}), (target:Risk {id: 'RA-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-30',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Critical',
  description: 'Optical technology maturation failure blocks PDR readiness',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RA-05'}), (target:Risk {id: 'RA-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-31',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'ITAR restrictions may force partner to withdraw from program',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-05'}), (target:Risk {id: 'RC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-32',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Government contract failure removes high-ARPU revenue stream from EBITDA path',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RH-06'}), (target:Risk {id: 'RH-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-46',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Moderate',
  description: 'Ground throughput ceiling constrains corporate service quality and the revenue ramp (threads RH-06 → RH-03 → TPO-01)',
  confidence: 0.75,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RA-04'}), (target:Risk {id: 'RA-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-47',
  influence_type: 'Level2_Bus_to_Bus',
  strength: 'Strong',
  description: 'Strategic-partner withdrawal forces ODT to absorb a larger AURORA budget share, driving the overrun (threads RA-04 → RA-02 → RC-02 → TCO-04)',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-09'}), (target:Risk {id: 'SEC-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-33',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Strong',
  description: 'Social engineering provides initial access vector for ransomware deployment',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-09'}), (target:Risk {id: 'SEC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-34',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Moderate',
  description: 'Social engineering credentials enable initial foothold for APT campaign',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-14'}), (target:Risk {id: 'SEC-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-35',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Critical',
  description: 'IT-to-OT lateral movement enables access to satellite command systems',
  confidence: 0.9,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-14'}), (target:Risk {id: 'SEC-04'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-36',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Strong',
  description: 'IT-to-OT pivot extends ransomware blast radius to ground segment',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-13'}), (target:Risk {id: 'SEC-12'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-37',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Critical',
  description: 'Compromised command keys enable unauthorized firmware modification',
  confidence: 0.95,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-03'}), (target:Risk {id: 'SEC-13'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-38',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Strong',
  description: 'Insider with privileged access can extract cryptographic keys',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-02'}), (target:Risk {id: 'SEC-12'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-39',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Strong',
  description: 'Supply chain malicious firmware is unauthorized modification by nature',
  confidence: 0.9,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-08'}), (target:Risk {id: 'ROI-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-40',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Strong',
  description: 'Cloud provider compromise causes NOC service outage',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROH-01'}), (target:Risk {id: 'ROE-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-41',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Moderate',
  description: 'Talent loss increases risk of undetected software defects',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'ROM-01'}), (target:Risk {id: 'ROM-03'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-42',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Moderate',
  description: 'Supplier failure forces use of less qualified backup sources',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-07'}), (target:Risk {id: 'SEC-14'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-43',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Moderate',
  description: 'Physical breach at ground station can provide network access point for IT-to-OT pivot',
  confidence: 0.65,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'SEC-11'}), (target:Risk {id: 'SEC-05'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-44',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Moderate',
  description: 'Telemetry intelligence informs targeted jamming/spoofing attacks',
  confidence: 0.7,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RCY-01'}), (target:Risk {id: 'RCY-02'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-CY1',
  influence_type: 'Level3_Op_to_Op',
  strength: 'Critical',
  description: 'Foothold on the VPN enables lateral movement to the PLM',
  confidence: 0.85,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);
MATCH (source:Risk {id: 'RCY-02'}), (target:Risk {id: 'RH-01'})
CREATE (source)-[:INFLUENCES {
  id: 'INF-CY2',
  influence_type: 'Level1_Op_to_Bus',
  strength: 'Strong',
  description: 'PLM/production disruption delays Phase-3 deployment (business risk)',
  confidence: 0.8,
  created_at: datetime(),
  last_validated: datetime()
}]->(target);

// =============================================================================
// IMPACTS_TPO  (Risk → Programme Objective)
// =============================================================================

MATCH (r:Risk {id: 'RC-01'}), (t:ContextNode {id: 'TPO-01'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-01',
  impact_level: 'Critical',
  description: 'Direct severity: this is the risk of not achieving the TPO',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RC-02'}), (t:ContextNode {id: 'TPO-01'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-02',
  impact_level: 'Critical',
  description: 'Cash exhaustion prevents reaching EBITDA positive date',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-03'}), (t:ContextNode {id: 'TPO-01'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-03',
  impact_level: 'High',
  description: 'Revenue miss shifts EBITDA timeline',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-01'}), (t:ContextNode {id: 'TPO-02'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-04',
  impact_level: 'Critical',
  description: 'Direct severity: schedule delay threatens deployment objective',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-02'}), (t:ContextNode {id: 'TPO-02'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-05',
  impact_level: 'Medium',
  description: 'Degradation may require replacement satellites in Phase 3',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RC-04'}), (t:ContextNode {id: 'TPO-03'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-06',
  impact_level: 'Critical',
  description: 'Regulatory non-compliance directly blocks FCC license',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-07'}), (t:ContextNode {id: 'TPO-03'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-07',
  impact_level: 'High',
  description: 'ITU coordination failures complicate FCC approval',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-05'}), (t:ContextNode {id: 'TPO-04'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-08',
  impact_level: 'Critical',
  description: 'Direct severity: government pipeline failure prevents contract win',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RC-05'}), (t:ContextNode {id: 'TPO-04'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-09',
  impact_level: 'High',
  description: 'Reputational damage undermines government trust and contract selection',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RA-01'}), (t:ContextNode {id: 'TPO-05'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-10',
  impact_level: 'Critical',
  description: 'Direct severity: PDR readiness delay threatens PDR gate objective',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RA-03'}), (t:ContextNode {id: 'TPO-05'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-11',
  impact_level: 'Critical',
  description: 'Optical ISL technology maturation is the PDR critical path item',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RA-05'}), (t:ContextNode {id: 'TPO-05'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-12',
  impact_level: 'Medium',
  description: 'ITAR issues may block partner contributions needed for PDR',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RC-05'}), (t:ContextNode {id: 'TPO-06'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-13',
  impact_level: 'High',
  description: 'Reputational events most likely to originate from debris incident',
  created_at: datetime()
}]->(t);
MATCH (r:Risk {id: 'RH-02'}), (t:ContextNode {id: 'TPO-06'})
CREATE (r)-[:IMPACTS_TPO {
  id: 'IMP-14',
  impact_level: 'Medium',
  description: 'Degraded satellites may lose de-orbit capability',
  created_at: datetime()
}]->(t);

// =============================================================================
// MITIGATES  (Mitigation → Risk)
// =============================================================================

MATCH (m:Mitigation {id: 'MIT-01'}), (r:Risk {id: 'ROL-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-01',
  effectiveness: 'High',
  description: 'Three independent launch providers reduce manifest congestion risk',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-01'}), (r:Risk {id: 'RH-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-02',
  effectiveness: 'Medium',
  description: 'Launch diversification provides schedule flexibility for Phase 3',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-02'}), (r:Risk {id: 'ROM-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-03',
  effectiveness: 'High',
  description: 'Second qualified source eliminates single-point supply failure',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-03'}), (r:Risk {id: 'ROH-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-04',
  effectiveness: 'High',
  description: 'Retention program significantly reduces critical engineer turnover',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-03'}), (r:Risk {id: 'RH-04'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-05',
  effectiveness: 'Medium',
  description: 'Retaining talent preserves competitive innovation capability',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-04'}), (r:Risk {id: 'SEC-14'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-06',
  effectiveness: 'Critical',
  description: 'Zero Trust micro-segmentation prevents IT-to-OT lateral movement',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-04'}), (r:Risk {id: 'SEC-04'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-07',
  effectiveness: 'High',
  description: 'Network segmentation contains ransomware blast radius',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-05'}), (r:Risk {id: 'SEC-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-08',
  effectiveness: 'Critical',
  description: 'Post-quantum command authentication prevents unauthorized satellite commands',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-05'}), (r:Risk {id: 'SEC-13'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-09',
  effectiveness: 'High',
  description: 'HSM-based key management reduces key compromise attack surface',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-05'}), (r:Risk {id: 'SEC-12'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-10',
  effectiveness: 'High',
  description: 'Authenticated command chain prevents unauthorized firmware updates',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-06'}), (r:Risk {id: 'ROC-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-11',
  effectiveness: 'High',
  description: 'Customer success management reduces churn through proactive engagement',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-07'}), (r:Risk {id: 'ROL-02'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-12',
  effectiveness: 'Critical',
  description: 'Autonomous manoeuvre capability minimizes collision probability',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-08'}), (r:Risk {id: 'ROE-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-13',
  effectiveness: 'High',
  description: 'Independent V&V maximizes defect detection before deployment',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-09'}), (r:Risk {id: 'ROE-03'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-14',
  effectiveness: 'High',
  description: 'Pre-PDR breadboard testing reduces pointing accuracy uncertainty',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-09'}), (r:Risk {id: 'RA-03'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-15',
  effectiveness: 'High',
  description: 'Risk reduction campaign de-risks optical ISL technology maturation',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-10'}), (r:Risk {id: 'SEC-02'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-16',
  effectiveness: 'High',
  description: 'X-ray and hash verification detect compromised components before integration',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-11'}), (r:Risk {id: 'SEC-05'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-17',
  effectiveness: 'High',
  description: 'Adaptive null-steering neutralizes targeted jamming sources',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-12'}), (r:Risk {id: 'SEC-04'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-18',
  effectiveness: 'High',
  description: 'Offline backups and playbook ensure rapid recovery from ransomware',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-13'}), (r:Risk {id: 'SEC-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-19',
  effectiveness: 'High',
  description: '24/7 SOC monitoring enables early APT detection',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-13'}), (r:Risk {id: 'SEC-14'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-20',
  effectiveness: 'Medium',
  description: 'SOC SIEM correlation detects lateral movement patterns',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-13'}), (r:Risk {id: 'SEC-10'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-21',
  effectiveness: 'Medium',
  description: 'SOC can activate DDoS mitigation within SLA',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-14'}), (r:Risk {id: 'RC-02'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-22',
  effectiveness: 'Medium',
  description: 'Cash flow monitoring enables early warning on runway exhaustion',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-14'}), (r:Risk {id: 'RA-02'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-23',
  effectiveness: 'Medium',
  description: 'Variance analysis catches AURORA budget overrun trends early',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-15'}), (r:Risk {id: 'ROI-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-24',
  effectiveness: 'Critical',
  description: 'DR infrastructure ensures NOC recovery within 4h RTO',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-16'}), (r:Risk {id: 'SEC-09'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-25',
  effectiveness: 'High',
  description: 'Phishing simulations and training reduce social engineering success rate',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-16'}), (r:Risk {id: 'SEC-03'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-26',
  effectiveness: 'Medium',
  description: 'Security culture awareness reduces insider threat opportunity',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-17'}), (r:Risk {id: 'ROM-03'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-27',
  effectiveness: 'High',
  description: 'ECSS quality framework mandates rigorous process controls',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-17'}), (r:Risk {id: 'ROE-02'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-28',
  effectiveness: 'Medium',
  description: 'ECSS thermal analysis requirements ensure margin adequacy',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-18'}), (r:Risk {id: 'SEC-06'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-29',
  effectiveness: 'High',
  description: 'NIST CSF Protect function controls reduce data exfiltration risk',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-18'}), (r:Risk {id: 'SEC-08'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-30',
  effectiveness: 'Medium',
  description: 'NIST CSF supply chain risk management extends to cloud providers',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-19'}), (r:Risk {id: 'ROR-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-31',
  effectiveness: 'Critical',
  description: 'Automated compliance tracking prevents unintentional license breaches',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-19'}), (r:Risk {id: 'RC-04'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-32',
  effectiveness: 'High',
  description: 'FCC compliance program is key pillar of multi-jurisdiction compliance',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-20'}), (r:Risk {id: 'RA-05'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-33',
  effectiveness: 'High',
  description: 'ITAR compliance system enables structured technology sharing within legal boundaries',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-21'}), (r:Risk {id: 'SEC-06'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-34',
  effectiveness: 'Medium',
  description: 'ISMS controls provide defense-in-depth for IP protection',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-21'}), (r:Risk {id: 'SEC-07'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-35',
  effectiveness: 'High',
  description: 'ISO 27001 Annex A physical security controls protect ground stations',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-21'}), (r:Risk {id: 'SEC-11'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-36',
  effectiveness: 'Medium',
  description: 'ISMS cryptographic controls address telemetry encryption requirements',
  created_at: datetime()
}]->(r);
MATCH (m:Mitigation {id: 'MIT-CY1'}), (r:Risk {id: 'RCY-01'})
CREATE (m)-[:MITIGATES {
  id: 'MIG-CY1',
  effectiveness: 'High',
  description: 'MFA + posture checks materially reduce VPN compromise likelihood',
  created_at: datetime()
}]->(r);

// =============================================================================
// CONTEXT EDGES  (kill-chain, business wiring, risk-concern)
// =============================================================================

MATCH (a:ContextNode {id: 'ATK-01'}), (b:ContextNode {id: 'EP-01'})
CREATE (a)-[:EXPLOITS {id: 'EXP-01', created_at: datetime(), success_probability: 0.6}]->(b);
MATCH (a:ContextNode {id: 'EP-01'}), (b:ContextNode {id: 'TP-PLM'})
CREATE (a)-[:COMPROMISES {id: 'CMP-01', created_at: datetime(), technique: 'Valid accounts + lateral movement'}]->(b);
MATCH (a:ContextNode {id: 'TP-PLM'}), (b:ContextNode {id: 'SC-01'})
CREATE (a)-[:EXPOSES {id: 'EXPO-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'SC-01'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:AFFECTS {id: 'AFF-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'SPN-01'}), (b:ContextNode {id: 'ATK-01'})
CREATE (a)-[:MANAGES {id: 'MNG-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'SPN-01'}), (b:ContextNode {id: 'FT-01'})
CREATE (a)-[:SEEKS {id: 'SEK-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'ATK-01'}), (b:ContextNode {id: 'TP-PLM'})
CREATE (a)-[:TARGETS {id: 'TGT-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BP-LEO'}), (b:ContextNode {id: 'BA-01'})
CREATE (a)-[:USES {id: 'USE-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BA-01'}), (b:ContextNode {id: 'FT-01'})
CREATE (a)-[:PRODUCES {id: 'PRD-01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-01'}), (b:ContextNode {id: 'TP-PLM'})
CREATE (a)-[:HOSTED_ON {id: 'HST-01', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'RCY-01'}), (b:ContextNode {id: 'EP-01'})
CREATE (a)-[:CONCERNS {id: 'CON-01', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'RCY-02'}), (b:ContextNode {id: 'TP-PLM'})
CREATE (a)-[:CONCERNS {id: 'CON-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BP-LEO'}), (b:ContextNode {id: 'BA-PROC'})
CREATE (a)-[:USES {id: 'USE-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BP-LEO'}), (b:ContextNode {id: 'BA-MFG'})
CREATE (a)-[:USES {id: 'USE-03', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BP-LEO'}), (b:ContextNode {id: 'BA-LAUNCH'})
CREATE (a)-[:USES {id: 'USE-04', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BP-LEO'}), (b:ContextNode {id: 'BA-SVC'})
CREATE (a)-[:USES {id: 'USE-05', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BA-PROC'}), (b:ContextNode {id: 'FT-COMP'})
CREATE (a)-[:PRODUCES {id: 'PRD-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BA-MFG'}), (b:ContextNode {id: 'FT-SAT'})
CREATE (a)-[:PRODUCES {id: 'PRD-03', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BA-LAUNCH'}), (b:ContextNode {id: 'FT-CONST'})
CREATE (a)-[:PRODUCES {id: 'PRD-04', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'BA-SVC'}), (b:ContextNode {id: 'FT-SVC'})
CREATE (a)-[:PRODUCES {id: 'PRD-05', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-COMP'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:HOSTED_ON {id: 'HST-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-SAT'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:HOSTED_ON {id: 'HST-03', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-CONST'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:HOSTED_ON {id: 'HST-04', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-SVC'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:HOSTED_ON {id: 'HST-05', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'ROM-01'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-ROM01', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'ROM-02'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-ROM02', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'ROM-03'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-ROM03', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'ROM-04'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-ROM04', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-02'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC02', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'ROL-01'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:CONCERNS {id: 'CON-ROL01', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'SPN-02'}), (b:ContextNode {id: 'ATK-02'})
CREATE (a)-[:MANAGES {id: 'MNG-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'SPN-02'}), (b:ContextNode {id: 'FT-CTRL'})
CREATE (a)-[:SEEKS {id: 'SEK-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'ATK-02'}), (b:ContextNode {id: 'EP-02'})
CREATE (a)-[:EXPLOITS {id: 'EXP-02', created_at: datetime(), success_probability: 0.5}]->(b);
MATCH (a:ContextNode {id: 'EP-02'}), (b:ContextNode {id: 'TP-IDP'})
CREATE (a)-[:COMPROMISES {id: 'CMP-02', created_at: datetime(), technique: 'Privileged credential abuse via MSSP access'}]->(b);
MATCH (a:ContextNode {id: 'EP-02'}), (b:ContextNode {id: 'TP-NMS'})
CREATE (a)-[:COMPROMISES {id: 'CMP-03', created_at: datetime(), technique: 'Shared identity-plane pivot Denver->Dublin; corrupt beam/capacity config'}]->(b);
MATCH (a:ContextNode {id: 'EP-02'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:COMPROMISES {id: 'CMP-04', created_at: datetime(), technique: 'Operator credential revocation; fleet-wide safe-mode trip'}]->(b);
MATCH (a:ContextNode {id: 'ATK-02'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:TARGETS {id: 'TGT-02', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'ATK-02'}), (b:ContextNode {id: 'TP-NMS'})
CREATE (a)-[:TARGETS {id: 'TGT-03', created_at: datetime()}]->(b);
MATCH (a:ContextNode {id: 'FT-CTRL'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:HOSTED_ON {id: 'HST-06', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-01'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC01', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-04'}), (b:ContextNode {id: 'TP-GW'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC04', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-05'}), (b:ContextNode {id: 'TP-NMS'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC05', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-08'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC08', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-10'}), (b:ContextNode {id: 'TP-BILL'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC10', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'SEC-14'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:CONCERNS {id: 'CON-SEC14', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'HX-01'}), (b:ContextNode {id: 'TP-AIT'})
CREATE (a)-[:CONCERNS {id: 'CON-HX01', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'HX-02'}), (b:ContextNode {id: 'EP-01'})
CREATE (a)-[:CONCERNS {id: 'CON-HX02', created_at: datetime()}]->(b);
MATCH (a:Risk {id: 'HX-03'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:CONCERNS {id: 'CON-HX03', created_at: datetime()}]->(b);

// =============================================================================
// SPICE — MITIGATION OBJECTIVES (ADDRESSES targets)
// =============================================================================

CREATE (mos11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-S1-1',
  name: 'Separate Denver/Dublin identity & privileged-access planes',
  description: 'Kill the single-plane weakness that lets one compromise trip the whole fleet.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mos12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-S1-2',
  name: 'Harden / segment MSSP privileged remote access',
  description: 'Constrain the managed-service-provider entry path.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mos13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-S1-3',
  name: 'Pre-built clean control-plane recovery capability',
  description: 'Cut crisis days by rebuilding control from trusted golden images.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mosc11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-SC1-1',
  name: 'Re-verification / clean-build capability for suspect units',
  description: 'Certify which Phase-4 units are clean after suspected tampering.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mosc12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-SC1-2',
  name: 'PLM integrity monitoring & supplier access governance',
  description: 'Detect tampering of build/test/config records early.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mosc13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-SC1-3',
  name: 'IP-segmentation of payload design data',
  description: 'Limit blast radius of design-data exfiltration.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (morg11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-RG1-1',
  name: 'Maintain accreditation enclave integrity (audited, isolated)',
  description: 'Keep the accredited environment defensibly separate.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (morg12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-RG1-2',
  name: 'Pre-cleared remediation playbook to shorten suspension',
  description: 'Reduce the duration of any accreditation freeze.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (morg13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-RG1-3',
  name: 'Diversify revenue away from 30% government concentration',
  description: 'Reduce single-segment dependency (supports TCO-03).',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mogp11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GP1-1',
  name: 'Dual-source RF components & multi-launcher strategy',
  description: 'Remove single points of geopolitical supply failure.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mogp12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GP1-2',
  name: 'Export-control compliance & scenario monitoring',
  description: 'Forecast and pre-empt policy shifts (governance posture — no purchasable control).',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mogp13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GP1-3',
  name: 'Geographic supplier diversification',
  description: 'Spread supply across jurisdictions.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mofn11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-FN1-1',
  name: 'Hold FY2028 FCF above the -$100M liquidity trigger',
  description: 'Every upstream mitigation ultimately feeds this.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mofn12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-FN1-2',
  name: 'Pre-arranged bridge financing & insurance that actually pays',
  description: 'Liquidity that survives a war/state-actor exclusion dispute.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (mofn13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-FN1-3',
  name: 'Quantified, disclosed risk in the IPO file',
  description: 'Diane\'s lever — disclosure rather than a purchasable control.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (moga11:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GA1-1',
  name: 'De-risk optical ISL to TRL 4+ ahead of the PDR gate',
  description: 'Retire the technology-maturation cost/schedule driver (RA-03/ROE-03) before it forces an overrun.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (moga12:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GA1-2',
  name: 'Hold AURORA spend within the company FCF envelope',
  description: 'Stage-gate funding + variance control so a GEO overrun does not push consolidated FCF through the -$60M IPO-bridge assumption.',
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (moga13:ContextNode {
  node_type: 'mitigation_objective',
  id: 'MO-GA1-3',
  name: 'Secure ESA/NASA co-funding continuity & partner commitment',
  description: 'Governance/relationship objective against partner withdrawal (RA-04) — no purchasable control (deliberate coverage gap).',
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// SPICE — SCENARIOS  (bestiary families × best/realistic/pessimistic)
// =============================================================================

// --- BST-S1 — NOC / Ground-Segment Compromise ---

CREATE (bsts1best:SpiceScenario {
  id: 'BST-S1-best',
  name: 'NOC / Ground-Segment Compromise (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'State-aligned actor takes the constellation offline long enough to break SLAs and shake government confidence — loss of legitimate control, not ransomware.',
  cause_type: 'security',
  ebit_impact_y1: -34.0,
  ebit_impact_y2: -5.0,
  ebit_impact_y3: -1.0,
  ebit_impact_total: -40.0,
  fcf_impact_y1: -60.0,
  fcf_impact_total: -60.0,
  operational_recovery_days: 14,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bsts1realistic:SpiceScenario {
  id: 'BST-S1-realistic',
  name: 'NOC / Ground-Segment Compromise (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'State-aligned actor takes the constellation offline long enough to break SLAs and shake government confidence — loss of legitimate control, not ransomware.',
  cause_type: 'security',
  ebit_impact_y1: -54.0,
  ebit_impact_y2: -12.0,
  ebit_impact_y3: -3.0,
  ebit_impact_total: -69.0,
  fcf_impact_y1: -79.0,
  fcf_impact_total: -79.0,
  operational_recovery_days: 21,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bsts1pessimistic:SpiceScenario {
  id: 'BST-S1-pessimistic',
  name: 'NOC / Ground-Segment Compromise (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'State-aligned actor takes the constellation offline long enough to break SLAs and shake government confidence — loss of legitimate control, not ransomware.',
  cause_type: 'security',
  ebit_impact_y1: -78.0,
  ebit_impact_y2: -24.0,
  ebit_impact_y3: -8.0,
  ebit_impact_total: -110.0,
  fcf_impact_y1: -118.0,
  fcf_impact_total: -118.0,
  operational_recovery_days: 42,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bsts1bestmitigated:SpiceScenario {
  id: 'BST-S1-best-mitigated',
  name: 'NOC / Ground-Segment Compromise (best, mitigated)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 2,
  case_type: 'best',
  status_in_family: 'draft',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Projected S1 with the two planned cyber controls funded (identity/PAM plane separation + clean control-plane recovery). Pessimistic FCF held above the -$100M liquidity trigger (-82 vs -118 base); the S1 → FN1 path is severed. Benefit vs base: FCF +22/+25/+36 (best/realistic/pessimistic).',
  cause_type: 'security',
  ebit_impact_y1: -20.0,
  ebit_impact_y2: -3.0,
  ebit_impact_total: -23.0,
  fcf_impact_y1: -38.0,
  fcf_impact_total: -38.0,
  operational_recovery_days: 6,
  financial_recovery_years: 1,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bsts1realisticmitigated:SpiceScenario {
  id: 'BST-S1-realistic-mitigated',
  name: 'NOC / Ground-Segment Compromise (realistic, mitigated)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 2,
  case_type: 'realistic',
  status_in_family: 'draft',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Projected S1 with the two planned cyber controls funded (identity/PAM plane separation + clean control-plane recovery). Pessimistic FCF held above the -$100M liquidity trigger (-82 vs -118 base); the S1 → FN1 path is severed. Benefit vs base: FCF +22/+25/+36 (best/realistic/pessimistic).',
  cause_type: 'security',
  ebit_impact_y1: -32.0,
  ebit_impact_y2: -8.0,
  ebit_impact_total: -40.0,
  fcf_impact_y1: -54.0,
  fcf_impact_total: -54.0,
  operational_recovery_days: 9,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bsts1pessimisticmitigated:SpiceScenario {
  id: 'BST-S1-pessimistic-mitigated',
  name: 'NOC / Ground-Segment Compromise (pessimistic, mitigated)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000001',
  version_number: 2,
  case_type: 'pessimistic',
  status_in_family: 'draft',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Projected S1 with the two planned cyber controls funded (identity/PAM plane separation + clean control-plane recovery). Pessimistic FCF held above the -$100M liquidity trigger (-82 vs -118 base); the S1 → FN1 path is severed. Benefit vs base: FCF +22/+25/+36 (best/realistic/pessimistic).',
  cause_type: 'security',
  ebit_impact_y1: -46.0,
  ebit_impact_y2: -14.0,
  ebit_impact_y3: -4.0,
  ebit_impact_total: -64.0,
  fcf_impact_y1: -82.0,
  fcf_impact_total: -82.0,
  operational_recovery_days: 16,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});

// --- BST-SC1 — Supplier Build-Chain Intrusion & Production Halt ---

CREATE (bstsc1best:SpiceScenario {
  id: 'BST-SC1-best',
  name: 'Supplier Build-Chain Intrusion & Production Halt (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000002',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Industrial-espionage / state actor compromises a tier-1 supplier, tampering with build integrity and exfiltrating payload IP — no outage, yet costly through schedule, integrity and IP.',
  cause_type: 'security',
  ebit_impact_y1: -16.0,
  ebit_impact_y2: -4.0,
  ebit_impact_total: -20.0,
  fcf_impact_y1: -24.0,
  fcf_impact_total: -24.0,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstsc1realistic:SpiceScenario {
  id: 'BST-SC1-realistic',
  name: 'Supplier Build-Chain Intrusion & Production Halt (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000002',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Industrial-espionage / state actor compromises a tier-1 supplier, tampering with build integrity and exfiltrating payload IP — no outage, yet costly through schedule, integrity and IP.',
  cause_type: 'security',
  ebit_impact_y1: -26.0,
  ebit_impact_y2: -10.0,
  ebit_impact_total: -36.0,
  fcf_impact_y1: -42.0,
  fcf_impact_total: -42.0,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstsc1pessimistic:SpiceScenario {
  id: 'BST-SC1-pessimistic',
  name: 'Supplier Build-Chain Intrusion & Production Halt (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000002',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Industrial-espionage / state actor compromises a tier-1 supplier, tampering with build integrity and exfiltrating payload IP — no outage, yet costly through schedule, integrity and IP.',
  cause_type: 'security',
  ebit_impact_y1: -42.0,
  ebit_impact_y2: -18.0,
  ebit_impact_total: -60.0,
  fcf_impact_y1: -70.0,
  fcf_impact_total: -70.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});

// --- BST-RG1 — Security Accreditation Suspension ---

CREATE (bstrg1best:SpiceScenario {
  id: 'BST-RG1-best',
  name: 'Security Accreditation Suspension (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000003',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Accrediting authority suspends the security accreditation that gates Government & Defense task orders — contractual from day one, no outage.',
  cause_type: 'other',
  ebit_impact_y1: -18.0,
  ebit_impact_y2: -6.0,
  ebit_impact_total: -24.0,
  fcf_impact_y1: -28.0,
  fcf_impact_total: -28.0,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstrg1realistic:SpiceScenario {
  id: 'BST-RG1-realistic',
  name: 'Security Accreditation Suspension (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000003',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Accrediting authority suspends the security accreditation that gates Government & Defense task orders — contractual from day one, no outage.',
  cause_type: 'other',
  ebit_impact_y1: -34.0,
  ebit_impact_y2: -12.0,
  ebit_impact_y3: -2.0,
  ebit_impact_total: -48.0,
  fcf_impact_y1: -55.0,
  fcf_impact_total: -55.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstrg1pessimistic:SpiceScenario {
  id: 'BST-RG1-pessimistic',
  name: 'Security Accreditation Suspension (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000003',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Accrediting authority suspends the security accreditation that gates Government & Defense task orders — contractual from day one, no outage.',
  cause_type: 'other',
  ebit_impact_y1: -58.0,
  ebit_impact_y2: -18.0,
  ebit_impact_y3: -4.0,
  ebit_impact_total: -80.0,
  fcf_impact_y1: -90.0,
  fcf_impact_total: -90.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});

// --- BST-GP1 — Export-Control Tightening & Launch Disruption ---

CREATE (bstgp1best:SpiceScenario {
  id: 'BST-GP1-best',
  name: 'Export-Control Tightening & Launch Disruption (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000004',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Shift in the export-control / sanctions environment constrains RF supply and launch access — slows deployment and raises cost of capital, with no attacker.',
  cause_type: 'geopolitical',
  ebit_impact_y1: -9.0,
  ebit_impact_y2: -3.0,
  ebit_impact_total: -12.0,
  fcf_impact_y1: -14.0,
  fcf_impact_total: -14.0,
  financial_recovery_years: 1,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstgp1realistic:SpiceScenario {
  id: 'BST-GP1-realistic',
  name: 'Export-Control Tightening & Launch Disruption (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000004',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Shift in the export-control / sanctions environment constrains RF supply and launch access — slows deployment and raises cost of capital, with no attacker.',
  cause_type: 'geopolitical',
  ebit_impact_y1: -22.0,
  ebit_impact_y2: -8.0,
  ebit_impact_total: -30.0,
  fcf_impact_y1: -34.0,
  fcf_impact_total: -34.0,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstgp1pessimistic:SpiceScenario {
  id: 'BST-GP1-pessimistic',
  name: 'Export-Control Tightening & Launch Disruption (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000004',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'Shift in the export-control / sanctions environment constrains RF supply and launch access — slows deployment and raises cost of capital, with no attacker.',
  cause_type: 'geopolitical',
  ebit_impact_y1: -40.0,
  ebit_impact_y2: -15.0,
  ebit_impact_total: -55.0,
  fcf_impact_y1: -62.0,
  fcf_impact_total: -62.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});

// --- BST-FN1 — IPO Window Collapse / Distressed Raise ---

CREATE (bstfn1best:SpiceScenario {
  id: 'BST-FN1-best',
  name: 'IPO Window Collapse / Distressed Raise (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000005',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The convergence node: any upstream family that pushes FY2028 below plan, plus a closing market window, forces an emergency dilutive raise.',
  cause_type: 'other',
  hypothesis: 'Impact is borne via cash / cost-of-capital and the IPO valuation multiple, not operating EBIT; it is quantified as an FCF breach and dilution rather than an EBIT trajectory, so ebit_impact is set to 0 by design.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -60.0,
  fcf_impact_total: -60.0,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstfn1realistic:SpiceScenario {
  id: 'BST-FN1-realistic',
  name: 'IPO Window Collapse / Distressed Raise (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000005',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The convergence node: any upstream family that pushes FY2028 below plan, plus a closing market window, forces an emergency dilutive raise.',
  cause_type: 'other',
  hypothesis: 'Impact is borne via cash / cost-of-capital and the IPO valuation multiple, not operating EBIT; it is quantified as an FCF breach and dilution rather than an EBIT trajectory, so ebit_impact is set to 0 by design.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -100.0,
  fcf_impact_total: -100.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstfn1pessimistic:SpiceScenario {
  id: 'BST-FN1-pessimistic',
  name: 'IPO Window Collapse / Distressed Raise (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000005',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The convergence node: any upstream family that pushes FY2028 below plan, plus a closing market window, forces an emergency dilutive raise.',
  cause_type: 'other',
  hypothesis: 'Impact is borne via cash / cost-of-capital and the IPO valuation multiple, not operating EBIT; it is quantified as an FCF breach and dilution rather than an EBIT trajectory, so ebit_impact is set to 0 by design.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -140.0,
  fcf_impact_total: -140.0,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});

// --- BST-GA1 — AURORA-GEO Development Overrun & Co-Funding Shock ---

CREATE (bstga1best:SpiceScenario {
  id: 'BST-GA1-best',
  name: 'AURORA-GEO Development Overrun & Co-Funding Shock (best)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000006',
  version_number: 1,
  case_type: 'best',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The GEO-perimeter case: optical-ISL maturation difficulty drives a Phase A/B-to-C development overrun, compounded in the tail by an ESA/NASA co-funding/partner shock — draining ODT\'s cash exactly while FCF discipline gates the IPO. The second perimeter reaching the IPO story.',
  cause_type: 'other',
  hypothesis: 'AURORA-GEO is pre-revenue, so the impact is borne via FCF (incremental cash burn on the BP-GEO perimeter), not operating EBIT — ebit_impact is set to 0 by design, consistent with BP-GEO ebit_baseline 0 and the capitalise treatment of AURORA dev-spend (CAN-01, decided 2026-06-26). Cases consolidate with the canon FY2028 plan FCF of -40: best -46, realistic -52, pessimistic -64 — the pessimistic case alone breaches the -60 IPO-bridge assumption. operational_recovery_days encodes the PDR-gate schedule slip.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -6.0,
  fcf_impact_total: -6.0,
  operational_recovery_days: 90,
  financial_recovery_years: 1,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstga1realistic:SpiceScenario {
  id: 'BST-GA1-realistic',
  name: 'AURORA-GEO Development Overrun & Co-Funding Shock (realistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000006',
  version_number: 1,
  case_type: 'realistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The GEO-perimeter case: optical-ISL maturation difficulty drives a Phase A/B-to-C development overrun, compounded in the tail by an ESA/NASA co-funding/partner shock — draining ODT\'s cash exactly while FCF discipline gates the IPO. The second perimeter reaching the IPO story.',
  cause_type: 'other',
  hypothesis: 'AURORA-GEO is pre-revenue, so the impact is borne via FCF (incremental cash burn on the BP-GEO perimeter), not operating EBIT — ebit_impact is set to 0 by design, consistent with BP-GEO ebit_baseline 0 and the capitalise treatment of AURORA dev-spend (CAN-01, decided 2026-06-26). Cases consolidate with the canon FY2028 plan FCF of -40: best -46, realistic -52, pessimistic -64 — the pessimistic case alone breaches the -60 IPO-bridge assumption. operational_recovery_days encodes the PDR-gate schedule slip.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -12.0,
  fcf_impact_total: -12.0,
  operational_recovery_days: 180,
  financial_recovery_years: 2,
  created_at: datetime(),
  updated_at: datetime()
});
CREATE (bstga1pessimistic:SpiceScenario {
  id: 'BST-GA1-pessimistic',
  name: 'AURORA-GEO Development Overrun & Co-Funding Shock (pessimistic)',
  scenario_family_id: 'a1e6b2c0-1f47-4c8e-9b21-000000000006',
  version_number: 1,
  case_type: 'pessimistic',
  status_in_family: 'current',
  assessment_date: date('2028-02-15'),
  validated: 'business',
  cause_description: 'The GEO-perimeter case: optical-ISL maturation difficulty drives a Phase A/B-to-C development overrun, compounded in the tail by an ESA/NASA co-funding/partner shock — draining ODT\'s cash exactly while FCF discipline gates the IPO. The second perimeter reaching the IPO story.',
  cause_type: 'other',
  hypothesis: 'AURORA-GEO is pre-revenue, so the impact is borne via FCF (incremental cash burn on the BP-GEO perimeter), not operating EBIT — ebit_impact is set to 0 by design, consistent with BP-GEO ebit_baseline 0 and the capitalise treatment of AURORA dev-spend (CAN-01, decided 2026-06-26). Cases consolidate with the canon FY2028 plan FCF of -40: best -46, realistic -52, pessimistic -64 — the pessimistic case alone breaches the -60 IPO-bridge assumption. operational_recovery_days encodes the PDR-gate schedule slip.',
  ebit_impact_y1: 0.0,
  ebit_impact_total: 0.0,
  fcf_impact_y1: -24.0,
  fcf_impact_total: -24.0,
  operational_recovery_days: 365,
  financial_recovery_years: 3,
  created_at: datetime(),
  updated_at: datetime()
});

// =============================================================================
// SPICE EDGES  (ILLUSTRATES / CAUSED_BY / ASSESSED_AGAINST / OCCURS_AT)
// =============================================================================

MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Risk {id: 'RH-04'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-S1-RH-04', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Risk {id: 'SEC-01'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-S1-SEC-01', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Risk {id: 'SEC-08'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-S1-SEC-08', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-S1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:ContextNode {id: 'TP-NOC'})
CREATE (a)-[:OCCURS_AT {id: 'OCC-BST-S1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:Risk {id: 'RH-02'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-SC1-RH-02', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:Risk {id: 'SEC-02'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-SC1-SEC-02', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:Risk {id: 'ROE-01'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-SC1-ROE-01', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-SC1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:ContextNode {id: 'TP-PLM'})
CREATE (a)-[:OCCURS_AT {id: 'OCC-BST-SC1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:Risk {id: 'RH-05'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-RG1-RH-05', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:Risk {id: 'SEC-04'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-RG1-SEC-04', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-RG1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:Risk {id: 'RH-04'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-GP1-RH-04', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:Risk {id: 'RA-02'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-GP1-RA-02', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:Risk {id: 'ROM-01'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-GP1-ROM-01', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:Risk {id: 'ROL-01'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-GP1-ROL-01', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-GP1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:Risk {id: 'RC-01'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-FN1-RC-01', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:Risk {id: 'RC-02'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-FN1-RC-02', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:Risk {id: 'RC-03'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-FN1-RC-03', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:ContextNode {id: 'BP-LEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-FN1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Risk {id: 'RA-02'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-GA1-RA-02', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Risk {id: 'RA-04'})
CREATE (a)-[:ILLUSTRATES {id: 'ILL-BST-GA1-RA-04', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Risk {id: 'ROE-03'})
CREATE (a)-[:CAUSED_BY {id: 'CBY-BST-GA1-ROE-03', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:ContextNode {id: 'BP-GEO'})
CREATE (a)-[:ASSESSED_AGAINST {id: 'ASG-BST-GA1', created_at: datetime()}]->(b);

// =============================================================================
// SPICE EDGES  (ADDRESSES / MITIGATED_BY — realistic case)
// =============================================================================

MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:ContextNode {id: 'MO-S1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-S1-MO-S1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:ContextNode {id: 'MO-S1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-S1-MO-S1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:ContextNode {id: 'MO-S1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-S1-MO-S1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Mitigation {id: 'SM-CYBER-INS'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-S1-SM-CYBER-INS', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Mitigation {id: 'SM-CTRL-RECOVERY'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-S1-SM-CTRL-RECOVERY', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-S1-realistic'}), (b:Mitigation {id: 'SM-IDENTITY-SPLIT'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-S1-SM-IDENTITY-SPLIT', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:ContextNode {id: 'MO-SC1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-SC1-MO-SC1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:ContextNode {id: 'MO-SC1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-SC1-MO-SC1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:ContextNode {id: 'MO-SC1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-SC1-MO-SC1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:Mitigation {id: 'SM-CLEAN-BUILD'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-SC1-SM-CLEAN-BUILD', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-SC1-realistic'}), (b:Mitigation {id: 'SM-PLM-INTEGRITY'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-SC1-SM-PLM-INTEGRITY', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:ContextNode {id: 'MO-RG1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-RG1-MO-RG1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:ContextNode {id: 'MO-RG1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-RG1-MO-RG1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:ContextNode {id: 'MO-RG1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-RG1-MO-RG1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:Mitigation {id: 'SM-ACCRED-ENCLAVE'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-RG1-SM-ACCRED-ENCLAVE', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-RG1-realistic'}), (b:Mitigation {id: 'SM-REVENUE-DIVERSIFY'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-RG1-SM-REVENUE-DIVERSIFY', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:ContextNode {id: 'MO-GP1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GP1-MO-GP1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:ContextNode {id: 'MO-GP1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GP1-MO-GP1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:ContextNode {id: 'MO-GP1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GP1-MO-GP1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GP1-realistic'}), (b:Mitigation {id: 'SM-DUAL-SOURCE'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-GP1-SM-DUAL-SOURCE', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:ContextNode {id: 'MO-FN1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-FN1-MO-FN1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:ContextNode {id: 'MO-FN1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-FN1-MO-FN1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:ContextNode {id: 'MO-FN1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-FN1-MO-FN1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:Mitigation {id: 'SM-BRIDGE-FACILITY'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-FN1-SM-BRIDGE-FACILITY', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-FN1-realistic'}), (b:Mitigation {id: 'SM-CYBER-INS'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-FN1-SM-CYBER-INS', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:ContextNode {id: 'MO-GA1-1'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GA1-MO-GA1-1', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:ContextNode {id: 'MO-GA1-2'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GA1-MO-GA1-2', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:ContextNode {id: 'MO-GA1-3'})
CREATE (a)-[:ADDRESSES {id: 'ADR-BST-GA1-MO-GA1-3', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Mitigation {id: 'SM-AURORA-DERISK'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-GA1-SM-AURORA-DERISK', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Mitigation {id: 'SM-AURORA-VARIANCE'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-GA1-SM-AURORA-VARIANCE', created_at: datetime()}]->(b);
MATCH (a:SpiceScenario {id: 'BST-GA1-realistic'}), (b:Mitigation {id: 'SM-BRIDGE-FACILITY'})
CREATE (a)-[:MITIGATED_BY {id: 'MBY-BST-GA1-SM-BRIDGE-FACILITY', created_at: datetime()}]->(b);

// =============================================================================
// SPICE EDGES  (FULFILS — mitigation → objective; re-homed CR-01)
// =============================================================================

MATCH (a:Mitigation {id: 'SM-CYBER-INS'}), (b:ContextNode {id: 'MO-FN1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-CYBER-INS-MO-FN1-2', created_at: datetime(), contribution_weight: 80.0}]->(b);
MATCH (a:Mitigation {id: 'SM-CTRL-RECOVERY'}), (b:ContextNode {id: 'MO-S1-3'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-CTRL-RECOVERY-MO-S1-3', created_at: datetime(), contribution_weight: 90.0}]->(b);
MATCH (a:Mitigation {id: 'SM-IDENTITY-SPLIT'}), (b:ContextNode {id: 'MO-S1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-IDENTITY-SPLIT-MO-S1-1', created_at: datetime(), contribution_weight: 100.0}]->(b);
MATCH (a:Mitigation {id: 'SM-IDENTITY-SPLIT'}), (b:ContextNode {id: 'MO-S1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-IDENTITY-SPLIT-MO-S1-2', created_at: datetime(), contribution_weight: 40.0}]->(b);
MATCH (a:Mitigation {id: 'SM-CLEAN-BUILD'}), (b:ContextNode {id: 'MO-SC1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-CLEAN-BUILD-MO-SC1-1', created_at: datetime(), contribution_weight: 90.0}]->(b);
MATCH (a:Mitigation {id: 'SM-PLM-INTEGRITY'}), (b:ContextNode {id: 'MO-SC1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-PLM-INTEGRITY-MO-SC1-2', created_at: datetime(), contribution_weight: 80.0}]->(b);
MATCH (a:Mitigation {id: 'SM-PLM-INTEGRITY'}), (b:ContextNode {id: 'MO-SC1-3'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-PLM-INTEGRITY-MO-SC1-3', created_at: datetime(), contribution_weight: 50.0}]->(b);
MATCH (a:Mitigation {id: 'SM-ACCRED-ENCLAVE'}), (b:ContextNode {id: 'MO-RG1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-ACCRED-ENCLAVE-MO-RG1-1', created_at: datetime(), contribution_weight: 70.0}]->(b);
MATCH (a:Mitigation {id: 'SM-ACCRED-ENCLAVE'}), (b:ContextNode {id: 'MO-RG1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-ACCRED-ENCLAVE-MO-RG1-2', created_at: datetime(), contribution_weight: 60.0}]->(b);
MATCH (a:Mitigation {id: 'SM-DUAL-SOURCE'}), (b:ContextNode {id: 'MO-GP1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-DUAL-SOURCE-MO-GP1-1', created_at: datetime(), contribution_weight: 80.0}]->(b);
MATCH (a:Mitigation {id: 'SM-DUAL-SOURCE'}), (b:ContextNode {id: 'MO-GP1-3'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-DUAL-SOURCE-MO-GP1-3', created_at: datetime(), contribution_weight: 50.0}]->(b);
MATCH (a:Mitigation {id: 'SM-BRIDGE-FACILITY'}), (b:ContextNode {id: 'MO-FN1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-BRIDGE-FACILITY-MO-FN1-1', created_at: datetime(), contribution_weight: 70.0}]->(b);
MATCH (a:Mitigation {id: 'SM-BRIDGE-FACILITY'}), (b:ContextNode {id: 'MO-FN1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-BRIDGE-FACILITY-MO-FN1-2', created_at: datetime(), contribution_weight: 40.0}]->(b);
MATCH (a:Mitigation {id: 'SM-REVENUE-DIVERSIFY'}), (b:ContextNode {id: 'MO-RG1-3'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-REVENUE-DIVERSIFY-MO-RG1-3', created_at: datetime(), contribution_weight: 60.0}]->(b);
MATCH (a:Mitigation {id: 'SM-REVENUE-DIVERSIFY'}), (b:ContextNode {id: 'MO-FN1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-REVENUE-DIVERSIFY-MO-FN1-1', created_at: datetime(), contribution_weight: 20.0}]->(b);
MATCH (a:Mitigation {id: 'SM-AURORA-DERISK'}), (b:ContextNode {id: 'MO-GA1-1'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-AURORA-DERISK-MO-GA1-1', created_at: datetime(), contribution_weight: 80.0}]->(b);
MATCH (a:Mitigation {id: 'SM-AURORA-VARIANCE'}), (b:ContextNode {id: 'MO-GA1-2'})
CREATE (a)-[:FULFILS {id: 'FUL-SM-AURORA-VARIANCE-MO-GA1-2', created_at: datetime(), contribution_weight: 75.0}]->(b);

// =============================================================================
// BEARS  (owner → risk; consequence-bearer, one per risk)
// =============================================================================

MATCH (o:ContextNode {id: 'OWN-CEO'}), (r:Risk {id: 'RC-01'})
CREATE (o)-[:BEARS {id: 'BEARS-RC-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (r:Risk {id: 'RC-02'})
CREATE (o)-[:BEARS {id: 'BEARS-RC-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CEO'}), (r:Risk {id: 'RC-03'})
CREATE (o)-[:BEARS {id: 'BEARS-RC-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (r:Risk {id: 'RC-04'})
CREATE (o)-[:BEARS {id: 'BEARS-RC-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CEO'}), (r:Risk {id: 'RC-05'})
CREATE (o)-[:BEARS {id: 'BEARS-RC-05', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPLO'}), (r:Risk {id: 'RH-01'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPENG'}), (r:Risk {id: 'RH-02'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (r:Risk {id: 'RH-03'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CTO'}), (r:Risk {id: 'RH-04'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (r:Risk {id: 'RH-05'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-05', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPGO'}), (r:Risk {id: 'RH-06'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-06', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (r:Risk {id: 'RH-07'})
CREATE (o)-[:BEARS {id: 'BEARS-RH-07', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-APD'}), (r:Risk {id: 'RA-01'})
CREATE (o)-[:BEARS {id: 'BEARS-RA-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (r:Risk {id: 'RA-02'})
CREATE (o)-[:BEARS {id: 'BEARS-RA-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CTO'}), (r:Risk {id: 'RA-03'})
CREATE (o)-[:BEARS {id: 'BEARS-RA-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-APD'}), (r:Risk {id: 'RA-04'})
CREATE (o)-[:BEARS {id: 'BEARS-RA-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (r:Risk {id: 'RA-05'})
CREATE (o)-[:BEARS {id: 'BEARS-RA-05', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-LSA'}), (r:Risk {id: 'ROE-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROE-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-TSL'}), (r:Risk {id: 'ROE-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROE-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-ACE'}), (r:Risk {id: 'ROE-03'})
CREATE (o)-[:BEARS {id: 'BEARS-ROE-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPMSC'}), (r:Risk {id: 'ROM-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROM-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPMSC'}), (r:Risk {id: 'ROM-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROM-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-QM'}), (r:Risk {id: 'ROM-03'})
CREATE (o)-[:BEARS {id: 'BEARS-ROM-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-PD'}), (r:Risk {id: 'ROM-04'})
CREATE (o)-[:BEARS {id: 'BEARS-ROM-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPLO'}), (r:Risk {id: 'ROL-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROL-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPLO'}), (r:Risk {id: 'ROL-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROL-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (r:Risk {id: 'ROC-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROC-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (r:Risk {id: 'ROC-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROC-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (r:Risk {id: 'ROF-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROF-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (r:Risk {id: 'ROF-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROF-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-HRD'}), (r:Risk {id: 'ROH-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROH-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-HRD'}), (r:Risk {id: 'ROH-02'})
CREATE (o)-[:BEARS {id: 'BEARS-ROH-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (r:Risk {id: 'ROR-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROR-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-ITD'}), (r:Risk {id: 'ROI-01'})
CREATE (o)-[:BEARS {id: 'BEARS-ROI-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-01'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-02'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-03'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-04'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-05'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-05', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-06'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-06', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-07'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-07', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-08'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-08', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-09'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-09', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-10'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-10', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-11'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-11', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-12'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-12', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-13'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-13', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'SEC-14'})
CREATE (o)-[:BEARS {id: 'BEARS-SEC-14', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'RCY-01'})
CREATE (o)-[:BEARS {id: 'BEARS-RCY-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'RCY-02'})
CREATE (o)-[:BEARS {id: 'BEARS-RCY-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-QM'}), (r:Risk {id: 'HX-01'})
CREATE (o)-[:BEARS {id: 'BEARS-HX-01', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (r:Risk {id: 'HX-02'})
CREATE (o)-[:BEARS {id: 'BEARS-HX-02', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPGO'}), (r:Risk {id: 'HX-03'})
CREATE (o)-[:BEARS {id: 'BEARS-HX-03', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPLO'}), (r:Risk {id: 'HX-04'})
CREATE (o)-[:BEARS {id: 'BEARS-HX-04', created_at: datetime()}]->(r);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (r:Risk {id: 'HX-05'})
CREATE (o)-[:BEARS {id: 'BEARS-HX-05', created_at: datetime()}]->(r);

// =============================================================================
// STEWARDS  (owner → mitigation; never a risk)
// =============================================================================

MATCH (o:ContextNode {id: 'OWN-VPLO'}), (m:Mitigation {id: 'MIT-01'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-01', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPMSC'}), (m:Mitigation {id: 'MIT-02'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-02', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-HRD'}), (m:Mitigation {id: 'MIT-03'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-03', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-04'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-04', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-05'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-05', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (m:Mitigation {id: 'MIT-06'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-06', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPLO'}), (m:Mitigation {id: 'MIT-07'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-07', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-LSA'}), (m:Mitigation {id: 'MIT-08'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-08', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-ACE'}), (m:Mitigation {id: 'MIT-09'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-09', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-10'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-10', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPENG'}), (m:Mitigation {id: 'MIT-11'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-11', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-12'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-12', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-13'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-13', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (m:Mitigation {id: 'MIT-14'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-14', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-ITD'}), (m:Mitigation {id: 'MIT-15'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-15', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-16'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-16', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (m:Mitigation {id: 'MIT-17'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-17', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-18'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-18', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (m:Mitigation {id: 'MIT-19'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-19', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (m:Mitigation {id: 'MIT-20'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-20', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-21'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-21', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'MIT-CY1'})
CREATE (o)-[:STEWARDS {id: 'STW-MIT-CY1', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (m:Mitigation {id: 'SM-CYBER-INS'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-CYBER-INS', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'SM-CTRL-RECOVERY'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-CTRL-RECOVERY', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'SM-IDENTITY-SPLIT'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-IDENTITY-SPLIT', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPMSC'}), (m:Mitigation {id: 'SM-CLEAN-BUILD'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-CLEAN-BUILD', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CISO'}), (m:Mitigation {id: 'SM-PLM-INTEGRITY'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-PLM-INTEGRITY', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPCQ'}), (m:Mitigation {id: 'SM-ACCRED-ENCLAVE'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-ACCRED-ENCLAVE', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPMSC'}), (m:Mitigation {id: 'SM-DUAL-SOURCE'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-DUAL-SOURCE', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (m:Mitigation {id: 'SM-BRIDGE-FACILITY'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-BRIDGE-FACILITY', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-VPSALES'}), (m:Mitigation {id: 'SM-REVENUE-DIVERSIFY'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-REVENUE-DIVERSIFY', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-ACE'}), (m:Mitigation {id: 'SM-AURORA-DERISK'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-AURORA-DERISK', created_at: datetime()}]->(m);
MATCH (o:ContextNode {id: 'OWN-CFO'}), (m:Mitigation {id: 'SM-AURORA-VARIANCE'})
CREATE (o)-[:STEWARDS {id: 'STW-SM-AURORA-VARIANCE', created_at: datetime()}]->(m);


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
