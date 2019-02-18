# Sakila Database Study

## Enhanced entity–relationship model of Sakila Database Included

## The following queries where performed using 'Sakila_Study.sql'

-- 3a (Make sure to research the type `BLOB`, as the difference between it and `VARCHAR` are significant).
-- TEXT and BLOB data types are stored off the table with a designated pointer to the contents.
-- VARCHAR data elements are strings which are stored within the table.

#___#1#____________________________________________________________________________________________________
 -- -------------------------------------------------------------------------------------------------------
  -- a. Display the first and last names of all actors from the table `actor`.
  -- b. Display the first & last name of each actor using all upper case in a single column titled `Actor Name`.
#___#2#____________________________________________________________________________________________________
  -- a. Given an actor's 1st name ('Joe'), How would you query their ID number, last name, (and first name)?
  -- b. Find all actors whose last name contains the letters `GEN`.
   -- c. Find all actors whose last name contains letters `LI`, & order the rows by last name then first name.
  -- d. Using `IN`, display `country_id` & `country` of the following: Afghanistan, Bangladesh, & China.
#___#3#____________________________________________________________________________________________________
  -- a. For a place to store actor descriptions, create `actor`.`description` and use the data type `BLOB`.
  -- b. Delete the `description` column.
#___#4#____________________________________________________________________________________________________
  -- a. List the last names of actors, as well as the number of records sharing that last name.
  -- b. List last names of actors, & the number of records sharing that last name, only for shared names.
  -- c. Write a Corrective Query to Change actor `GROUCHO WILLIAMS` to `HARPO WILLIAMS`.
   -- d. Change it back: If the first name of the actor is currently `HARPO`, change it to `GROUCHO`.
#___#5#____________________________________________________________________________________________________
  -- a. You cannot locate the schema of the `address` table. Which query would you use to re-create it?
#___#6#____________________________________________________________________________________________________
  -- a. Use `JOIN` to display the first and last names, as well as the address, of each staff member.
  -- b. Use `JOIN` to display total staff member sales in August 2005. Use tables `staff` & `payment`.
  -- c. List each film & number of actors listed for it. Use INNER JOIN on tables `film_actor` & `film`.
  -- d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
  -- e. JOIN tables `payment` & `customer` & list total paid per customer, sorting last name alphabetically.
#___#7#____________________________________________________________________________________________________
  -- a. Use subqueries to display titles of movies starting w/ letters `K` & `Q` whose language is English.
  -- b. Use subqueries to display all actors who appear in the film `Alone Trip`.
  -- c. Retrieve names & email addresses of all Canadian customers using JOINs.
  -- d. Query all films in the category 'Family'.
  -- e. Display the most frequently rented movies in descending order.
   -- f. Write a query to display how much business, in dollars, each store brought in.
  -- g. Write a query to display for each store its store ID, city, and country.
  -- h. What are the top 5 genres in gross revenue (descending order).
#___#8#____________________________________________________________________________________________________
  -- a. Create view for top 5 genres in gross revenue (solution of 7h).
  -- b. How would you display the view that you created in 8a?
  -- c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.
