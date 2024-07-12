require("dotenv").config();

const express = require("express");
const app = express();

app.use(express.json());

const productosRouter = require("./routes/productos.router");
const categoriasRouter = require("./routes/categorias.router");
const usuariosRouter = require("./routes/usuarios.router");
const datosClientesRouter = require("./routes/datosClienetes.router");

app.use("/productos", productosRouter);
app.use("/categorias", categoriasRouter);
app.use("/usuarios", usuariosRouter);
app.use("/datosClientes", datosClientesRouter);

app.get("/", (req, res) => {
  res.send("Punto Verde BackEnd!!");
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`http://localhost:${PORT}`));
