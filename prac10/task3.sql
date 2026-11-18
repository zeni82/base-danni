-- 1. Нарушение 1НФ
-- В ячейке assignments_and_grades хранится несколько заданий с оценками.

-- 2. Приведение к 1НФ
-- Каждая строка хранит оценку одного студента за одно задание по курсу.
-- Номер задания уникален в пределах курса.
CREATE TABLE StudentGrades_1NF (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    assignment_id INT NOT NULL,
    student_name VARCHAR(255),
    course_professor VARCHAR(255),
    assignment_name VARCHAR(255),
    grade INT,
    PRIMARY KEY (student_id, course_id, assignment_id)
);

-- 3. Проверка на 2НФ
-- student_id -> student_name (частичная зависимость)
-- course_id -> course_professor (частичная зависимость)
-- (course_id, assignment_id) -> assignment_name (частичная зависимость)
-- (student_id, course_id, assignment_id) -> grade (полная зависимость)
-- Таблица нарушает 2НФ. Для определения имени студента, преподавателя
-- и названия задания достаточно части ключа. Только оценка зависит от всего ключа.

-- 4. Приведение к 2НФ
-- Данные студентов, курсов и заданий храним отдельно. В StudentGrades
-- оставляем ключ из трёх полей и оценку, которая зависит от всего ключа.
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255)
);

CREATE TABLE Assignments (
    course_id INT NOT NULL,
    assignment_id INT NOT NULL,
    assignment_name VARCHAR(255),
    PRIMARY KEY (course_id, assignment_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE StudentGrades (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    assignment_id INT NOT NULL,
    grade INT,
    PRIMARY KEY (student_id, course_id, assignment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id, assignment_id) REFERENCES Assignments(course_id, assignment_id)
);
