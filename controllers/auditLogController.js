const AuditLog = require('../models/auditLogModel');

// Create audit log
exports.createAuditLog = async (req, res) => {
  try {
    const {
      log_desc,
      screen_name,
      created_by,
      updated_by,
      system_details
    } = req.body;

    const log = await AuditLog.create({
      log_desc,
      screen_name,
      created_by,
      updated_by,
      system_details
    });

    res.status(201).json(log);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get all audit logs
exports.getAllAuditLogs = async (req, res) => {
  try {
    const logs = await AuditLog.findAll();
    res.json(logs);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
