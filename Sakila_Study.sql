# ____________________________________ * MySQL * sakila Database Analysis * ____________________________________#
USE sakila;
-- ----------------------------------
### 1 ###______________________________________________________________________________________________________
  -- a. Display the first and last names of all actors from the table `actor`.
SELECT 
	first_name, 
    last_name
FROM actor;

  -- b. Display the first & last name of each actor using all upper case in a single column titled `Actor Name`.
SELECT 
	UPPER(CONCAT(first_name, ' ', last_name)) AS 'Actor Name' 
FROM actor;
 
-- ----------------------------------
### 2 ###______________________________________________________________________________________________________
  -- a. Given an actor's 1st name, How would you query their ID number, last name, (and first name)?
SELECT 
	actor_id, 
    first_name, 
    last_name
FROM actor
WHERE first_name='query_this_1st_name';

  -- b. Find all actors whose last name contains the letters `GEN`.
SELECT 
	actor_id, 
    first_name, 
    last_name
FROM actor
WHERE 
	last_name LIKE '%GEN%';

  -- c. Find all actors whose last name contains letters `LI`, & order the rows by last name then first name.
SELECT 
	actor_id, 
    first_name, 
    last_name
FROM actor
WHERE 
	last_name LIKE '%LI%'
ORDER BY last_name, first_name;
  
  -- d. Using `IN`, display `country_id` & `country` of the following: Afghanistan, Bangladesh, & China.
SELECT 
	country_id AS 'ID', 
    country AS 'Country'
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- ----------------------------------
### 3 ###______________________________________________________________________________________________________
  -- a. For a place to store actor descriptions, create `actor`.`description` and use the data type `BLOB`.
		-- (Make sure to research the type `BLOB`, as the difference between it and `VARCHAR` are significant).
-- TEXT and BLOB data types are stored off the table with a designated pointer to the contents.  
-- VARCHAR data elements are strings which are stored within the table.

ALTER TABLE actor
ADD COLUMN description BLOB FIRST;
        
  -- b. Delete the `description` column.

ALTER TABLE actor
DROP COLUMN description;

-- ----------------------------------
### 4 ###______________________________________________________________________________________________________
  -- a. List the last names of actors, as well as the number of records sharing that last name.
SELECT 
	last_name AS 'Last Name', 
    COUNT(last_name) AS 'Count' 
FROM actor 
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;

  -- b. List last names of actors, & the number of records sharing that last name, only for shared names.
SELECT 
	last_name AS 'Last Name', 
    COUNT(last_name) AS 'Count' 
FROM actor 
GROUP BY last_name
HAVING Count > 1
ORDER BY Count ASC;
  
  -- c. Write a Corrective Query to Change actor `GROUCHO WILLIAMS` to `HARPO WILLIAMS`.
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name='WILLIAMS';

SELECT * FROM actor WHERE first_name='GROUCHO'; -- test statement; 

  -- d. Change it back: If the first name of the actor is currently `HARPO`, change it to `GROUCHO`.
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO' AND last_name='Williams'
LIMIT 1;

-- ----------------------------------
### 5 ###______________________________________________________________________________________________________
  -- a. You cannot locate the schema of the `address` table. Which query would you use to re-create it?
-- To recreate a table's schema, you could:
-- (i) run the script on the following line,   
  SHOW CREATE TABLE sakila.address;
-- (ii) or right-click on sakila.address -> 'Copy to Clipboard' -> 'Create Statement'  
  CREATE TABLE `address` (
  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;

-- ----------------------------------
### 6 ###______________________________________________________________________________________________________
  -- a. Use `JOIN` to display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address 
FROM staff
INNER JOIN address 
USING(address_id);

  -- b. Use `JOIN` to display total staff member sales in August 2005. Use tables `staff` & `payment`.
SELECT 
    S.staff_id AS 'ID#', 
	CONCAT(S.first_name, ' ', S.last_name) AS 'Staff Member',
    SUM(P.amount) AS 'Total'
FROM staff AS S
INNER JOIN payment AS P
ON S.staff_id = P.staff_id
WHERE payment_date LIKE '%2005-08%'
GROUP BY S.staff_id; 

  -- c. List each film & number of actors listed for it. Use INNER JOIN on tables `film_actor` & `film`.
SELECT
	title AS 'Film',
    COUNT(actor_id) AS '# of Actors'
FROM film F
INNER JOIN film_actor A
ON F.film_id=A.film_id
GROUP BY title;

  -- d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
SELECT 
	I.film_id AS 'ID#', 
    F.title AS 'Film Title',
    COUNT(I.film_id) AS 'Count in Inventory'
FROM inventory AS I
INNER JOIN film as F
USING(film_id)
GROUP BY I.film_id
HAVING F.title = 'Hunchback Impossible';

  -- e. JOIN tables `payment` & `customer` & list total paid per customer, sorting last name alphabetically.
SELECT 
	C.customer_id AS 'Customer ID#', 
    C.last_name AS 'Last Name', 
    SUM(P.amount) AS 'Total Paid' 
FROM payment P
JOIN customer C
USING(customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- ----------------------------------
### 7 ###______________________________________________________________________________________________________
  -- a. Use subqueries to display titles of movies starting w/ letters `K` & `Q` whose language is English.
SELECT title AS 'Film Title'
FROM film F
WHERE
language_id IN
	(
	SELECT language_id
	FROM language 
	WHERE name="English"
	)
AND title LIKE 'Q%' OR title LIKE "K%"; 

  -- b. Use subqueries to display all actors who appear in the film `Alone Trip`.
SELECT 
	actor_id AS 'ID#', 
    CONCAT(first_name, ' ', last_name) AS 'Actor'
FROM actor 
WHERE actor_id IN
	(
	SELECT actor_id
	FROM film_actor
	WHERE film_id in
		(
		SELECT film_id 
		FROM film 
		WHERE title = "Alone Trip"
		)
	);
    
  -- c. Retrieve names & email addresses of all Canadian customers using JOINs.
SELECT 
	CONCAT(first_name, ' ', last_name) AS 'Customer Name', 
    email AS 'email address'
FROM customer
JOIN address
	USING (address_id)
JOIN city
	USING(city_id)
JOIN country
	USING(country_id)
WHERE country = "Canada";

  -- d. Query all films in the category _family_.
SELECT 
	film_id AS 'ID#', 
    title AS 'Film Title', 
    description AS 'Description'
FROM film F
WHERE film_id IN  
	(
	SELECT film_id
	FROM film_category
	WHERE category_id IN 
		(
        SELECT category_id
		FROM category
		WHERE name = 'Family'
		)
	);
  -- e. Display the most frequently rented movies in descending order.
SELECT 
	I.film_id AS 'ID#', 
    title AS 'Film Title', 
    COUNT(film_id) As 'Times Rented'
FROM rental R
LEFT JOIN inventory I
	USING(inventory_id)
LEFT JOIN film AS F
	USING(film_id)
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

  -- f. Write a query to display how much business, in dollars, each store brought in.
SELECT 
	store_id AS 'Store #', 
    SUM(amount) AS 'Store Revenue'
FROM payment P
JOIN staff S
	ON S.staff_id = P.staff_id
GROUP BY store_id;

  -- g. Write a query to display for each store its store ID, city, and country.
SELECT 
	store_id AS 'ID#', 
    city AS 'City', 
    country AS 'Country' 
FROM store S
INNER JOIN address A
	USING(address_id)
INNER JOIN city C
	USING(city_id)
INNER JOIN country D
USING(country_id); 

  -- h. What are the top 5 genres in gross revenue (descending order). 
SELECT 
	C.category_id AS 'ID#', 
    C.name AS 'Genre', 
    SUM(P.amount) as 'Genre Revenue'
FROM payment P 
JOIN rental R
	USING(rental_id)
JOIN inventory I
	USING(inventory_id)
JOIN film_category FC
	USING(film_id)
JOIN category C
	USING (category_id)
GROUP BY category_id
ORDER BY 'Genre Revenue' DESC
LIMIT 5;

-- ----------------------------------
### 8 ###______________________________________________________________________________________________________
  -- a. Create view for top 5 genres in gross revenue (solution of 7h).
CREATE VIEW TopFiveGenres AS
SELECT 
	C.category_id AS 'ID#', 
    C.name AS 'Genre', 
    SUM(P.amount) as 'Genre Revenue'
FROM payment P 
JOIN rental R
	USING(rental_id)
JOIN inventory I
	USING(inventory_id)
JOIN film_category FC
	USING(film_id)
JOIN category C
	USING (category_id)
GROUP BY category_id
ORDER BY 'Genre Revenue' DESC
LIMIT 5;
  -- b. How would you display the view that you created in 8a?
-- Views can be queried like tables:
SELECT * FROM TopFiveGenres; 
  
  -- c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.
DROP VIEW IF EXISTS TopFiveGenres;