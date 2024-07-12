const db = require("../db/db");

// lista de productos.

const listadoDeProductos = (req, res) => {
  const sql = "SELECT * FROM productos";
  db.query(sql, (error, rows) => {
    if (error) {
      console.error("Error de la Base de Datos ", error);
      return res
        .status(500)
        .json({ error: "Intente en otro momento", details: error.message });
    }
    res.json(rows);
  });
};
// Productos por id.

const obtenerPorId = (req, res) => {
  console.log(req.params);
  const { id_producto } = req.params;
  const sql = "SELECT * FROM productos WHERE id_productos = ?";
  db.query(sql, [id_producto], (error, rows) => {
    if (error) {
      console.error("Error en la base de datos:", error);
      return res
        .status(500)
        .json({ error: "Intente en otro momento.", details: error.message });
    }

    if (rows.length === 0) {
      return res.status(404).json({ error: "Producto no encontrado." });
    }

    res.json(rows[0]);
  });
};

// Agregar.

const agregar = (req, res) => {
  const { nombre, precio, stock, id_categoria } = req.body;

  const sql =
    "INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES (?, ?, ?, ?)";

  db.query(sql, [nombre, precio, stock, id_categoria], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res
        .status(500)
        .json({ error: "Espere un momento y vuelva a intentarlo" });
    }

    const producto = {
      id: result.insertId,
      nombre,
      precio,
      stock,
      id_categoria,
    };

    res.status(201).json(producto);
  });
};

// Actualizar.

const actualizar = (req, res) => {
  const { id_productos } = req.params;
  const { nombre, precio, stock, id_categoria } = req.body;

  const sql =
    "UPDATE productos SET nombre = ?, precio = ?, stock = ?, id_categoria = ?,  WHERE id_productos = ?";

  db.query(
    sql,
    [nombre, precio, stock, id_categoria, id_productos],
    (error, result) => {
      if (error) {
        console.error("Error de consulta a la base de datos:", error);
        return res.status(500).json({ error: "Intente más tarde" });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "Producto no encontrado" });
      }
      const producto = { ...req.body, ...req.params };
      res.json(producto);
    }
  );
};

// Eliminar.

const eliminar = (req, res) => {
  const { id_productos } = req.params;
  const sql = "DELETE FROM productos WHERE id_productos = ?";

  db.query(sql, [id_productos], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Producto no encontrado" });
    }
    res.json({ message: "Producto eliminado correctamente" });
  });
};

module.exports = {
  listadoDeProductos,
  obtenerPorId,
  agregar,
  actualizar,
  eliminar,
};
