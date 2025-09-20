const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Product = sequelize.define('Product', {
  prod_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  prod_name: {
    type: DataTypes.TEXT('medium'),
    allowNull: false
  },
  prod_price_1: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  prod_price_2: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  prod_price_3: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  created_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  updated_by: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: true
  },
  qty_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  parent_produc_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  }
}, {
  tableName: 'products',
  timestamps: false,
  freezeTableName: true
});

module.exports = Product;
