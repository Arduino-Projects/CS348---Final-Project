import express from "express";
import mysql from "mysql";
import cors from "cors";

const app = express();
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "DatabasePass",
  database: "AutoShopDB",
});

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  res.json("HELLO this is the backend");
});

app.get("/carsFiltered", (req, res) => {
  console.log(req.query);
  const q =
    "call get_filtered_cars(" +
    req.query["make_year"] +
    ", " +
    req.query["odometer_max"] +
    ', "' +
    req.query["make_wanted"] +
    '");';
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.get("/reviews", (req, res) => {
  console.log(req.query);
  const q = "call get_reviews(" + req.query["car_id"] + ");";
  db.query(q, (err, data) => {
    console.log(q);
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.get("/orders", (req, res) => {
  console.log(req.query);
  const q = "call bought_by_user(" + req.query["buyer"] + ");";
  db.query(q, (err, data) => {
    console.log(q);
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.get("/deleteComment", (req, res) => {
  console.log(req.data);
  const q = "call delete_comment(" + req.query["comment_id"] + ");";
  db.query(q, (err, data) => {
    console.log(q);
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.post("/newcar", (req, res) => {
  const q = 'call add_comment("amazingggg", 5, 1, 1)';
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.listen(8800, () => {
  console.log("CONNECTED!");
});
