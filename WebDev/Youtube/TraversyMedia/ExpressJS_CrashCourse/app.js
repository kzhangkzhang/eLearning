const express     = require('express');
const bodyParser  = require('body-parser');
const path        = require('path');
const expressValidator = require('express-validator');

var app = express();

// var logger = function(req, res, next){
//   console.log('Logging ...');
//   next();
// };

// app.use(logger);

// Boday Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// Set Static Path
app.use(express.static(path.join(__dirname, 'public')));

var people = [
  {
    name: 'Kevin Zhang',
    age: 44,
  },
  {
    name: 'Ying Wang',
    age: 44,
  },
  {
    name: 'Brandon Zhang',
    age: 8,
  },
  {
    name: 'Elena Zhang',
    age: 5,
  },
];

var users = [
  {
    id: 1,
    first_name: 'Kevin',
    last_name: 'Zhang',
    email: 'kezhangkezhang@gmail.com',
  },
  {
    id: 2,
    first_name: 'Ying',
    last_name: 'Wang',
    email: 'wyingwying@gmail.com',
  },
  {
    id: 3,
    first_name: 'Brandon',
    last_name: 'Zhang',
    email: 'brandonzhang@gmail.com',
  },
];


// View Engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.get('/', function(req, res){
  //  res.json(people);
  res.render('index', {
    title: 'Customers',
    users,
users,
  });
});

app.post('/users/add', function(req, res){
  // console.log(req.body.first_name);
  var newUser = {
    first_name: req.body.first_name,
    last_name: req.body.last_name,
    email_name: req.body.email,
  };

  console.log(newUser);
});

app.listen(3000, function(){
  console.log('Server started on port 3000 ...');
});
