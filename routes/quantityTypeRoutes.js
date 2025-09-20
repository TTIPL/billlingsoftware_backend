const express = require('express');
const router = express.Router();
const quantityTypeController = require('../controllers/quantityTypeController');

router.post('/', quantityTypeController.createQuantityType);
router.get('/', quantityTypeController.getAllQuantityTypes);
router.get('/:id', quantityTypeController.getQuantityTypeById);
router.put('/:id', quantityTypeController.updateQuantityType);
router.delete('/:id', quantityTypeController.deleteQuantityType);

module.exports = router;
