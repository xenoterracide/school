MySQL - Homework 2, Class4
Name: Caleb Cushing

1.) DBA (Database Administrator)
2.)

SELECT AuthorFirst, AuthorLast FROM Author;
+-------------+--------------+
| AuthorFirst | AuthorLast   |
+-------------+--------------+
| Toni        | Morrison     |
| Paul        | Solotaroff   |
| Vernor      | Vintage      |
| Dick        | Francis      |
| Peter       | Straub       |
| Stephen     | King         |
| Philip      | Pratt        |
| Truddi      | Chase        |
| Bradley     | Collins      |
| Joseph      | Heller       |
| Gary        | Wills        |
| Douglas R.  | Hofstadter   |
| Harper      | Lee          |
| Stephen E.  | Ambrose      |
| J.K.        | Rowling      |
| J.D.        | Salinger     |
| Seamus      | Heaney       |
| Albert      | Camus        |
| Bradley     | Collins, Jr. |
| John        | Steinbeck    |
| Riva        | Castelman    |
| Barbara     | Owen         |
| Randy       | O'Rourke     |
| Tracy       | Kidder       |
| Lon         | Schleining   |
+-------------+--------------+
25 rows in set (0.00 sec)

3.)

SELECT BookCode,Title, Price FROM Book WHERE Type = 'FIC';
+----------+------------------------+-------+
| BookCode | Title                  | Price |
+----------+------------------------+-------+
| 0200     | The Stranger           |  8.00 |
| 138X     | Beloved                | 12.95 |
| 2766     | Of Mice and Men        |  6.95 |
| 3743     | Nine Stories           |  5.99 |
| 5790     | Catch-22               | 12.00 |
| 6128     | Jazz                   | 12.95 |
| 6908     | Franny and Zooey       |  5.99 |
| 7405     | East of Eden           | 12.95 |
| 7559     | The Fall               |  8.00 |
| 9627     | Song of Solomon        | 14.00 |
| 9701     | The Grapes of Wrath    | 13.00 |
| 9883     | The Catcher in the Rye |  5.99 |
| 9931     | To Kill a Mockingbird  | 18.00 |
+----------+------------------------+-------+
13 rows in set (0.04 sec)

4.)
SELECT BookCode,Title, Price, Type FROM Book
	WHERE Price >= '18.00' AND Type = 'ART';
+----------+----------------------+-------+------+
| BookCode | Title                | Price | Type |
+----------+----------------------+-------+------+
| 0378     | Venice               | 24.50 | ART  |
| 1382     | Treasure Chests      | 24.46 | ART  |
| 2281     | Van Gogh and Gauguin | 21.00 | ART  |
+----------+----------------------+-------+------+
3 rows in set (0.03 sec)

All Art >= 21.00
