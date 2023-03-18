const express = require("express");
const cors = require("cors");
const functions = require("firebase-functions");
const bodyParser = require("body-parser");
const app = express();
const router = express.Router();
const userRoute = require("./user/user-route");

router.use("/user", userRoute);

app.use(cors());
app.use(bodyParser.json());
app.use(express.urlencoded({extended: false}))


app.use("/", router);


exports.app = functions.https.onRequest(app);
