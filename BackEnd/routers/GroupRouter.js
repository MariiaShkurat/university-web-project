import Router from "express";
import GroupController from "../controllers/GroupController.js";
const router = new Router();

router.get("/groups", GroupController.get);

router.get("/groups/:id", GroupController.getById);

router.post("/groups", GroupController.create);

router.put("/groups", GroupController.update);

router.delete("/groups/:id", GroupController.delete);

export default router;
