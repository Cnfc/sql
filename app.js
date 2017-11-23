var mysql      = require('mysql');
var faker = require("faker");

var connection = mysql.createConnection({
  host     : '127.0.0.1',
  user     : 'root',
  password : 'cnfcSQLSERVER92',
  database : 'first_app'
});

connection.connect();
// To SELECT all users from database:
//

var person = {
    email: faker.internet.email(),
    created_at: faker.date.past()
};

var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
  if (err) throw err;
  console.log(result) ;
});

connection.end();



// To count the number of users in the database:
// var q = 'SELECT COUNT(*) AS total FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });
