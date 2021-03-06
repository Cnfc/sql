var mysql      = require('mysql');
var faker      = require("faker");
var bodyParser = require("body-parser");
var ejs        = require("ejs");
var express    = require("express");
var app        = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/css"));

var connection = mysql.createConnection({
  host     : '127.0.0.1',
  user     : 'root',
  password : 'cnfcSQLSERVER92',
  database : 'email_db_app'
});
app.get("/", function(req, res) {
  // FIND COUNT USERS IN DATABASE
  var q = "SELECT COUNT(*) AS count FROM users";
  connection.query(q, function(err, results) {
    if(err) throw err;
    var count = results[0].count;
    res.render("home", {data: count});
  });
  // RESPOND WITH THAT ACC
});

app.post("/register", function(req, res) {

  var email = req.body.email;
  var person = {
    email: req.body.email
  };

  connection.query('INSERT INTO users SET ?', person, function(err, result) {
    if (err) throw err;
    res.redirect("/");
    });
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
