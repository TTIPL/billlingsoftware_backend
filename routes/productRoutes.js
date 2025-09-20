const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

router.get('/by-parent/:id', productController.getProductsByParent);
router.post('/createBilling', productController.createBilling);
router.get('/billing-details/:id', productController.getBillingDetails);
router.get('/all-billings', productController.getAllBillingDetails);
router.get('/reports', productController.getReports);
router.get('/', productController.getAllProducts);
router.post('/', productController.createProduct);
router.put('/:id', productController.updateProduct);
router.delete('/:id', productController.deleteProduct);
module.exports = router;
