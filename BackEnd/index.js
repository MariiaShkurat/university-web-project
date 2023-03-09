import express from "express";
import cors from "cors";
import facultyRouter from "./routers/FacultyRouter.js";
import departmentRouter from "./routers/DepartmentRouter.js";
import disciplineRouter from "./routers/DisciplineRouter.js";
import groupRouter from "./routers/GroupRouter.js";
import newsRouter from "./routers/NewsRouter.js";
import scheduleRouter from "./routers/ScheduleRouter.js";
import studentRouter from "./routers/StudentRouter.js";
import teacherRouter from "./routers/TeacherRouter.js";

const PORT = 5000;

const app = express();

app.use(express.json());
app.use(
  cors({
    origin: "*",
  })
);

app.use("/", facultyRouter);
app.use("/", departmentRouter);
app.use("/", disciplineRouter);
app.use("/", groupRouter);
app.use("/", newsRouter);
app.use("/", scheduleRouter);
app.use("/", studentRouter);
app.use("/", teacherRouter);

async function startApp() {
  try {
    app.listen(PORT, () => console.log("SERVER STARTED ON PORT " + PORT));
  } catch (e) {
    console.log(e);
  }
}

startApp();
