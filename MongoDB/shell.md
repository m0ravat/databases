# MongoDB Shell  

Start it up by installing it and running mongosh (short for mongo shell) in your cmd.  

## Commands  
mongosh - start mongo shell  
exit - exit shell  
cls - clear screen (previous messages)  
help (list all commands)  

db - returns name of database  
db.*collectionName* - returns name of collection like "Collection db.name"  
show collections - show names of all collections in DB  
show dbs - Shows all databases you have.  
use *dbName* - switches to a database, you can switch to a non existent database, insert data and it will be saved auto.  
db.dropDatabase() - Deletes database

var name = "yoshi" (Create variable)  
name (will output yoshi)  
name = "Mario" (changes to Mario)  

## Operators  
They always begin with a '$' sign beforehand.  

List of operators:  

- $gt - Greater than  
- $lt - Less than  
- $gte - Greater than or equal to  
- $lte - Less than or equal to  
- $eq - equal to
- $ne - not equal to
- $or [] - Finds documents with multiple filters. 
- $and [] - Finds documents that meet multiple conditions 
- $not - Finds documents that don't meet condition
- $in [] - Finds documents with a value in the array  
- $nin [] - Finds documents with values outside array  
- $all [] - Finds documents with an array of attributes (like genres of a book)  
- $set - Updates values of a document  
- $unset - Removes a column/attribute. 
- $inc - Increments attribute of a document by a numeric value (+ for add, - for minus)  
- $rename - Renames a column/attribute (firstName to fname). 
- $pull - Removes attribute from a document  
- $push - Adds an attribute to a document  
- $each - Adds an array of values to an attribute  
- $exists - Returns documents which include an attribute. 
- $expr {$gt: ["$debt", "$balance"]} - compares columns and returns if debt > balance

## Querying the database  

### Creating data  
You can insert into non existent collections and it will create that collection and save it.  

```js
db.collectionName.insertOne({
  title: "Harry Potter",
  pages: 92,
  genres: ["Fantasy", "magic"],
  reviews: [
    { name: "user1", rating: 1 },
    { name: "user8742", rating: 9 }
  ]
})
```

This would insert the following:  

```json
{
  "title": "Harry Potter",
  "pages": 92,
  "genres": ["Fantasy", "magic"],
  "reviews": [
    {
      "name": "user1",
      "rating": 1
    },
    {
      "name": "user8742",
      "rating": 9
    }
  ]
}
```

```js
db.collectionName.insertMany([{ title: "hi" }, { title: "Bye" }])
```

This would insert:  

```json
[
  {
    "title": "hi"
  },
  {
    "title": "bye"
  }
]
```

### Reading data  

#### Basic commands  
db.books.find() - Outputs first 20 books found  
it - iterates over next 20 books  

db.books.find({author: "Terry", rating: 7}) - Finds books with author terry and rating of 7.  
db.books.find({author: "Terry"}, {title: 1, author: 1}) - previous but returns only title/author (ID by default too unless put at 0 to exclude)  
db.books.find({}, {title: 1}) - returns titles of first 20 books  
db.books.findOne({_id: ObjectId("fs76fje33443")}) - returns book with this ID  
db.books.findOne({author: "Terry"}) - returns first book with author terry  
db.books.find().skip(1) - Skips 1st document found and returns the second. 

#### Complex commands  
db.books.find().count() - returns number of documents found (find query can be same format as prev section)  

db.books.find().limit(3) - returns first 3 documents  
db.books.find().limit(3).count() - redundant but possible  

db.books.find().sort({title: 1}) - Sorts in ascending order A-Z, change to -1 for reverse order  
db.books.find().sort({rating: -1}).limit(3) - Sorts in reverse order of rating and limits to first 3 returned.  

#### Using Operators  
db.books.find({rating: {$gt: 7}}) - All books >7 not inclusive.  
db.books.find({rating: {$gt: 7}, author: "Terry"}) - >7 and author name terry  

db.books.find({ $or: [{rating: 7}, {rating: 9}, {author: "Terry"}] }) - gets books with rating 7/9 or author terry  
db.books.find({$or: [{pages: {$gt: 300}}, {pages: {$lt: 100}} ]}) - Books with <100 pages or >300  

db.books.find({rating: {$in: [7,8,9]}}) - return books with ratings 7 8 or 9  
db.books.find({rating: {$nin: [7,8,9]}}) - returns books with ratings outside of 7,8,9.  

#### Reading arrays  
db.books.find({genres: "fantasy"}) - if genre array returns all books with it and other genres.  
db.books.find({genres: ["fantasy"]}) - only return books where fantasy is only genre.  
db.books.find({genres: ["fantasy", "magic"]}) - fantasy and magic.  

db.books.find({genres: {$all: ["fantasy", "magic"]}}) - fetch books with fantasy and magic, even if they have extra genres.  
db.books.find({"reviews.name": "Luigi"}) - returns books with review made by luigi.  

### Updating data  
db.books.updateOne({_id: ObjectId("lofew786")}, {$set: {rating: 8, pages: 360}})  
db.books.updateMany({author: "Tery"}, {$set: {author: "Terry"}}) - To update many, for spelling errors, new info etc.  

db.books.updateOne({_id: 33}, {$inc : {pages: 2}}) - Increase value of pages by adding 2 (300 --> 302)  
db.books.updateOne({_id: 33}, {$inc : {pages: -2}}) - Decreases pages by 2.  

db.books.updateOne({_id: 2}, {$pull: {genres: "fantasy"}}) - removes genre from array  
db.books.updateOne({ _id: 2 },{ $push: { genres: { $each: ["fantasy", "magic"] } } })


### Deleting data  
db.books.deleteOne({_id: ObjectId("eff456gfdf")}) - Delete one based off ID  
db.books.deleteOne({author: "Terry"}) - possible but not recommended if many have the author  
db.books.deleteMany({author: "Terry"}) - Deletes all books with terry as author.  


## Indexes
.explain("executionStats") - shows stats of query - how many documents examined, returned etc. - Put at end of find

db.books.createIndex({rating: 1}) - Creates index of books for ascending sort, -1 for descending
db.books.dropIndex({rating: 1})

## Creating collections
db.createCollection("teachers", {capped: true, size: 1000000, max: 100}) - Maximum size 10mb and 100 teachers
db.createCollection("teachers", {capped: true, size: 1000000, max: 100}, {autoIndexId: false}) - automatically create index for id
db.teachers.drop() - drops collection

