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
SQL databases tend to have more structure as data is inserted into tables, similar to an Excel file while NoSQL follows a more lenient format like MongoDB collections. They tend to take slightly different approaches in matters, for example where you may have a composite primary key in SQL, since NoSQL allows storing arrays you may have foreign keys in both tables instead of a join table. 

# Setting up respective databases
For beginners, MongoDB is typically the most friendly database at the start since you can easily set it up on the cloud for free by creating an account, hence its popularity in the MERN/MEAN stacks. However, the main limitation is your MongoDB server may be set up in a different country to your deployed website which can produce delays.    

SQL oriented databases tend to be harder since many are stuck behind a paywall, but you can set up a server locally like MySQL which wouldn't typically be optimal for a personal project since it's unlikely to be running 24/7 and using cloud services typically costs money. The alternative is using an ORM which allows your app to store the database in the project in a specific folder/file which you can query. Django also has built in support with SQLite and has a built in admin dashboard making it easy to see your data. It's worth noting ORMs can also come with limitations, Prisma ORM for certain SQL databases can't be deployed on Vercel for example due to architectural incompatibilities which can require significant workarounds so it's best to do research for optimal combinations. 
# Resources
[w3Schools SQL Datatypes and other resources](https://www.w3schools.com/sql/sql_datatypes.asp)
[MySQL Tutorial On Youtube via BroCode](https://www.youtube.com/watch?v=5OdVJbNCSso)

