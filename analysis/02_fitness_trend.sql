with run_stats as(
	select 
		date_trunc('month', activity_date)::date as month,
		ROUND(moving_time_mins / nullif(distance_km, 0), 2) as mins_per_km,
		average_heart_rate
	from activities_short
	where activity_category = 'Run' 
      	and average_heart_rate is not null
      	and distance_km > 1
      	and moving_time_mins / nullif(distance_km, 0) < 10
),
monthly as (
	select month,
	   	COUNT(*) as runs,
	   	ROUND(AVG(mins_per_km), 2) as avg_pace_mins_per_km,
	   	ROUND(AVG(average_heart_rate), 1) as avg_heart_rate
	from run_stats
	group by month
	having COUNT(*) > 3
)
select month,
	   runs,
	   avg_pace_mins_per_km,
	   avg_heart_rate,
	   ROUND(100.0 / (avg_pace_mins_per_km * avg_heart_rate / 100.0), 2) AS efficiency_score
from monthly
order by month;