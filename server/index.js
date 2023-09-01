const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const animeRouter = require('./routes/anime');
const userRouter = require('./routes/user')
const app = express();
app.use(express.json());

const cors = require('cors');
app.use(cors());
app.options("*", cors());

// Connect to MongoDB
mongoose
  .connect(process.env.MONGODB_URI, {
    dbName: process.env.DB_NAME,
  })
  .then(() => {
    console.log('MongoDB connected');
  })
  .catch((err) => {
    console.log(err.message);
  });

// Routes
app.use( authRouter);
app.use( adminRouter);
app.use( productRouter);
app.use( animeRouter);
app.use( userRouter);

app.get('/', (req, res) => {
  res.json({});
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
