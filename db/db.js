const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: process.env.DB_HOST || "juannieto.alwaysdata.net/",
  user: process.env.DB_USER || "juannieto",
  password: process.env.DB_PASSWORD || "loquillo",
  database: process.env.DB_NAME || "juannieto_puntoverde_backend",
});

connection.connect((error) => {
  if (error) {
    return console.error(error);
  }
  console.log("Conectado");
});

module.exports = connection;
