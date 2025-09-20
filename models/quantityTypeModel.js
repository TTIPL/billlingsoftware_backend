const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const QuantityType = sequelize.define('QuantityType', {
  quantity_type_id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  quantity_type_name: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  createdat: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  updatedat: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
}, {
  tableName: 'quantity_type',
  timestamps: false, // because we’re manually handling timestamps
});

module.exports = QuantityType;
