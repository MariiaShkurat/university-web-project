import Router from "express";
import StudentController from "../controllers/StudentController.js";
const router = new Router();

router.get("/students", StudentController.get);

router.get("/students/:id", StudentController.getById);

router.post("/students", StudentController.create);

router.put("/students", StudentController.update);

router.delete("/students/:id", StudentController.delete);

export default router;
