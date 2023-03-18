const express = require("express");
const router = express.Router();
const functions = require("firebase-functions");


const {validateFirebaseIdToken} = require("../authorize");

const {initializeApp, cert} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");

const serviceAccount = require("../serviceAccountKey.json");


initializeApp({
  credential: cert(serviceAccount),
});

const db = getFirestore();

router.get("/", (req, res) => {
  return res.status(200).json("hello from user route");
});


router.post("/create_animal", validateFirebaseIdToken, async (req, res) => {
  const animals = db.collection("animals");
  functions.logger.info(req.body);
  const data = {
    name: req.body.name,
    note: req.body.note,
    age: req.body.age,
    gender: req.body.gender,
    species: req.body.species,
    breed: req.body.breed,
    user: res.locals.decodedIdToken,
  };
  await animals.add(data);
  res.json("success");
});

router.get("/get_animalas", validateFirebaseIdToken, async (req, res) => {
  const animals = db.collection("animals");
  try {
    const allAnimals = await animals.get();
    res.json(allAnimals.docs.map((doc) => {
      const data = doc.data();
      data.id = doc.id;
      return data;
    }));
  } catch (error) {
    res.json({});
  }
});


router.get("/get_animalas_filter", validateFirebaseIdToken, async (req, res) => {
  const animals = db.collection("animals");
  try {
    functions.logger.info(req.query["breed"]);
    const filterField = req.query["filter_field"];
    const filterValue = req.query["filter_value"];
    const allAnimals = await animals.where(filterField, "==", filterValue).get();
    res.json(allAnimals.docs.map((doc) => doc.data()));
  } catch (error) {
    res.json({});
  }
});

router.post("/remove_animal", validateFirebaseIdToken, async (req, res) => {
  try {
    const animals = db.collection("animals");
    const animal = await animals.doc(req.body["id"]).get();
    await animal.ref.delete();
    res.json("success");
  } catch (error) {
    res.json({});
  }
});

router.post("/create_animal_hosting_request", validateFirebaseIdToken, async (req, res) => {
  try {
    const hostingRequests = db.collection("hosting_requests");
    const data = {
      "user_id": res.locals.decodedIdToken,
      "animal_id": req.body.user,
      "date_start": req.body.user,
      "date_end": req.body.user,
      "state": req.body.user,
    };
    await hostingRequests.add(data);
    res.json("success");
  } catch (error) {
    res.json({});
  }
});

router.get("/get_animal_hosting_request", validateFirebaseIdToken, async (req, res) => {
  try {
    const hostingRequests = await db.collection("hosting_requests").get();
    res.json(hostingRequests.docs.map((doc) => {
      const data = doc.data();
      data.id = doc.id;
      return data;
    }));
  } catch (error) {
    res.json({});
  }
});


router.get("/get_animal_hosting_request_filter", validateFirebaseIdToken, async (req, res) => {
  // try {
  //   const filterField = req.query["filter_field"];
  //   const filterValue = req.query["filter_value"];
  //   const hostingRequests = await db.collection("hosting_requests").get();
  //   const animals = await db.collection("animals");
  //   res.json(hostingRequests.docs.filter(async (doc) => {
  //     let animal = await animals.doc(animalId).get();
  //
  //   }));
  // } catch (error) {
  //   res.json({});
  // }
});




module.exports = router;
