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


	--QUERY 6 : Select from where group by having
	--QUERY 7 : select from where bwith two implied joins, a max function, an avg function, two levels of embedded parenthesis
	--QUERY 8: select from where with a not operator and an in operator
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :
	--QUERY :