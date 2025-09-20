const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Master = sequelize.define('Master', {
  master_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  gst_support: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
  },
  gst_value: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  pdf_label_support: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  updated_at: {
    type: DataTypes.DATE,
  },
  updated_by: {
    type: DataTypes.INTEGER,
  },
  created_by: {
    type: DataTypes.INTEGER,
  },
}, {
  tableName: 'masters',
  timestamps: false,
});

module.exports = Master;
