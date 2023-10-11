var express = require('express');
var router = express.Router();
var mysql = require('../connect');
const multer = require('multer'); // เพิ่ม Multer

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '/Users/thanaboon/SlipPayment'); // ชื่อโฟลเดอร์ที่คุณต้องการเก็บไฟล์
  },
  filename: function (req, file, cb) {
    const date = new Date();
    const timestamp = date.getTime(); // หาค่า timestamp ปัจจุบัน
    const fileExtension = file.originalname.split('.').pop(); // หานามสกุลของไฟล์

    // สร้างชื่อไฟล์ใหม่โดยใช้ timestamp และนามสกุลไฟล์
    const newFileName = `${timestamp}.${fileExtension}`;
    cb(null, newFileName);
  },
});

const upload = multer({ storage: storage });


router.post('/payment/:customerID', upload.single('SlipPayment'),(req, res)=>{	
var values = [req.body];
console.log(values);

  var sql = 'INSERT INTO payment SET?';
  mysql.query(sql,values,(err,result)=>{
    if(err){
      res.send(err);
  } else{
    var sql = 'SELECT * FROM payment ORDER BY paymentID DESC LIMIT 1';
    mysql.query(sql,(err,result)=>{
      if(err){
        res.send(err);
      } else {
        res.render('confirmPaymentForm', {payment: result});
        console.log('data is',{payment: result});
      }
    })
  }
  })

  /*var sql = 'SELECT products.productName, orders.Quantity, orders.SubTotalPrice FROM products JOIN orders ON products.productID = orders.ProductID Order by orderDate DESC Limit 3  '; // เอาค่า cmID ไป Join ระหว่างตาราง Order กับ Products
    mysql.query(sql,(err,result)=>{
      if(err){
        res.send(err);
      } else{
        res.render('confirmPaymentForm', {payment: result});
        console.log('data is',{detail: result});
      }
    })*/

});

module.exports = router;
