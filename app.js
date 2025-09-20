const express = require('express');
const cors = require('cors')
const bodyParser = require('body-parser');
const sequelize = require('./config/db');
const userRoutes = require('./routes/userRoutes');
const auditLogRoutes = require('./routes/auditLogRoutes');
const companyRoutes = require('./routes/companyRoutes');
const customerRoutes = require('./routes/customerRoutes');
const parentProductRoutes = require('./routes/parentProductRoutes');
const productRoutes = require('./routes/productRoutes');
const quantityTypeRoutes = require('./routes/quantityTypeRoutes');
const masterRoutes = require('./routes/masterRoutes');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(cors());
app.use(cors({
  origin: 'http://localhost:3001'
}))
app.use('/api/users', userRoutes);
app.use('/api/masters', masterRoutes);
app.use('/api/audit-logs', auditLogRoutes);
app.use('/api/companies', companyRoutes);
app.use('/api/customers', customerRoutes);
app.use('/api/parent-products', parentProductRoutes);
app.use('/api/products', productRoutes);
app.use('/api/quantity-types', quantityTypeRoutes);

sequelize.sync()
  .then(() => {
    app.listen(PORT, () => {
      console.log(`Server running at http://localhost:${PORT}`);
    });
  })
  .catch(err => console.error('Sync error:', err));
