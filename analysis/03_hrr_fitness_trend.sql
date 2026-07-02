WITH runs_with_rhr AS (
    SELECT
        a.activity_id,
        a.activity_date,
        a.distance_km,
        a.moving_time_mins,
        a.average_heart_rate,
        w.resting_heart_rate,
        w.recovery_score,
        w.hrv,
        -- dynamic max HR based on age at time of activity
        (220 - DATE_PART('year', AGE(a.activity_date, '2002-09-15'::date)))::numeric AS max_hr
    FROM activities_short a
    LEFT JOIN whoop_cycles w
        ON a.activity_date >= w.cycle_start_time
        AND a.activity_date < w.cycle_end_time
    WHERE a.activity_category = 'Run'
    AND a.average_heart_rate IS NOT NULL
    AND a.distance_km > 1
    AND a.moving_time_mins / NULLIF(a.distance_km, 0) < 10
    AND w.resting_heart_rate IS NOT NULL
),
hrr_calc AS (
    SELECT
        *,
        ROUND(moving_time_mins / NULLIF(distance_km, 0), 2) AS mins_per_km,
        -- %HRR: what percentage of available HR range was used
        ROUND(
            100.0 * (average_heart_rate - resting_heart_rate)
            / NULLIF(max_hr - resting_heart_rate, 0)
        , 1) AS pct_hrr
    FROM runs_with_rhr
)
SELECT
    DATE_TRUNC('month', activity_date)::date    AS month,
    COUNT(*)                                    AS runs,
    ROUND(AVG(mins_per_km), 2)                  AS avg_pace_mins_per_km,
    ROUND(AVG(average_heart_rate), 1)           AS avg_hr,
    ROUND(AVG(resting_heart_rate), 1)           AS avg_rhr,
    ROUND(AVG(pct_hrr), 1)                      AS avg_pct_hrr,
    ROUND(AVG(recovery_score), 1)               AS avg_recovery_score,
    ROUND(AVG(hrv), 1)                          AS avg_hrv
FROM hrr_calc
GROUP BY month
HAVING COUNT(*) >= 3
ORDER BY month;