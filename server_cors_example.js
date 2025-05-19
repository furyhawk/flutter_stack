// Example of CORS configuration for Node.js backend
// This is intended as a reference for your backend team

const express = require('express');
const cors = require('cors');
const app = express();

// CORS configuration
const corsOptions = {
  origin: [
    'https://service.furyhawk.lol',
    'http://localhost',
    'http://127.0.0.1',
    // Add any other domains that need to access your API
  ],
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
  maxAge: 86400 // 24 hours
};

// Apply CORS middleware
app.use(cors(corsOptions));

// Routes
app.get('/api/v1/health', (req, res) => {
  res.send({ status: 'ok' });
});

// Start server
app.listen(3000, () => {
  console.log('Server running on port 3000');
});
