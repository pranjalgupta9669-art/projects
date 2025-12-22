Create database jalaacedmy;
use jalaacedmy;
create table salespeople(
snum int primary key,
sname varchar(30),
city varchar(15),
comm int not null);
create table cust(
cnum int primary key,
cname varchar(20),
city varchar(15),
rating int,
snum int);
create table orders(
onum int primary key,
amt float,
odate date,
cnum int,
snum int);
insert into salespeople values
(1001,"Peel","London",12),
(1002,"Serres", "San Jose",13),
(1004,"Motika","London", 11),
(1007,"Rafkin","Barcelona",15),
(1003,"Axelrod","New york", 1);

insert into cust values
( 2001,"Hoffman","London",100 ,1001),
(2002,"Giovanne","Rome",200,1003),
(2003,"Liu","San Jose",300,1002),
(2004,"Grass", "Brelin",100,1002),
(2006,"Clemens","London",300,1007),
(2007,"Pereira","Rome",100,1004);

INSERT INTO orders VALUES
(3001,18.69,'1994-10-03',2008,1007),
(3003,767.19,'1994-10-03',2001,1001),
(3002,1900.10,'1994-10-03',2007,1004),
(3005,5160.45,'1994-10-03',2003,1002),
(3006,1098.16,'1994-10-04',2008,1007),
(3009,1713.23,'1994-10-04',2002,1003),
(3007,75.75,'1994-10-05',2004,1002),
(3008,4723.00,'1994-10-05',2006,1001),
(3010,1309.95,'1994-10-06',2004,1002),
(3011,9891.88,'1994-10-06',2006,1001);

/* =======================
   1. Display snum,sname,city,comm of all salespeople
======================= */
SELECT snum, sname, city, comm FROM salespeople;

/* 2. Display all snum without duplicates from orders */
SELECT DISTINCT snum FROM orders;

/* 3. Names and commissions of salespeople in London */
SELECT sname, comm FROM salespeople WHERE city = 'London';

/* 4. All customers with rating 100 */
SELECT * FROM cust WHERE rating = 100;

/* 5. Order no, amount and date from orders */
SELECT onum, amt, odate FROM orders;

/* 6. Customers in San Jose with rating > 200 */
SELECT * FROM cust WHERE city = 'San Jose' AND rating > 200;

/* 7. Customers in San Jose OR rating > 200 */
SELECT * FROM cust WHERE city = 'San Jose' OR rating > 200;

/* 8. Orders for more than $1000 */
SELECT * FROM orders WHERE amt > 1000;

/* 9. Salespeople in London with commission > 0.10 */
SELECT sname, city FROM salespeople
WHERE city = 'London' AND comm > 10;

/* 10. Customers excluding rating <=100 unless in Rome */
SELECT * FROM cust
WHERE rating > 100 OR city = 'Rome';

/* 11. Salespeople in Barcelona or London */
SELECT * FROM salespeople
WHERE city IN ('Barcelona','London');

/* 12. Salespeople with commission between 0.10 and 0.12 (exclusive) */
SELECT * FROM salespeople
WHERE comm > 10 AND comm < 12;

/* 13. Customers with NULL city */
SELECT * FROM cust WHERE city IS NULL;

/* 14. Orders on Oct 3 and Oct 4, 1994 */
SELECT * FROM orders
WHERE odate IN ('1994-10-03','1994-10-04');

/* 15. Customers serviced by Peel or Motika */
SELECT c.*
FROM cust c
JOIN salespeople s ON c.snum = s.snum
WHERE s.sname IN ('Peel','Motika');

/* 16. Customers whose names begin with A to B */
SELECT * FROM cust WHERE cname REGEXP '^[A-B]';

/* 17. Orders except amt = 0 or NULL */
SELECT * FROM orders
WHERE amt IS NOT NULL AND amt <> 0;

/* 18. Count salespeople listing orders */
SELECT COUNT(DISTINCT snum) FROM orders;

/* 19. Largest order by each salesperson (datewise) */
SELECT snum, odate, MAX(amt) AS max_amt
FROM orders
GROUP BY snum, odate;

/* 20. Largest order per salesperson > 3000 */
SELECT snum, MAX(amt) AS max_amt
FROM orders
GROUP BY snum
HAVING MAX(amt) > 3000;

/* 21. Day with highest total amount */
SELECT odate
FROM orders
GROUP BY odate
ORDER BY SUM(amt) DESC
LIMIT 1;

/* 22. Count orders on Oct 3 */
SELECT COUNT(*) FROM orders
WHERE odate = '1994-10-03';

/* 23. Count distinct non-null cities in cust */
SELECT COUNT(DISTINCT city) FROM cust WHERE city IS NOT NULL;

/* 24. Each customer's smallest order */
SELECT cnum, MIN(amt) FROM orders GROUP BY cnum;

/* 25. First customer alphabetically starting with G */
SELECT * FROM cust
WHERE cname LIKE 'G%'
ORDER BY cname
LIMIT 1;

/* 26. Output: For dd/mm/yy there are ___ orders */
SELECT CONCAT('For ', DATE_FORMAT(odate,'%d/%m/%y'),
              ' there are ', COUNT(*), ' orders') AS result
FROM orders
GROUP BY odate;

/* 27. Commission (12%) for each order */
SELECT onum, snum, amt * 0.12 AS commission FROM orders;

/* 28. Highest rating in each city */
SELECT CONCAT('For the city ', city,
              ', the highest rating is : ', MAX(rating)) AS result
FROM cust
GROUP BY city;

/* 29. Totals of orders per day (desc) */
SELECT odate, SUM(amt) total
FROM orders
GROUP BY odate
ORDER BY total DESC;

/* 30. Salespeople and customers in same city */
SELECT s.sname, c.cname, s.city
FROM salespeople s
JOIN cust c ON s.city = c.city;

/* 31. Customers matched with their salespeople */
SELECT c.cname, s.sname
FROM cust c
JOIN salespeople s ON c.snum = s.snum;

/* 32. Order number with customer name */
SELECT o.onum, c.cname
FROM orders o
JOIN cust c ON o.cnum = c.cnum;

/* 33. Order number with salesperson and customer */
SELECT o.onum, s.sname, c.cname
FROM orders o
JOIN salespeople s ON o.snum = s.snum
JOIN cust c ON o.cnum = c.cnum;

/* 34. Customers serviced by salespeople with comm > 12% */
SELECT DISTINCT c.*
FROM cust c
JOIN salespeople s ON c.snum = s.snum
WHERE s.comm > 12;

/* 35. Commission for orders with customer rating > 100 */
SELECT o.onum, o.amt * 0.12 AS commission
FROM orders o
JOIN cust c ON o.cnum = c.cnum
WHERE c.rating > 100;

/* 36. Pairs of customers with same rating */
SELECT c1.cname, c2.cname, c1.rating
FROM cust c1
JOIN cust c2 ON c1.rating = c2.rating
WHERE c1.cnum <> c2.cnum;

/* 37. Same as above, once only */
SELECT c1.cname, c2.cname, c1.rating
FROM cust c1
JOIN cust c2 ON c1.rating = c2.rating
WHERE c1.cnum < c2.cnum;

/* 38. Three salespeople per customer (cartesian) */
SELECT c.cname, s.sname
FROM cust c, salespeople s;

/* 39. Customers in cities where Serres has customers */
SELECT *
FROM cust
WHERE city IN (
    SELECT city FROM cust
    WHERE snum = (SELECT snum FROM salespeople WHERE sname='Serres')
);

/* 40. Pairs of customers served by same salesperson */
SELECT c1.cname, c2.cname
FROM cust c1
JOIN cust c2 ON c1.snum = c2.snum
WHERE c1.cnum < c2.cnum;

/* 41. Pairs of salespeople in same city */
SELECT s1.sname, s2.sname, s1.city
FROM salespeople s1
JOIN salespeople s2 ON s1.city = s2.city
WHERE s1.snum < s2.snum;

/* 42. Pairs of orders by same customer */
SELECT o1.onum, o2.onum, c.cname
FROM orders o1
JOIN orders o2 ON o1.cnum = o2.cnum AND o1.onum < o2.onum
JOIN cust c ON o1.cnum = c.cnum;

/* 43. Customers with same rating as Hoffman */
SELECT cname, city
FROM cust
WHERE rating = (
    SELECT rating FROM cust WHERE cname='Hoffman'
);

/* 44. Orders of Motika */
SELECT o.*
FROM orders o
JOIN salespeople s ON o.snum = s.snum
WHERE s.sname='Motika';

/* 45. Orders credited to Hoffman's salesperson */
SELECT *
FROM orders
WHERE snum = (
    SELECT snum FROM cust WHERE cname='Hoffman'
);

/* 46. Orders greater than average on Oct 4 */
SELECT *
FROM orders
WHERE amt > (
    SELECT AVG(amt) FROM orders WHERE odate='1994-10-04'
);

/* 47. Average commission in London */
SELECT AVG(comm)
FROM salespeople
WHERE city='London';

/* 48. Orders attributed to salespeople servicing London customers */
SELECT o.*
FROM orders o
WHERE o.snum IN (
    SELECT DISTINCT snum FROM cust WHERE city='London'
);

/* 49. Commissions of salespeople servicing London customers */
SELECT DISTINCT s.comm
FROM salespeople s
JOIN cust c ON s.snum = c.snum
WHERE c.city='London';

/* 50. Customers whose cnum is 1000 above Serres snum */
SELECT *
FROM cust
WHERE cnum = (
    SELECT snum + 1000 FROM salespeople WHERE sname='Serres'
);

/* 51. Count customers with rating above San Jose avg */
SELECT COUNT(*)
FROM cust
WHERE rating > (
    SELECT AVG(rating) FROM cust WHERE city='San Jose'
);

/* 52. Orders for customer named Cisnerous */
SELECT *
FROM orders
WHERE cnum = (
    SELECT cnum FROM cust WHERE cname='Cisnerous'
);

/* 53. Customers with above average orders */
SELECT DISTINCT c.cname, c.rating
FROM cust c
JOIN orders o ON c.cnum = o.cnum
WHERE o.amt > (SELECT AVG(amt) FROM orders);

/* 54. Total order amount per salesperson > largest order */
SELECT snum, SUM(amt) total
FROM orders
GROUP BY snum
HAVING total > (SELECT MAX(amt) FROM orders);

/* 55. Customers with orders on Oct 3 */
SELECT DISTINCT c.*
FROM cust c
JOIN orders o ON c.cnum = o.cnum
WHERE o.odate='1994-10-03';

/* 56. Salespeople with more than one customer */
SELECT s.snum, s.sname
FROM salespeople s
JOIN cust c ON s.snum = c.snum
GROUP BY s.snum
HAVING COUNT(c.cnum) > 1;

/* 57. Check correct salesperson credited */
SELECT *
FROM orders o
JOIN cust c ON o.cnum = c.cnum
WHERE o.snum <> c.snum;

/* 58. Orders above average for their customer */
SELECT *
FROM orders o
WHERE amt > (
    SELECT AVG(amt) FROM orders WHERE cnum=o.cnum
);

/* 59. Sum by date at least 2000 above max order */
SELECT odate, SUM(amt)
FROM orders
GROUP BY odate
HAVING SUM(amt) >= (SELECT MAX(amt) + 2000 FROM orders);

/* 60. Customers with max rating in their city */
SELECT *
FROM cust c
WHERE rating = (
    SELECT MAX(rating) FROM cust WHERE city=c.city
);

/* 61. Salespeople with customers in city they don't service (JOIN) */
SELECT DISTINCT s.*
FROM salespeople s
JOIN cust c ON s.city = c.city AND s.snum <> c.snum;

/* 62. Customers if any customer is in San Jose */
SELECT cnum, cname, city
FROM cust
WHERE EXISTS (SELECT * FROM cust WHERE city='San Jose');

/* 63. Salespeople numbers with multiple customers */
SELECT snum FROM cust GROUP BY snum HAVING COUNT(*) > 1;

/* 64. Salespeople details with multiple customers */
SELECT s.snum, s.sname, s.city
FROM salespeople s
JOIN cust c ON s.snum=c.snum
GROUP BY s.snum
HAVING COUNT(c.cnum)>1;

/* 65. Salespeople serving only one customer */
SELECT s.*
FROM salespeople s
JOIN cust c ON s.snum=c.snum
GROUP BY s.snum
HAVING COUNT(c.cnum)=1;

/* 66. Salespeople with more than one order */
SELECT s.*
FROM salespeople s
JOIN orders o ON s.snum=o.snum
GROUP BY s.snum
HAVING COUNT(o.onum)>1;

/* 67. Salespeople with customers rating 300 (EXISTS) */
SELECT *
FROM salespeople s
WHERE EXISTS (
    SELECT * FROM cust c
    WHERE c.snum=s.snum AND c.rating=300
);

/* 68. Same using JOIN */
SELECT DISTINCT s.*
FROM salespeople s
JOIN cust c ON s.snum=c.snum
WHERE c.rating=300;

/* 69. Salespeople with customers in their city not assigned to them */
SELECT *
FROM salespeople s
WHERE EXISTS (
    SELECT * FROM cust c
    WHERE c.city=s.city AND c.snum<>s.snum
);

/* 70. Customers whose salesperson has another customer with orders */
SELECT DISTINCT c1.*
FROM cust c1
WHERE EXISTS (
    SELECT * FROM cust c2
    JOIN orders o ON c2.cnum=o.cnum
    WHERE c2.snum=c1.snum AND c2.cnum<>c1.cnum
);

/* 71. Salespeople with customers in their city (ANY / IN) */
SELECT *
FROM salespeople
WHERE city IN (SELECT city FROM cust);

/* 72. Salespeople with customers alphabetically after them */
SELECT *
FROM salespeople s
WHERE EXISTS (
    SELECT * FROM cust c
    WHERE c.cname > s.sname
);

/* 73. Customers with rating > any in Rome */
SELECT *
FROM cust
WHERE rating > ANY (
    SELECT rating FROM cust WHERE city='Rome'
);

/* 74. Orders greater than at least one order on Oct 6 */
SELECT *
FROM orders
WHERE amt > ANY (
    SELECT amt FROM orders WHERE odate='1994-10-06'
);

/* 75. Orders smaller than any amount for San Jose customers */
SELECT *
FROM orders
WHERE amt < ANY (
    SELECT amt FROM orders o
    JOIN cust c ON o.cnum=c.cnum
    WHERE c.city='San Jose'
);

/* 76. Customers rating higher than every customer in Paris */
SELECT *
FROM cust
WHERE rating > ALL (
    SELECT rating FROM cust WHERE city='Paris'
);

/* 77. Customers rating >= ANY of Serres */
SELECT *
FROM cust
WHERE rating >= ANY (
    SELECT rating FROM cust
    WHERE snum=(SELECT snum FROM salespeople WHERE sname='Serres')
);

/* 78. Salespeople with no customers in their city */
SELECT *
FROM salespeople s
WHERE NOT EXISTS (
    SELECT * FROM cust c WHERE c.city=s.city
);

/* 79. Orders greater than any for London customers */
SELECT *
FROM orders
WHERE amt > ANY (
    SELECT amt FROM orders o
    JOIN cust c ON o.cnum=c.cnum
    WHERE c.city='London'
);

/* 80. Salespeople and customers in London */
SELECT s.sname, c.cname
FROM salespeople s
JOIN cust c ON s.city=c.city
WHERE s.city='London';

/* 81. Highest and lowest order dates per salesperson */
SELECT snum,
MIN(odate) AS lowest_date,
MAX(odate) AS highest_date
FROM orders
GROUP BY snum;

/* 82. Salespeople and whether they have customers in city */
SELECT s.sname,
CASE
WHEN EXISTS (SELECT * FROM cust c WHERE c.city=s.city)
THEN 'Has Customers'
ELSE 'No Customers'
END AS status
FROM salespeople s;

/* 83. Append match status */
SELECT s.sname,
CONCAT(s.city,' - ',
IF(EXISTS (SELECT * FROM cust c WHERE c.city=s.city),
'Matched','Not Matched')) AS status
FROM salespeople s;

/* 84. UNION High / Low rating customers */
SELECT cname, city, rating, 'High Rating' AS status
FROM cust WHERE rating>=200
UNION
SELECT cname, city, rating, 'Low Rating'
FROM cust WHERE rating<200;

/* 85. Salespeople & customers with >1 order */
SELECT s.sname, s.snum
FROM salespeople s
JOIN orders o ON s.snum=o.snum
GROUP BY s.snum
HAVING COUNT(o.onum)>1
UNION
SELECT c.cname, c.cnum
FROM cust c
JOIN orders o ON c.cnum=o.cnum
GROUP BY c.cnum
HAVING COUNT(o.onum)>1
ORDER BY 1;

/* 86. UNION of San Jose salespeople, customers, Oct 3 orders */
SELECT snum FROM salespeople WHERE city='San Jose'
UNION
SELECT cnum FROM cust WHERE city='San Jose'
UNION ALL
SELECT onum FROM orders WHERE odate='1994-10-03';

/* 87. Salespeople in London with customers there */
SELECT DISTINCT s.*
FROM salespeople s
JOIN cust c ON s.snum=c.snum
WHERE s.city='London' AND c.city='London';

/* 88. Salespeople in London without customers there */
SELECT s.*
FROM salespeople s
WHERE s.city='London'
AND NOT EXISTS (
    SELECT * FROM cust c WHERE c.city='London' AND c.snum=s.snum
);

/* 89. Salespeople matched with customers (OUTER JOIN + UNION) */
SELECT s.sname, c.cname
FROM salespeople s
LEFT JOIN cust c ON s.snum=c.snum
UNION
SELECT s.sname, c.cname
FROM cust c
RIGHT JOIN salespeople s ON s.snum=c.snum;

    
    




