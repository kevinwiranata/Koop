const http = require("http");
const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");
const axios = require("axios");
require("dotenv").config({ path: "../.env" });

const app = express();
app.use(cors());
app.use(morgan("dev"));
app.use(bodyParser.json());

const hostname = "localhost";
const port = 3000;

app.get("/", cors(), async (req, res, next) => {
  const body = JSON.parse(JSON.stringify(req.query));
  const { ticker } = body;
  final = {};

  axios
    .get(
      `http://api.marketstack.com/v1/eod?access_key=${process.env.MARKET_STACK_API_KEY}&symbols=${ticker}`
    )
    .then((response) => {
      const apiResponse = response.data;
      apiResponse["data"].forEach((stockData) => {
        final[stockData["date"]] = parseFloat(stockData["close"]).toFixed(2);
      });

      //error handling
      if(Object.entries(final).length == 0) {
        throw new Error('Invalid Stock Ticker');
      }
      res.json(final);
      next();
    })
    .catch((error) => {
      console.log(error);
      next(error);
    });
});

const server = http.createServer(app);

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
