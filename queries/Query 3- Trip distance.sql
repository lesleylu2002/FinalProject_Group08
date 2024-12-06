
WITH combined_trips AS (
    SELECT trip_distance
    FROM taxi_trips
    WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    UNION ALL
    SELECT trip_miles AS trip_distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
),
sorted_trips AS (
    SELECT trip_distance
    FROM combined_trips
    ORDER BY trip_distance
),
percentile_index AS (
    SELECT CAST(COUNT(*) * 0.95 AS INTEGER) AS idx
    FROM sorted_trips
)
SELECT trip_distance AS percentile_95
FROM sorted_trips
LIMIT 1 OFFSET (SELECT idx - 1 FROM percentile_index);
