const QuantityType = require('../models/quantityTypeModel');

// Create
exports.createQuantityType = async (req, res) => {
  try {
    const quantityType = await QuantityType.create(req.body);
    res.status(201).json(quantityType);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Read all
exports.getAllQuantityTypes = async (req, res) => {
  try {
    const types = await QuantityType.findAll();
    res.json(types);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Read by ID
exports.getQuantityTypeById = async (req, res) => {
  try {
    const type = await QuantityType.findByPk(req.params.id);
    type ? res.json(type) : res.status(404).json({ message: 'Not found' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Update
exports.updateQuantityType = async (req, res) => {
  try {
    const result = await QuantityType.update(req.body, {
      where: { quantity_type_id: req.params.id },
    });
    res.json({ updated: result[0] });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete
exports.deleteQuantityType = async (req, res) => {
  try {
    await QuantityType.destroy({ where: { quantity_type_id: req.params.id } });
    res.status(204).send();
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
