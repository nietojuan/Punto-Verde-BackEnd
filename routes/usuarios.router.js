const express = require("express");
const router = express.Router();
const controller = require("../controllers/usuarios.controller");

router.get("/", controller.listadoDeUsuarios);
router.get("/:id_usuario", controller.obtenerPorId);
router.post("/", controller.agregar);
router.put("/:id_usuario", controller.actualizar);
router.delete("/:id_usuario", controller.eliminar);

module.exports = router;
