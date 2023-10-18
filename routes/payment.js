var express = require('express');
var router = express.Router();
var mysql = require('../connect');
const multer = require('multer'); // เพิ่ม Multer
// const jpg = require('jpg');

//'/Users/thanaboon/SlipPayment
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'D:\\ejs\\Store.Clotting.Nodejs-main\\public\\SlipPayment'); // ชื่อโฟลเดอร์ที่คุณต้องการเก็บไฟล์
  },
  filename: function (req, file, cb) {
    const date = new Date();
    const timestamp = date.getTime(); // หาค่า timestamp ปัจจุบัน
    const fileExtension = file.originalname.split('.').pop(); // หานามสกุลของไฟล์ dddddd

    // const fileExtension = path.extname(file.originalname);
    const newFileName = `${timestamp}.${fileExtension}`;

    // สร้างชื่อไฟล์ใหม่โดยใช้ timestamp และนามสกุลไฟล์
    // const newFileName = `${file.originalname}.${fileExtension}`;      ddddddd
    // const newFileName = file.originalname;
    cb(null, newFileName);
  },
});



const upload = multer({ storage: storage });


router.post('/payment/:customerID/:totalAll/', upload.single('SlipPayment'), (req, res) => {
  var values = [req.body];
  const uploadedFile = req.file.filename; 
  // var id = req.params.customerID;
  var values = {
    PayName: req.body.PayName,
    PayAddress: req.body.PayAddress,
    PayTel: req.body.PayTel,
    SlipPayment: uploadedFile,
    customerID: req.params.customerID,
    TotalAll: req.body.TotalAll,
  };

  console.log(values);

  var sql = 'INSERT INTO payment SET ?';
  mysql.query(sql, values, (err, result) => {
    if (err) {
      res.send(err);
    } else {

      var sql = 'SELECT * FROM payment ORDER BY paymentID DESC LIMIT 1';
      mysql.query(sql, (err, paymentResult) => {
        if (err) {
          res.send(err);
        } else {
          // เรียกข้อมูลสินค้าที่สั่งซื้อล่าสุด
          var sql3 = 'SELECT products.productName as productName, orders.Quantity as Quantity, orders.SubTotalPrice as SubTotalPrice FROM products JOIN orders ON products.productID = orders.ProductID WHERE orders.customerID = ? ORDER BY orderDate DESC LIMIT 3';
          mysql.query(sql3, req.params.customerID, (err, productResult) => {
            if (err) {
              res.send(err);
            } else {
              res.render('confirmPaymentForm', { payment: paymentResult, products: productResult });
              console.log('data is', { payment: paymentResult, products: productResult });
            }
          });
        }
      });
    }
  });
});


module.exports = router;
