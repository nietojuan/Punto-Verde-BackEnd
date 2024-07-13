const db = require("../db/db");

// Listado se usuarios.

const listadoDeUsuarios = (req, res) => {
  const sql = "SELECT * FROM usuarios";
  db.query(sql, (error, rows) => {
    if (error) {
      console.error("Error de la Base de Datos ", error);
      return res
        .status(500)
        .json({ error: "Intente más tarde", details: error.message });
    }
    res.json(rows);
  });
};

// Usuarios por id.

const obtenerPorId = (req, res) => {
  const { id_usuario } = req.params;
  const sql = "SELECT * FROM usuarios WHERE id_usuario = ?";
  db.query(sql, [id_usuario], (error, rows) => {
    if (error) {
      console.error("Error en la base de datos:", error);
      return res
        .status(500)
        .json({ error: "Intente más tarde.", details: error.message });
    }

    if (rows.length === 0) {
      return res.status(404).json({ error: "Usuario no encontrado." });
    }

    res.json(rows[0]);
  });
};

// Agregar.

const agregar = (req, res) => {
  const { nombre, email, password } = req.body;
  const sql = "INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)";

  db.query(sql, [nombre, email, password], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }

    const usuario = {
      id_usuario: result.insertId,
      nombre,
      email,
      password,
    };

    res.status(201).json(usuario);
  });
};

// Actualizar.

const actualizar = (req, res) => {
  const { id_usuario } = req.params;
  const { nombre, email, password } = req.body;

  if (!nombre || !email || !password) {
    return res.status(400).json({ error: "Faltan campos requeridos" });
  }

  const sql =
    "UPDATE usuarios SET nombre = ?, email = ?, password = ? WHERE id_usuario = ?";

  db.query(sql, [nombre, email, password, id_usuario], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }
    const usuario = { ...req.body, ...req.params };
    res.json(usuario);
  });
};

// Eliminar.

const eliminar = (req, res) => {
  const { id_usuario } = req.params;
  const sql = "DELETE FROM usuarios  WHERE id_usuario = ?";

  db.query(sql, [id_usuario], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Contacto no encontrado" });
    }
    res.json({ message: "Usuario eliminado correctamente" });
  });
};

module.exports = {
  listadoDeUsuarios,
  agregar,
  obtenerPorId,
  actualizar,
  eliminar,
};
