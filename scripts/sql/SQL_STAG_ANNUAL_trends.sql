-- Script Identifier: SQL_STAG_ANNUAL
-- Description: Extracts macro-level temporal aggregates to compute annual interest averages across World A and World B. 
-- Target: Generates the 12-row dataset stored within the staging_annual_trends cloud mart.

SELECT 
  geo_iso_code,
  EXTRACT(YEAR FROM date_axis) AS calendar_year,
  COUNT(*) AS total_records,
  ROUND(AVG(normalized_index_value), 2) AS aggregate_index_mean
FROM 
  `bp-trends-analysis.market_analysis.bp_wellness_master`
GROUP BY 
  geo_iso_code, 
  calendar_year
ORDER BY 
  geo_iso_code ASC, 
  calendar_year ASC;
