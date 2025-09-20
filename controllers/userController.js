const bcrypt = require('bcrypt');
const User = require('../models/userModel');

// Create
exports.createUser = async (req, res) => {
  try {
    const { user_name, user_email, user_mobile, user_password } = req.body;
    const hashedPassword = await bcrypt.hash(user_password, 10);

    const user = await User.create({
      user_name,
      user_email,
      user_mobile_number:user_mobile,
      user_password: hashedPassword,
    });

    res.status(201).json(user);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get All
exports.getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll({
      attributes: { exclude: ['user_password'] }, // hide password
    });
    res.json(users);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get By ID
exports.getUserById = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id, {
      attributes: { exclude: ['user_password'] },
    });

    if (!user) return res.status(404).json({ message: 'User not found' });

    res.json(user);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Update
exports.updateUser = async (req, res) => {
  try {
    const { user_name, user_email, user_mobile, user_password } = req.body;

    const updatedData = {
      user_name,
      user_email,
      user_mobile_number:user_mobile,
    };

    if (user_password) {
      updatedData.user_password = await bcrypt.hash(user_password, 10);
    }

    const [updated] = await User.update(updatedData, {
      where: { user_id: req.params.id },
    });

    if (updated) {
      res.json({ message: 'User updated successfully' });
    } else {
      res.status(404).json({ message: 'User not found' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete
exports.deleteUser = async (req, res) => {
  try {
    const deleted = await User.destroy({
      where: { user_id: req.params.id },
    });

    if (deleted) {
      res.json({ message: 'User deleted successfully' });
    } else {
      res.status(404).json({ message: 'User not found' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
