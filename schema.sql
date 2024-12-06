
CREATE TABLE IF NOT EXISTS hourly_weather (
    date_time TEXT PRIMARY KEY,
    temperature FLOAT,
    precipitation FLOAT,
    wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    date TEXT PRIMARY KEY,
    avg_temperature FLOAT,
    total_precipitation FLOAT,
    total_snowfall FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    trip_id INTEGER PRIMARY KEY,
    pickup_datetime TEXT,
    dropoff_datetime TEXT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    tip_amount FLOAT,
    total_amount FLOAT,
    PULocationID INTEGER,
    DOLocationID INTEGER
);

CREATE TABLE IF NOT EXISTS uber_trips (
    trip_id INTEGER PRIMARY KEY,
    pickup_datetime TEXT,
    dropoff_datetime TEXT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    tip_amount FLOAT,
    total_amount FLOAT,
    PULocationID INTEGER,
    DOLocationID INTEGER
);

CREATE TABLE IF NOT EXISTS daily_sunrise_sunset (
    date TEXT PRIMARY KEY,
    sunrise TIME NOT NULL,
    sunset TIME NOT NULL,
    daylight_duration FLOAT NOT NULL
);
