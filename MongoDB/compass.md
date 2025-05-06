# MongoDB Compass

A GUI for MongoDB database. You can connect to a local or Atlas DB.  
Supports importing JSON/CSV and is compatible with JavaScript-style syntax.  
Allows you to Create, Read, Update, and Delete data (CRUD operations) alongside filtering.  

You can:  
- Physically add new documents  
- Change fields  
- Export your database (with selected fields)  
- Import data  

## Inserting documents via plaintext

You can insert documents directly in plaintext using JSON format like so:

```json
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
```

## Filter

To filter documents based on specific values, such as books with 10 pages, enter the following in the **Filter** search bar:

```json
{ "Pages": 10 }
```

You can use other query operators and fields similarly to how you'd use them in the MongoDB shell.

