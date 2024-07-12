const express = require("express");
const router = express.Router();
const controller = require("../controllers/datosClientes.controller");

router.get("/", controller.listado);
router.get("/:id_datos_cliente", controller.obtenerPorId);
router.post("/", controller.agregar);
router.put("/:id_datos_cliente", controller.actualizar);
router.delete("/:id_datos_cliente", controller.eliminar);

module.exports = router;
