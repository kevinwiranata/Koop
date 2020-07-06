const express = require("express");
const bodyParser = require("body-parser");
const axios = require("axios");
require("dotenv").config({ path: "../.env" });

const stockRouter = express.Router();
stockRouter.use(bodyParser.json());

stockRouter
  .route("/")
  .get((req, res, next) => {
    // getting generic stock series from MarketStack API
    const body = JSON.parse(JSON.stringify(req.query));
    const { ticker } = body;
    parsedResponse = {};
    axios
      .get(
        `http://api.marketstack.com/v1/eod?access_key=${process.env.MARKET_STACK_API_KEY}&symbols=${ticker}`
      )
      .then((response) => {
        const apiResponse = response.data;
        apiResponse["data"].forEach((stockData) => {
          parsedResponse[stockData["date"]] = parseFloat(
            stockData["close"]
          ).toFixed(2);
        });

        //error handling
        if (Object.entries(parsedResponse).length == 0) {
          throw new Error("Invalid Stock Ticker");
        }
        res.json(parsedResponse);
        next();
      })
      .catch((error) => {
        console.log(error);
        next(error);
      });
  })
  .post((req, res, next) => {
    // Posting watchlist stock tickers to firebase
  })
  .put((req, res, next) => {
    // Updating watchlist stock tickers to firebase
  })
  .delete((req, res, next) => {
    // deleting watching stock tickers in firebase
  });

stockRouter.route("/details").get((req, res, next) => {
  const body = JSON.parse(JSON.stringify(req.query));
  const { ticker } = body;
  parsedResponse = { 5: 2 };

  var currentDate = new Date().toISOString().slice(0, 10);
  var yesterdayDate = new Date(Date.now() - 864e5).toISOString().slice(0, 10);

  axios
    .get(
      `http://api.marketstack.com/v1/eod?access_key=${process.env.MARKET_STACK_API_KEY}&symbols=${ticker}&date_from=${yesterdayDate}&date_to=${currentDate}`
    )
    .then((response) => {
      const apiResponse = response.data;
      parsedResponse = apiResponse["data"][0];

      //error handling
      if (Object.entries(parsedResponse).length == 0) {
        throw new Error("Invalid Stock Ticker");
      }
      res.json(parsedResponse);
      next();
    })
    .catch((error) => {
      console.log(error);
      next(error);
    });
});

module.exports = stockRouter;
