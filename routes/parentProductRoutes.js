const express = require('express');
const router = express.Router();
const parentProductController = require('../controllers/parentProductController');

router.get('/', parentProductController.getAllParentProducts);
router.post('/', parentProductController.createParentProduct);
router.get('/:id', parentProductController.getParentProductById);
router.put('/:id', parentProductController.updateParentProduct);
router.delete('/:id', parentProductController.deleteParentProduct);

module.exports = router;
