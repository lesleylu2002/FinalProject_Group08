
SELECT strftime('%w', pickup_datetime) AS weekday,
       COUNT(*) AS ride_count
FROM uber_trips
WHERE pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
GROUP BY weekday
ORDER BY ride_count DESC;
