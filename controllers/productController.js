//const { sequelize } = require('../models');
const sequelize = require("../config/db");
const Billing = require("../models/Billing");
const BillingDetail = require("../models/BillingDetail");
const Product = require("../models/productModel");
// Create a new product
exports.createProduct = async (req, res) => {
  try {
    const {
      prod_name,
      prod_price_1,
      prod_price_2,
      prod_price_3,
      created_by,
      updated_by,
      qty_id,
      parent_produc_id,
    } = req.body;

    const newProduct = await Product.create({
      prod_name,
      prod_price_1,
      prod_price_2,
      prod_price_3,
      created_by,
      updated_by,
      qty_id,
      parent_produc_id,
    });

    res.status(201).json(newProduct);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get all products with quantity type and parent product names
exports.getAllProducts = async (req, res) => {
  try {
    const [results] = await sequelize.query(`
        SELECT 
          p.prod_id,
          p.prod_name,
          p.prod_price_1,
          p.prod_price_2,
          p.prod_price_3,
          p.qty_id,
          q.quantity_type_name,
          p.parent_produc_id,
          pp.parent_product_name
        FROM products p
        LEFT JOIN quantity_type q ON p.qty_id = q.quantity_type_id
        LEFT JOIN parent_product pp ON p.parent_produc_id = pp.parent_id
        ORDER BY p.prod_id DESC
      `);

    res.json(results);
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ message: "Failed to fetch products", error: err.message });
  }
};

// Update product by ID
exports.updateProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Product.update(req.body, {
      where: { prod_id: id },
    });

    if (updated) {
      res.status(201).json(updated);
    } else {
      res.status(404).json({ message: "Product not found" });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete product by ID
exports.deleteProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Product.destroy({
      where: { prod_id: id },
    });

    if (deleted) {
      res.json({ message: "Product deleted successfully" });
    } else {
      res.status(404).json({ message: "Product not found" });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getProductsByParent = async (req, res) => {
  try {
    const { id } = req.params; // parent_id from URL

    const [results] = await sequelize.query(
      `
        SELECT 
          p.prod_id,
          p.prod_name,
          p.prod_price_1,
          p.prod_price_2,
          p.prod_price_3,
          p.qty_id,
          q.quantity_type_name,
          p.parent_produc_id,
          pp.parent_product_name
        FROM products p
        LEFT JOIN quantity_type q ON p.qty_id = q.quantity_type_id
        LEFT JOIN parent_product pp ON p.parent_produc_id = pp.parent_id
        WHERE p.parent_produc_id = :parentId
        ORDER BY p.prod_id DESC
      `,
      {
        replacements: { parentId: id },
      }
    );

    res.json(results);
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({
        message: "Failed to fetch products by parent id",
        error: err.message,
      });
  }
};

exports.createBilling = async (req, res) => {
  const t = await sequelize.transaction();

  try {
    const {
      description,
      cust_id,
      cust_name,
      parent_id,
      parent_product_name,
      products,
    } = req.body;

    const billing = await Billing.create(
      {
        billing_description: description,
        customer_id: cust_id,
        company_id: 1,
        overall_amt: 0,
      },
      { transaction: t }
    );

    let overallAmt = 0;

    for (const item of products) {
      const prod = await Product.findOne({
        where: { prod_id: item.product },
      });

      if (!prod) throw new Error(`Product not found: ${item.product}`);

      for (let company_id = 1; company_id <= 3; company_id++) {
        let price;
        if (company_id === 1) price = prod.prod_price_1;
        else if (company_id === 2) price = prod.prod_price_2;
        else if (company_id === 3) price = prod.prod_price_3;

        const totalAmt = price * item.qty;

        await BillingDetail.create(
          {
            prod_id: item.product,
            billing_id: billing.billing_id,
            prod_qty: item.qty,
            prod_price: price,
            company_id: company_id,
            total_amt: totalAmt,
          },
          { transaction: t }
        );

        if (company_id === 1) {
          overallAmt += totalAmt;
        }
      }
    }

    billing.overall_amt = overallAmt;
    await billing.save({ transaction: t });

    await t.commit();
    res
      .status(201)
      .json({
        message: "Billing created successfully",
        billing_id: billing.billing_id,
      });
  } catch (err) {
    await t.rollback();
    console.error(err);
    res
      .status(500)
      .json({ message: "Failed to create billing", error: err.message });
  }
};

exports.getBillingDetails = async (req, res) => {
  const billing_id = req.params.id;

  if (!billing_id) {
    return res
      .status(400)
      .json({ message: "billing_id is required in URL params" });
  }

  try {
    const results = await sequelize.query(
      `
        SELECT
            bd.billing_detail_id,
            bd.prod_qty,
            bd.prod_price,
            bd.total_amt,
            p.prod_name,
            b.billing_description,
            c.company_id,
            c.company_name,
            cust.cust_name,
            cust.cust_address,
            cust.cust_mobile_number
        FROM
            billing_details bd
        JOIN products p ON bd.prod_id = p.prod_id
        JOIN company c ON bd.company_id = c.company_id
        JOIN billings b ON bd.billing_id = b.billing_id
        JOIN customer cust ON b.customer_id = cust.cust_id
        WHERE
            bd.billing_id = :billing_id
      `,
      {
        replacements: { billing_id },
        type: sequelize.QueryTypes.SELECT,
      }
    );

    return res.json({ data: results });
  } catch (error) {
    console.error("Error fetching billing details:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

exports.getAllBillingDetails = async (req, res) => {
  try {
    const results = await sequelize.query(
      `SELECT 
        b.billing_id,
        b.billing_description,
        b.overall_amt,
        b.created_at,
        b.updated_at,
        c.company_id,
        c.company_name,
        cu.cust_name,
        cu.cust_address
      FROM 
        billings b
      INNER JOIN 
        company c ON b.company_id = c.company_id
      INNER JOIN 
        customer cu ON b.customer_id = cu.cust_id`,
      {
        type: sequelize.QueryTypes.SELECT,
      }
    );

    return res.json({ data: results });
  } catch (error) {
    console.error("Error fetching all billing details:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};





exports.getReports = async (req, res) => {
  try {
    const { startDate, endDate, customerId } = req.query;
    let query = `
      SELECT 
        b.billing_id,
        b.billing_description,
        b.overall_amt,
        b.created_at,
        b.updated_at,
        c.company_name,
        c.company_id,
        cu.cust_name,
        cu.cust_name,
        cu.cust_address
      FROM 
        billings b
      INNER JOIN 
        company c ON b.company_id = c.company_id
      INNER JOIN 
        customer cu ON b.customer_id = cu.cust_id
      WHERE 1=1
    `;

    const replacements = {};

    // Add filters conditionally
    if (startDate) {
      query += ' AND b.created_at >= :startDate';
      replacements.startDate = startDate;
    }
    if (endDate) {
      query += ' AND b.created_at <= :endDate';
      replacements.endDate = endDate;
    }
    if (customerId) {
      query += ' AND cu.cust_id = :customerId';
      replacements.customerId = customerId;
    }

    const results = await sequelize.query(query, {
      replacements,
      type: sequelize.QueryTypes.SELECT,
    });

    return res.json({ data: results });
  } catch (error) {
    console.error("Error fetching all billing details:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};
