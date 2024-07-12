const express = require("express");
const router = express.Router();
const controller = require("../controllers/productos.controller");

router.get("/", controller.listadoDeProductos);
router.get("/:id_producto", controller.obtenerPorId);
router.post("/", controller.agregar);
router.put("/:id_producto", controller.actualizar);
router.delete("/:id_producto", controller.eliminar);

module.exports = router;
