const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Company = sequelize.define('Company', {
  company_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  company_name: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  company_email: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  company_mobile_number: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  company_address: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  company_gst_number: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: true
  },
  created_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  updated_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  }
}, {
  tableName: 'company',
  timestamps: false,
  freezeTableName: true
});

module.exports = Company;
