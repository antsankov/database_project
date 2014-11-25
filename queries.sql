--QUERY 1: This finds all of the books that have prices above 275
SELECT * 
FROM Book_Info 
WHERE price > 275

--QUERY 2: This finds all of the books that have prices above 275 and orders them by class  

SELECT * 
FROM Book_Info 
WHERE price > 275 
ORDER BY class

--QUERY 3: This finds all of the books that have prices above 275 and orders them by class, limited to the first three

SELECT * 
FROM Book_Info 
WHERE price > 275 
ORDER BY class
LIMIT 3

--QUERY 4: This finds all the classes that have a respect score equal to that of their department. 

SELECT *
FROM FCQs AS class , Department_FCQs AS dep
WHERE class.department = dep.department AND class.avg_respect = dep.avg_respect

--QUERY 5: This finds all the classes that have a respect score equal to that of their department and groups them by their department. 

SELECT *
FROM FCQs AS class , Department_FCQs AS dep
WHERE class.department = dep.department AND class.avg_respect = dep.avg_respect
GROUP BY class.department

--QUERY 6: This finds the most expensive book for classes that are smaller than 25 people. 

SELECT *
FROM Book_Info AS book, FCQs AS fcq
WHERE fcq.avg_class_size < 25 AND fcq.class = book.class
GROUP BY fcq.avg_class_size
HAVING MAX(book.price)

--QUERY 7 : select from where bwith two implied joins, a max function, an avg function, two levels of embedded parenthesis

SELECT MAX( F.percent_passing_grades ) 
FROM Department_FCQs AS F
WHERE (
	SELECT AVG( F.percent_passing_grades ) 
	FROM Class_Ratings AS C, Departments AS D, Department_FCQs AS F
	WHERE (C.department = D.id)AND (C.department = F.department)
) >=75

--QUERY 8: select from where with a not operator and an in operator
SELECT *
FROM Construction_Plans
WHERE (current_build_cost > projected_build_cost) AND company NOT IN 
	("Orci Tincidunt PC",
	"Quis Foundation",
	"Dis Parturient Montes PC",
	"Ipsum Corp.",
	"Aliquam Nisl Industries",
	"Risus Nunc LLC");

--QUERY 9: SET with nontrivial where. TODO

--QUERY 10: Doubles the price of any books that cost less than 100 and belong to a class that has a title of less than 110. 

UPDATE Book_Info 
SET price = (price*2)
WHERE price < 100 AND class < 110;

--QUERY 11: This creates a user named 'test1' with the password: '123'. This user only has access to our school database

CREATE USER 'test1'@'localhost' IDENTIFIED BY '123';GRANT USAGE ON *.* TO 'test1'@'localhost' IDENTIFIED BY '123' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT ALL PRIVILEGES ON `school`.* TO 'test1'@'localhost';

--QUERY 12: This drops the previously created user. 

DROP USER 'test1'@'localhost';

--QUERY 13: This will remove all books that cost more than 150, and then rollback. 

START TRANSACTION; 
DELETE FROM Book_Info WHERE price > 150;
ROLLBACK;

