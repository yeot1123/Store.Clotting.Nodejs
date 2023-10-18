var connection = require('../connect');
var express = require('express');
var session = require('express-session');
var router = express.Router();




router.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

  // Authentication route
  router.post('/auth', function(request, response) {
    var userName = request.body.username;
    var passWord = request.body.password;
    if (userName && passWord) {
      connection.query('SELECT * FROM accounts WHERE userName = ? AND passWord = ?', [userName, passWord], function(error, results, fields) {
        if (results.length > 0) {
          request.session.loggedin = true;
          request.session.userName = userName;
                            if (results[0].types === 'admin') {
                              const today = new Date();
                              const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                              const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                              const currentDate = date+' '+time;
                              // ใช้วันที่ปัจจุบัน
                            const logadminData = {
                              logUserName: userName,
                              logPassWord: passWord,
                              logTime: currentDate
                            };
                            
                            const query = 'INSERT INTO logadmin SET ?';
                            
                            connection.query(query, logadminData, (error, results, fields) => {
                              if (error) {
                                console.error('Error inserting data:', error);
                              } else {
                                console.log('Data inserted successfully!');
                              }
                            });
            response.redirect('/admins_auth/adminsForm'); // เปลี่ยนเส้นทางไปยังหน้า products สำหรับ admin
          } else if (results[0].types === 'customer') {
            console.log(results);
            customerID = results[0].customerID
            console.log(customerID);
            response.redirect('/customers_auth/login/productsForm/' + customerID); // เปลี่ยนเส้นทางไปยังหน้า home สำหรับ customer
          }
        } else {
          response.send('Incorrect Username and/or Password!');
        }
        response.end();
      });
    } else {
      response.send('Please enter Username and Password!');
      response.end();
    }
  });
  
  router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
  });

module.exports = router;