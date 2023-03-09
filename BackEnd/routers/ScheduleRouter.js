import Router from "express";
import SchedulesController from "../controllers/ScheduleController.js";
const router = new Router();

router.get("/schedules", SchedulesController.get);

router.get("/schedules/:id", SchedulesController.getById);

router.post("/schedules", SchedulesController.create);

router.put("/schedules", SchedulesController.update);

router.delete("/schedules/:id", SchedulesController.delete);

export default router;
