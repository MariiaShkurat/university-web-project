import Router from "express";
import DepartmentController from "../controllers/DepartmentController.js";
const router = new Router();

router.get("/departments", DepartmentController.get);

router.get("/departments/:id", DepartmentController.getById);

router.post("/departments", DepartmentController.create);

router.put("/departments", DepartmentController.update);

router.delete("/departments/:id", DepartmentController.delete);

export default router;
