# company\_data\_model

company relational data model final project





\# Industrial Systems Relational Database Project



A normalized Oracle SQL database designed for an industrial computer systems firm managing hardware installations, custom software, and SCADA engineering initiatives\[cite: 6, 7]. Built and tested in Oracle Live SQL / APEX to model departmental structures, inter-disciplinary project assignments, and technical employee skill matrices while maintaining strict referential integrity\[cite: 6, 7, 9].



\---



\## Key Highlights



\* \*\*5 Core Tables\*\*: `Department`, `Employee`, `Project`, `Skill`, and `Project\_Team` (resolving the $M:N$ assignment relationship)\[cite: 6, 7].

\* \*\*Circular Dependency Handling\*\*: Implemented a 3-step decoupling workflow (`NULL` manager assignment $\\rightarrow$ employee creation $\\rightarrow$ `UPDATE` \& `ALTER TABLE` constraint binding) to prevent `ORA-02291` parent-key errors\[cite: 6, 9, 10].

\* \*\*Relational Querying\*\*: Demonstrates complete DDL creation, batch data insertion, primary/foreign key enforcement, record updates, schema alteration, and inner joins\[cite: 6, 7, 13].



\---



\## Repository Files



\* \[`company\_schema\_oracle.sql`](./company\_schema\_oracle.sql): Complete SQL script containing table creation (DDL), sample data insertion (DML), constraints, and analytical queries\[cite: 6].

\* \[`Final\_Project.pdf`](./Final\_Project.pdf): Full academic submission containing the Crow's Foot ER diagram and Oracle query execution screenshots\[cite: 7, 8, 9, 10, 11, 12, 13].



\---



\## Schema Overview



\[Department] 1 --- M \[Employee] 1 --- M \[Skill]

|                    |

| 1                  | 1

|                    |

M                    M

\[Project]  1 --------- M \[Project\_Team]



\---



\## Verification \& Results



All queries executed with zero errors in Oracle Live SQL\[cite: 9, 10, 11, 12, 13]:



| Component | SQL Operation | Status |

| :--- | :--- | :--- |

| \*\*Schema\*\* | `CREATE TABLE` (5 entities) + `ALTER TABLE` (FK constraint) | Verified\[cite: 9] |

| \*\*Data\*\* | `INSERT INTO` (6+ rows per table) + `UPDATE` (circular keys) | Verified\[cite: 10] |

| \*\*Read\*\* | `SELECT \*` across all 5 tables | Verified\[cite: 11, 12, 13] |

| \*\*Analysis\*\* | `INNER JOIN` matching employees to departments | Verified\[cite: 13] |

