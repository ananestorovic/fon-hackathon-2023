const functions = require("firebase-functions");

const express = require("express");
const app = express();

const userRoute = require("./user/user-route");
app.use("/user", userRoute);

exports.app = functions.https.onRequest(app);
