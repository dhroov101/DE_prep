SELECT title, year
FROM movies
WHERE year > 2000;

-- Find movies with a rating above 8
SELECT title, rating
FROM movies
WHERE rating > 8.0;

-- List all the Canadian cities and their populations 
SELECT City, Population FROM north_american_cities
where country= "Canada";

--Order all the cities in the United States by their latitude from north to south
SELECT City FROM north_american_cities
where country= "United States"
order by latitude desc ;

--List all the cities west of Chicago, ordered from west to east
SELECT City FROM north_american_cities
where longitude < (select longitude from north_american_cities where city = "Chicago")
order by longitude asc ;

--List the two largest cities in Mexico (by population)
SELECT City FROM north_american_cities
where country= "Mexico"
order by population desc limit 2

--List the third and fourth largest cities (by population) in the United States and their population
SELECT City FROM north_american_cities
where country= "United States"
order by population desc limit 2 offset 2
