-- Clean data, engineer time features, and remove corrupted/maintenance rows
CREATE OR REPLACE TABLE `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.tripdata_2025_cleaned` AS

SELECT
  ride_id,
  rideable_type,
  member_casual,
  start_station_name,
  end_station_name,
  
  -- Create Time/Date columns
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
  FORMAT_TIMESTAMP('%B', started_at) AS month,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
  EXTRACT(HOUR FROM started_at) AS ride_hour, 
  
  -- Create Buckets for Power BI
  CASE
    WHEN TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 15 THEN '0-15 min (Quick Trip)'
    WHEN TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 15 AND 30 THEN '15-30 min (Commute)'
    WHEN TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 31 AND 60 THEN '31-60 min (Cruising)'
    ELSE '60+ min (Long Ride)'
  END AS ride_length_bucket

FROM
  `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.tripdata_2025_raw`
  
WHERE
  -- Quality Control Filters
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440 
  AND ride_id IS NOT NULL;