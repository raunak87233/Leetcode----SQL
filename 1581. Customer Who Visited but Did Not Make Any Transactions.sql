SELECT a.customer_id, COUNT(a.visit_id) AS count_no_trans FROM Visits AS a
LEFT JOIN Transactions AS b
ON a.visit_id = b.visit_id
WHERE b.transaction_id IS NULL
GROUP BY a.customer_id;
