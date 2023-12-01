SELECT a.student_id AS student_id, a.student_name AS student_name, a.subject_name AS subject_name, coalesce(attended_exams,0) AS attended_exams
FROM(
SELECT *
FROM students
CROSS JOIN subjects
GROUP BY student_id, student_name, subject_name) a
LEFT JOIN
(SELECT e.student_id, student_name, subject_name, COUNT(*) AS attended_exams
FROM examinations e JOIN students s
ON e.student_id = s.student_id
GROUP BY e.student_id, student_name, subject_name) b
ON a.student_id = b.student_id AND a.subject_name =b.subject_name
ORDER BY a.student_id ASC, a.subject_name ASC
