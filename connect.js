const mysql = require('mysql2');
// สร้างตัวแปร connection จาก object mysql ให้ทำการเชื่อมต่อ
const connection = mysql.createConnection({
    host: 'localhost', 
    user:'root',
    database:'nicedream_1',
    password:''
});

module.exports = connection;
