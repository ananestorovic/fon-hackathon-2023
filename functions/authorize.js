
const functions = require("firebase-functions");
const admin = require("firebase-admin");
require("express");
const unauthorizedResponse = {
  message: [`Unauthorized`],
  statusCode: 403,
  success: true,
};

async function validateFirebaseIdToken(req, res, next) {
  // functions.logger.log("Check if request is authorized with Firebase ID token");
  //
  // if (
  //   (!req.headers.authorization ||
  //           !req.headers.authorization.startsWith("Bearer ")) &&
  //       !(req.cookies && req.cookies.__session)
  // ) {
  //   functions.logger.error(
  //       "No Firebase ID token was passed as a Bearer token in the Authorization header.",
  //       "Make sure you authorize your request by providing the following HTTP header:",
  //       "Authorization: Bearer <Firebase ID Token>",
  //       "or by passing a \"__session\" cookie.",
  //   );
  //   res.status(403).json(unauthorizedResponse);
  //   return;
  // }
  //
  // let idToken;
  // if (
  //   req.headers.authorization &&
  //       req.headers.authorization.startsWith("Bearer ")
  // ) {
  //   functions.logger.log("Found \"Authorization\" header");
  //   // Read the ID Token from the Authorization header.
  //   idToken = req.headers.authorization.split("Bearer ")[1];
  // } else if (req.cookies) {
  //   functions.logger.log("Found \"__session\" cookie");
  //   // Read the ID Token from cookie.
  //   idToken = req.cookies.__session;
  // } else {
  //   // No cookie
  //   res.status(403).json(unauthorizedResponse);
  //   return;
  // }
  //
  // try {
  //   const decodedIdToken = await admin.auth().verifyIdToken(idToken);
  //   functions.logger.log("ID Token correctly decoded", decodedIdToken);
  //   res.locals.decodedIdToken = decodedIdToken;
  //   next();
  // } catch (error) {
  //   functions.logger.error("Error while verifying Firebase ID token:", error);
  //   res.status(403).send(unauthorizedResponse);
  // }
    res.locals.decodedIdToken = 2;
    next();
};


module.exports.validateFirebaseIdToken = validateFirebaseIdToken;
