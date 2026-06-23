-- Assign chronological numeric values to string-based months and days for BI sorting
CREATE OR REPLACE TABLE `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.tripdata_2025_final` AS

SELECT 
    ride_id,
    rideable_type,
    member_casual,
    start_station_name,
    end_station_name,
    day_of_week,
    month,
    ride_length_minutes,
    ride_length_bucket,
    CASE
        WHEN month = 'January' AND month IS NOT NULL THEN 1
        WHEN month = 'February' AND month IS NOT NULL THEN 2
        WHEN month = 'March' AND month IS NOT NULL THEN 3
        WHEN month = 'April' AND month IS NOT NULL THEN 4
        WHEN month = 'May' AND month IS NOT NULL THEN 5
        WHEN month = 'June' AND month IS NOT NULL THEN 6
        WHEN month = 'July' AND month IS NOT NULL THEN 7
        WHEN month = 'August' AND month IS NOT NULL THEN 8
        WHEN month = 'September' AND month IS NOT NULL THEN 9
        WHEN month = 'October' AND month IS NOT NULL THEN 10
        WHEN month = 'November' AND month IS NOT NULL THEN 11
        WHEN month = 'December' AND month IS NOT NULL THEN 12
        ELSE NULL
    END AS month_index,
    CASE
        WHEN day_of_week = 'Monday' AND day_of_week IS NOT NULL THEN 1
        WHEN day_of_week = 'Tuesday' AND day_of_week IS NOT NULL THEN 2
        WHEN day_of_week = 'Wednesday' AND day_of_week IS NOT NULL THEN 3
        WHEN day_of_week = 'Thursday' AND day_of_week IS NOT NULL THEN 4
        WHEN day_of_week = 'Friday' AND day_of_week IS NOT NULL THEN 5
        WHEN day_of_week = 'Saturday' AND day_of_week IS NOT NULL THEN 6
        WHEN day_of_week = 'Sunday' AND day_of_week IS NOT NULL THEN 7
        ELSE NULL
    END AS day_index
FROM 
    `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.tripdata_2025_cleaned`;