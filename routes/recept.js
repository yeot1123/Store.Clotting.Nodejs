var connection = require('../connect');
var mysql = require('express')
var express = require('express');
const PDFDocument = require('pdfkit');
const fs = require('fs');
const path = require('path');
const thaiFontPath = 'C:\\Fonts\\THSarabun.ttf'; // เปลี่ยนเส้นทางไปยังฟอนต์ที่ถูกต้อง
var router = express.Router();

// GET /recept
router.get('/recept', (req, res, next) => { // .get จะต้องใช้ req.query
    const PayName = req.query.PayName;
    const PaymentID = req.query.PaymentID;
    const PayAddress = req.query.PayAddress;
    const TotalAll = req.query.TotalAll;
    const customerID = req.query.customerID;

    var sql = 'SELECT products.productName, orders.Quantity, orders.SubTotalPrice FROM products JOIN orders ON products.productID = orders.ProductID Order by orderDate DESC Limit 3  '; // เอาค่า cmID ไป Join ระหว่างตาราง Order กับ Products
    mysql.query(sql,(err,result)=>{
      if(err){
        res.send(err);
      } else{
        res.render('recept', {detail: result});
        console.log('data is',{detail: result});
      }
    })

    // mysql.query(sql,values,(err,result)=>{
    //     if(err){
    //       res.send(err);
    //   } else{
    //     var sql = 'SELECT * FROM Orders '; // เอาค่า cmID ไป Join ระหว่างตาราง Order กับ Products
    //     mysql.query(sql,(err,result)=>{
    //       if(err){
    //         res.send(err);
    //       } else{
    //         res.render('confirmPaymentForm', {payment: result});
    //         console.log('data is',{payment: result});
    //       }
    //     })
    //   }
    //   })




    // สร้างฟอร์มใบเสร็จ PDF
// สร้างฟอร์มใบเสร็จ PDF
const doc = new PDFDocument({
    font: thaiFontPath, // เพิ่มฟอนต์ที่รองรับภาษาไทย
    size: 'A4', // กำหนดขนาดกระดาษ A4
    margin: 50, // กำหนดระยะขอบ
});

const fileName = `Receipt_${PaymentID}_${PayName}.pdf`; // ตั้งชื่อไฟล์ตาม PaymentID และ PayName

// กำหนดเส้นทางเก็บไฟล์ PDF ในโฟลเดอร์ "recept" ใน Drive C
const filePath = path.join('C:\\Recept', fileName);

doc.pipe(fs.createWriteStream(filePath)); // ใช้ filePath แทน fileName
doc.fontSize(25).text(`ใบเสร็จเลขที่ XXXXXX ${PaymentID}`, { underline: true, align: 'center' }); // ใส่ชื่อใบเสร็จและกำหนดให้เนื้อหาอยู่ตรงกลาง
doc.moveDown(); // เลื่อนลงไปด้านล่าง
doc.fontSize(18).text(`ชื่อลูกค้า: ${PayName}`);
doc.fontSize(18).text(`ที่อยู่: ${PayAddress} `);


const items = [
    { description: 'สินค้า 1', quantity: 'XXXX', price: 'XXXX' },
    { description: 'สินค้า 2', quantity: 'XXXX', price: 'XXXX' },
    { description: 'สินค้า 3', quantity: 'XXXX', price: 'XXXX' },
];

doc.moveDown(); // เลื่อนลงไปด้านล่าง
doc.fontSize(16).text('รายการสินค้า', { underline: true });
// วนลูปแสดงรายการสินค้า
items.forEach((item, index) => {
    const y = 250 + index * 30; // กำหนดความสูงของแต่ละรายการ
    doc.fontSize(14).text(item.description, 100, y, { width: 200, align: 'left' });
    doc.text(item.quantity.toString(), 350, y, { width: 80, align: 'center' });
    doc.text(item.price.toString(), 450, y, { width: 100, align: 'right' });
});

// คำนวณยอดรวม
doc.moveDown(); // เลื่อนลงไปด้านล่าง
doc.fontSize(16).text(`ยอดรวม: ${TotalAll} บาท`, null, null, { width: 100,align: 'right' });

doc.end();

// ส่งหน้าเว็บแสดงฟอร์มใบเสร็จ
res.send('ดำเนินการออกใบเสร็จเรียบร้อย');
});

module.exports = router;
