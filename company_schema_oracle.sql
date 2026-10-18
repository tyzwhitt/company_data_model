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


