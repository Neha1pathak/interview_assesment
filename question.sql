use date_time;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    marks INT
);

INSERT INTO students (student_id, marks) VALUES (1, 95);
INSERT INTO students (student_id, marks) VALUES (2, 88);
INSERT INTO students (student_id, marks) VALUES (3, 92);
INSERT INTO students (student_id, marks) VALUES (4, 85);
INSERT INTO students (student_id, marks) VALUES (5, 97);
INSERT INTO students (student_id, marks) VALUES (6, 90);
INSERT INTO students (student_id, marks) VALUES (7, 82);
INSERT INTO students (student_id, marks) VALUES (8, 93);
INSERT INTO students (student_id, marks) VALUES (9, 89);
INSERT INTO students (student_id, marks) VALUES (10, 91);
select*from students;

# question 1---

SELECT student_id, marks
FROM students
ORDER BY marks DESC
LIMIT 3;

# question2--
WITH QuartileGroups AS (
    SELECT 
        student_id,
        marks,
        NTILE(4) OVER (ORDER BY marks) AS quartile
    FROM 
        students
)

SELECT 
    quartile,
    MIN(marks) AS min_marks,
    MAX(marks) AS max_marks,
    COUNT(*) AS num_students
FROM 
    QuartileGroups
GROUP BY 
    quartile
ORDER BY 
    quartile;