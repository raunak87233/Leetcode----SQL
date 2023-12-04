SELECT name
FROM Employee
WHERE id IN
   (SELECT ManagerId
    FROM Employee
    GROUP BY ManagerId
    HAVING COUNT(DISTINCT Id) >= 5)
