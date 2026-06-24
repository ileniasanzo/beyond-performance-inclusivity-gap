-- Script Identifier: SQL_STAG_MONTHLY
-- Description: Groups the timeline into a recurring 1-to-12 monthly continuum to isolate cyclical demand behavior patterns.
-- Target: Generates the 48-row dataset stored within the staging_monthly_seasonality cloud mart.

SELECT 
  EXTRACT(MONTH FROM date_axis) AS month_number,
  geo_iso_code AS country,
  operational_paradigm_world AS world,
  ROUND(AVG(normalized_index_value), 2) AS avg_seasonal_velocity,
  COUNT(*) AS sample_size_observed
FROM 
  `bp-trends-analysis.market_analysis.bp_wellness_master`
GROUP BY 
  month_number, 
  country, 
  world
ORDER BY 
  country ASC, 
  world ASC, 
  month_number ASC;
