const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Customer = sequelize.define('Customer', {
  cust_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  cust_name: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  cust_email: {
    type: DataTypes.STRING(50),
    allowNull: false,
    unique: true
  },
  cust_mobile_number: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  cust_address: {
    type: DataTypes.TEXT('medium'),
    allowNull: false
  },
  cust_gst_number: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  created_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: true
  },
  updated_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  }
}, {
  tableName: 'customer',
  timestamps: false,
  freezeTableName: true
});

module.exports = Customer;
