const db = require("../db/db");

// Listado.

const listadoDeCategorias = (req, res) => {
  const sql = "SELECT * FROM categorias";
  db.query(sql, (error, rows) => {
    if (error) {
      console.error("Error de la Base de Datos ", error);
      return res
        .status(500)
        .json({ error: "Intente Luego", details: error.message });
    }
    res.json(rows);
  });
};

//  Categoria por id.

const obtenerPorId = (req, res) => {
  const { id_categoria } = req.params;
  const sql = "SELECT * FROM categorias WHERE id_categoria = ?";
  db.query(sql, [id_categoria], (error, rows) => {
    if (error) {
      console.error("Error en la base de datos:", error);
      return res
        .status(500)
        .json({ error: "Intente más tarde.", details: error.message });
    }

    if (rows.length === 0) {
      return res.status(404).json({ error: "Categoría no encontrada." });
    }

    res.json(rows[0]);
  });
};

// Agregar.

const agregar = (req, res) => {
  const { categoria } = req.body;
  const sql = "INSERT INTO categorias (categoria) VALUES (?)";

  db.query(sql, [categoria], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }

    const categoria = {
      id_categoria: result.insertId,
      categoria,
    };

    res.status(201).json(categoria);
  });
};

// Actualizar.

const actualizar = (req, res) => {
  const { id_categoria } = req.params;
  const { categoria } = req.body;

  if (!categoria) {
    return res.status(400).json({ error: "Faltan campos requeridos" });
  }

  const sql = "UPDATE categorias SET categoria = ? WHERE id_categoria = ?";

  db.query(sql, [categoria, id_categoria], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Categoría no encontrada" });
    }
    const categoriaActualizada = { ...req.body, ...req.params };
    res.json(categoriaActualizada);
  });
};

// Eliminar.

const eliminar = (req, res) => {
  const { id_categoria } = req.params;
  const sql = "DELETE FROM categorias WHERE id_categoria = ?";

  db.query(sql, [id_categoria], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Categoría no encontrada" });
    }
    res.json({ message: "Categoría eliminada correctamente" });
  });
};

module.exports = {
  listadoDeCategorias,
  agregar,
  obtenerPorId,
  actualizar,
  eliminar,
};
