-- 1. Creating Schema(5 tables)
CREATE TABLE Department (
    Department_ID    VARCHAR2(25) PRIMARY KEY,
    Department_Name  VARCHAR2(50),
    Department_Phone VARCHAR2(25),
    Department_Email VARCHAR2(50),
    Manager_ID       VARCHAR2(25)
);

CREATE TABLE Employee (
    Employee_ID    VARCHAR2(25) PRIMARY KEY,
    Employee_Fname VARCHAR2(50),
    Employee_Lname VARCHAR2(50),
    Job_Title      VARCHAR2(50),
    Department_ID  VARCHAR2(25) REFERENCES Department(Department_ID)
);

CREATE TABLE Project (
    Project_ID         VARCHAR2(25) PRIMARY KEY,
    Project_Name       VARCHAR2(50),
    Project_Date       DATE,
    Department_ID      VARCHAR2(25) REFERENCES Department(Department_ID),
    Project_Manager_ID VARCHAR2(25) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Skill (
    Skill_ID          VARCHAR2(25) PRIMARY KEY,
    Skill_Name        VARCHAR2(50),
    Skill_Description VARCHAR2(200),
    Employee_ID       VARCHAR2(25) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Project_Team (
    Team_ID     VARCHAR2(10) PRIMARY KEY,
    Employee_ID VARCHAR2(10) REFERENCES Employee(Employee_ID),
    Project_ID  VARCHAR2(10) REFERENCES Project(Project_ID)
);

-- connecting department table's foreign key 
ALTER TABLE Department
ADD CONSTRAINT fk_depart_mngr
FOREIGN KEY (Manager_ID) REFERENCES Employee(Employee_ID);



-- 2.Creating 6 records for each table
INSERT INTO Department VALUES ('D1', 'Software Engineering', '555-1111', 'eng@company.com', NULL);
INSERT INTO Department VALUES ('D2', 'Hardware Systems', '555-2222', 'hardware@company.com', NULL);
INSERT INTO Department VALUES ('D3', 'Industrial Automation', '555-3333', 'auto@company.com', NULL);
INSERT INTO Department VALUES ('D4', 'Field Operations', '555-4444', 'field@company.com', NULL);
INSERT INTO Department VALUES ('D5', 'Quality Assurance', '555-5555', 'qa@company.com', NULL);
INSERT INTO Department VALUES ('D6', 'Technical Consulting', '555-6666', 'consulting@company.com', NULL);


INSERT INTO Employee VALUES ('E1', 'James', 'Miller', 'Project Manager', 'D1');
INSERT INTO Employee VALUES ('E2', 'Sarah', 'Connor', 'Project Manager', 'D2');
INSERT INTO Employee VALUES ('E3', 'Marcus', 'Vance', 'Engineer', 'D3');
INSERT INTO Employee VALUES ('E4', 'Lana', 'Rose', 'Operations Manager', 'D4');
INSERT INTO Employee VALUES ('E5', 'David', 'Kim', 'Engineer', 'D5');
INSERT INTO Employee VALUES ('E6', 'Rachel', 'Green', 'Principal Consultant', 'D6');
INSERT INTO Employee VALUES ('E6', 'Robert', 'BOB', 'Project Manager', 'D3');


INSERT INTO Project VALUES ('P1', 'SCUDA', DATE '2026-01-01', 'D1', 'E3');
INSERT INTO Project VALUES ('P1', 'SCUDA', DATE '2026-01-01', 'D2', 'E3');
INSERT INTO Project VALUES ('P2', 'Assembly', DATE '2026-02-02', 'D3', 'E2');
INSERT INTO Project VALUES ('P3', 'Deployment', DATE '2026-03-03', 'D1', 'E1');
INSERT INTO Project VALUES ('P4', 'Gateway', DATE '2026-04-04', 'D2', 'E2');
INSERT INTO Project VALUES ('P5', 'Automated Safety', DATE '2026-05-05', 'D5', 'E5');
INSERT INTO Project VALUES ('P6', 'Data Pipeline', DATE '2026-06-06', 'D1', 'E6');
INSERT INTO Project VALUES ('P6', 'Data Pipeline', DATE '2026-06-06', 'D5', 'E6');
INSERT INTO Project VALUES ('P6', 'Data Pipeline', DATE '2026-06-06', 'D2', 'E6');



INSERT INTO Skill VALUES ('S1', 'Python', 'Scripting and automation data workflows', 'E1');
INSERT INTO Skill VALUES ('S2', 'Oracle', 'RDBM to run SQL querys', 'E3');
INSERT INTO Skill VALUES ('S3', 'Microsoft Word', 'Documentation', 'E2');
INSERT INTO Skill VALUES ('S4', 'Network Security', 'Industrial firewall and segment routing', 'E4');
INSERT INTO Skill VALUES ('S5', 'SQL', 'Relational data query and schema management', 'E5');
INSERT INTO Skill VALUES ('S6', 'System Architecture', 'Enterprise software deployment and design', 'E6');


INSERT INTO Project_Team VALUES ('T1', 'E1', 'P1');
INSERT INTO Project_Team VALUES ('T2', 'E3', 'P1');
INSERT INTO Project_Team VALUES ('T3', 'E2', 'P2');
INSERT INTO Project_Team VALUES ('T4', 'E5', 'P3');
INSERT INTO Project_Team VALUES ('T5', 'E4', 'P4');
INSERT INTO Project_Team VALUES ('T6', 'E6', 'P6');

--Adding after to avoid chicken-egg
UPDATE Department SET Manager_ID = 'E1' WHERE Department_ID = 'D1';
UPDATE Department SET Manager_ID = 'E2' WHERE Department_ID = 'D2';
UPDATE Department SET Manager_ID = 'E3' WHERE Department_ID = 'D3';
UPDATE Department SET Manager_ID = 'E4' WHERE Department_ID = 'D4';
UPDATE Department SET Manager_ID = 'E5' WHERE Department_ID = 'D5';
UPDATE Department SET Manager_ID = 'E6' WHERE Department_ID = 'D6';

COMMIT;

-- 3.Display tables
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;
SELECT * FROM Skill;
SELECT * FROM Project_Team;


--4. Utilize JOINS
SELECT 
    Employee.Employee_ID,
    Employee.Employee_Fname,
    Employee.Job_Title,
    Department.Department_Name
FROM Employee
JOIN Department 
    ON Employee.Department_ID = Department.Department_ID;