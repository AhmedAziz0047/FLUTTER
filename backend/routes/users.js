const express = require('express');
const router = express.Router();

const userController = require('../Controller/user');
const auth = require('./../middlewares/auth');

router.post('/signup', userController.signup);
router.post('/login', userController.login);
router.get('/profile/:id', auth, userController.profile);
router.get('/api/getUsers',getUsers);
router.get('/api/getUserById/:id',getUserById);
router.post('/api/addUser',createUser);
router.delete('/api/deleteUser/:id',deleteUser);
router.put('/api/editUser/:id', updateUSer);

module.exports = router;