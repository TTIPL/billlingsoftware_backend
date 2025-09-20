const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// CRUD routes
router.post('/', userController.createUser);   
router.post('/login', userController.login);          // Create
router.get('/', userController.getAllUsers);           // Read all
router.get('/:id', userController.getUserById);        // Read one
router.put('/:id', userController.updateUser);         // Update
router.delete('/:id', userController.deleteUser);      // Delete

module.exports = router;
