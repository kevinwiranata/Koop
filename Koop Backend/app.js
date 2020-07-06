const http = require("http");
const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");
const axios = require("axios");

const stockRouter = require("./routes/stockRouter");
const app = express();
app.use(cors());
app.use(morgan("dev"));
app.use(bodyParser.json());

const hostname = "localhost";
const port = 3000;

app.use("/stocks", stockRouter);

const server = http.createServer(app);

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
