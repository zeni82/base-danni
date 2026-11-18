-- В team_members несколько фамилий записаны в одной ячейке. Это 1НФ.
-- В ProjectMembers каждая строка связывает один проект с одним сотрудником.

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255)
);

CREATE TABLE ProjectMembers (
    project_id INT NOT NULL,
    member_id INT NOT NULL,
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);