import Router from "express";
import TeacherController from "../controllers/TeacherController.js";
const router = new Router();

router.get("/teachers", TeacherController.get);

router.get("/teachers/:id", TeacherController.getById);

router.post("/teachers", TeacherController.create);

router.put("/teachers", TeacherController.update);

router.delete("/teachers/:id", TeacherController.delete);

export default router;
