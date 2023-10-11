var express = require('express');
var router = express.Router();
var mysql = require('../connect');


//ดึงข้อมูลในตารางมาแสดงในหน้า authurize ของ admin  
router.get('/admins_auth/adminsForm', function(req, res, next) {
    var sql = 'SELECT * FROM products';
    mysql.query(sql,(err, result)=>{
        if(err){
          res.send(err);
        }else{
          res.render('adminsForm', { items:result });
        }
      })
    });

// ดึงข้อมูลในตารางขึ้นมาแสดงในหน้า authurize ของ customer  ยังไม่ลงทะเบียน
router.get('/customers_auth/productsForm', function(req, res, next) {
  var sql = 'SELECT * FROM products';
  mysql.query(sql,(err, result)=>{
      if(err){
        res.send(err);
      }else{
        res.render('productsForm', { items:result });

      }
    })
  });

// ดึงข้อมูลในตารางขึ้นมาแสดงในหน้า authurize ของ customer สำหรับลูกค้าที่ลงทะเบียนแล้ว  
router.get('/customers_auth/login/productsForm/:customerID', function(req, res, next) {
  const customerID = req.params.customerID;
  var sql = 'SELECT * FROM products';
  mysql.query(sql,(err, result)=>{
      if(err){
        res.send(err);
      }else{
        res.render('customerAuthForm', { items:result, customerID: customerID});

      }
    })
  });

  
// เพิ่มข้อมูลในตาราง 
router.post('/insert',(req, res)=>{
  var sql = 'INSERT INTO products SET?';
  var data = req.body;
  mysql.query(sql,data,(err,result)=>{
    if(err){
      res.send(err);
  } else{
    res.redirect('/admins_auth/adminsForm');
  }
  })
});

// แก้ไขตารางสินค้า (update table)
router.get('/edit/:productID',(req, res) => {
  var sql = 'SELECT * FROM products WHERE productID=?';
  mysql.query(sql,req.params.productID, (err, result) => {
      if(err){
          res.send(err);
      }else{
          res.render('updateForm',{
              data:result[0]
          });
      }
  })
})
router.post('/edit/:productID',(req,response)=>{
  var sql = 'UPDATE products SET? WHERE productID =?';
  var params=[req.body,req.params.productID];
  mysql.query(sql,params,(err,result)=>{
      if(err){
          response.send(err);
      }else{
          response.redirect('/admins_auth/adminsForm');
      }
      response.end();
  })
})



// ค้นหาข้อมูลรายการสินค้า
router.get('/searching',(req,res)=>{
  console.log(req);
  var sname=req.query.q;
  var sql = "SELECT * FROM products WHERE ProductName LIKE '%"+sname+"%'";
  mysql.query(sql,(err, result)=>{
     if(err){
      res.send(err);
    }else{
      res.render('searchingForm', { items:result });
    }
  })
});


// ลบข้อมูลสินค้าในตาราง
router.get('/delete/:ProductID',(req, response) => {
  var sql = 'DELETE FROM products WHERE productID = ?';
  var id=req.params.ProductID;
  console.log(id);

  mysql.query(sql, id, (err, result) => {
      if(err) {
       response.send(err);
          console.log('OK');
      }else{
       console.log('OK');
          response.redirect('/admins_auth/adminsForm');
      }
      response.end();
  });
});


// myself add
router.post('/signupadmin', (req, res) => {
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
        types:'admin'
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