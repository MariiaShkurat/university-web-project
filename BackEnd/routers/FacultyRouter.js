import Router from "express";
import FacultyController from "../controllers/FacultyController.js";
const router = new Router();

router.get("/faculties", FacultyController.get);

router.get("/faculties/:id", FacultyController.getById);

router.post("/faculties", FacultyController.create);

router.put("/faculties", FacultyController.update);

router.delete("/faculties/:id", FacultyController.delete);

export default router;
