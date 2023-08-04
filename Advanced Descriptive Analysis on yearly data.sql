WITH temp_table AS (
  SELECT
    ride_id,
    started_at,
    ended_at,
    rideable_type,
    member_casual,
    TIME(TIMESTAMP_SECONDS(TIMESTAMP_DIFF(ended_at, started_at, SECOND))) AS ride_length,
    EXTRACT(DAYOFWEEK FROM started_at) as day_of_week
  FROM
    `cyclist-394306.previous_12_month_data.year_data`
  WHERE
    started_at<ended_at
)

SELECT
  member_casual,
  ROUND(SUM(Extract(HOUR FROM ride_length)*3600 + Extract(MINUTE FROM ride_length) * 60 + Extract(SECOND FROM ride_length))/3600, 2) AS total_hours
FROM
  temp_table
GROUP BY
  member_casual

  member_casual,
  (SUM(EXTRACT(HOUR FROM ride_length)*3600 + EXTRACT(MINUTE FROM ride_length)*60 + EXTRACT  
  (SECOND FROM ride_length))) AS total_ride_time
GROUP BY
  member_casual


SELECT
  day_of_week,
  member_casual,
  COUNT(*) AS total
FROM
  temp_table
GROUP BY
  day_of_week, member_casual
ORDER BY
  day_of_week, member_casual


SELECT
  day_of_week,
  COUNT(*) AS total_rides
FROM
  temp_table
GROUP BY
  day_of_week
ORDER BY
  total_rides DESC

SELECT 
  member_casual,
  COUNT(*) AS total
FROM
  `cyclist-394306.previous_12_month_data.year_data`

GROUP BY
  member_casual


SELECT
  EXTRACT(YEAR FROM started_at) AS year,
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS total_rides
FROM
  `cyclist-394306.previous_12_month_data.year_data`

GROUP BY
  year, month
ORDER BY
  total_rides DESC