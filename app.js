var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var adminRounter = require('./routes/admin');
var loginRounter = require('./routes/login');
var signupRounter = require('./routes/signup');
var ordersRounter = require('./routes/orders');
var confirmOrderRounter = require('./routes/comfirmOrder');
var paymentRounter = require('./routes/payment');
var dashboardRounter = require('./routes/dashboard');
var receptRounter = require('./routes/recept');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/', loginRounter);
app.use('/', signupRounter);
app.use('/', adminRounter);
app.use('/', ordersRounter);
app.use('/', confirmOrderRounter);
app.use('/', paymentRounter);
app.use('/', dashboardRounter);
app.use('/', receptRounter);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
