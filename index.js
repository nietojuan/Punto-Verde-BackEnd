const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("puntoverdebackend!!");
});

const PORT = process.env.PORT || 8100;

app.listen(PORT, () => console.log(`http://localhost:${PORT}`));
