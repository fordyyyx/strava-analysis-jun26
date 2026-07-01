-- ============================================================
-- Load data from CSV exports (auto-generated, positions verified against header)
-- Run after 01_create_tables.sql
--   psql -d strava -f 01_create_tables.sql
--   psql -d strava -f 02_load_data.sql
-- Adjust file paths below if you're not running psql from the export folder.
-- ============================================================

-- ---- activities.csv ----
-- Loaded into a 103-column staging table first because the CSV has
-- duplicate header names, which \copy can't target directly.

DROP TABLE IF EXISTS activities_staging;

CREATE TABLE activities_staging (
    col1 TEXT, col2 TEXT, col3 TEXT, col4 TEXT, col5 TEXT, col6 TEXT, col7 TEXT,
    col8 TEXT, col9 TEXT, col10 TEXT, col11 TEXT, col12 TEXT, col13 TEXT, col14 TEXT,
    col15 TEXT, col16 TEXT, col17 TEXT, col18 TEXT, col19 TEXT, col20 TEXT, col21 TEXT,
    col22 TEXT, col23 TEXT, col24 TEXT, col25 TEXT, col26 TEXT, col27 TEXT, col28 TEXT,
    col29 TEXT, col30 TEXT, col31 TEXT, col32 TEXT, col33 TEXT, col34 TEXT, col35 TEXT,
    col36 TEXT, col37 TEXT, col38 TEXT, col39 TEXT, col40 TEXT, col41 TEXT, col42 TEXT,
    col43 TEXT, col44 TEXT, col45 TEXT, col46 TEXT, col47 TEXT, col48 TEXT, col49 TEXT,
    col50 TEXT, col51 TEXT, col52 TEXT, col53 TEXT, col54 TEXT, col55 TEXT, col56 TEXT,
    col57 TEXT, col58 TEXT, col59 TEXT, col60 TEXT, col61 TEXT, col62 TEXT, col63 TEXT,
    col64 TEXT, col65 TEXT, col66 TEXT, col67 TEXT, col68 TEXT, col69 TEXT, col70 TEXT,
    col71 TEXT, col72 TEXT, col73 TEXT, col74 TEXT, col75 TEXT, col76 TEXT, col77 TEXT,
    col78 TEXT, col79 TEXT, col80 TEXT, col81 TEXT, col82 TEXT, col83 TEXT, col84 TEXT,
    col85 TEXT, col86 TEXT, col87 TEXT, col88 TEXT, col89 TEXT, col90 TEXT, col91 TEXT,
    col92 TEXT, col93 TEXT, col94 TEXT, col95 TEXT, col96 TEXT, col97 TEXT, col98 TEXT,
    col99 TEXT, col100 TEXT, col101 TEXT, col102 TEXT, col103 TEXT
);

\copy activities_staging FROM '/Users/will/DataAnalyticsPractice/StravaAnalysis300626/StravaDataJun26/activities.csv' WITH (FORMAT csv, HEADER true)

INSERT INTO activities (
    activity_id,
    activity_date,
    activity_name,
    activity_type,
    activity_description,
    elapsed_time_legacy,
    distance_legacy,
    max_heart_rate_legacy,
    relative_effort_legacy,
    commute_legacy,
    activity_private_note,
    activity_gear,
    filename,
    athlete_weight,
    bike_weight,
    elapsed_time,
    moving_time,
    distance,
    max_speed,
    average_speed,
    elevation_gain,
    elevation_loss,
    elevation_low,
    elevation_high,
    max_grade,
    average_grade,
    average_positive_grade,
    average_negative_grade,
    max_cadence,
    average_cadence,
    max_heart_rate,
    average_heart_rate,
    max_watts,
    average_watts,
    calories,
    max_temperature,
    average_temperature,
    relative_effort,
    total_work,
    number_of_runs,
    uphill_time,
    downhill_time,
    other_time,
    perceived_exertion,
    type,
    start_time,
    weighted_average_power,
    power_count,
    prefer_perceived_exertion,
    perceived_relative_effort,
    commute,
    total_weight_lifted,
    from_upload,
    grade_adjusted_distance,
    weather_observation_time,
    weather_condition,
    weather_temperature,
    apparent_temperature,
    dewpoint,
    humidity,
    weather_pressure,
    wind_speed,
    wind_gust,
    wind_bearing,
    precipitation_intensity,
    sunrise_time,
    sunset_time,
    moon_phase,
    bike,
    gear,
    precipitation_probability,
    precipitation_type,
    cloud_cover,
    weather_visibility,
    uv_index,
    weather_ozone,
    jump_count,
    total_grit,
    average_flow,
    flagged,
    average_elapsed_speed,
    dirt_distance,
    newly_explored_distance,
    newly_explored_dirt_distance,
    activity_count,
    total_steps,
    carbon_saved,
    pool_length,
    training_load,
    intensity,
    average_grade_adjusted_pace,
    timer_time,
    total_cycles,
    recovery,
    with_pet,
    competition,
    long_run,
    for_a_cause,
    with_kid,
    downhill_distance,
    total_sets,
    total_reps,
    media
)
SELECT
    NULLIF(col1,'')::BIGINT,
    NULLIF(col2,'')::TIMESTAMP,
    NULLIF(col3,''),
    NULLIF(col4,''),
    NULLIF(col5,''),
    NULLIF(col6,'')::NUMERIC,
    NULLIF(col7,'')::NUMERIC,
    NULLIF(col8,'')::NUMERIC,
    NULLIF(col9,'')::NUMERIC,
    CASE NULLIF(col10,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col11,''),
    NULLIF(col12,''),
    NULLIF(col13,''),
    NULLIF(col14,'')::NUMERIC,
    NULLIF(col15,'')::NUMERIC,
    NULLIF(col16,'')::NUMERIC,
    NULLIF(col17,'')::NUMERIC,
    NULLIF(col18,'')::NUMERIC,
    NULLIF(col19,'')::NUMERIC,
    NULLIF(col20,'')::NUMERIC,
    NULLIF(col21,'')::NUMERIC,
    NULLIF(col22,'')::NUMERIC,
    NULLIF(col23,'')::NUMERIC,
    NULLIF(col24,'')::NUMERIC,
    NULLIF(col25,'')::NUMERIC,
    NULLIF(col26,'')::NUMERIC,
    NULLIF(col27,'')::NUMERIC,
    NULLIF(col28,'')::NUMERIC,
    NULLIF(col29,'')::NUMERIC,
    NULLIF(col30,'')::NUMERIC,
    NULLIF(col31,'')::NUMERIC,
    NULLIF(col32,'')::NUMERIC,
    NULLIF(col33,'')::NUMERIC,
    NULLIF(col34,'')::NUMERIC,
    NULLIF(col35,'')::NUMERIC,
    NULLIF(col36,'')::NUMERIC,
    NULLIF(col37,'')::NUMERIC,
    NULLIF(col38,'')::NUMERIC,
    NULLIF(col39,'')::NUMERIC,
    NULLIF(col40,'')::INTEGER,
    NULLIF(col41,'')::NUMERIC,
    NULLIF(col42,'')::NUMERIC,
    NULLIF(col43,'')::NUMERIC,
    NULLIF(col44,'')::NUMERIC,
    NULLIF(col45,''),
    NULLIF(col46,''),
    NULLIF(col47,'')::NUMERIC,
    NULLIF(col48,'')::NUMERIC,
    CASE NULLIF(col49,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col50,'')::NUMERIC,
    CASE NULLIF(col51,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col52,'')::NUMERIC,
    CASE NULLIF(col53,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col54,'')::NUMERIC,
    NULLIF(col55,''),
    NULLIF(col56,''),
    NULLIF(col57,'')::NUMERIC,
    NULLIF(col58,'')::NUMERIC,
    NULLIF(col59,'')::NUMERIC,
    NULLIF(col60,'')::NUMERIC,
    NULLIF(col61,'')::NUMERIC,
    NULLIF(col62,'')::NUMERIC,
    NULLIF(col63,'')::NUMERIC,
    NULLIF(col64,'')::NUMERIC,
    NULLIF(col65,'')::NUMERIC,
    NULLIF(col66,''),
    NULLIF(col67,''),
    NULLIF(col68,''),
    NULLIF(col69,''),
    NULLIF(col70,''),
    NULLIF(col71,'')::NUMERIC,
    NULLIF(col72,''),
    NULLIF(col73,'')::NUMERIC,
    NULLIF(col74,'')::NUMERIC,
    NULLIF(col75,'')::NUMERIC,
    NULLIF(col76,'')::NUMERIC,
    NULLIF(col77,'')::NUMERIC,
    NULLIF(col78,'')::NUMERIC,
    NULLIF(col79,'')::NUMERIC,
    CASE NULLIF(col80,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col81,'')::NUMERIC,
    NULLIF(col82,'')::NUMERIC,
    NULLIF(col83,'')::NUMERIC,
    NULLIF(col84,'')::NUMERIC,
    NULLIF(col85,'')::NUMERIC,
    NULLIF(col86,'')::NUMERIC,
    NULLIF(col87,'')::NUMERIC,
    NULLIF(col88,'')::NUMERIC,
    NULLIF(col89,'')::NUMERIC,
    NULLIF(col90,'')::NUMERIC,
    NULLIF(col91,'')::NUMERIC,
    NULLIF(col92,'')::NUMERIC,
    NULLIF(col93,'')::NUMERIC,
    CASE NULLIF(col94,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    CASE NULLIF(col95,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    CASE NULLIF(col96,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    CASE NULLIF(col97,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    CASE NULLIF(col98,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    CASE NULLIF(col99,'')
        WHEN 'true' THEN TRUE WHEN 'True' THEN TRUE WHEN 'TRUE' THEN TRUE
        WHEN 't' THEN TRUE WHEN '1' THEN TRUE WHEN '1.0' THEN TRUE
        WHEN 'false' THEN FALSE WHEN 'False' THEN FALSE WHEN 'FALSE' THEN FALSE
        WHEN 'f' THEN FALSE WHEN '0' THEN FALSE WHEN '0.0' THEN FALSE
        ELSE NULL END,
    NULLIF(col100,'')::NUMERIC,
    NULLIF(col101,'')::NUMERIC,
    NULLIF(col102,'')::NUMERIC,
    NULLIF(col103,'')
FROM activities_staging;

DROP TABLE activities_staging;

-- ---- bikes.csv ----
\copy bikes (bike_name, bike_brand, bike_model, bike_default_sport_types) FROM '/Users/will/DataAnalyticsPractice/StravaAnalysis300626/StravaDataJun26/bikes.csv' WITH (FORMAT csv, HEADER true)

-- ---- shoes.csv ----
\copy shoes (shoe_name, shoe_brand, shoe_model, shoe_default_sport_types) FROM '/Users/will/DataAnalyticsPractice/StravaAnalysis300626/StravaDataJun26/shoes.csv' WITH (FORMAT csv, HEADER true)
