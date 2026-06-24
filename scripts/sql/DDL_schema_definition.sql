CREATE OR REPLACE TABLE `bp-trends-analysis.market_analysis.bp_wellness_master`
(
  date_axis DATE NOT NULL,
  geo_iso_code STRING(3) NOT NULL,
  search_keyword_string STRING NOT NULL,
  normalized_index_value FLOAT64 NOT NULL,
  strategic_pillar_classification STRING NOT NULL,
  operational_paradigm_world STRING NOT NULL
)
OPTIONS(
  description='Unified analytical master data mart containing 1,464 long-format records mapping World A and World B post-pandemic wellness search indexes across Italy and the USA (2021-2026).'
);
