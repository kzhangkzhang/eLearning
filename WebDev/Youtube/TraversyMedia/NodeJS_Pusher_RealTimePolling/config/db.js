const mongoose = require('mongoose');

// Map global promises
mongoose.Promise = global.Promise;

// Mongoose Connect
mongoose.connect('mongodb://kevinzhang:welcome1@ds123129.mlab.com:23129/pushpoll')
.then(() => console.log('MongoDB Connected'))
.catch(err => console.log(err));