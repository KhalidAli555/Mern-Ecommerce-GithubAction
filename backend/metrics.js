const client = require("prom-client");

// Collect default Node.js metrics
client.collectDefaultMetrics();

module.exports = async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
};