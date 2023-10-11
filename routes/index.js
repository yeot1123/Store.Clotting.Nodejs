var express = require('express');
var router = express.Router();
var mysql = require('../connect');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/loginForm', function(req, res, next) {
  res.render('loginForm', { title: 'Express' });
});

router.get('/signupForm', function(req, res, next) {
  res.render('signupForm', { title: 'Signup' });
});

router.get('/insertForm', function(req, res, next) {
  res.render('insertForm', { title: 'Express' });
});

router.get('/addadmin', function(req, res, next) {
  res.render('addAdmin', { title: 'Express' });
});

router.get('/service', function(req, res, next) {
  res.render('pageServiceForm', { title: 'Express' });
});

router.get('/contact', function(req, res, next) {
  res.render('pageContactForm', { title: 'Express' });
});




module.exports = router;
