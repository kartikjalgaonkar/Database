SELECT COUNT(RATING) FROM CUSTOMER WHERE RATING IS NOT NULL;

/*Write a query that gives the names of both the salesperson and the customer for each order after the order number*/

SELECT ORDERS.ONUM, SALESPEOPLE.SNAME, CUSTOMER.CNAME FROM 
CUSTOMER INNER JOIN ORDERS ON CUSTOMER.CNUM = ORDERS.CNUM INNER JOIN SALESPEOPLE ON SALESPEOPLE.SNUM = CUSTOMER.SNUM;

/*Count the number of Salespeople registering orders for each day. 
(If a salespersons has more than one order on given day, he or she should be counted only once).*/
SELECT SALESPEOPLE.SNAME, IF (COUNT(*) >1, 1, COUNT(*)) AS ORDERS_EACH_DAY FROM SALESPEOPLE INNER JOIN ORDERS ON SALESPEOPLE.SNUM = ORDERS.SNUM GROUP BY SALESPEOPLE.SNAME;

/* Find all orders attributed to salespeople in London.*/

SELECT ORDERS.* FROM SALESPEOPLE INNER JOIN ORDERS ON SALESPEOPLE.SNUM = ORDERS.SNUM WHERE SALESPEOPLE.CITY='LONDON';

/*Find all salespeople who have customers with more than one current order*/

SELECT SALESPEOPLE.SNAME, COUNT(*) FROM SALESPEOPLE INNER JOIN CUSTOMER ON SALESPEOPLE.SNUM = CUSTOMER.SNUM 
INNER JOIN ORDERS ON SALESPEOPLE.SNUM=ORDERS.SNUM GROUP BY SALESPEOPLE.SNAME HAVING COUNT(*)>1;

/*  Write a query that selects all customers whose names begins with ‘C’.*/
SELECT * FROM CUSTOMER WHERE CNAME LIKE 'C%';

-- /*Write a query on the Customers table that will find the highest rating in each city.
-- Put the output in this form: for the City (city) the highest rating is: (rating)*/
-- 
-- SELECT C1.CITY, MAX(C1.RATING) FROM CUSTOMER C1, CUSTOMER C2 WHERE C1.CITY=C2.CITY AND C1.CNUM <> C2.CNUM GROUP BY C1.CNAME;
-- SELECT C1.CITY FROM CUSTOMER C1 W

/*  Write a query that selects each customer’s smallest order.*/
SELECT cnum, MIN(amt) FROM orders GROUP BY cnum;

/*Write a query that selects the first customer in alphabetical order whose name begins with G*/
SELECT MIN(CNAME) FROM CUSTOMER WHERE CNAME LIKE 'G%';

/*Write a query that counts the number of different non NULL city values in the Customers table*/
SELECT DISTINCT(CITY),COUNT(*) FROM CUSTOMER WHERE CITY IS NOT NULL GROUP BY CITY;

/*  Find the average amount from the Orders table.*/
SELECT AVG(AMT) FROM ORDERS;

/*  Find all customers who are not located in San Jose and whose rating is above 200.*/
SELECT * FROM CUSTOMER WHERE CITY <> 'SANJOSE' AND RATING > 200;

/*  Does the customer who has placed the maximum number of orders have the maximum rating?*/
SELECT MAX(MYCOUNT) FROM (SELECT COUNT(*) AS MYCOUNT FROM ORDERS GROUP BY CNUM) ORDERS;


/*Find all records in the Customer table with NULL values in the city column*/
SELECT * FROM CUSTOMER WHERE CITY IS NULL;

/*Arrange the Orders table by descending customer number.*/
SELECT * FROM ORDERS ORDER BY CNUM DESC;

/*Find which salespeople currently have orders in the Orders table.*/
SELECT DISTINCT SALESPEOPLE.SNAME FROM SALESPEOPLE INNER JOIN ORDERS ON SALESPEOPLE.SNUM = ORDERS.SNUM;

/*Find the names and numbers of all salespeople who had more the one customer.*/
SELECT sname, snum
FROM salespeople
WHERE snum IN ( SELECT snum
                             FROM customer
                             GROUP BY snum
                             HAVING COUNT(snum) > 1 );


/*Count the orders of each of the salespeople and output the results in descending order.*/
SELECT SALESPEOPLE.SNAME,COUNT(*) AS COUNT_OF_ORDER FROM SALESPEOPLE INNER JOIN orders ON SALESPEOPLE.SNUM=ORDERS.SNUM GROUP BY SALESPEOPLE.SNAME ORDER BY COUNT_OF_ORDER DESC;

/*List the Customer table if and only if one or more of the Customers in the Customer table are located in San Jose.*/
SELECT * FROM customer WHERE CITY = 'SANJOSE';


/*Find the largest order taken by each salesperson.*/
SELECT SALESPEOPLE.SNAME, MAX(ORDERS.AMT) FROM SALESPEOPLE INNER JOIN ORDERS ON SALESPEOPLE.SNUM = ORDERS.SNUM GROUP BY SALESPEOPLE.SNAME;


/*Find customers in San Jose who have a rating above 200.*/
SELECT * FROM CUSTOMER WHERE CITY = 'SANJOSE' AND RATING > 200;

/*List all the orders of salesperson Motika from the Orders table.*/
SELECT ORDERS.* FROM ORDERS INNER JOIN SALESPEOPLE ON ORDERS.SNUM=SALESPEOPLE.SNUM WHERE SALESPEOPLE.SNAME = 'MOTIKA';

/*Find salespeople who have multiple customers.*/
SELECT * FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM CUSTOMER GROUP BY SNUM HAVING COUNT(*)>1);

/*Find salespeople with customers located in their city.*/
SELECT SALESPEOPLE.SNAME FROM SALESPEOPLE WHERE SNUM IN(SELECT SNUM FROM CUSTOMER WHERE SALESPEOPLE.CITY = CUSTOMER.CITY);

/*Find the largest orders for serres and Rifkin.*/
SELECT MAX(AMT) FROM ORDERS WHERE SNUM IN (SELECT SNUM FROM SALESPEOPLE WHERE SNAME IN ('SERRES','RIKKLIN') ) GROUP BY SNUM;


/*Find all salespeople that are located in either Barcelona or London.*/
SELECT SALESPEOPLE.SNAME FROM SALESPEOPLE WHERE CITY IN ('Barcelona','London');

/*Find all salespeople with only one customer.*/
SELECT SALESPEOPLE.SNAME FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM CUSTOMER GROUP BY SNUM HAVING COUNT(*)=1);

/*Find salespeople whose sales is greater the avg sales*/
-- SELECT SALESPEOPLE.* FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM ORDERS );


SELECT * FROM salespeople WHERE snum IN(SELECT snum FROM orders WHERE amt >(SELECT AVG(amt) FROM orders));






