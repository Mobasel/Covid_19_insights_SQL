  -- Looking FOR total cases VS population. --
SELECT
  location,
  date,
  total_cases,
  population,
  (total_cases / population)*100 AS Cases_Percentage
FROM
  `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1`
WHERE
  location = "Egypt"
ORDER BY
  1,
  2