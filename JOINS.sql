## relationships that the data has ##
## one to one , one to many , many to many ##
## one to many relatnionship is very common ##
##one to many relationship ## easier to get through and the one is exteremt common ##
create database company_OB ;
use  company_OB;
drop table companies;
CREATE TABLE customers (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email_id VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_ID INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);

INSERT INTO customers (first_name, last_name, email_id) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
drop table orders;
SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    orders;

## select all the orders placed by boy george ##
## way 1 of doing that ##
SELECT 
    id
FROM
    customers
WHERE
    last_name = 'george';

SELECT 
    *
FROM
    orders
WHERE
    customer_id = 1;

SELECT 
    *
FROM
    customers;

##what  do we do  in case of the multiple entries ##
SELECT 
    *
FROM
    customers
WHERE
    id = (SELECT 
            id
        FROM
            customers
        WHERE
            last_name = 'george'); 
            
## applying joins ##
## cross join / cartesian join ##
## every single row from the order table will get joined with the customer table without any considered criteria ##
SELECT 
    *
FROM
    customers,
    orders;
## INNER JOINS , LEFT JOINS AND RIGHT JOINS ##
## INNER JOIN ##
SELECT 
    *
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id;

SELECT 
    first_name, last_name, amount, order_date
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id;
    
SELECT 
    *
FROM
    orders
        JOIN
    customers ON customers.id = orders.customer_id;
 
SELECT 
    *
FROM
    customers;
    
SELECT 
    *
FROM
    orders; 

SELECT 
    first_name, last_name
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.ID;
## WHEN WE ARE NOT MENTIONING INNER JOIN , SIMPLY A JOIN WILL MEAN INNER JOIN BY DEFAULT ##
## inner joins by using group by ##
 drop table orders;
 drop table customers;
 CREATE TABLE customers (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email_id VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_ID INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);

SELECT 
    first_name, last_name, SUM(amount) as total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
order by total desc
;

## left join ##
select first_name , last_name , order_date
from customers
join 
orders on
customers.id=orders.customer_id; 

select * from orders ;

SELECT 
    order_id, order_date, last_name, first_name
FROM
    orders
        JOIN
    customers ON orders.order_id = customers.id;

SELECT 
    order_id,
    customer_id,
    first_name,
    last_name,
    SUM(amount)
    FROM
    customers 
        left JOIN
    orders ON customers.id=orders.customer_id ;
    
select first_name , last_name , order_date , amount 
from customers 
left join 
orders 
on 
orders.customer_id=customers.id;

## purpose of the left join .in case I want to know the users who have never purchased any order and left join will give me an idea about the same and show the ones without a value placed at null ##
## inner join on the contrary will just place all the rows together and not the specific value specific requirement ##
select * from customers ;
SELECT 
    *
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;
    
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;
    select * from orders ;
    
## group by ##
## customers on the left ##
SELECT 
    first_name, last_name, amount
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id;

## We dont want to see a null value in the table instead we are going to replace it with a value equivalent to zero##
 
    select first_name , last_name ,IFNULL(SUM(AMOUNT),0)
    from customers 
    left join orders 
    on customers.id=orders.customer_id 
    group by first_name , last_name;
    
SELECT 
    customer_id,
    order_id,
    last_name,
    first_name,
    IFNULL(SUM(amount), 0)
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY last_name , first_name;


## right join ##
SELECT 
    first_name, last_name, order_date, IFNULL(amount, 0)
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id;

desc  orders ;
 
 ## on delete cascade ##
## when we delete a customer from our customer base ##
delete from customers 
where last_name="george"; ## this will give us an error ##

##on delete cascascade ##
drop table orders;
drop table customers;

CREATE TABLE customers (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email_id VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_ID INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);
        
SELECT 
    *
FROM
    ORDERS;
    
DELETE FROM CUSTOMERS 
where 
last_name="george";

        
INSERT INTO customers (first_name, last_name, email_id) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

## exercises ##
create database unive_marks;
use unive_marks;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (student_id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;
select * from papers;

## using joins print the firstname , title , grade ##
select first_name , title , grade 
from students
join 
papers
on students.student_id= papers.student_id
order by grade desc ;

## print the first_name , title , grade displaying the null values as well ##
select first_name , title , grade 
from students 
left join 
papers on
students.student_id = papers.student_id ;

## for printing first_name , title, grade while replacing the null values wuth missing ##
select first_name , ifnull(title,"missing"), ifnull(grade,0) 
from students
left join
papers 
on 
students.student_id=papers.student_id;

## print the first_name, average with the null values replaced with a zero##
select first_name , ifnull(avg(grade),0)
from students  
left join
papers 
on students.student_id=papers.student_id
group by first_name 
order by grade desc;
 
## many to many joins ##
create database television ;
CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);
 drop table reviews;
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2 , 1 ),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id)
        REFERENCES series (id) on delete cascade,
    FOREIGN KEY (reviewer_id) 
        REFERENCES reviewers (id) on delete cascade
);
 
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    select * from reviews;
    select * from reviewers;
    select * from series ;

## tv series challenges ##
## write a query that shows the title and rating in the tabluar format##
##title = series ; rating --> reviews ##

SELECT 
    title, rating
FROM
    series
        LEFT JOIN
    reviews ON series.id = reviews.id
LIMIT 15;

## write a query to display title and avg rating from the above mentioned tables ##
SELECT 
    title, AVG(rating) AS avg_rating
FROM
    series
        LEFT JOIN
    reviews ON series.id = reviews.id
GROUP BY title
ORDER BY rating ASC;

##rounding off ##
SELECT 
    title, round(AVG(rating),2) AS avg_rating
FROM
    series
        LEFT JOIN
    reviews ON series.id = reviews.id
GROUP BY title
ORDER BY rating ASC;

##write a query to display first_name , last_name , rating##
##reviewers = first_name , last_name ##
##rating = reviews##
SELECT 
    *
FROM
    reviews;
SELECT 
    *
FROM
    reviewers;
    
SELECT 
    first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviews.id=reviewers.id;

SELECT 
   first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviews.id=reviewers.id;

SELECT 
    first_name, last_name, rating
FROM
    reviewers
        JOIN
    reviews ON reviews.reviewer_id = reviewers.id;
    
## write a query to display unreviewed series ##
SELECT 
    title as unreviewd_series
FROM
    reviews
        right JOIN
    series ON series.id = reviews.series_id
    where rating is null ;
 
##write a query to display genre , ratings from the above mentioned tables ##
##genre --> series ##
SELECT 
    *
FROM
    series;

SELECT 
    *
FROM
    reviews;
## rating --> reviews ##
SELECT 
    genre, AVG(rating) AS avg_rating
FROM
    series
        LEFT JOIN
    reviews ON reviews.id = reviews.series_id
GROUP BY genre
ORDER BY rating;

select * from reviews; ##rating ##
select * from reviewers;##first_name , last_name ##
select * from series;
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
        INNER JOIN
    series ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviewers
        INNER JOIN
    reviews ON reviews.reviewer_id = reviewers.id
        INNER JOIN
    series ON reviews.series_id = series.id;
