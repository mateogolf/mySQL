-- 1) get all the countries that speak Slovene? Your query should return the name of the country, language and language percentage. 
-- Your query should arrange the result by language percentage in descending order
SELECT countries.name, languages.language, languages.percentage from countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.language = "Slovene"
ORDER BY languages.percentage DESC;

-- 2) display the total number of cities for each country? 
-- Your query should return the name of the country and the total number of cities. 
-- Your query should arrange the result by the number of cities in descending order. 
SELECT countries.id, countries.name, COUNT(cities.name) As num_cities from countries
JOIN cities on countries.id = cities.country_id
GROUP BY countries.name
ORDER BY num_cities DESC;

-- 3) get all the cities in Mexico with a population of greater than 500,000?
-- Your query should arrange the result by population in descending order.
-- SELECT * from countries WHERE countries.name = "Mexico" -- result 136
SELECT cities.name, cities.population from cities
WHERE country_id = 136
ORDER BY cities.population DESC;

-- 4) get all languages in each country with a percentage greater than 89%?
-- Your query should arrange the result by percentage in descending order.
SELECT countries.name, languages.language, languages.percentage from countries
JOIN languages ON countries.id = languages.country_id
GROUP BY countries.name HAVING languages.percentage > 0.89
ORDER BY languages.percentage DESC;


-- 5) get all the countries with Surface Area below 501 and Population greater than 100,000
SELECT countries.name, countries.surface_area, countries.population from countries
WHERE countries.surface_area < 501 AND countries.population > 100000;

-- 6) get countries with only Constitutional Monarchy with a capital greater than 200
-- and a life expectancy greater than 75 years
SELECT countries.name, countries.government_form, countries.capital, countries.life_expectancy from countries
WHERE
	countries.government_form = "Constitutional Monarchy" AND
    countries.capital > 200 AND
    countries.life_expectancy > 75;


-- 7) get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500,000?
-- The query should return the Country Name, City Name, District and Population.
SELECT countries.name, cities.name, cities.district, cities.population from countries
JOIN cities on countries.id = cities.country_id
WHERE countries.name = "Argentina" AND
	  cities.district = "Buenos Aires" AND
      cities.population > 500000;

-- 8) summarize the number of countries in each region?
-- The query should display the name of the region and the number of countries.
-- Also, the query should arrange the result by the number of countries in descending order. 
SELECT countries.region, COUNT(*) as country_count from countries
GROUP BY countries.region
ORDER BY country_count DESC;
