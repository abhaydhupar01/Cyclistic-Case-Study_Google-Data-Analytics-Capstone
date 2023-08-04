WITH temp_table AS (
  SELECT
    ride_id,
    rideable_type,
    member_casual,
    TIME(TIMESTAMP_SECONDS(TIMESTAMP_DIFF(ended_at, started_at, SECOND))) AS ride_length,   
    EXTRACT(DAYOFWEEK FROM started_at) as day_of_week 
  FROM `cyclist-394306.previous_12_month_data.2022-07`
)

SELECT
  day_of_week,
  COUNT(*)  AS frequency_of_weekday
FROM
  temp_table
GROUP BY
  day_of_week
ORDER BY
  frequency_of_weekday DESC


SELECT
  member_casual,
  SUM(CASE WHEN day_of_week = 1 OR day_of_week = 7 THEN 1 ELSE 0 END) AS weekend_rides_count
FROM
  temp_table
GROUP BY
  member_casual;


SELECT
  member_casual,
  rideable_type,
  COUNT(rideable_type) AS Total
FROM
  temp_table
GROUP BY
  member_casual,
  rideable_type
ORDER BY
  member_casual,
  rideable_type

SELECT 
  member_casual,
  COUNT(*) AS total
FROM temp_table
GROUP BY
  member_casual
