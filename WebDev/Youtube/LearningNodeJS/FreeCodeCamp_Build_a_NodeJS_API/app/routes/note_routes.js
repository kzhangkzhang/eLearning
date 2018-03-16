var ObjectID = require('mongodb').ObjectID;

module.exports = function(app, db){

  // get a post
  app.get('/notes/:id', (req, res) => {
    const id = req.params.id;
    const details = {
      '_id': new ObjectID(id)
    };

    db.collection('notes').findOne(details, (err, item) => {
      if (err) {
        res.send({'error': 'An error has occured'});
      } else {
        res.send(item);
      }
    });
  });

  // Delete a note
  app.delete('/notes/:id', (req, res) => {
    const id = req.params.id;
    const details = {
      '_id': new ObjectID(id)
    };

    db.collection('notes').remove(details, (err, item) => {
      if (err) {
        res.send({'error': 'An error has occured'});
      } else {
        res.send('Note' + id + ' is deleted!');
      }
    });
  });

  // Update a note: find it and then create it again (via post)
  app.put('/notes/:id', (req, res) => {
    const id = req.params.id;
    const details = {
      '_id': new ObjectID(id)
    };

    const note = {
      title: req.body.title,
      text: req.body.notebody
    };

    db.collection('notes').update(details, note, (err, item) => {
      if (err) {
        res.send({'error': 'An error has occured'});
      } else {
        res.send(item);
      }
    });
  });

  app.post('/notes', (req, res) => {
    // we will create the node here
    // console.log(req.body);
    // res.send('Hello, I will create a note for you soon');
    const note = {
      title: req.body.title,
      text: req.body.notebody
    };

    db.collection('notes').insert(note, (err, result) => {
      if (err) {
        res.send({'error': 'An error has occured'});
      } else {
        res.send(result.ops[0]);
      }
    });
  });
};