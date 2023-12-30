const express = require("express");
const mysql = require("mysql2");
const app = express();
const port = process.env.PORT || 8080;
app.use(express.json);
const db = mysql.createPool({
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  socketPath: `/cloudsql/${process.env.INSTANCE_CONNECTION}`,
});
app.listen(port, () => console.log(`Example app listening on port ${port}!`));

app.get("/employee", (req, res) => {
  db.query("SELECT * FROM employees", (err, res) => {
    if (err) next(err);
    res.json(res);
  });
});
