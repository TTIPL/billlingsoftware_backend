const Company = require('../models/companyModel');

// Create new company
exports.createCompany = async (req, res) => {
  try {
    const {
      company_name,
      company_email,
      company_mobile_number,
      company_address,
      company_gst_number,
      created_by,
      updated_by
    } = req.body;

    const company = await Company.create({
      company_name,
      company_email,
      company_mobile_number,
      company_address,
      company_gst_number,
      created_by,
      updated_by
    });

    res.status(201).json(company);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get all companies
exports.getAllCompanies = async (req, res) => {
  try {
    const companies = await Company.findAll();
    res.json(companies);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get company by ID
exports.getCompanyById = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findByPk(id);
    if (!company) {
      return res.status(404).json({ message: 'Company not found' });
    }
    res.json(company);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Update company
exports.updateCompany = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findByPk(id);
    if (!company) {
      return res.status(404).json({ message: 'Company not found' });
    }

    await company.update(req.body);
    res.json({ message: 'Company updated successfully', company });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete company
exports.deleteCompany = async (req, res) => {
  try {
    const { id } = req.params;
    const company = await Company.findByPk(id);
    if (!company) {
      return res.status(404).json({ message: 'Company not found' });
    }

    await company.destroy();
    res.json({ message: 'Company deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
