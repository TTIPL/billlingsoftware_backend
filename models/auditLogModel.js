const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const AuditLog = sequelize.define('AuditLog', {
  audit_log_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  log_desc: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  screen_name: {
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
  },
  system_details: {
    type: DataTypes.JSON,
    allowNull: true,
    validate: {
      isJson(value) {
        if (value && typeof value !== 'object') {
          throw new Error('system_details must be a valid JSON object');
        }
      }
    }
  }
}, {
  tableName: 'audit_log',
  timestamps: false,
  freezeTableName: true
});

module.exports = AuditLog;
