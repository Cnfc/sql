var mysql      = require('mysql');
var faker = require("faker");

var connection = mysql.createConnection({
  host     : '127.0.0.1',
  user     : 'root',
  password : 'cnfcSQLSERVER92',
  database : 'first_app'
});

connection.connect
//
// INSERTing lots of data
var data = [];
for(var i=0; i<500; i++) {

  data.push([
    faker.internet.email(),
    faker.date.past()
  ]);
}
console.log(data);
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
var q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function (err, result) {
  console.log(err);
  console.log(result);
});
connection.end();
