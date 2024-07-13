-- Showing countries with highest death count per Country.--

SELECT location, population, max(total_deaths) AS max_total_deaths  --, (max(total_deaths) / population)*100 AS max_deaths_percentage
FROM `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` 
WHERE continent IS NOT NULL
group by location, population
Order by max_total_deaths desc;

-- Showing countries with highest death count per continent.--

SELECT location, population, max(total_deaths) AS max_total_deaths  --, (max(total_deaths) / population)*100 AS max_deaths_percentage
FROM `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` 
WHERE continent IS NULL
group by location, population
Order by max_total_deaths desc;

-- The global deaths percentage per date. --


SELECT date, SUM(new_cases) AS total_new_cases, SUM(new_deaths) AS total_new_deaths, (SUM(new_deaths) / SUM(new_cases))*100 AS newDeathPercentage
FROM `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` 
WHERE continent IS NOT NULL
group by date
order by date