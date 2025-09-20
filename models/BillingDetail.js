const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const BillingDetail = sequelize.define('BillingDetail', {
  billing_detail_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  prod_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  billing_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  prod_qty: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  prod_price: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  company_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  total_amt: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  created_at: {
    type: DataTypes.DATE,
    allowNull: true,
    defaultValue: DataTypes.NOW,
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  created_by: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  updated_by: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  tableName: 'billing_details',
  timestamps: false,
  freezeTableName: true,
});

module.exports = BillingDetail;
