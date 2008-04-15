/* Homework 5
 * Caleb Cushing */

#1
	
 SELECT ORDERS.OrderNum,
	ORDERS.OrderDate,
	CUSTOMER.CustomerNum,
	CUSTOMER.CustomerName
   FROM ORDERS
  INNER JOIN CUSTOMER
     ON ORDERS.CustomerNum = CUSTOMER.CustomerNum;

/*
+----------+------------+-------------+----------------------------+
| OrderNum | OrderDate  | CustomerNum | CustomerName               |
+----------+------------+-------------+----------------------------+
| 21608    | 2007-10-20 | 148         | Al's Appliance and Sport   |
| 21610    | 2007-10-20 | 356         | Ferguson's                 |
| 21613    | 2007-10-21 | 408         | The Everything Shop        |
| 21614    | 2007-10-21 | 282         | Brookings Direct           |
| 21617    | 2007-10-23 | 608         | Johnson's Department Store |
| 21619    | 2007-10-23 | 148         | Al's Appliance and Sport   |
| 21623    | 2007-10-23 | 608         | Johnson's Department Store |
+----------+------------+-------------+----------------------------+
7 rows in set (0.00 sec)
*/

#2
 SELECT ORDERS.OrderNum,
	ORDERS.OrderDate
   FROM ORDERS
  INNER JOIN OrderLine
     ON ORDERS.OrderNum = OrderLine.OrderNum
  INNER JOIN PART
     ON PART.PartNum = OrderLine.PartNum
  WHERE PART.Description IN ("Iron");

/*
+----------+------------+
| OrderNum | OrderDate  |
+----------+------------+
| 21608    | 2007-10-20 |
+----------+------------+
1 row in set (0.00 sec)
*/

#3
 SELECT Book.BookCode,
	Book.Title,
	Publisher.PublisherCode,
	Publisher.PublisherName
   FROM Book
  INNER JOIN Publisher
     ON Book.PublisherCode = Publisher.PublisherCode
  ORDER BY Publisher.PublisherName;

/*
+----------+------------------------------------------+---------------+--------------------------+
| BookCode | Title                                    | PublisherCode | PublisherName            |
+----------+------------------------------------------+---------------+--------------------------+
| 3906     | The Soul of a New Machine                | BY            | Back Bay Books           |
| 8092     | Godel, Escher, Bach                      | BA            | Basic Books              |
| 3350     | Group: Six People in Search of a Life    | BP            | Berkley Publishing       |
| 669X     | A Guide to SQL                           | CT            | Course Technology        |
| 2908     | Electric Light                           | FS            | Farrar Straus and Giroux |
| 0189     | Magic Terror                             | FA            | Fawcett Books            |
| 9931     | To Kill a Mockingbird                    | HC            | HarperCollins Publishers |
| 9882     | Slay Ride                                | JP            | Jove Publications        |
| 0808     | The Edge                                 | JP            | Jove Publications        |
| 8720     | When Rabbit Howls                        | JP            | Jove Publications        |
| 3743     | Nine Stories                             | LB            | Lb Books                 |
| 9883     | The Catcher in the Rye                   | LB            | Lb Books                 |
| 6908     | Franny and Zooey                         | LB            | Lb Books                 |
| 2766     | Of Mice and Men                          | PE            | Penguin USA              |
| 7405     | East of Eden                             | PE            | Penguin USA              |
| 9701     | The Grapes of Wrath                      | PE            | Penguin USA              |
| 5163     | Travels with Charley                     | PE            | Penguin USA              |
| 9627     | Song of Solomon                          | PL            | Plume                    |
| 6128     | Jazz                                     | PL            | Plume                    |
| 138X     | Beloved                                  | PL            | Plume                    |
| 079X     | Second Wind                              | PU            | Putnam Publishing Group  |
| 9611     | Black House                              | RH            | Random House             |
| 2226     | Harry Potter and the Prisoner of Azkaban | ST            | Scholastic Trade         |
| 7443     | Harry Potter and the Goblet of Fire      | ST            | Scholastic Trade         |
| 5790     | Catch-22                                 | SC            | Scribner                 |
| 1351     | Dreamcatcher: A Novel                    | SC            | Scribner                 |
| 0378     | Venice                                   | SS            | Simon and Schuster       |
| 1382     | Treasure Chests                          | TA            | Taunton Press            |
| 0180     | A Deepness in the Sky                    | TB            | Tor Books                |
| 6328     | Band of Brothers                         | TO            | Touchstone Books         |
| 7559     | The Fall                                 | VB            | Vintage Books            |
| 0200     | The Stranger                             | VB            | Vintage Books            |
| 2281     | Van Gogh and Gauguin                     | WP            | Westview Press           |
+----------+------------------------------------------+---------------+--------------------------+
33 rows in set (0.02 sec)
*/
