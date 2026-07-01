-- ============================================================
-- Strava export schema (auto-generated from verified 103-column header)
-- Duplicate source columns (Elapsed Time, Distance, Max Heart Rate,
-- Relative Effort, Commute) appear twice in activities.csv. The FIRST
-- occurrence is kept as *_legacy; the SECOND occurrence becomes the
-- canonical column. If your numbers look wrong after loading (e.g.
-- distance is null/zero), the occurrences may be swapped in your
-- export -- check 02_load_data.sql, the mapping is positional and
-- easy to flip.
-- ============================================================

DROP TABLE IF EXISTS activities CASCADE;
DROP TABLE IF EXISTS bikes CASCADE;
DROP TABLE IF EXISTS shoes CASCADE;

CREATE TABLE activities (
    activity_id                         BIGINT PRIMARY KEY,
    activity_date                       TIMESTAMP,
    activity_name                       TEXT,
    activity_type                       TEXT,
    activity_description                TEXT,
    elapsed_time_legacy                 NUMERIC,
    distance_legacy                     NUMERIC,
    max_heart_rate_legacy               NUMERIC,
    relative_effort_legacy              NUMERIC,
    commute_legacy                      BOOLEAN,
    activity_private_note               TEXT,
    activity_gear                       TEXT,
    filename                            TEXT,
    athlete_weight                      NUMERIC,
    bike_weight                         NUMERIC,
    elapsed_time                        NUMERIC,
    moving_time                         NUMERIC,
    distance                            NUMERIC,
    max_speed                           NUMERIC,
    average_speed                       NUMERIC,
    elevation_gain                      NUMERIC,
    elevation_loss                      NUMERIC,
    elevation_low                       NUMERIC,
    elevation_high                      NUMERIC,
    max_grade                           NUMERIC,
    average_grade                       NUMERIC,
    average_positive_grade              NUMERIC,
    average_negative_grade              NUMERIC,
    max_cadence                         NUMERIC,
    average_cadence                     NUMERIC,
    max_heart_rate                      NUMERIC,
    average_heart_rate                  NUMERIC,
    max_watts                           NUMERIC,
    average_watts                       NUMERIC,
    calories                            NUMERIC,
    max_temperature                     NUMERIC,
    average_temperature                 NUMERIC,
    relative_effort                     NUMERIC,
    total_work                          NUMERIC,
    number_of_runs                      INTEGER,
    uphill_time                         NUMERIC,
    downhill_time                       NUMERIC,
    other_time                          NUMERIC,
    perceived_exertion                  NUMERIC,
    type                                TEXT,
    start_time                          TEXT,
    weighted_average_power              NUMERIC,
    power_count                         NUMERIC,
    prefer_perceived_exertion           BOOLEAN,
    perceived_relative_effort           NUMERIC,
    commute                             BOOLEAN,
    total_weight_lifted                 NUMERIC,
    from_upload                         BOOLEAN,
    grade_adjusted_distance             NUMERIC,
    weather_observation_time            TEXT,
    weather_condition                   TEXT,
    weather_temperature                 NUMERIC,
    apparent_temperature                NUMERIC,
    dewpoint                            NUMERIC,
    humidity                            NUMERIC,
    weather_pressure                    NUMERIC,
    wind_speed                          NUMERIC,
    wind_gust                           NUMERIC,
    wind_bearing                        NUMERIC,
    precipitation_intensity             NUMERIC,
    sunrise_time                        TEXT,
    sunset_time                         TEXT,
    moon_phase                          TEXT,
    bike                                TEXT,
    gear                                TEXT,
    precipitation_probability           NUMERIC,
    precipitation_type                  TEXT,
    cloud_cover                         NUMERIC,
    weather_visibility                  NUMERIC,
    uv_index                            NUMERIC,
    weather_ozone                       NUMERIC,
    jump_count                          NUMERIC,
    total_grit                          NUMERIC,
    average_flow                        NUMERIC,
    flagged                             BOOLEAN,
    average_elapsed_speed               NUMERIC,
    dirt_distance                       NUMERIC,
    newly_explored_distance             NUMERIC,
    newly_explored_dirt_distance        NUMERIC,
    activity_count                      NUMERIC,
    total_steps                         NUMERIC,
    carbon_saved                        NUMERIC,
    pool_length                         NUMERIC,
    training_load                       NUMERIC,
    intensity                           NUMERIC,
    average_grade_adjusted_pace         NUMERIC,
    timer_time                          NUMERIC,
    total_cycles                        NUMERIC,
    recovery                            BOOLEAN,
    with_pet                            BOOLEAN,
    competition                         BOOLEAN,
    long_run                            BOOLEAN,
    for_a_cause                         BOOLEAN,
    with_kid                            BOOLEAN,
    downhill_distance                   NUMERIC,
    total_sets                          NUMERIC,
    total_reps                          NUMERIC,
    media                               TEXT
);

CREATE TABLE bikes (
    bike_id                            SERIAL PRIMARY KEY,
    bike_name                          TEXT,
    bike_brand                         TEXT,
    bike_model                         TEXT,
    bike_default_sport_types           TEXT
);

CREATE TABLE shoes (
    shoe_id                            SERIAL PRIMARY KEY,
    shoe_name                          TEXT,
    shoe_brand                         TEXT,
    shoe_model                         TEXT,
    shoe_default_sport_types           TEXT
);

CREATE INDEX idx_activities_date ON activities (activity_date);
CREATE INDEX idx_activities_type ON activities (activity_type);
