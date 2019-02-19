<h1 align=center> Sakila Database Study </h1>

![EER](src='Sakila_Screenshot.jpg')

### A basic study was conducted of the Sakila Database.  All queries were performed in `Sakila_Study.sql` and are summarize below.  
#### An `Enhanced entity–relationship (EER) model` of the Sakila Database is included<br>
#### The difference between dataypes TEXT and BLOB:
 ##### `TEXT`/`BLOB`: NOT stored in a table, but pointer to memory is mapped. <br>
 ##### `VARCHAR`: strings stored within a table in the database. <br>

<hr>

- #### 1<br>
  a. Display the first and last names of all actors from the table `actor`.<br>
  b. Display the first & last name of each actor using all upper case in a single column titled `Actor Name`.<br>
<hr>

- #### 2<br>
  a. Given an actor's 1st name ('Joe'), How would you query their ID number, last name, (and first name)?<br>
  b. Find all actors whose last name contains the letters `GEN`.<br>
  c. Find all actors whose last name contains letters `LI`, & order the rows by last name then first name.<br>
  d. Using `IN`, display `country_id` & `country` of the following: Afghanistan, Bangladesh, & China.<br>
<hr>

- #### 3<br>
  a. For a place to store actor descriptions, create `actor`.`description` and use the data type `BLOB`.<br>
  b. Delete the `description` column.<br>
<hr>

- #### 4<br>
  a. List the last names of actors, as well as the number of records sharing that last name.<br>
  b. List last names of actors, & the number of records sharing that last name, only for shared names.<br>
  c. Write a Corrective Query to Change actor `GROUCHO WILLIAMS` to `HARPO WILLIAMS`.<br>
  d. Change it back: If the first name of the actor is currently `HARPO`, change it to `GROUCHO`.<br>
<hr>

- #### 5<br>
  a. You cannot locate the schema of the `address` table. Which query would you use to re-create it?<br>
<hr>

- #### 6<br>
  a. Use `JOIN` to display the first and last names, as well as the address, of each staff member.<br>
  b. Use `JOIN` to display total staff member sales in August 2005. Use tables `staff` & `payment`.<br>
  c. List each film & number of actors listed for it. Use INNER JOIN on tables `film_actor` & `film`.<br>
  d. How many copies of the film `Hunchback Impossible` exist in the inventory system?<br>
  e. JOIN tables `payment` & `customer` & list total paid per customer, sorting last name alphabetically.<br>
<hr>

- #### 7<br>
  a. Use subqueries to display titles of movies starting w/ letters `K` & `Q` whose language is English.<br>
  b. Use subqueries to display all actors who appear in the film `Alone Trip`.<br>
  c. Retrieve names & email addresses of all Canadian customers using JOINs.<br>
  d. Query all films in the category 'Family'.<br>
  e. Display the most frequently rented movies in descending order.<br>
  f. Write a query to display how much business, in dollars, each store brought in.<br>
  g. Write a query to display for each store its store ID, city, and country.<br>
  h. What are the top 5 genres in gross revenue (descending order).<br>
<hr>

- #### 8<br>
  a. Create view for top 5 genres in gross revenue (solution of 7h).<br>
  b. How would you display the view that you created in 8a?<br>
  c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.<br>
  
<hr>
