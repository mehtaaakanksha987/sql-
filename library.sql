create database library;
use library;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
select * from books;
##concatenate functions ##
select author_fname,author_lname 
from books;

##uses of concatenate function ##
##enumerate multiple fields of data.##
##Using the aggregators function (GROUNDBY)##
##it returns a string value if a group contains a min value##
##of NULL. A default value will not be returned##

select concat("hello","world");
select concat ("hello",".....","world");
select 
concat(author_fname,'',author_lname)
from books ;

select 
concat(author_fname,'  ',author_lname)
from books ;

select 
concat(author_fname,'',author_lname) as jumbum 
from books;

## concatenating using the aliases ##
select 
author_fname as first,
author_lname as last,
concat 
(author_fname,' ',author_lname) AS full
from books ; 
select * from books ;

##concatenating with the separator ##
##concat_ws##
##concatenating multiple fields with the symbol situated between both ##
select 
concat (title,"-", author_fname,"-", author_lname)
from books ;

##CONCAT_WS() is used to prevent the repeated typing of the ##
## sign in a certain string##
select 
concat_ws(' - ',title, author_fname, author_lname)
from books;

SELECT 
CONCAT_WS('-','!',title, author_fname, author_lname)
FROM BOOKS;

##SUBSTRINGS##
##to select the individual strings or the parts of the strings ##
select substring("hello world" ,1,4);
select substring('hello world' , 7);
select substring("hello world",5,8);
select SUBSTRING('A Heartbreaking Work of Staggering Genius', 1,10);
SELECT SUBSTRING("Where I'm Calling From: Selected Stories",1,10);
SELECT SUBSTRING(TITLE ,1,10) AS SHORT_TITLE
FROM BOOKS;

SELECT SUBSTR(TITLE,1,10)
FROM BOOKS;
SELECT CONCAT(SUBSTRING(TITLE,1,10),"..."
)
FROM BOOKS;

Select 
concat(substring(title,3,7),'.....')
from books;

select 
concat(substring(title,-3,4),"---")
from books;

##replace##
##replaces parts of strings ##

select replace ("hello world", "l",7);
select replace ("hello world ",6,10);

##replace can replace multiple items ##
select
replace ('cheese bread coffee milk ', ' ', ' and ');
select replace ('The Namesake' , "e" , 3)
from books ;
select replace (title ,"t",1)
from books ;
select replace ( "jhumpa lahiri" ,"i",4)
from books ;
select replace ("jhumpa lahiri" , "jhumpa" , "aestro")
from books ;
select * from books;   

##using concatenate and replace together ##
select 
substring(
replace (title , "e",3) , 1,10)
from books;

select substring(
replace 
('Just Kids', "d",2),1,3
)
from books;

##using reverse function ##
select 
reverse ("hello world");

select reverse 
(
'A Hologram for the King: A Novel'
)
from books;

select reverse("meow meow");

select reverse ("jhumpa lahiri")
from books ;

select reverse (author_fname)
from books ;

select reverse (author_lname)
from books ;

select concat 
(author_fname), 
reverse (author_lname )
from books ;

select concat 
(author_fname),"...",
reverse(author_fname)
from books;

select * from books ;

select concat 
(title ), "     " ,
reverse (author_fname)
from books;

##charlength##
 select char_length("hello world");
 use library;
 select author_lname, char_length(author_lname) as length
 from books;
 select author_fname , char_length(author_fname) as last
 from books ;
 select char_length( 
 concat(author_Fname, reverse(author_fname)))
 from books;
 
 select concat(author_lname, " is " , 
 char_length(author_lname)), 'characters_long'
 from books;
 
 ##upper and lower ; change the string's case ##
 select upper ("Hello World");
 select lower ("UPPER WORLD");
 select upper(title)
 from books;
 select concat(upper(author_lname), reverse(author_fname))
 from books;
 select concat('MY FAVOURITE BOOK IS THE', UPPER(TITLE)) 
 FROM BOOKS;
 select concat ("this libraray sucks", reverse(author_lname))
 from books;

##exercises##
##reverse the statement why does my cat look at me with such hatred##
select reverse("why does my cat look at me with such hatred");
 select reverse(upper("why does my cat look at me with such hatred"));

##uppercase the statement why does my cat look at me with such hatred##
select 
upper ("why does my cat look at me with such hatred");

## what is the output to the following ##
select 
replace 
(
concat('I', ' ' ,'like', ' ' , 'cats'),
' ',
'_'
); 

##replace spaces in the titles with '->'
select replace(title ,' ','->') as title
from books;

##print author's name in uppercase ##
select 
concat(upper(author_fname)  , "  " , 
upper(author_lname))
from books;

select author_lname as forwards ,
author_fname as backwards 
from books;

select * from books;
select 
concat((title), " was released in " , released_year )
from books;

##print book titles and the name of the title ##
select 
title , character_length(title) as character_count
from books ;

select * from books ;
## combines short tiltle , author , quantity##

##section 8 :refining our selections##
use library;
insert into books 
(title, author_fname,author_lname , released_year, stock_quantity, pages)
values 
("10% happier", "Dan", "harris", 2014,29,256 ),
("fake_book", "Freida", "Harris", 2001, 287,428),
("Lincoln In the Bardo","George","saunders",2017,1000,367);
select * from books ;

##use distinct##
## in conjunction with select ##
##to remove the duplicates##
 
select 
distinct author_lname 
from books;

desc books;
select distinct
author_fname 
from books;

select 
distinct title 
from books;

select 
distinct released_year 
from books ;

##advanced version of distinct##
select distinct author_lname 
from books; ## in this case the authors with the same last names get deleted , so to get all the authors including the ones with the same last name tghe dollowing command wont work ##
## one way is to use concatenate function ##

select
distinct( 
concat(author_fname ," " , author_lname))  
from books;

select 
distinct author_fname, author_lname 
from books;

## order by ##
select title 
from books 
order by author_lname;
select title from books;

select title 
from books 
order by title desc;

select distinct title 
from books 
order by title desc;

select title 
from books 
order by title desc;

select title 
from books 
order by  title asc ;

select author_lname 
from books 
order by author_lname;

select distinct author_lname 
from books 
order by author_lname;

select released_year 
from books 
order by released_year;
select * from books;
desc books;

select released_year 
from books 
order by released_year desc;

##multiple entries##
select distinct
title,
released_year,
pages
from books 
order by released_year;

## order by 2 /1/3/ is the number of the place that particular variable is on whichwe want to run order by ##
select distinct title , 
pages, 
author_fname , 
author_lname 
from books 
order by 2 desc;

select author_lname , 
released_year , 
author_fname 
from books 
order by 1;

##order by 2 different columns ##
select pages , 
author_fname,
author_lname ,
released_year
from books 
order by author_fname , pages;

select Author_fname ,
author_lname
from books 
order by author_lname, author_fname;

##using limit##
select title from books 
limit 10;

select author_fname 
from books 
limit 4;

select * from books 
limit 3 ;

##select the 5 most recently released books ##
select  title , released_year 
from books 
order by released_year desc
limit 5;

select * from books ;
drop table books;

select title , released_year 
from books 
order by released_year 
 limit 0,5;  ## tells you the starting and the last point ##
 
select author_fname ,
pages ,
author_lname,
released_year 
from books 
limit 3,7; 
## use is where there is a blog site with thousands and tens of thousands of articles and cannot show him all the articles , so we start with the latest number of posts say limited to 10 and then on the next page it will start from 11 and so on and so forth ##
## in case of pagenation ##
select * from books limit 95,18446744073709551615; ## as mentioned in the libraray ##
 
##like function ##
##helps in convenient and better searching of the data##

select title , author_fname 
from books
where author_fname like "%j%"; 

select title , author_fname 
from books 
where author_fname like "%da%";

select pages , title , author_fname 
from books 
where author_fname like "da%";

select author_fname , author_lname 
from books 
where title like '%the%';

##USE OF UNDERSCORE##
SELECT * FROM BOOKS;
USE LIBRARY;
SELECT * FROM BOOKS;

select title , stock_quantity 
from books;

select title , 
stock_quantity 
from books where 
stock_quantity like '____';

select title , stock_quantity from 
books 
where stock_quantity like "__";

desc books;
select title , 
author_lname ,
pages,
author_fname from books
where 
pages like "_" and author_fname like "a___";

select title from books
where title like "%";
select title from books 
where title like "%\_%";

select title , author_fname from books 
where author_fname like "__\%";
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
("20% happier ", "Rumi","narayan",2022,356,790),
("%250 times love is in the air","vaishnavi" , "sanaya" , 2019, 1123,650),
("40 times % of love ", "amir" , "zakiri", 1990, 1000 , 611),
(" ramsay's love for kitchen is 20% of what he has to offer " , "ashley", "jordan", 2016, 311,250),
("all is withing 20% human", "amayra" , "suzanne " , 2003 , 2156 , 1500);
select * from books ;

select title 
from books 
where title like "%%\%%%";

select title 
from books 
where title like "\%%";

select author_fname , title ,pages 
from books 
where author_fname like "da%";

select author_fname , title, pages , released_year
from books 
where 
pages like "___" and author_fname like "%da%";

select title 
from books 
where title like "%%\_%%";

##exercises ##
## select title where the books contain stories##
##select all stories collections ##
select title from books
where title like "%stories";

##select the title form the books where the pages =634##
select title from books 
where pages = 634;

##find the longest book ##
select title , pages from books 
order by pages desc limit 5;

select * from books;

##print a ##summary containing the title and year for the 3 most recent books##
select released_year , title 
from books 
order by title asc
limit 10;

select concat(title , "   " , released_year) 
from books 
order by released_year desc limit 10;

##find all the books with an author_lname that contains a space ##
select title , author_lname 
from books 
where author_lname like "% %";

## find 3 books with the lowest stock ##
select title, released_year, stock_quantity 
from books 
order by stock_quantity asc 
limit 3;

## print title and author last name , sorted first by the authopr _lname and then by title ##
select title , author_lname 
from books 
order by author_lname ,title;

select title , author_lname 
from books 
order by 2,1;

##sort the last name alphabetically ##
select 
concat(upper("my favourite author is " ), "  " , upper(author_fname),"  " ,upper(author_lname) , "!") as yell
from books 
order by author_lname;
 
##section 9 ##
## magic of aggregate functions##
##count function ##
##how many books are in our dsatabase ##
select 
* 
from books;
select count(title)
from books;

select count(*)
from books;

##count fnames from the database##
select 
count(author_fname)
from books;

select author_fname from books;
select count(author_lname)
from books;

##select distinct names##
select count(distinct(author_fname))
from books;

select count(distinct(author_lname))
from books;

## how many titles contain "the" ##
select 
count(title)
from books 
where 
title like "%the%";

select title from books 
where 
title like "%the%";

## group by ##
## group by summarizes or aggregates the identical data into single rows##
select author_lname , count(*)
from books
group by author_lname limit 3;

select
author_fname , 
author_lname ,
count(*)
from books 
group by author_lname;

select title 
author_fname, 
author_lname ,
released_year
from books ;

select released_year,
count(*)
from books 
group by released_year;

use library;
select concat(' in the released_year',' ' ,  count(*) , 
'book(s) released ') AS year 
from books;

select title , 
author_lname 
from books 
group by author_lname;

## MIN & MAX ##
## without group by ##
## find the lowest / minimum released year from our table ##
select 
min(released_year)
from books;

select min(pages)
from books;

select max(pages)
from books;

select max(released_year)
from books;

## what if I want to get the longest title of the book ##
## running the subqueries ##
select title , pages from books 
where pages = (select max(pages) from books);

## the shortest title of the book##
select title , pages from books 
where pages = (select min(pages) from books);
## this above query is slow ## 

select * from books 
order by pages asc limit 1;

select * from books 
order by pages desc limit 1 ;

## min and max using group by ##
##find the each year author published their first book ##
select title , min(released_year), author_lname , author_fname 
from books;

## find the year each author published their first book ##
select 
author_fname , 
author_lname ,
min(released_year)
from books
group by author_fname ,
author_lname ;

## find the longest page count for each author ##
select title, 
author_fname,
author_lname,
max(pages)
from books 
group by author_lname , 
author_fname ;

select
concat(author_fname,'  ' , author_lname)
AS author,
max(pages) as 'longest book'
from books
group by author_lname,
author_fname;

##sum function ##
## sum all the pages in the entire database ##
select sum(pages)
from books;

select sum(released_year)
from books;

## sum of all the pages every author has written ##
select author_fname ,
author_lname ,
sum(pages)
from books 
group by author_lname ,
author_fname ;

## sum of all the released year in which every author has chosen to release the book ##
select author_fname ,
author_lname, 
sum(released_year)
from books 
group by author_lname,
author_fname ;

## average function (avg) ##
select  
avg(pages) 
from books ;

## calculate the average released year across all the books ##
select avg (released_year)
from books;

select avg(pages)
from books;

##calculate the average released year across the books ##
select avg(released_year)
from books ;

## calculate the average stock quantity for the books released the same year ##
select released_year , 
avg (stock_quantity)
from books 
group by released_year;

select author_fname , 
author_lname ,
avg(pages)
from books 
group by author_lname , author_fname;

## challenges ##
## print the number of books in the data base ##
select count(*)
from books;

## print how many books were released in each year ##
select released_year,
count(*) 
from 
books 
group by released_year;

## print out the total number of books in the stock ##
select * from books ;
select sum(stock_quantity)
from books;

## find the average released year for each author ##
select 
avg(released_year)
from books 
group by author_lname , 
author_fname ;

## find the full name of the author who wrote the longest book ##
select concat(author_lname ,'   '  ,  author_fname) as sum
from books 
where pages = 634;

select concat(author_lname,"  ", author_fname) as sum 
from books 
where 
pages = (select max(pages)from books);

select author_lname ,
author_fname , 
max(pages)
from 
books limit 1 ;

select 
concat(author_fname, '  ' , author_lname, pages )
from books 
order by pages desc limit 1 ;

use library;
##select the full name of the author who arote the longest book ##
select 
released_year AS year , 
count(*) as "# books",
avg(pages) as "avg pages"
from 
books 
group by released_year;

## char & varchar##
## storing text ##
## char has a fixed length ##
## char is faster for the fixed length text##
use library;
create database new_testing_db;
drop table dogs;
create table dogs
(name char(5),
breed varchar(10));
insert into dogs(name , breed)
values("bob","beagle"),
("robby", "corgy"),
("ane" , "retriever");
select * from dogs;

## numbers ##
## decimals ##
use library;
## decimal (5,2) == total no of digits is 5 and 2 denotes the number of digits after the dot ##
create table items 
(price decimal (5,2));
insert into items (price )
values (7);
insert into items (price)
values (79.71);
insert into items (price)
values (34.88);
insert into items (price)
values (298.99);
insert into items (price)
values (7.99);
select * from items;
select * from books;

## float & double ##
## the decimal data type is a fixed point type and the calculations are exact ##
## float and double data types are floating point types and the calculations are approximate ##
## store larger numbers and lesser space is the advantage of the float and dopuble data typrs ##
## it comes at the cost of precision ##
##  which numerical data type shouls we use in case of the financial data - decimals ##
##and the cases where the precison doesnt matter then the float can be used ##
create table thingies (price decimal);
insert into thingies (price) value (88.45); 
insert into thingies (price) value(8877665544.45);
select * from thingies;
##FLOAT IS MORE PRECISE##
##WHICH NUMERIC DATA TYPE SHPULD WE USE WHEN WE ARE STORING HUGE NUMBERS ESP DECIMALS ? DECIMALS##
CREATE TABLE THINGIES_2 (PRICE FLOAT);
insert into thingies_2(price)
values 
(88.45);
select * from thingies_2;
insert into thingies_2(price)
values 
(8877.45);
select * from thingies_2;
insert into thingies_2(price)
values 
(8877665544.45);## it will place the first 7 digits and truncates the later points ##
select * from thingies_2;

## select the data and time ##
## date: values with a date but no time format ==> "yyyy-mm-dd"##
## time : values with a time and no date ==> works well in the situations when the reminders are at play ; format being " HH:MM:SS "##
## datetime : values with a date and time ==> used in the scenarios such as the user signed up for the website or when the facebook user commented on the post . the format of the datetime is : 
##format : "yyyy-mm-dd hh:mm:ss"##

##exercises : lets try them out ##
create table people
(name varchar(200) ,
birthdate date,
birthtime time ,
birthdt datetime);
desc people;
insert into people (name,birthdate,birthtime,birthdt)
values 
("padma ", " 1983-11-11", "10:07:35", " 1983-11-11 10:07:35");
 insert into people (name,birthdate,birthtime,birthdt)
values 
("larry" ,"1943-12-25" , "04:10:42" , "1943-12-25 04:10:42");
select * from people ;
CREATE DATABASE CITU;
USE CITU;
create table a_citu
(name_occupant varchar(500),
citu_id int primary key auto_increment,
sector int,
name varchar(700));
desc a_citu;

insert into a_citu(name_occupant,sector,name)
values
 ("adarsh", 21, "vaishnav");
 insert into a_citu(name_occupant,sector,name)
values
 ("ronit",31,"kaustav");
 insert into a_citu(name_occupant,sector,name)
values
 ("Ravi",26,"abnhishtha ");
  insert into a_citu(name_occupant,sector,name)
values
 ("aakanksha",45,"meenarviksha");
 insert into a_citu(name_occupant,sector,name)
values
( "amayra",19,"rashtihbha");
insert into a_citu(name_occupant,sector,name)
values
 ("avirak",23,"timarta");
 select * from a_citu;
 
 select max(sector)from 
 a_citu;
 
select max(sector)
from a_citu
order by sector
desc;

SELECT name, MAX(sector) AS SC
  FROM a_citu
 WHERE sector < (SELECT MAX(SECTOR) 
                 FROM a_citu
                 WHERE SECTOR < (SELECT MAX(SECTOR)
                 FROM a_citu)
                ); 
                
select * from a_citu;

select name , max(sector) as sector 
from a_citu 
where sector<> (select max(sector)
from a_citu);
 
create database shopping_mart;
use shopping_mart;
create table shopping_items
(ID int primary key auto_increment,
name_article varchar(400),
price int,
place varchar(600));

insert into shopping_items (name_article ,price , place)
values 
("potato", 300, "sushant_lok");
insert into shopping_items (name_article ,price , place)
values
("tomato",85,"brigade");
insert into shopping_items (name_article ,price , place)
values
("paneer",100,"commercials");
insert into shopping_items (name_article ,price , place)
values
("hibiscus",600,"gurgaon_mart");
insert into shopping_items (name_article ,price , place)
values
("tofu",1000,"M.G. road");
insert into shopping_items (name_article ,price , place)
values
("raat_rani",1000,"chandrika enclave ");
insert into shopping_items (name_article ,price , place)
values
("rosemary",350,"bombay bazaar");
insert into shopping_items (name_article ,price , place)
values
("cabbage",100,"worli");
insert into shopping_items (name_article ,price , place)
values
("water chestnuts",300,"keshav");
select * from shopping_items;
select max(price)
from 
shopping_items;
select name_article , max(price) as SP
from shopping_items
where price <> (select max(price)
from shopping_items);

## 3rd highest ##
select ID , max(price)
from shopping_items 
where 
price < (select max(price)
from shopping_items);
select * from shopping_items;





SELECT ID , MAX(PRICE)
FROM SHOPPING_ITEMS 
WHERE 
PRICE<>(SELECT MAX(PRICE)
FROM
SHOPPING_ITEMS);

select * from shopping_items 
where 
price = (select max(price)
from shopping_items )
order by price 
desc 
limit 2;
use shopping_mart;
select * from shopping_items;
select max(price) 
from shopping_items order by price
desc
limit 2;

select concat( max(price), "   "  , "is the highest" , '  ' , ' than' , '   '  ,  min(price))
from shopping_items;

select * from shopping_items;
select concat(place , '   ' , ID , '   '  ," HIGHER THAN " , avg (price))as summary
from shopping_items;

select concat(min(price) , '    ' , '>' ,'   ' , avg(price)) 
as APP 
from shopping_items;

select concat(max(price) , 
"   " , " is equal to " , "   " , sum(price)) as SSP
FROM SHOPPING_ITEMS;

select * from shopping_items;
select place , max(price) as pp 
from shopping_items 
where 
price<> (select max(price)
from shopping_items);

select * from shopping_items;
select avg(price)
from shopping_items 
where 
price !=1000; 

select * from  shopping_items;
select ID , name_article 
from shopping_items 
where price != 300;

select place , ID, price  
from shopping_items 
where 
price>max(price)
group by price ;

SELECT * FROM SHOPPING_ITEMS;
SELECT max(PRICE)
FROM SHOPPING_ITEMS;
SELECT ID , MAX(PRICE)
FROM SHOPPING_ITEMS;

select ID , max(price) as IP 
from 
shopping_items
where 
price<> (select max(price)
from shopping_items);

## date and time ##
## date: without a  time : "yy-mm-dd" --> eg : birthday ##
## Time : values with the time and no date --> hh:min:secs ##
## date time : values with the date and time --> yy-mm-dd hh:min:sec yy-mm-dd  hh:min:sec##
CREATE DATABASE POPULATION ;
CREATE TABLE PEOPLE 
(NAME varchar(100),
BIRTHDATE date , 
BIRTHTIME time , 
birthdt datetime 
);
desc people ;
insert  into PEOPLE  
(NAME , BIRTHDATE,BIRTHTIME,birthdt)
values 
("padma" , "1983-11-11" , "10:07:35", "1983-11-11 10:07:35");
 insert  into PEOPLE  
(NAME , BIRTHDATE,BIRTHTIME,birthdt)
values 
("larry","1943-12-25", "04:10:42","1943-12-25 04:10:42");
select * from people;

## curdate , curtime , now ##
## cur date : current date ##
## curtime : current time ##
## now : gives current date time ##
insert into people 
(NAME , BIRTHDATE,BIRTHTIME,birthdt)
values 
("toaster","2017-04-21","19:12:43","2017-04-21 19:12:43");
select * from people;
SELECT CURDATE();
SELECT NOW();
SELECT CURTIME();
INSERT INTO PEOPLE (NAME , BIRTHDATE,BIRTHTIME,birthdt)
VALUES 
("MICROWAVE ",CURDATE(),CURTIME(),NOW());
SELECT * FROM PEOPLE;
delete from people where 
name ="microwave ";
select * from people ;

##formatting dates##
##In the following lecture, titled "Formatting Dates", there's a small typo around the 13 minute and 50 second mark##
##It should say %i for minute, instead of %m, the correction can also be seen in the CODE lecture##

select name , birthdate from people ;
select day(birthdate)from people;
select birthdate, day(birthdate)from people;
select name , birthdate, dayname(birthdate) from people ;
select dayofweek(birthdate) from people;
select name , dayofyear(birthdate), dayofweek(birthdate)
from people;
select name , birthdate , monthname(birthdate) from people ;

select concat(monthname(birthdate),'  ',day(birthdate),'  ',
year (birthdate))as shorty
from people; 

select date_format("2009-10-04 22:23:00" ,"%W","%M","%Y")
from people ;
