const http = require("http");
const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");
const fetch = require("node-fetch");
const numeral = require("numeral");

const app = express();
app.use(cors());
app.use(morgan("dev"));
app.use(bodyParser.json());

const hostname = "localhost";
const port = 3000;

app.get("/", cors(), async (req, res, next) => {
  const body = JSON.parse(JSON.stringify(req.query));
  const { ticker } = body;

  const request = await fetch(
    `https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=${ticker}&apikey=${process.env.ALPHA_VANTAGE_API_KEY}`
  );
  var data = await request.json();

  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");

  // JSON Parsing
  data = data["Time Series (Daily)"];
  var final = {};
  for (var key in data) {
    final[key.replace(/-/g, "")] = data[key]["4. close"]; // mapping "close" to price for chart data
  }

  lastData = data[Object.keys(data)[0]]; // adding 8 statistics for the current day for info
  for (var key in lastData) {
    final[key] = numeral(parseFloat(lastData[key])).format("0,0.00");
  }
  res.json(final);
  next();
});

const server = http.createServer(app);

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
