-- ============================================================
-- Creates and loads the whoop_cycles table from Whoop's
-- physiological_cycles.csv export.
-- Run after 03_create_activities_short.sql
-- Update the file path in the COPY command to match your local
-- path before running.
-- Note: raw Whoop data CSV should be added to .gitignore and
-- never committed to the repository (personal health data).
-- ============================================================
 
DROP TABLE IF EXISTS whoop_cycles;
 
CREATE TABLE whoop_cycles (
    cycle_start_time        TIMESTAMP,
    cycle_end_time          TIMESTAMP,
    cycle_timezone          TEXT,
    recovery_score          NUMERIC,        -- percentage 0-100
    resting_heart_rate      NUMERIC,        -- bpm
    hrv                     NUMERIC,        -- heart rate variability in ms
    skin_temp_celsius       NUMERIC,
    blood_oxygen_pct        NUMERIC,
    day_strain              NUMERIC,        -- whoop strain score 0-21
    energy_burned_cal       NUMERIC,
    max_hr                  NUMERIC,        -- bpm
    average_hr              NUMERIC,        -- bpm
    sleep_onset             TIMESTAMP,
    wake_onset              TIMESTAMP,
    sleep_performance_pct   NUMERIC,
    respiratory_rate        NUMERIC,        -- breaths per minute
    asleep_duration_min     NUMERIC,
    in_bed_duration_min     NUMERIC,
    light_sleep_min         NUMERIC,
    deep_sleep_min          NUMERIC,
    rem_sleep_min           NUMERIC,
    awake_duration_min      NUMERIC,
    sleep_need_min          NUMERIC,
    sleep_debt_min          NUMERIC,
    sleep_efficiency_pct    NUMERIC,
    sleep_consistency_pct   NUMERIC
);
 
-- Update the path below to match your local Whoop export location
-- Windows example: 'E:/DataAnalysis/StravaAnalysis/data/whoopdata/physiological_cycles.csv'
-- Mac example:     '/Users/will/DataAnalyticsPractice/StravaAnalysis300626/StravaDataJun26/physiological_cycles.csv'
COPY whoop_cycles FROM 'YOUR_PATH_HERE/physiological_cycles.csv' WITH (FORMAT csv, HEADER true);
 
-- Sanity check
SELECT
    MIN(cycle_start_time)                   AS earliest_cycle,
    MAX(cycle_start_time)                   AS latest_cycle,
    COUNT(*)                                AS total_cycles,
    ROUND(AVG(resting_heart_rate), 1)       AS avg_rhr,
    ROUND(AVG(hrv), 1)                      AS avg_hrv,
    ROUND(AVG(recovery_score), 1)           AS avg_recovery_score,
    COUNT(*) FILTER (WHERE resting_heart_rate IS NOT NULL) AS cycles_with_rhr
FROM whoop_cycles;