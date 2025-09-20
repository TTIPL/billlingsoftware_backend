const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const ParentProduct = sequelize.define('ParentProduct', {
  parent_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  parent_product_name: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  createdat: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW
  },
  updatedat: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'parent_product',
  timestamps: false,
  freezeTableName: true
});

module.exports = ParentProduct;
