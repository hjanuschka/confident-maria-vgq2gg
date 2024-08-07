

//database create

// var MongoClient = require('mongodb').MongoClient;
// //Create a database named is "mongo":
// var url = "mongodb://localhost:27017/mongo";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   console.log("Database created!");
//   db.close();
// });



// //create Collection


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   //name of data baise is "mongo"
//   var dbo = db.db("mongo");
//   dbo.createCollection("customers", function(err, res) {
//     if (err) throw err;
//     console.log("Collection created!");
//     db.close();
//   });
// });


// //insert  1 documen in customers collection 


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
// in this  "mongo" is the name of my databaise
//   var dbo = db.db("mongo");
//   var myobj = { name: "Company Inc", address: "Highway 37" };
//   dbo.collection("customers").insertOne(myobj, function(err, res) {
//     if (err) throw err;
//     console.log("1 document inserted");
//     db.close();
//   });
// });





//Insert multiple documents in the "customers" collection




// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   in this  "mongo" is the name of my databaise
//   var dbo = db.db("mongo");
//   var myobj = [
//     { name: 'John', address: 'Highway 71'},
//     { name: 'Peter', address: 'Lowstreet 4'},
//     { name: 'Amy', address: 'Apple st 652'},
//     { name: 'Hannah', address: 'Mountain 21'},
//     { name: 'Michael', address: 'Valley 345'},
//     { name: 'Sandy', address: 'Ocean blvd 2'},
//     { name: 'Betty', address: 'Green Grass 1'},
//     { name: 'Richard', address: 'Sky st 331'},
//     { name: 'Susan', address: 'One way 98'},
//     { name: 'Vicky', address: 'Yellow Garden 2'},
//     { name: 'Ben', address: 'Park Lane 38'},
//     { name: 'William', address: 'Central st 954'},
//     { name: 'Chuck', address: 'Main Road 989'},
//     { name: 'Viola', address: 'Sideway 1633'}
//   ];
//   dbo.collection("customers").insertMany(myobj, function(err, res) {
//     if (err) throw err;
//     console.log("Number of documents inserted: " + res.insertedCount);
//     db.close();
//   });
// });




//Insert three records in a "products" table, with specified _id fields



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   // in this  "mongo" is the name of my databaise
//   var dbo = db.db("mongo");
//   var myobj = [
//     { _id: 154, name: 'Chocolate Heaven'},
//     { _id: 155, name: 'Tasty Lemon'},
//     { _id: 156, name: 'Vanilla Dream'}
//   ];
//   dbo.collection("products").insertMany(myobj, function(err, res) {
//     if (err) throw err;
//     console.log(res);
//     db.close();
//   });
// });





//Find the first document in the customers collection:



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   //mongo id databaise
//   var dbo = db.db("mongo");
//   //The findOne() method returns the first occurrence in the selection.
//   dbo.collection("customers").findOne({}, function(err, result) {
//     if (err) throw err;
//     console.log(result.name);
//     db.close();
//   });
// });






//The find() method returns all occurrences in the selection.



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   //Find all documents in the customers collection:
//   dbo.collection("customers").find({}).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });



//Return the fields "name" and "address" of all documents in the customers collection:


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   //Exclude the name field from the result:  its tack boolian value if you enter 1 it show you that fild and if you set 0 it does not show that value
//   dbo.collection("customers").find({}, { projection: {  name: 1} }).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });





//Find documents with the address "Park Lane 38":



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   /*Return only the documents with the address "Park Lane 38":*/
//   var query = { address: "Park Lane 38" };
//   dbo.collection("customers").find(query).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });



//Find documents where the address starts with the letter "S":


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
/*Return only the documents where the address starts with an "S":*/
//   var query = { address: /^S/ };
//   dbo.collection("customers").find(query).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });


//Sort the result alphabetically by name:
//Use the sort() method to sort the result in ascending or descending order.

//The sort() method takes one parameter, an object defining the sorting order.



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   //mongo is the name of databaise
//   var dbo = db.db("mongo");
//   //Sort the result by name:
//  // { name: 1 } // ascending
// //{ name: -1 } // descending
//   var sort = { name: 1 };
//   dbo.collection("customers").find().sort(sort).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });



//To delete a record, or document as it is called in MongoDB, we use the deleteOne() method.

//The first parameter of the deleteOne() method is a query object defining which document to delete.



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   /*Delete the first customers with the address "Mountain 21":*/
//   var myquery = { address: 'Mountain 21' };
//   dbo.collection("customers").deleteOne(myquery, function(err, obj) {
//     if (err) throw err;
//     console.log("1 document deleted");
//     db.close();
//   });
// });




//To delete more than one document, use the deleteMany() method.

//The first parameter of the deleteMany() method is a query object defining which documents to delete.


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//     /*Delete all customers where the address starts with an "A":*/
//   var myquery = { address: /^A/ };
//   dbo.collection("customers").deleteMany(myquery, function(err, obj) {
//     if (err) throw err;
//     console.log(obj.result + " document(s) deleted");
//     db.close();
//   });
// });





//You can delete a table, or collection as it is called in MongoDB, by using the drop() method.



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   //Delete the "customers" collection:
//   dbo.collection("customers").drop(function(err, delOK) {
//     if (err) throw err;
//     if (delOK) console.log("Collection deleted");
//     db.close();
//   });
// });


//2nd methord for drope coloection 

// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mydb");
//   //Delete the "customers" collection:
//   dbo.dropCollection("customers", function(err, delOK) {
//     if (err) throw err;
//     if (delOK) console.log("Collection deleted");
//     db.close();
//   });
// });




//Update the document with the address "Tasty Lemon" to name="bro" ":



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   //mongo is the name of the data baise
//   var dbo = db.db("mongo");
//   var myquery = { name: "Tasty Lemon" };
//   var newvalues = { $set: { name: "bro"} };
//   //"products" is the name of the collection 
//   dbo.collection("products").updateOne(myquery, newvalues, function(err, res) {
//     if (err) throw err;
//     console.log("1 document updated");
//     db.close();
//   });
// });


//When using the $set operator, only the specified fields are updated:



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   var myquery = { name:"bro" };
//   var newvalues = {$set: {name: "Canyon 123"} };
//   dbo.collection("products").updateOne(myquery, newvalues, function(err, res) {
//     if (err) throw err;
//     console.log("1 document updated");
//     db.close();
//   });
// });




//To update all documents that mech the criteria of the query, use the updateMany() method.




// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//Update all documents where the name starts with the letter "C":
//   var myquery = { name: /^C/ };
//   var newvalues = {$set: {name: "max"} };
//   dbo.collection("products").updateMany(myquery, newvalues, function(err, res) {
//     if (err) throw err;
//     console.log(res.result + " document(s) updated");
//     db.close();
//   });
// });





//The limit() method takes one parameter, a number defining how many documents to return.



// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   //Return the first 5 customers:
//   dbo.collection("products").find().limit(2).toArray(function(err, result) {
//     if (err) throw err;
//     console.log(result);
//     db.close();
//   });
// });



//The $lookup stage lets you specify which collection you want to join with the current collection, and which fields that should match.


// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://127.0.0.1:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mongo");
//   dbo.collection('products').aggregate([
//     { $lookup:
//       {
//         from: 'products',
//         localField: 'product_id',
//         foreignField: '_id',
//         as: 'orderdetails'
//       }
//     }
//   ]).toArray(function(err, res) {
//     if (err) throw err;
//     console.log(JSON.stringify(res));
//     db.close();
//   });
// });
