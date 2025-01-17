  -- Looking FOR total population VS vaccinations (JOIN two tables) --
SELECT
  death.continent,
  death.location,
  death.date,
  death.population,
  Vacc.new_vaccinations
FROM
  `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` AS death
JOIN
  `training-projects-421111.Covid_deaths_vaccinations.Covid_vaccinations` AS Vacc
ON
  death.location = Vacc.location
  AND death.date = Vacc.date
WHERE
  death.continent IS NOT NULL
  AND Vacc.new_vaccinations IS NOT NULL
ORDER BY
  2,
  3; 
  
-- Total vaccinations per country --
SELECT
  death.location,
  death.population,
  SUM(Vacc.new_vaccinations),
  ROUND((SUM(Vacc.new_vaccinations) / death.population)*100, 2) AS Vaccinated_population_percentage
FROM
  `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` AS death
JOIN
  `training-projects-421111.Covid_deaths_vaccinations.Covid_vaccinations` AS Vacc
ON
  death.location = Vacc.location
  AND death.date = Vacc.date
WHERE
  death.continent IS NOT NULL
  AND Vacc.new_vaccinations IS NOT NULL
GROUP BY
  death.location,
  death.population
ORDER BY
  1; 
  
-- Total vaccinations per continent --
SELECT
  continent,
  SUM(new_vaccinations) AS Total_vaccinacted
FROM
  `training-projects-421111.Covid_deaths_vaccinations.Covid_vaccinations`
WHERE
  continent IS NOT NULL
  AND new_vaccinations IS NOT NULL
GROUP BY
  continent
ORDER BY
  1; 
  
-- Total vaccinations VS population per continent --

SELECT
  death.continent,
  SUM(DISTINCT death.population) AS pop_per_continent,
  SUM(Vacc.new_vaccinations) AS vacc_per_continent,
  ROUND((SUM(Vacc.new_vaccinations) / SUM(DISTINCT death.population))*100, 2) AS Vaccinated_pop_percentage
FROM
  `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` AS death
JOIN
  `training-projects-421111.Covid_deaths_vaccinations.Covid_vaccinations` AS Vacc
ON
  death.location = Vacc.location
  AND death.date = Vacc.date
WHERE
  death.continent IS NOT NULL
  AND Vacc.new_vaccinations IS NOT NULL
GROUP BY
  death.continent
ORDER BY
  1;