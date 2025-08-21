# Logical ERDs
These are diagrams for databases to map what data we want to handle in our tables so we don't have to make constant adjustments when implementing the database. The typical notation is TableName and camelCase for attributes. It would also store the participation/cardinality for each respective table relationship, participation being the minimum number and cardinality the max. For example, in a site like Jira one project can have many tasks but can have 0 tasks, so Project --> Task would be 0..* (if they had a max number of tasks like 50 that would replace the '*' but it would still be considered zero to many) which is zero to many. A task is created on a Jira project so it depends on that, no project = no task so the participation is 1, but a task can't be shared amongst projects making cardinality one so Task --> Project would be 1..1. This would be considered a 1 to many relationship (you look at the cardinalities/upper bounds). 

# Mapping logical ERDs to conceptual 
To optimize database designs to prevent the possibility of replicated data we follow certain rules to go from a Logical ERD to a conceptual ERD. This is typically done more so for SQL oriented databases since NoSQL databases typically differ in implementation, an exmaple being MongoDBs ability to store arrays of values as an attribute whereas in SQL you can't store arrays. The key factor of this is looking at the relationships between tables as seen below


## Mapping order
### I. Map Specialisations (Rules 7, 8, 9, or 10)
- Consider the **constraint** (Mandatory/Optional, AND/OR).  
- Apply the **appropriate rule**:  
  - **Rule 7**: Mandatory AND → Merge all entities into 1 table, add flags.  
  - **Rule 8**: Optional AND → Use general + specialised tables, FK = PK.  
  - **Rule 9**: Mandatory OR → Separate into distinct tables.  
  - **Rule 10**: Optional OR → General + multiple specialised tables, FK = PK.  

---

### II. Map One-to-One Relationships (Mandatory on Both Sides — Rule 2)
- Merge the 2 entities into **one table**.  
- Select **one attribute as PK**.  
- The other becomes an **alternate key (AK)**.  

---

### III. Map Complex & Many-to-Many Relationships (Rules 5 or 6)
- Reproduce the **original entities** and make them **parent tables**.  
- Introduce a **link table** as a child.  
- Define the **new multiplicities**.  
- The link table carries **foreign keys (FKs)** to the parent tables.  
- The **primary key (PK)** of the link table is **composite** (made of the FKs).  

---

### IV. Map One-to-Many and One-to-One (Optional on One or Both Sides — Rules 1, 3, or 4)
- Reproduce the **original entities**.  
- Make one the **parent table** and the other the **child table**.  
- Introduce a **foreign key (FK)** in the child table to reference the **primary key (PK)** of the parent table.

## Mapping rules simplified 

### 1) One-to-Many Relationship
- Create 2 tables: **Parent** & **Child**.  
- Add a **foreign key (FK)** in the child table to reference the **primary key (PK)** in the parent table.  

---

### 2) One-to-One Relationship (Mandatory on Both Sides)
- Merge both entities into **1 table** with all attributes.  
- Choose one attribute as the **primary key (PK)**.  
- The other becomes an **alternate key (AK)**.  

---

### 3) One-to-One Relationship (Optional on One Side)
- Create 2 tables: **Parent** & **Child**.  
- Add a **foreign key (FK)** in the child table to reference the **primary key (PK)** in the parent table.  

---

### 4) One-to-One Relationship (Optional on Both Sides)
- Create 2 tables: **Parent** & **Child**.  
- Add a **foreign key (FK)** in the child table to reference the **primary key (PK)** in the parent table.  

---

### 5) Many-to-Many Relationship
- Create 3 tables: **Parent1**, **Parent2**, and a **Link Table**.  
- The **Link Table** is a child of both parents and carries **foreign keys (FKs)** referencing each parent.  
- The **primary key (PK)** of the link table is **composite (compound)**, made up of the 2 FKs.  

---

### 6) Ternary Relationship
- Create 4 tables: **Entity1**, **Entity2**, **Entity3**, and a **Link Table**.  
- The **Link Table** is a child of the other 3 tables and carries their **foreign keys (FKs)**.  
- The **primary key (PK)** of the link table is **composite (compound)**, made up of the 3 FKs.  

---

### 7) Specialisation with {Mandatory, AND} Constraint
- Merge all entities into **1 table** with all attributes.  
- Add **relevant flags** to indicate the type of specialization.  

---

### 8) Specialisation with {Optional, AND} Constraint
- Create 2 tables:  
  - 1 for the **general entity**  
  - 1 for **both specialised entities**  
- Use a **one-to-one relationship** (optional on specialised side).  
- Create a **foreign key (FK)** that is also a **primary key (PK)** in the specialised table.  
- Add **relevant flags**.  

---

### 9) Specialisation with {Mandatory, OR} Constraint
- Create **2 completely separate tables**.  
- Separate all the attributes and relationships into their respective tables.  

---

### 10) Specialisation with {Optional, OR} Constraint
- Create 3 tables:  
  - 1 for the **general entity**  
  - 2 for the **specialised entities**  
- Use **two one-to-one relationships**, optional on the specialised sides.  
- Create **foreign keys (FKs)** that are also **primary keys (PKs)** in the specialised tables.  

## Mapping Rules with database design considerations

Mapping one to many relationships - The Table with an upper bound of one will share it's primary key as a foreign key in the table with the upper bound. e.g, Project --> Task is a 1 to many relationship (1 Project has multiple tasks, one task belongs to one project). Even though a project might have no tasks we look at the upper bound since normal behaviour for the system would be to typically store many tasks per project.     

Mapping one to one mandatory (when both upper bound and lower bound/participation vs cardinality are both 1) - Merge both tables into one and have one Primary key and one alternate key. e.g. A university gives each student one laptop which they must return when they graduate, that laptop will always belong to one student at a time and the student must have a laptop. The Laptop table would typically merge into the student table where the studentID is the primary key and laptopID is an alternate key. Of course in this scenario a student could lose a laptop, in which case we may decide to add an isLost attribute to see if the student has lost his/her laptop. If they have we can assume the university is in the process of getting another laptop for them and as such will alter the laptop details when resolved.    

Mapping one to one optional on one side (one table has participation of 0 while the other has 1 but both have max of 1/0..1 and 1..1) - The table with the lower participation is regarded as a child table and as such inherits the parents primary key as a foreign key. 
e.g. As opposed to our previous implementation of Student and laptop if a student doesn't need to take a laptop from the university it becomes optional. As such each laptop would belong to a student but a student isn't guaranteed to have a laptop so each laptop comes with a studentID as its foreign key (if the university had too many laptops/students weren't interested and laptops were vacant you would allow for studentID to be null and query those for when a student may change his mind/needs a replacement.)   

One to one optional on both sides - The same as before, you choose the more mandatory table to be the parent and the more optional one to be a child. In the context of Student and laptop if a university has a shortage of laptops so there aren't enough for the students a laptop could belong to a student but it might not be the case if students aren't interested. Likewise a student might not be interested in a laptop so that's also optional. In this case though we'd still put Student as the parent table since a Student would own a laptop while a laptop belongs to them.     

Many to many relationships (0..*/1..*/*..* on both tables) - You create a join table for both tables and form a composite primary key with an extra identifier. In laymans terms, going with the student and laptop analogy if the university ran it as a renting system so students rent laptops a student may rent different laptops at different times and a laptop will have multiple owners making it a many to many. As a result, you create a laptopStudentAssign table or laptopAssign table with its primary key being composed of 3 attributes - studentID, laptopID and another unique identifier like assignDateTime. This composite primary key would look like (studentID {FK}, laptopID {FK}, assignDateTime) {PK}. The foreign keys studentID and laptopID form the primary key with assignDateTime because a student may rent a laptop, return it and change his mind and rent it on the same day so the time helps prevent a duplicate record.    

Ternary/Quarternary relationships - In the student and laptop renting/owning analogy if students could only rent them via a project class we would also keep track of project data via a table. That is a 3-way relationship so the joining table would connect 3 tables to one whereas many to many did 2 tables. We still form a composite primary key with projectID as an extra foreign key. Note: for a ternary/quarternary relationship and so on all tables need to connect to each other, if project has no association with laptop in the system and only with student that isn't ternary.    

### Mapping generalisations
#### Generalisations 
These are when one parent table can have multiple inheritors, an example being a system with different types of users. A school may have a student portal, parent portal and teacher portal so you might have a User table storing common details that the Student/Parent/Teacher table would inherit (User - username, password and Teacher - Salary, Teacher would inherit username and password). A relationship is considered mandatory if the parent has to be one of the children, so if a user can only be a student/teacher/parent. If the system also stored emergency contacts that might add an extra layer, so you might have a Person table with personal details like name/dob/contact details with the aforementioned User table as a child. This would look like Person -- > Emergency contact/User which points to student/teacher/parent (User --> student/teacher/parent). Emergency contact wouldn't have a child table since it's a relatively specialised table while User/Person are more generic. However, if we stored emergency contact as a separate standalone table we don't need the person table so it would look like (EmergencyContact       User --> Student/teacher/parent). If we planned on storing another type of User in the future like admin it would be optional instead of mandatory. That's the first distinction for generalisations, mandatory vs optional.    

The second and last distinction is or/and. In the above case a teacher could be a parent, so a user can be a teacher and parent. That would be {mandatory/optional, and}, however if the system was designed so the person would have a teacher account and parent account with different user details (username/password) it is {mandatory/optional, or}. The mandatory/optional is dependent upon the context discussed in the above paragraph. 

#### Mapping those Generalisations
Mandatory, and - merge tables into the parent table and add flags for each role/child, User table would have user details and studentFlag, studentGrade, teacherFlag, teacherSalary, parentFlag, parentRelationship. The flag is a boolean (true/false) so it could also be isStudent, isTeacher, isParent. This way if a teacher is a parent the studentFlag would be false and the other 2 are true in cases where we want to identify them.

Optional, and - Merge the children tables into one but keep it separate to the parent, so instead of merging the children into the parent we merge the children tables into 1 with the parent table intact. User --> student/teacher/parent becomes User --> ChildTable with data looking like User (username, password, userID{PK}) and ChildTable (userID{PK}, studentFlag, studentGrade, teacherFlag, teacherSalary, parentFlag, parentData) and the cardinality becomes 1..1 optional on one side.     

Mandatory, or - Wipe out the parent table and give its data to the below tables. User --> Student/teacher/parent becomes Student (studentInfo, userID{PK}), Parent (parentInfo, userID{PK}) and Teacher (teacherInfo, userID{PK}). Note, we would typically change userID to studentID/teacherID/parentID but this is to show they inherit the data from the parent.    

Optional, or - The userID would be shared to children tables but parent table stays intact and the child ID's would be userID{PK}{FK} instead of the above where it's just userID{PK}. What we would then do is give a relationship to each parent/child as a 1..1 optional on one side. This would be User --> Student, User --> Teacher, User --> Parent instead of the children coming under one umbrella as seen in previous instances. 

## End result of the mapped ERD 
By the end of the mapping process, the **logical ERD** only contains:

- **One-to-many relationships**  
  - With correct foreign keys (FKs).  

- **One-to-one relationships (optional on one side)**  
  - Represented with correct FKs.  

- **One-to-one relationships (optional on both sides)**  
  - Represented with correct FKs.  

---

### All Other Relationships Are Resolved and Removed:
- **Specialisations** → replaced with one or several tables (see Rules 7, 8, 9, and 10).  
- **Ternary relationships** → replaced by **4 tables** and **3 one-to-many relationships** (see Rule 6).  
- **Many-to-many relationships** → replaced by **3 tables** and **2 one-to-many relationships** (see Rule 5).  
- **One-to-one relationships (mandatory on both sides)** → replaced by a **single merged table** (see Rule 2).  