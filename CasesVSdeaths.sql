-- Looking for total cases VS total deaths --
SELECT location, date, total_cases, total_deaths, (total_deaths / total_cases)*100 AS deaths_percentage
FROM `training-projects-421111.Covid_deaths_vaccinations.Deaths_table_1` 
Where location = "Egypt"
Order by 1, 2
