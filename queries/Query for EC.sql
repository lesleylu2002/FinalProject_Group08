
WITH daily_data AS (
    SELECT
        daily_sunrise_sunset.date AS date,
        daily_sunrise_sunset.daylight_duration,
        daily_weather.DailyPrecipitation AS total_precipitation
    FROM daily_sunrise_sunset
    JOIN daily_weather
    ON daily_sunrise_sunset.date = daily_weather.DATE
    WHERE daily_sunrise_sunset.date BETWEEN '2020-01-01' AND '2024-08-31'
)
SELECT
    date,
    daylight_duration,
    total_precipitation
FROM daily_data
ORDER BY date;
