CREATE TABLE `cyclist-394306.previous_12_month_data.year_data` AS 
WITH temp_table AS (
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-07`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-08`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-09`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-10`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-11`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2022-12`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-01`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-02`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-03`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-04`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-05`
  UNION ALL
  SELECT * FROM `cyclist-394306.previous_12_month_data.2023-06`
)

SELECT * FROM temp_table