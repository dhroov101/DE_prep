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

  -- joins 
--Find the domestic and international sales for each movie
SELECT Title,domestic_sales, International_sales FROM movies join Boxoffice
where movies.Id=Boxoffice.Movie_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT Title,domestic_sales, International_sales FROM movies join Boxoffice
where movies.Id=Boxoffice.Movie_id and International_sales > domestic_sales;

--List all the movies by their ratings in descending order
SELECT Title,domestic_sales, International_sales FROM movies join Boxoffice
where movies.Id=Boxoffice.Movie_id
order by Boxoffice.rating desc;

--Find the list of all buildings that have employees
SELECT b.building_name, count(*) 
FROM employees as e join Buildings as b
where b.building_name=e.building
group by b.building_name;

--List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, role 
FROM buildings 
  LEFT JOIN employees
    ON building_name = building;

--Find the name and role of all employees who have not been assigned to a building
select name, role from employees where building is null;

--Find the names of the buildings that hold no employees
SELECT building_name
FROM buildings LEFT JOIN employees
ON building_name = building
    where building is NULL;

--List all movies and their combined sales in millions of dollars
SELECT m.title, (b.domestic_sales + b.International_sales)/1000000 as sales_in_millions
FROM movies as m join boxoffice as b
on m.id = b.movie_id;

--List all movies and their ratings in percent 
SELECT m.title, (b.rating*10) as percent_rating
FROM movies as m join boxoffice as b
on m.id = b.movie_id;

--List all movies that were released on even number years
SELECT m.title
FROM movies as m join boxoffice as b
on m.id = b.movie_id
where m.year%2=0;

--Find the longest time that an employee has been at the studio 
SELECT years_employed FROM employees
order by years_employed desc
limit 1;

--For each role, find the average number of years employed by employees in that role
SELECT role, avg(years_employed) FROM employees
group by role;

--Find the total number of employee years worked in each building
select building ,sum(years_employed) 
from employees 
group by building;

--Find the number of Artists in the studio (without a HAVING clause) 
SELECT count(*)
FROM employees
where role = "Artist";

--Find the number of Employees of each role in the studio
SELECT role,count(*)
FROM employees
group by  role;

--Find the total number of years employed by all Engineers 
select role,sum(years_employed)
from employees
group by role
having role = "Engineer";

--Find the number of movies each director has directed 
SELECT m.director, count(*)
FROM movies as m join boxoffice as b
on m.id = b.movie_id
group by m.director;

--Find the total domestic and international sales that can be attributed to each director
SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
FROM movies
    INNER JOIN boxoffice
        ON movies.id = boxoffice.movie_id
GROUP BY director;






