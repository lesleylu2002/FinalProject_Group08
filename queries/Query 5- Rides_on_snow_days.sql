
WITH daily_trip_counts AS (
    SELECT strftime('%Y-%m-%d', pickup_datetime) AS ride_date,
           COUNT(*) AS total_rides
    FROM (
        SELECT tpep_pickup_datetime AS pickup_datetime
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
        UNION ALL
        SELECT pickup_datetime
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
    ) AS all_trips
    GROUP BY ride_date
)
SELECT w.DATE AS ride_date, 
       w.DailySnowfall AS total_snowfall, 
       COALESCE(d.total_rides, 0) AS total_rides
FROM daily_weather w
LEFT JOIN daily_trip_counts d ON w.DATE = d.ride_date
WHERE w.DATE BETWEEN '2020-01-01' AND '2024-08-31'
ORDER BY w.DailySnowfall DESC
LIMIT 10;

