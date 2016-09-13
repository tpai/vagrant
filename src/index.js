var express = require('express');
var app = express();
var http = require('http').createServer(app);
var bodyParser = require('body-parser')
var port = process.env.PORT || 3000;

app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');
 
    if ('OPTIONS' == req.method) {
        res.sendStatus(200);
    }
    else {
        next();
    }
});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 
app.use('/member', require('./route'));

var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/my_db', function() {
    http.listen(port, function() {
        console.log("GET /member");
        console.log("POST /member");
        console.log("PUT /member/:id");
        console.log("DELETE /member/:id");
    });
});
