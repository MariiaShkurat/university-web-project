import Router from "express";
import DisciplineController from "../controllers/DisciplineController.js";
const router = new Router();

router.get("/disciplines", DisciplineController.get);

router.get("/disciplines/:id", DisciplineController.getById);

router.post("/disciplines", DisciplineController.create);

router.put("/disciplines", DisciplineController.update);

router.delete("/disciplines/:id", DisciplineController.delete);

export default router;
