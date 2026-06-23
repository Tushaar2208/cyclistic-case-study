-- Create a master table combining all 12 months of raw Cyclistic data
CREATE OR REPLACE TABLE `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.tripdata_2025_raw` AS

SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.jan_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.feb_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.march_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.april_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.may_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.june_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.july_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.August_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.sept_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.oct_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.Nov_2025_trips`
UNION ALL
SELECT * FROM `project-fd566ac6-ea21-4d18-b63.cyclistic_tripdata.dec_2025_trips`;