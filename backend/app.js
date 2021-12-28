const express = require('express');
const mongoose = require('mongoose');
const app=express();
const flightsRoute =require('./routes/flights');
const reservationsRoute =require('./routes/reservations');
const userRouter = require('./routes/users');
app.use(express.urlencoded({extended:true}));
var bodyParser = require('body-parser');
const cors = require('cors');
app.use(bodyParser.json());
app.use(cors());

mongoose.connect('mongodb://localhost:27017/travel',
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connected successfully to MongoDB !'))
  .catch(() => console.log('Connection failed to MongoDB !'));


app.use(express.json());

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});
app.use('/',flightsRoute);
app.use('/',reservationsRoute);
app.use('/api/auth', userRouter);



module.exports=app;
