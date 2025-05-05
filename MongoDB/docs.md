# MongoDB - NoSQL
Consistent with JSON format - Works well with JS based backend. 
Uses collections to store data - Equivalent of tables
Documents - Instances of the table (like classes/objects)
Can store arrays of values (like IDs) as an attribute
Start it up by running mongosh in the terminal

## Format 
{
    "title": "My blog",
    "author": {
        "name": "Jeff Wizik",
        "role": "Admin"
    },
    "desc": "This is my blog guys",
    "tags": ["misc", "fun"],
    "upvotes": 20,
    "reviews": [
        {"name": "user12334", "rating": 1},
        {"name": "user1334", "rating": 5},
        {"name": "user1234", "rating": 9}
    ],
    "_id": ObjectId("sfhk743j)
}





# MongoDB Atlas




# MongoDB Compass
A GUI for MongoDB database, can connect to local/Atlas DB. 
You can import JSON/CSV (compatibility with JS).
Can Create, Read, Update and Delete data (all CRUD operations) alongside filtering. 

## Inserting documents
[
  {
    "title": "Harry Potter",
    "Genre": "Fantasy", 
    "Pages": 200, 
    "tags": ["Fantasy", "Evil"]
  },
    {
    "title": "Top 10 cool rocks!",
    "Genre": "Real Geology", 
    "Pages": 10, 
    "tags": ["Non-Fiction", "Good"]
  }
]

## Filter
To filter documents based off books with 10 pages: {pages: 10}

# MongoDB Shell

Using CMD after running mongosh. Same as Compass w/o GUI. 

## Commands
mongosh (Start mongo shell)
show dbs (shows databases assigned)
use *dbName* (Switches database connected to, by default in a DB called test) - can use a non existing name and when creating collection saves 
cls (clears screen - removes all previous messages in terminal)
db (shows db name)
db.*collectionName* - returns format
show collections (show names of all collections in DB)
help (list all commands)
exit (exit shell)

var name = "yoshi" (Create variable)
name (will output yoshi)
name = "Mario" (changes to Mario)

### Inserting data 
You can reference collection names thaat dont exist and insert, then it will be added to db. 

db.*collectionName*.insertOne({title: "Harry Potter", pages: 92, genres: ["Fantasy", "magic"], 
                                reviews: [{name: "user1", rating: 1}, {name: "user8742", rating: 9}] }) - whitespace isnt needed
db.*collectionName*.insertMany([{title: "hi"}, {title: "Bye"}])


### Finding Documents
db.books.find() - Outputs first 20 books found 
it - iterates over next 20 books

db.books.find({author: "Terry"}) - finds books with author terry
db.books.find({author: "Terry", rating: 7})
db.books.find({author: "Terry"}, {title: 1, author: 1}) - returns title and authors only for books found (always get ID too)
db.books.find({}, {title: 1}) - returns titles of first 20 books
db.books.findOne({_id: ObjectId("fs76fje33443")}) - finds id
db.books.findOne({author: "Terry"}) - Finds first book with author terry

### Sorting and limiting data
db.books.find().count() - returns number of documents found
can use find as done in finding documents

db.books.find().limit(3) - returns 3 documents
db.books.find().limit(3).count() - redundant but possible

db.books.find().sort({title: 1}) - Sorts in ascending order A-Z, change to -1 for reverse order
db.books.find().sort({rating: -1}).limit(3) - Sorts in reverse order of rating and limits to first 3 returned.

### Operators & complex Queries
gt- greater than 
lt- less than
lte - lt + equal to
gte- gt + equal to

db.books.find({rating: {$gt: 7}}) - All books >7 not inclusive. 
db.books.find({rating: {$gt: 7}, author: "Terry"}) - >7 and author name terry

db.books.find({$or: []})
db.books.find({ $or: [{rating: 7}, {rating: 9}, {author: "Terry"}] }) - gets books with rating 7/9 or author terry
db.books.find({$or: [{pages: {$gt: 300}}, {pages: {$lt: 100}} ]}) - Books with <100 pages or >300

# Mocha - Testing 