var mongoose = require('mongoose');
var Schema = mongoose.Schema;

module.exports = mongoose.model('Member', new Schema({
    name: { type: String, default: 'Guest' },
    phone: { type: String },
    age: { type: Number, min: 22, index: true }
}));
