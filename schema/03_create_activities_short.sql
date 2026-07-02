-- ============================================================
-- Creates activities_short: a leaner working table containing
-- only the metrics relevant for analysis, with times converted
-- to minutes, distance converted to km, and an activity_category
-- column added to group sport types into clean categories.
-- Run after 02_load_data.sql
-- ============================================================
 
DROP TABLE IF EXISTS activities_short;
 
CREATE TABLE activities_short AS
SELECT
    activity_id,
    activity_name,
    activity_date,
    activity_type,
    activity_gear,
    ROUND(moving_time  / 60.0, 2)  AS moving_time_mins,
    ROUND(elapsed_time / 60.0, 2)  AS elapsed_time_mins,
    ROUND(distance / 1000.0,   2)  AS distance_km,
    max_heart_rate,
    average_heart_rate,
    average_watts,
    calories,
    relative_effort,
    activity_description
FROM activities;
 
-- Add and populate the activity_category column
ALTER TABLE activities_short ADD COLUMN activity_category TEXT;
 
UPDATE activities_short SET activity_category = CASE
    WHEN activity_type = 'Run'                     THEN 'Run'
    WHEN activity_type IN ('Virtual Ride', 'Ride') THEN 'Cycle'
    WHEN activity_type = 'Football (Soccer)'       THEN 'Football'
    WHEN activity_type = 'Walk'                    THEN 'Walk'
    WHEN activity_type = 'Rowing'                  THEN 'Rowing'
    WHEN activity_type = 'Workout'                 THEN 'Squash'
    ELSE 'Other'
END;
 
-- Sanity check
SELECT activity_category, COUNT(*) AS count
FROM activities_short
GROUP BY activity_category
ORDER BY count DESC;