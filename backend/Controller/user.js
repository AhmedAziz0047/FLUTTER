const User = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

exports.signup = (req, res, next) => {
    bcrypt.hash(req.body.password, 10)
    .then(hash => {
      const user = new User({
        name: req.body.name,
        email: req.body.email,
        password: hash
      });
              user.save()
                  .then(() => res.status(201).json({
                    message: 'User created !',
                    status: 201
                  }))
                  .catch(error => res.status(400).json({ error }));
          })
          .catch(error => res.status(500).json({ error }));

};


exports.login = (req, res, next) => {  
  User.findOne({ email: req.body.email })
  .then(user => {
    if (!user) {
      return res.status(401).json({ error: 'User not found !' });
    }
    bcrypt.compare(req.body.password, user.password)
      .then(valid => {
        if (!valid) {
          return res.status(401).json({ error: 'Wrong password !' });
        }
        res.status(200).json({
            userId: user._id,
            token: jwt.sign(
              { userId: user._id },
              'RANDOM_TOKEN_SECRET',
              { expiresIn: '24h' }
            )
        });
      })
      .catch(error => res.status(500).json({ error }));
  })
  .catch(error => res.status(500).json({ error }));
};

exports.profile = (req, res, next) => {
    User.findOne({ _id: req.params.id })
      .then(user => res.status(200).json(user))
      .catch(error => res.status(500).json({ error }));
  };

  exports.getUsers=(req, res)=>{
    User.find()
    .then(user=>res.send(user))
    .catch(err=>res.status(400).json({error: err.message}))
  }
  
  exports.getUserById=(req, res)=>{
    User.findOne({_id: req.params.id})
    .then(user=>res.send(user))
    .catch(err=>res.status(400).json({error: err.message}))
  }

  
  exports.createUser = (req, res, next) => {
    const user = new User({
      ...req.body
    });
    user.save()
      .then(() => res.status(201).json({ message: 'User Created  !'}))
      .catch(error => res.status(400).json({ error }));
  };
  exports.deleteUser=(req, res)=>{
    User.deleteOne({ _id: req.params.id })
    .then(() => res.status(200).json({ message: 'User Deleted !'}))
    .catch(error => res.status(400).json({ error }));
  }
  
  exports.updateUSer  = (req, res, next) => {
    User.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
      .then(() => res.status(200).json({ message: 'User Updated !'}))
      .catch(error => res.status(400).json({ error }));
  };