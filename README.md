# Database Analysis
Databases are essential for storing data and as such are the cornerstone for backend developers and even frontend developers. With frameworks like NextJS you can directly interact with data alongside the advances of AI forcing developers to branch out into key topics. Note, I'm gonna be putting alot of design/practice information alongside theory so while I wouldn't recommend letting AI do all the work for you as a learning tool even the free model of ChatGPT will excel at helping visualising/simplifying foreign topics.  

# ERD design tools
To learn more about designing databases refer to the documentation [here](docs/erd.md) where I go into the basics of entity relationship diagrams (ERDs) and how to map them. Note, I'd highly recommend to use ChatGPT to break down/further explain future topics since I tried to make it as concise yet detailed as possible, apologies in advance. Here I will be focusing on tools you can use online to create databases:      

- [Draw.io](https://app.diagrams.net/): The simplest and easiest way to create databases but probably the slowest, while it has all the necessary arrows and tables it can feel like it takes ages to map any half complex database especially with the canvas size needing to constantly be configured. 
![Draw.io Image](/docs/drawIO.png)

- [DBDiagram.io](https://dbdiagram.io/): Generates tables automatically via SQL Create query, extensive support for typical data types like VARCHAR, can automatically arrange tables and shows relationship cardinalities like one to many automatically based off foreign keys. Cons - Cosmetic features like table colouring and putting tables into groups is hidden behind a paywall and it's inconsistent with mapping 0..1/0..*. 
![DBDiagram.io Image](/docs/dbdiagram.png)

- [DrawSQL](https://drawsql.app/): Generates tables well and has a nice UI alongside ability to map many to one, one to many and one to one. Has nice keybinds so easy to quickly make databases. Cons - Doesn't record participation among relationships (the 0 in 0..1/0..*) it focuses on the upper bound, alot of datatypes are very unique and not "SQL-typical", example is seen below where instead of VARCHAR it's multiline/singleline. 
![DrawSQL Image](/docs/drawsql.png)

- [DBDesigner](https://www.dbdesigner.net/): Allows you to manually create tables/columns or use SQL related queries, allows for basic coloring and relationship mapping and has lots of extra options like null, default values, unique etc. Has the best features from the previous ones in my opinion. Also has configurations for various SQL databases like mysql or postgreSQL. 
![DBDesigner Image](/docs/dbdesigner.png)

It's also worth noting that these are my subjective opinion, the UIs for these can feel vastly different and some of them allow you to export the SQL tables while others don't.    


# SQL vs noSQL 
SQL databases tend to have more structure as data is inserted into tables, similar to an Excel file. It is typically very strict as tables mapped out with dependencies can be tedious to delete if you have foreign keys in multiple tables. NoSQL databases on the other hand can store data in other formats, with the main implementation of MongoDB granting users the ability to export/import data in JSON and CSV making it highly portable. Especially with the rising use of JavaScript it is becoming more used since it pairs well with a JS based frameworks built in JSON functions.        
An SQL database has many upsides, they are typically more optimized and can flex faster speeds but normally run on a local machine/VM/server whereas NoSQL databases normally run on the cloud. SQL databases however can run from one base file, Django as an example runs SQLite without much overhead which can also be useful for mobile apps designed to run without internet connection.       
At a basic level MongoDB can be a very solid starter database in a software related project since it's easy to setup and integrate, however I still think learning how to query SQL based databases is a relevant and crucial skill. The main consideration for beginners is whether the system being implemented has detailed requirements and there isn't an anticipation in new data being handled, if so the ideal would be using an ORM for an SQL database (Note, Django has built in support with SQLite databases and a built-in admin dashboard). 

# 

