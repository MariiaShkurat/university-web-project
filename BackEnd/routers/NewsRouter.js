import Router from "express";
import NewsController from "../controllers/NewsController.js";
const router = new Router();

router.get("/news", NewsController.get);

router.get("/news/:id", NewsController.getById);

router.post("/news", NewsController.create);

router.put("/news", NewsController.update);

router.delete("/news/:id", NewsController.delete);

export default router;
