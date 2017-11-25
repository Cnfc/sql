var mysql      = require('mysql');
var faker      = require("faker");
var express    = require("express");
var app        = express();

// var connection = mysql.createConnection({
//   host     : '127.0.0.1',
//   user     : 'root',
//   password : 'cnfcSQLSERVER92',
//   database : 'db_app'
// });

app.get("/", function(req, res) {
  res.send("Hello FROM our APP!");
});

app.get("/joke", function(req, res) {
  var joke = "IT`S JOKE PAGE!!!";
  res.send(joke);;
});

app.get("/random", function(req, res) {
  var num = Math.floor(Math.random() * 10) + 1;
  res.send(num + ' ');
});

app.listen(8080, function() {
  console.log("app listening on port 8080!");
});










// connection.connect
//
// INSERTing lots of data
// var data = [];
// for(var i=0; i<500; i++) {
//
//   data.push([
//     faker.internet.email(),
//     faker.date.past()
//   ]);
// }
// console.log(data);
//
// var person = {
//   email: faker.internet.email(),
//   created_at: faker.date.past()
// };
//
// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//   if (err) throw err;
//   console.log(result) ;
// });
//
// To count the number of users in the database:
// var q = 'INSERT INTO users (email, created_at) VALUES ?';
//
// connection.query(q, [data], function (err, result) {
//   console.log(err);
//   console.log(result);
// });
// connection.end();
