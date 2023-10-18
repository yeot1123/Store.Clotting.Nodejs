// routes/signup.js
const express = require('express');
const router = express.Router();
var mysql = require('../connect');

router.post('/signup', (req, res) => {
  var data = {
    customerName: req.body.name,
    customerLastName: req.body.lastname,
    customerAddress: req.body.address,
    customerTel: req.body.tel,
    customerEmail: req.body.email
  };


  var sql = 'INSERT INTO customerDetail SET ?';
  mysql.query(sql, data, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      // After inserting into the first table, get the inserted row's cmID
      var customerID = result.insertId;

      // Assign the retrieved cmID to data2

      var data2 = {
        userName: req.body.username,
        passWord: req.body.password,
        customerID: customerID, // Initialize cmID as 0 (or you can remove this line if cmID is set to auto-increment)
        types:'customer'
      };
    
      console.log(data2)
      var sql2 = 'INSERT  INTO accounts SET ?';
      mysql.query(sql2, data2, (err2, result2) => {
        if (err2) {
          res.send(err2);
        } else {
          res.redirect('/');
        }
      });
    }
  });
});


module.exports = router;
