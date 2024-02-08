-- fOREIGN KEY 
CREATE TABLE courses (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE students (
	student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    course_id INT, FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO courses 
(course_id, course_name)
VALUES
(1, 'MATHEMATICS'),
(2, 'HISTORY'),
(3, 'COMPUTER SCIENCE');

INSERT INTO students 
(student_id, first_name, last_name, course_id)
VALUES
(101, 'Yusuf', 'Jamal', 1),
(102, 'Wasi', 'Akhtar', 2),
(103, 'Taha', 'Iftikhar', 3);

SELECT * FROM courses;
SELECT * FROM students;

SELECT * FROM students 
WHERE first_name = 'Yusuf';

SELECT * FROM students 
WHERE student_id > 101;

