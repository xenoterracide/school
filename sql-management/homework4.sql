/* Homework 4
 * Caleb Cushing */

#1

/* A join takes two tables and creates a result table by using the rows in the 
 * original tables to construct new rows with columns from  both tables. */

#2

/* an inner join is a cross join (see cartesian join/product) followed by a 
 * restriction. A left (outer) join is an inner join that preserves the table 
 * on the left side of the join, while padding any rows on the table on the 
 * right side, that do not exist in the table on the left side, with NULLs. */

#3

/* a right (outer) join is like a left (outer) join (see above),  except that 
 * it preserves the tables on the right and pads the table on the left. */

#4

/* a full (outer) join preserves the tables on both sides (see #2) of the join 
 * */

#5

/* A Cartesian Join, syntactically known as a CROSS JOIN, takes each row from 
 * one table and attaches a copy to each row of the other table, so that you 
 * get all possible combinations in the result table. or table a * table b */

#6

/* a union takes multiple tables, and creates a table that contains every row 
 * that is in any of the tables or all of them. tables are union compatable if 
 * they have the same number of columns and their corresponding columns have 
 * identical data types and lengths. */

#7

SELECT Title, Price, PublisherName
FROM Book, Publisher
WHERE Book.PublisherCode = Publisher.PublisherCode
ORDER BY PublisherName, Title;

/*
+------------------------------------------+-------+--------------------------+
| Title                                    | Price | PublisherName            |
+------------------------------------------+-------+--------------------------+
| The Soul of a New Machine                | 11.16 | Back Bay Books           |
| Godel, Escher, Bach                      | 14.00 | Basic Books              |
| Group: Six People in Search of a Life    | 10.40 | Berkley Publishing       |
| A Guide to SQL                           | 37.95 | Course Technology        |
| Electric Light                           | 14.00 | Farrar Straus and Giroux |
| Magic Terror                             |  7.99 | Fawcett Books            |
| To Kill a Mockingbird                    | 18.00 | HarperCollins Publishers |
| Slay Ride                                |  6.99 | Jove Publications        |
| The Edge                                 |  6.99 | Jove Publications        |
| When Rabbit Howls                        |  6.29 | Jove Publications        |
| Franny and Zooey                         |  5.99 | Lb Books                 |
| Nine Stories                             |  5.99 | Lb Books                 |
| The Catcher in the Rye                   |  5.99 | Lb Books                 |
| East of Eden                             | 12.95 | Penguin USA              |
| Of Mice and Men                          |  6.95 | Penguin USA              |
| The Grapes of Wrath                      | 13.00 | Penguin USA              |
| Travels with Charley                     |  7.95 | Penguin USA              |
| Beloved                                  | 12.95 | Plume                    |
| Jazz                                     | 12.95 | Plume                    |
| Song of Solomon                          | 14.00 | Plume                    |
| Second Wind                              | 24.95 | Putnam Publishing Group  |
| Black House                              | 18.81 | Random House             |
| Harry Potter and the Goblet of Fire      | 18.16 | Scholastic Trade         |
| Harry Potter and the Prisoner of Azkaban | 13.96 | Scholastic Trade         |
| Catch-22                                 | 12.00 | Scribner                 |
| Dreamcatcher: A Novel                    | 19.60 | Scribner                 |
| Venice                                   | 24.50 | Simon and Schuster       |
| Treasure Chests                          | 24.46 | Taunton Press            |
| A Deepness in the Sky                    |  7.19 | Tor Books                |
| Band of Brothers                         |  9.60 | Touchstone Books         |
| The Fall                                 |  8.00 | Vintage Books            |
| The Stranger                             |  8.00 | Vintage Books            |
| Van Gogh and Gauguin                     | 21.00 | Westview Press           |
+------------------------------------------+-------+--------------------------+
33 rows in set (0.04 sec)
*/

#8

SELECT Book.Bookcode, Title, Price, OnHand, BranchNum
FROM Book
INNER JOIN Inventory
ON Book.BookCode = Inventory.BookCode;

/*
+----------+------------------------------------------+-------+--------+-----------+
| Bookcode | Title                                    | Price | OnHand | BranchNum |
+----------+------------------------------------------+-------+--------+-----------+
| 0180     | A Deepness in the Sky                    |  7.19 |      2 |         1 |
| 0189     | Magic Terror                             |  7.99 |      2 |         2 |
| 0200     | The Stranger                             |  8.00 |      1 |         1 |
| 0200     | The Stranger                             |  8.00 |      3 |         2 |
| 0378     | Venice                                   | 24.50 |      2 |         3 |
| 079X     | Second Wind                              | 24.95 |      1 |         2 |
| 079X     | Second Wind                              | 24.95 |      2 |         3 |
| 079X     | Second Wind                              | 24.95 |      3 |         4 |
| 0808     | The Edge                                 |  6.99 |      1 |         2 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |      4 |         2 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |      2 |         3 |
| 1382     | Treasure Chests                          | 24.46 |      1 |         2 |
| 138X     | Beloved                                  | 12.95 |      3 |         2 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      3 |         1 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      2 |         3 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      1 |         4 |
| 2281     | Van Gogh and Gauguin                     | 21.00 |      3 |         4 |
| 2766     | Of Mice and Men                          |  6.95 |      2 |         3 |
| 2908     | Electric Light                           | 14.00 |      3 |         1 |
| 2908     | Electric Light                           | 14.00 |      1 |         4 |
| 3350     | Group: Six People in Search of a Life    | 10.40 |      2 |         1 |
| 3743     | Nine Stories                             |  5.99 |      1 |         2 |
| 3906     | The Soul of a New Machine                | 11.16 |      1 |         2 |
| 3906     | The Soul of a New Machine                | 11.16 |      2 |         3 |
| 5163     | Travels with Charley                     |  7.95 |      1 |         1 |
| 5790     | Catch-22                                 | 12.00 |      2 |         4 |
| 6128     | Jazz                                     | 12.95 |      4 |         2 |
| 6128     | Jazz                                     | 12.95 |      3 |         3 |
| 6328     | Band of Brothers                         |  9.60 |      2 |         2 |
| 669X     | A Guide to SQL                           | 37.95 |      1 |         1 |
| 6908     | Franny and Zooey                         |  5.99 |      2 |         2 |
| 7405     | East of Eden                             | 12.95 |      2 |         3 |
| 7443     | Harry Potter and the Goblet of Fire      | 18.16 |      1 |         4 |
| 7559     | The Fall                                 |  8.00 |      2 |         2 |
| 8092     | Godel, Escher, Bach                      | 14.00 |      1 |         3 |
| 8720     | When Rabbit Howls                        |  6.29 |      3 |         1 |
| 9611     | Black House                              | 18.81 |      2 |         1 |
| 9627     | Song of Solomon                          | 14.00 |      5 |         3 |
| 9627     | Song of Solomon                          | 14.00 |      2 |         4 |
| 9701     | The Grapes of Wrath                      | 13.00 |      2 |         1 |
| 9701     | The Grapes of Wrath                      | 13.00 |      1 |         2 |
| 9701     | The Grapes of Wrath                      | 13.00 |      3 |         3 |
| 9701     | The Grapes of Wrath                      | 13.00 |      2 |         4 |
| 9882     | Slay Ride                                |  6.99 |      3 |         3 |
| 9883     | The Catcher in the Rye                   |  5.99 |      3 |         2 |
| 9883     | The Catcher in the Rye                   |  5.99 |      2 |         4 |
| 9931     | To Kill a Mockingbird                    | 18.00 |      2 |         1 |
+----------+------------------------------------------+-------+--------+-----------+
47 rows in set (0.00 sec)
*/

#9

SELECT Book.Bookcode, Title, Price, OnHand, BranchNum, 
(Price * OnHand) AS Total_Cost
FROM Book
INNER JOIN Inventory
ON Book.BookCode = Inventory.BookCode;

/*
+----------+------------------------------------------+-------+--------+-----------+------------+
| Bookcode | Title                                    | Price | OnHand | BranchNum | Total_Cost |
+----------+------------------------------------------+-------+--------+-----------+------------+
| 0180     | A Deepness in the Sky                    |  7.19 |      2 |         1 |      14.38 |
| 0189     | Magic Terror                             |  7.99 |      2 |         2 |      15.98 |
| 0200     | The Stranger                             |  8.00 |      1 |         1 |       8.00 |
| 0200     | The Stranger                             |  8.00 |      3 |         2 |      24.00 |
| 0378     | Venice                                   | 24.50 |      2 |         3 |      49.00 |
| 079X     | Second Wind                              | 24.95 |      1 |         2 |      24.95 |
| 079X     | Second Wind                              | 24.95 |      2 |         3 |      49.90 |
| 079X     | Second Wind                              | 24.95 |      3 |         4 |      74.85 |
| 0808     | The Edge                                 |  6.99 |      1 |         2 |       6.99 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |      4 |         2 |      78.40 |
| 1351     | Dreamcatcher: A Novel                    | 19.60 |      2 |         3 |      39.20 |
| 1382     | Treasure Chests                          | 24.46 |      1 |         2 |      24.46 |
| 138X     | Beloved                                  | 12.95 |      3 |         2 |      38.85 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      3 |         1 |      41.88 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      2 |         3 |      27.92 |
| 2226     | Harry Potter and the Prisoner of Azkaban | 13.96 |      1 |         4 |      13.96 |
| 2281     | Van Gogh and Gauguin                     | 21.00 |      3 |         4 |      63.00 |
| 2766     | Of Mice and Men                          |  6.95 |      2 |         3 |      13.90 |
| 2908     | Electric Light                           | 14.00 |      3 |         1 |      42.00 |
| 2908     | Electric Light                           | 14.00 |      1 |         4 |      14.00 |
| 3350     | Group: Six People in Search of a Life    | 10.40 |      2 |         1 |      20.80 |
| 3743     | Nine Stories                             |  5.99 |      1 |         2 |       5.99 |
| 3906     | The Soul of a New Machine                | 11.16 |      1 |         2 |      11.16 |
| 3906     | The Soul of a New Machine                | 11.16 |      2 |         3 |      22.32 |
| 5163     | Travels with Charley                     |  7.95 |      1 |         1 |       7.95 |
| 5790     | Catch-22                                 | 12.00 |      2 |         4 |      24.00 |
| 6128     | Jazz                                     | 12.95 |      4 |         2 |      51.80 |
| 6128     | Jazz                                     | 12.95 |      3 |         3 |      38.85 |
| 6328     | Band of Brothers                         |  9.60 |      2 |         2 |      19.20 |
| 669X     | A Guide to SQL                           | 37.95 |      1 |         1 |      37.95 |
| 6908     | Franny and Zooey                         |  5.99 |      2 |         2 |      11.98 |
| 7405     | East of Eden                             | 12.95 |      2 |         3 |      25.90 |
| 7443     | Harry Potter and the Goblet of Fire      | 18.16 |      1 |         4 |      18.16 |
| 7559     | The Fall                                 |  8.00 |      2 |         2 |      16.00 |
| 8092     | Godel, Escher, Bach                      | 14.00 |      1 |         3 |      14.00 |
| 8720     | When Rabbit Howls                        |  6.29 |      3 |         1 |      18.87 |
| 9611     | Black House                              | 18.81 |      2 |         1 |      37.62 |
| 9627     | Song of Solomon                          | 14.00 |      5 |         3 |      70.00 |
| 9627     | Song of Solomon                          | 14.00 |      2 |         4 |      28.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |      2 |         1 |      26.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |      1 |         2 |      13.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |      3 |         3 |      39.00 |
| 9701     | The Grapes of Wrath                      | 13.00 |      2 |         4 |      26.00 |
| 9882     | Slay Ride                                |  6.99 |      3 |         3 |      20.97 |
| 9883     | The Catcher in the Rye                   |  5.99 |      3 |         2 |      17.97 |
| 9883     | The Catcher in the Rye                   |  5.99 |      2 |         4 |      11.98 |
| 9931     | To Kill a Mockingbird                    | 18.00 |      2 |         1 |      36.00 |
+----------+------------------------------------------+-------+--------+-----------+------------+
47 rows in set (0.00 sec)
*/

#10
SELECT MarinaNum, SlipNum, BoatName, Owner.OwnerNum, FirstName, LastName
FROM Owner
INNER JOIN MarinaSlip
ON Owner.OwnerNum = MarinaSlip.OwnerNum;

/*
+-----------+---------+--------------+----------+----------------+----------+
| MarinaNum | SlipNum | BoatName     | OwnerNum | FirstName      | LastName |
+-----------+---------+--------------+----------+----------------+----------+
| 1         | A1      | Anderson II  | AN75     | Bill           | Anderson |
| 1         | A2      | Our Toy      | EL25     | Sandy and Bill | Elend    |
| 1         | A3      | Escape       | KE22     | Alyssa         | Kelly    |
| 1         | B1      | Gypsy        | JU92     | Maria          | Juarez   |
| 1         | B2      | Anderson III | AN75     | Bill           | Anderson |
| 2         | 1       | Bravo        | AD57     | Bruce and Jean | Adney    |
| 2         | 2       | Chinook      | FE82     | Daniel         | Feenstra |
| 2         | 3       | Listy        | SM72     | Becky and Dave | Smeltz   |
| 2         | 4       | Mermaid      | BL72     | Mary           | Blake    |
| 2         | 5       | Axxon II     | NO27     | Peter          | Norton   |
| 2         | 6       | Karvel       | TR72     | Ashton         | Trent    |
+-----------+---------+--------------+----------+----------------+----------+
11 rows in set (0.00 sec)
*/
