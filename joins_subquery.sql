-- 1. List all customers who live in Texas (use JOINs)
-- Answer: Jennifer, Kim , Richard , Bryan, Ian
SELECT first_name, last_name, district
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
-- Answer:1408 rows
SELECT first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
-- 6 Answer: Rhonda, Clara, Eleanor, Marion, Tommy, Karl
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
)

-- 4. List all customers that live in Nepal (use the city table) 
-- 1 Answer:Kevin 
SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
-- Answer:Jon(7304)
SELECT first_name, last_name, COUNT(payment_id) as Num_Transactions
FROM staff
LEFT JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY Num_Transactions DESC;

-- 6. How many movies of each rating are there? 
--Answer:PG-13, 223 
--Answer:NC-17, 210 
--Answer:R, 195 
--Answer:PG, 194 
--Answer:G, 178 
SELECT rating, COUNT(film_id) as Num_Movies
FROM film
GROUP BY rating
ORDER BY Num_Movies DESC;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- Answer:45 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
)


-- 8. How many free rentals did our stores give away?
-- Answer:24 
SELECT COUNT(payment_id)
FROM payment
WHERE amount = 0;