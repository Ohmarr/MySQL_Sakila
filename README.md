# Homework Assignment

* 1
  ** a. Display the first and last names of all actors from the table `actor`.
  ** b. Display the first and last name of each actor using all upper case in a single column titled `Actor Name`.

* 2
  ** a. Given only the first name of an actor, which query would you use to find their ID number, last name, (and first name)?
  ** b. Find all actors whose last name contains the letters `GEN`.
  ** c. Find all actors whose last name contains the letters `LI`, & order the rows by last name then first name.
  ** d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China.

* 3
  ** a. For a place to store actor descriptions, create a column in the table `actor` named `description` and use the data type `BLOB`.
    **** (Make sure to research the type `BLOB`, as the difference between it and `VARCHAR` are significant).
  ** b. Delete the `description` column.

* 4
  ** a. List the last names of actors, as well as the number of records sharing that last name.
  ** b. List the last names of actors, as well as the number of records sharing that last name, only for names that are shared.
  ** c. The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`. Write a query to fix the record.
  ** d. Change it back: In a single query, if the first name of the actor is currently `HARPO`, change it to `GROUCHO`.

* 5
  ** a. You cannot locate the schema of the `address` table. Which query would you use to re-create it?
    **** Hint: [https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html](https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html)
* 6
  ** a. Use `JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address`:
  ** b. Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`.
  ** c. List each film and the number of actors who are listed for that film. Use an INNER JOIN on tables `film_actor` and `film`.
  ** d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
  ** e. Using a JOIN on tables `payment` & `customer` to list the total paid by each customer, sorting customers alphabetically by last name.

* 7
  ** a. Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English.
  ** b. Use subqueries to display all actors who appear in the film `Alone Trip`.
  ** c. Retrieve names & email addresses of all Canadian customers using JOINs.
  ** d. Query all films in the category _family_.
  ** e. Display the most frequently rented movies in descending order.
  ** f. Write a query to display how much business, in dollars, each store brought in.
  ** g. Write a query to display for each store its store ID, city, and country.
  ** h. What are the top 5 genres in gross revenue (descending order). (Hint: tables: category, film_category, inventory, payment, & rental.)

* 8
  ** a. Create view for top 5 genres in gross revenue (solution of 7h).
  ** b. How would you display the view that you created in 8a?
  ** c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.
