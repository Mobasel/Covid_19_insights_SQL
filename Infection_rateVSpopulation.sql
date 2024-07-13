-- Looking for countries with highest infection rate compared to population --

SELECT location, population, max(total_cases) AS max_total_cases, (max(total_cases) / population)*100 AS Max_infection_percentage
FROM `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` 
--Where location = "Egypt"
group by location, population
Order by Max_infection_percentage DESC

