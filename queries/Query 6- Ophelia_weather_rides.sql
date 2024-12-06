
WITH hourly_rides AS (
    SELECT strftime('%Y-%m-%d %H:00:00', pickup_datetime) AS hour,
           COUNT(*) AS total_rides
    FROM (
        SELECT tpep_pickup_datetime AS pickup_datetime
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
        UNION ALL
        SELECT pickup_datetime
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
    ) AS all_trips
    GROUP BY hour
),
hourly_data AS (
    SELECT strftime('%Y-%m-%d %H:00:00', DATE) AS hour,
           SUM(HourlyPrecipitation) AS total_precipitation,
           AVG(HourlyWindSpeed) AS avg_wind_speed
    FROM hourly_weather
    WHERE DATE BETWEEN '2023-09-25 00:00:00' AND '2023-10-03 23:59:59'
    GROUP BY hour
)
SELECT hr.hour,
       COALESCE(r.total_rides, 0) AS total_rides,
       COALESCE(h.total_precipitation, 0) AS total_precipitation,
       COALESCE(h.avg_wind_speed, 0) AS avg_wind_speed
FROM hourly_range hr
LEFT JOIN hourly_rides r ON hr.hour = r.hour
LEFT JOIN hourly_data h ON hr.hour = h.hour
ORDER BY hr.hour ASC;
