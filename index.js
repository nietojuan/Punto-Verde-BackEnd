const express = require("express");
const app = express();

app.use(express.json());

const productosRouter = require("./routes/productos.routes");
const categoriasRouter = require("./routes/categoria.routes");
const sucursalesRouter = require("./routes/sucursales.routes");
const contactoRouter = require("./routes/contacto.routes");

app.use("/productos", productosRouter);
app.use("/categoria", categoriasRouter);
app.use("/sucursales", sucursalesRouter);
app.use("/contacto", contactoRouter);

// app.use("/productos", require("./routes/productos.routes"));
// app.use("/usuarios", require("./routes/usuarios.routes"));
// app.use("/categorias", require("./routes/categorias.routes"));
// app.use("/datosClientes", require("./routes/catosClientes.routes"));

app.get("/", (req, res) => {
  res.send("Punto Verde BackEnd!!");
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`http://localhost:${PORT}`));
