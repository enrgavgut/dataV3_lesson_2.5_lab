USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’ 

SELECT *
FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT count(distinct(film_id))
FROM sakila.film; -- This return the count of unique films the shop has

SELECT count(distinct(film_id))
FROM sakila.inventory; -- This return the number of films currentyly

   -

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration. 

SELECT MAX(length) AS max_duration,MIN(length) AS min_duration
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(FLOOR(AVG(length)/60),'h ',MOD(AVG(length),60),'m')
FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(distinct(last_name))
FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)? 

SELECT MIN(rental_date), MAX(rental_date)
FROM sakila.rental; -- We take from first day that we had a rental 

SELECT DATEDIFF('2006/02/14', '2005/05/24') AS DateDiff; -- Shop has been opened 266 days

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, MONTHNAME(convert(rental_date,DATE)) AS Month, DAYNAME(convert(rental_date,DATE)) AS Day
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. CHECK

SELECT *, MONTHNAME(convert(rental_date,DATE)) AS Month, DAYNAME(convert(rental_date,DATE)) AS Day,
CASE
WHEN DAYNAME(convert(rental_date,DATE)) = 'Monday' then 'Workday'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Tuesday' then 'Workday'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Wednesday' then 'Workday'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Thursday' then 'Workday'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Friday' then 'Workday'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Saturday' then 'Weekend'
WHEN DAYNAME(convert(rental_date,DATE)) = 'Sunday' then 'Weekend'
ELSE 'No status'
END AS 'Day_type'
FROM sakila.rental;

-- 9. Get release years. 

SELECT title,release_year
FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title. 

SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO. 

SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films 
SELECT title, length
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content? 

SELECT count(*)
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'; -- If we use 'Behind the Scenes' instead only gives back cell where special_features = Behind the scenes


