# MongoDB - NoSQL  
Consistent with JSON format - Works well with JS based backend.  
Uses collections to store data - Equivalent of tables  
Documents - Instances of the table (like classes/objects)  
Can store arrays of values (like IDs) as an attribute  
Start it up by running mongosh in the terminal  

## Format  
```json
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
    "_id": ObjectId("sfhk743j")
}
```

## Table of contents  
- [MongoDB Compass](compass.md)  
- [MongoDB Shell](shell.md)  
- [MongoDB Driver](Driver/driver.md)  

# Mocha - Testing  
