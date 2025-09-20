const Master = require('../models/master');

// Get all masters
exports.getAllMasters = async (req, res) => {
  try {
    const masters = await Master.findAll();
    res.json(masters);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new master
exports.createMaster = async (req, res) => {
  try {
    const { gst_support, gst_value, pdf_label_support, created_by } = req.body;
    const newMaster = await Master.create({
      gst_support,
      gst_value,
      pdf_label_support,
      created_by,
      created_at: new Date(),
    });
    res.status(201).json(newMaster);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Update a master by ID
exports.updateMaster = async (req, res) => {
  try {
    const { id } = req.params;
    const { gst_support, gst_value, pdf_label_support, updated_by } = req.body;
    const master = await Master.findByPk(id);
    if (!master) return res.status(404).json({ message: 'Master not found' });

    master.gst_support = gst_support;
    master.gst_value = gst_value;
    master.pdf_label_support = pdf_label_support;
    master.updated_by = updated_by;
    master.updated_at = new Date();

    await master.save();
    res.json(master);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete a master by ID
exports.deleteMaster = async (req, res) => {
  try {
    const { id } = req.params;
    const master = await Master.findByPk(id);
    if (!master) return res.status(404).json({ message: 'Master not found' });

    await master.destroy();
    res.json({ message: 'Master deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
