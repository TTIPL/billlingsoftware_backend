const ParentProduct = require('../models/parentProductModel');

// Create a new parent product
exports.createParentProduct = async (req, res) => {
  try {
    const { parent_product_name } = req.body;
    const parent = await ParentProduct.create({ parent_product_name });
    res.status(201).json(parent);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get all parent products
exports.getAllParentProducts = async (req, res) => {
  try {
    const parents = await ParentProduct.findAll();
    res.json(parents);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get a parent product by ID
exports.getParentProductById = async (req, res) => {
  try {
    const parent = await ParentProduct.findByPk(req.params.id);
    if (!parent) {
      return res.status(404).json({ message: 'Parent product not found' });
    }
    res.json(parent);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Update a parent product
exports.updateParentProduct = async (req, res) => {
  try {
    const { parent_product_name } = req.body;
    const parent = await ParentProduct.findByPk(req.params.id);

    if (!parent) {
      return res.status(404).json({ message: 'Parent product not found' });
    }

    parent.parent_product_name = parent_product_name;
    await parent.save();

    res.json({ message: 'Parent product updated', parent });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete a parent product
exports.deleteParentProduct = async (req, res) => {
  try {
    const parent = await ParentProduct.findByPk(req.params.id);

    if (!parent) {
      return res.status(404).json({ message: 'Parent product not found' });
    }

    await parent.destroy();
    res.json({ message: 'Parent product deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
