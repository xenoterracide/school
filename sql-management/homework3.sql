/*
Caleb Cushing
MySQL – Homework 3						January 21, 2008

Create the following SQL Statements.  Make a print screen using the alt-Print 
Screen button combination and paste the query and sample results into a word 
document.  Contact me if you have any questions concerning this.

Here are the scripts, questions 1 to 10.

01. Select the bookcode, title, and calculate a discount price as 90 percent of 
the total price for book table.  Be sure to name the new calculated field 
discount_price.  Round the results to 2 decimal places.  Hint:  The round 
function is the same format as that used in MS Excel.
*/

SELECT BookCode, Title, ROUND (Price * .9, 2)
AS discount_price
FROM Book;

/*
+----------+------------------------------------------+----------------+
| BookCode | Title                                    | discount_price |
+----------+------------------------------------------+----------------+
| 0180     | A Deepness in the Sky                    |           6.47 |
| 0189     | Magic Terror                             |           7.19 |
| 0200     | The Stranger                             |           7.20 |
| 0378     | Venice                                   |          22.05 |
| 079X     | Second Wind                              |          22.46 |
| 0808     | The Edge                                 |           6.29 |
| 1351     | Dreamcatcher: A Novel                    |          17.64 |
| 1382     | Treasure Chests                          |          22.01 |
| 138X     | Beloved                                  |          11.66 |
| 2226     | Harry Potter and the Prisoner of Azkaban |          12.56 |
| 2281     | Van Gogh and Gauguin                     |          18.90 |
| 2766     | Of Mice and Men                          |           6.26 |
| 2908     | Electric Light                           |          12.60 |
| 3350     | Group: Six People in Search of a Life    |           9.36 |
| 3743     | Nine Stories                             |           5.39 |
| 3906     | The Soul of a New Machine                |          10.04 |
| 5163     | Travels with Charley                     |           7.16 |
| 5790     | Catch-22                                 |          10.80 |
| 6128     | Jazz                                     |          11.66 |
| 6328     | Band of Brothers                         |           8.64 |
| 669X     | A Guide to SQL                           |          34.16 |
| 6908     | Franny and Zooey                         |           5.39 |
| 7405     | East of Eden                             |          11.66 |
| 7443     | Harry Potter and the Goblet of Fire      |          16.34 |
| 7559     | The Fall                                 |           7.20 |
| 8092     | Godel, Escher, Bach                      |          12.60 |
| 8720     | When Rabbit Howls                        |           5.66 |
| 9611     | Black House                              |          16.93 |
| 9627     | Song of Solomon                          |          12.60 |
| 9701     | The Grapes of Wrath                      |          11.70 |
| 9882     | Slay Ride                                |           6.29 |
| 9883     | The Catcher in the Rye                   |           5.39 |
| 9931     | To Kill a Mockingbird                    |          16.20 |
+----------+------------------------------------------+----------------+
33 rows in set (0.00 sec)
*/

/*
02. Using the IN operator, write a select statement to select the bookcode, 
title, price, and type for all books with a type of SFI, MYS, or ART.  Sort it 
by the booktype, then the cost highest to lowest.
*/

 SELECT BookCode, Title, Price, Type
 FROM Book
 WHERE Type IN ('SFI', 'MYS', 'ART')
 ORDER BY Type, Price;

/*
 +----------+------------------------------------------+-------+------+
 | BookCode | Title                                    | Price | Type |
 +----------+------------------------------------------+-------+------+
 | 2281     | Van Gogh and Gauguin                     | 21.00 | ART  |
 | 1382     | Treasure Chests                          | 24.46 | ART  |
 | 0378     | Venice                                   | 24.50 | ART  |
 | 0808     | The Edge                                 |  6.99 | MYS  |
 | 9882     | Slay Ride                                |  6.99 | MYS  |
 | 079X     | Second Wind                              | 24.95 | MYS  |
 | 0180     | A Deepness in the Sky                    |  7.19 | SFI  |
 | 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 | SFI  |
 | 7443     | Harry Potter and the Goblet of Fire      | 18.16 | SFI  |
 +----------+------------------------------------------+-------+------+
 9 rows in set (0.00 sec)
*/


03. Write a select statement that uses aggregate functions to calculate the 
minimum cost, maximum cost, and the average cost of all books.  Name the output 
fields minimum_cost, maxium_cost, and average_cost.

 SELECT
 MIN(Price) AS minimum_cost,
 MAX(Price) AS maximum_cost,
 ROUND( AVG(Price), 2) AS average_cost
 FROM Book;
 +--------------+--------------+--------------+
 | minimum_cost | maximum_cost | average_cost |
 +--------------+--------------+--------------+
 |         5.99 |        37.95 |        13.42 |
 +--------------+--------------+--------------+
 1 row in set (0.00 sec)



04. Write a select statement to return all distinct type of books sorted by the 
type.

 SELECT DISTINCT Type FROM Book ORDER BY Type;
 +------+
 | Type |
 +------+
 | ART  |
 | CMP  |
 | FIC  |
 | HIS  |
 | HOR  |
 | MYS  |
 | PHI  |
 | POE  |
 | PSY  |
 | SCI  |
 | SFI  |
 | TRA  |
 +------+
 12 rows in set (0.00 sec)


05. Write a select statement to the average book price by type and ordered by 
average_price with the highest amount first and the type second alphabetically.  
This is called a major and minor sort.

 SELECT Type, ROUND( AVG(Price), 2) AS average_price
 FROM Book
 GROUP BY Type
 ORDER BY average_price DESC, type;

 +------+---------------+
 | Type | average_price |
 +------+---------------+
 | CMP  |         37.95 |
 | ART  |         23.32 |
 | HOR  |         15.47 |
 | PHI  |         14.00 |
 | POE  |         14.00 |
 | SFI  |         13.10 |
 | MYS  |         12.98 |
 | SCI  |         11.16 |
 | FIC  |         10.52 |
 | HIS  |          9.60 |
 | PSY  |          8.35 |
 | TRA  |          7.95 |
 +------+---------------+
 12 rows in set (0.00 sec)


06. Using Less than and Greater than combinations.  Write a SQL Statement to 
return bookcode, title, price for all books with a price greater than or equal 
to 8 and less than or equal to 20.

SELECT BookCode, Title, Price
FROM Book
WHERE Price >= 8 AND Price <= 20;

+----------+------------------------------------------+-------+
| BookCode | Title                                    | Price |
+----------+------------------------------------------+-------+
| 0200     | The Stranger                             |  8.00 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |
| 138X     | Beloved                                  | 12.95 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |
| 2908     | Electric Light                           | 14.00 |
| 3350     | Group: Six People in Search of a Life    | 10.40 |
| 3906     | The Soul of a New Machine                | 11.16 |
| 5790     | Catch-22                                 | 12.00 |
| 6128     | Jazz                                     | 12.95 |
| 6328     | Band of Brothers                         |  9.60 |
| 7405     | East of Eden                             | 12.95 |
| 7443     | Harry Potter and the Goblet of Fire      | 18.16 |
| 7559     | The Fall                                 |  8.00 |
| 8092     | Godel, Escher, Bach                      | 14.00 |
| 9611     | Black House                              | 18.81 |
| 9627     | Song of Solomon                          | 14.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |
| 9931     | To Kill a Mockingbird                    | 18.00 |
+----------+------------------------------------------+-------+
18 rows in set (0.00 sec)


07. Write the same SQL Statement (as 16) using the BETWEEN function.

SELECT BookCode, Title, Price
FROM Book
WHERE Price BETWEEN 8 AND 20;

+----------+------------------------------------------+-------+
| BookCode | Title                                    | Price |
+----------+------------------------------------------+-------+
| 0200     | The Stranger                             |  8.00 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |
| 138X     | Beloved                                  | 12.95 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |
| 2908     | Electric Light                           | 14.00 |
| 3350     | Group: Six People in Search of a Life    | 10.40 |
| 3906     | The Soul of a New Machine                | 11.16 |
| 5790     | Catch-22                                 | 12.00 |
| 6128     | Jazz                                     | 12.95 |
| 6328     | Band of Brothers                         |  9.60 |
| 7405     | East of Eden                             | 12.95 |
| 7443     | Harry Potter and the Goblet of Fire      | 18.16 |
| 7559     | The Fall                                 |  8.00 |
| 8092     | Godel, Escher, Bach                      | 14.00 |
| 9611     | Black House                              | 18.81 |
| 9627     | Song of Solomon                          | 14.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |
| 9931     | To Kill a Mockingbird                    | 18.00 |
+----------+------------------------------------------+-------+
18 rows in set (0.00 sec)



08 Write  to select Bookcode, Title, PublisherCode from book where the title 
contains the word “the”  

 SELECT BookCode, Title, PublisherCode FROM Book WHERE Title LIKE '%the%';

 +----------+------------------------------------------+---------------+
 | BookCode | Title                                    | PublisherCode |
 +----------+------------------------------------------+---------------+
 | 0180     | A Deepness in the Sky                    | TB            |
 | 0200     | The Stranger                             | VB            |
 | 0808     | The Edge                                 | JP            |
 | 2226     | Harry Potter and the Prisoner of Azkaban | ST            |
 | 3906     | The Soul of a New Machine                | BY            |
 | 6328     | Band of Brothers                         | TO            |
 | 7443     | Harry Potter and the Goblet of Fire      | ST            |
 | 7559     | The Fall                                 | VB            |
 | 9701     | The Grapes of Wrath                      | PE            |
 | 9883     | The Catcher in the Rye                   | LB            |
 +----------+------------------------------------------+---------------+
 10 rows in set (0.00 sec)


09 Write a SQL statement to select all books having an average price of greater 
than 10.



10. Using the inventory table - Write a select statement to return the 
bookcodes and the total count of the books for each branch.  We just need the 
bookcode and total for that bookcode.  Hint: Use will need to count the books 
and group the data by branch.

 SELECT Bookcode, COUNT(OnHand) AS total
 FROM Inventory
 GROUP BY BranchNum;

 +----------+-------+
 | Bookcode | total |
 +----------+-------+
 | 0180     |    11 |
 | 0189     |    15 |
 | 0378     |    12 |
 | 079X     |     9 |
 +----------+-------+
 4 rows in set (0.01 sec)

