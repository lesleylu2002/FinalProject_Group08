
WITH daily_rides AS (
    SELECT strftime('%Y-%m-%d', pickup_datetime) AS ride_date,
           COUNT(*) AS total_rides,
           AVG(trip_distance) AS avg_distance
    FROM (
        SELECT tpep_pickup_datetime AS pickup_datetime, trip_distance
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
        UNION ALL
        SELECT pickup_datetime, trip_miles AS trip_distance
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    ) AS all_rides
    GROUP BY ride_date
)
SELECT d.ride_date, 
       d.total_rides, 
       d.avg_distance, 
       w.DailyPrecipitation AS avg_precipitation, 
       w.DailyAverageWindSpeed AS avg_wind_speed
FROM daily_rides d
LEFT JOIN daily_weather w ON d.ride_date = w.DATE
ORDER BY d.total_rides DESC
LIMIT 10;

