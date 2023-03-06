import express from "express";
import mysql from "mysql";

const app = express();
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "DatabasePass",
  database: "AutoShopDB",
});

app.get("/", (req, res) => {
  res.json("HELLO this is the backend");
});

app.get("/cars", (req, res) => {
  const q = "SELECT * FROM BUYER;";
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.listen(8800, () => {
  console.log("CONNECTED!");
});
