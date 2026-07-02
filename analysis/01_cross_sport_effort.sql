with sport_stats as (
	select activity_category,
	   	COUNT(*) as activity_count,
       	ROUND(AVG(average_heart_rate), 1) as avg_heart_rate,
       	ROUND(AVG(relative_effort), 1) as avg_rel_effort,
       	ROUND(AVG(moving_time_mins), 1) as avg_moving_time_mins,
       	ROUND(AVG(calories), 1) as avg_calories,
       	ROUND(AVG(relative_effort) / nullif(AVG(moving_time_mins), 0), 2) as avg_effort_per_min,
       	ROUND(AVG(calories) / nullif(AVG(moving_time_mins), 0), 2) as avg_calories_per_min,
       	ROUND(AVG(max_heart_rate), 1) as avg_max_heart_rate
	from activities_short
	where average_heart_rate is not null
	and activity_category not in ('Walk', 'Other')
	group by activity_category
	order by avg_effort_per_min desc
),
normalised as (
	select activity_category,
		activity_count,
		avg_heart_rate,
		avg_rel_effort,
		avg_moving_time_mins,
		avg_calories,
		avg_effort_per_min,
		avg_calories_per_min,
		avg_max_heart_rate,
		ROUND(100 * avg_heart_rate / MAX(avg_heart_rate) OVER(), 1) as hr_score,
		ROUND(100 * avg_effort_per_min / MAX(avg_effort_per_min) OVER(), 1) as effort_score,
		ROUND(100 * avg_calories_per_min / MAX(avg_calories_per_min) OVER(), 1) as calorie_score
	from sport_stats
)
select activity_category,
	   activity_count,
	   avg_heart_rate,
	   avg_rel_effort,
	   avg_moving_time_mins,
	   avg_calories,
	   avg_effort_per_min,
	   avg_calories_per_min,
	   avg_max_heart_rate,
	   hr_score,
	   effort_score,
	   calorie_score,
	   ROUND(0.4 * hr_score + 0.4 * effort_score + 0.2 * calorie_score, 1) as weighted_score
from normalised
order by weighted_score DESC;
