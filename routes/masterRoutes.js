const express = require('express');
const router = express.Router();
const masterController = require('../controllers/masterController');

router.get('/', masterController.getAllMasters);
router.post('/', masterController.createMaster);
router.put('/:id', masterController.updateMaster);
router.delete('/:id', masterController.deleteMaster);

module.exports = router;
