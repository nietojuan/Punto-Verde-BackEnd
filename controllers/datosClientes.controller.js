const db = require("../db/db");

// Listado de datos.

const listadoDeDatos = (req, res) => {
  const sql = "SELECT * FROM datos_clientes";
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

// Datos de clientes por id.

const obtenerPorId = (req, res) => {
  const { id_datos_cliente } = req.params;
  const sql = "SELECT * FROM datos_cliente WHERE id_datos_cliente = ?";
  db.query(sql, [id_datos_cliente], (error, rows) => {
    if (error) {
      console.error("Error en la base de datos:", error);
      return res
        .status(500)
        .json({ error: "Intente más tarde.", details: error.message });
    }

    if (rows.length === 0) {
      return res.status(404).json({ error: "Datos de cliente no encontrado." });
    }

    res.json(rows[0]);
  });
};

// Agregar.

const agregar = (req, res) => {
  const { nombre, apellido, domicilio, localidad, telefono } = req.body;
  const sql =
    "INSERT INTO datos_cliente (nombre, apellido, domicilio, localidad, telefono) VALUES (?, ?, ?, ?, ?)";

  db.query(
    sql,
    [nombre, apellido, domicilio, localidad, telefono],
    (error, result) => {
      if (error) {
        console.error("Error de consulta a la base de datos:", error);
        return res.status(500).json({ error: "Intente más tarde" });
      }

      const datosClinetes = {
        id_contacto: result.insertId,
        nombre,
        apellido,
        domicilio,
        localidad,
        telefono,
      };

      res.status(201).json(datosClinetes);
    }
  );
};

// Actualizar.

const actualizar = (req, res) => {
  const { id_datos_cliente } = req.params;
  const { nombre, apellido, domicilio, localidad, telefono } = req.body;

  if (!nombre || !apellido || !domicilio || !localidad || !telefono) {
    return res.status(400).json({ error: "Faltan campos requeridos" });
  }

  const sql =
    "UPDATE datos_cliente SET nombre = ?, apellido = ?, domicilio = ?, localidad = ?, telefono = ? WHERE id_datos_cliente = ?";

  db.query(
    sql,
    [nombre, apellido, domicilio, localidad, telefono, id_datos_cliente],
    (error, result) => {
      if (error) {
        console.error("Error de consulta a la base de datos:", error);
        return res.status(500).json({ error: "Intente más tarde" });
      }
      if (result.affectedRows === 0) {
        return res
          .status(404)
          .json({ error: "Datos del cliente no encontrados" });
      }
      const datosCliente = { ...req.body, ...req.params };
      res.json(datosCliente);
    }
  );
};

// Eliminar.

const eliminar = (req, res) => {
  const { id_datos_cliente } = req.params;
  const sql = "DELETE FROM datos_cliente WHERE id_datos_cliente = ?";

  db.query(sql, [id_datos_cliente], (error, result) => {
    if (error) {
      console.error("Error de consulta a la base de datos:", error);
      return res.status(500).json({ error: "Intente más tarde" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Datos no encontrado" });
    }
    res.json({ message: "Datos del cliente fueron eliminados correctamente" });
  });
};

module.exports = {
  listadoDeDatos,
  agregar,
  obtenerPorId,
  actualizar,
  eliminar,
};
