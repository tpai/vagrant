var objectAssign = require('object-assign');
var mongoose = require('mongoose');
var express = require('express');
var router  = express.Router();

var db = require('./models');
var Member = db.member;

router.get('/', function(req, res) {
    Member.find(function(err, data) {
        res.setHeader('Content-Type', 'application/json');
        res.send(JSON.stringify(data));
    })
});

router.post('/', function(req, res) {
    new Member(req.body).save(function(err) {
        if(!err)res.sendStatus(200);
    });
});

router.put('/:id', function(req, res) {
    var member = objectAssign(req.member, req.body);
    member.save(function(err) {
        if(!err)res.sendStatus(200);
    });
});

router.delete('/:id', function(req, res) {
    var member = req.member;
    member.remove(function(err) {
        if(!err)res.sendStatus(200);
    });
});

router.param('id', function(req, res, next, id) {
    Member.findById(id, function(err, doc) {
        if (doc) {
            req.member = doc;
            return next();
        }
        return next(err);
    });
});

module.exports = router;
