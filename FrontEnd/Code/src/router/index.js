import { createRouter, createWebHistory } from 'vue-router'
import mainPage from "../components/MainPage.vue";
import FacultyPage from "../components/pages/FacultyPage.vue";
import editFaculty from "../components/faculty/EditFaculty.vue";
import addFaculty from "../components/faculty/AddFaculty.vue";
import TeacherPage from "../components/pages/TeacherPage.vue";
import editTeacher from "../components/teacher/EditTeacher.vue";
import addTeacher from "../components/teacher/AddTeacher.vue";
import DisciplinePage from "../components/pages/DisciplinePage.vue";
import editDiscipline from "../components/discipline/EditDiscipline.vue";
import addDiscipline from "../components/discipline/AddDiscipline.vue";
import GroupPage from "../components/pages/GroupPage.vue";
import editGroup from "../components/group/EditGroup.vue";
import addGroup from "../components/group/AddGroup.vue";
import DepartmentPage from "../components/pages/DepartmentPage.vue";
import editDepartment from "../components/department/EditDepartment.vue";
import addDepartment from "../components/department/AddDepartment.vue";
import StudentPage from "../components/pages/StudentPage.vue";
import editStudent from "../components/student/EditStudent.vue";
import addStudent from "../components/student/AddStudent.vue";
import addSchedule from "../components/schedule/AddSchedule.vue";
import SchedulePage from "../components/pages/SchedulePage.vue";
import editSchedule from "../components/schedule/EditSchedule.vue";
import NotFound from "../components/UI/NotFound.vue";
import NewsPage from "../components/pages/NewsPage.vue";
import editNews from "../components/news/EditNews.vue";
import addNews from "../components/news/AddNews.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/:catchAll(.*)',
      component: NotFound,
    },
    {
      path: '/',
      name: 'main-page',
      component: mainPage
    },
    {
      path: '/faculty',
      name: 'faculty',
      component: FacultyPage
    },
    {
      path: '/faculty/:id',
      name: 'faculty-details',
      component: editFaculty
    },
    {
      path: '/add_faculty',
      name: 'add-faculty',
      component: addFaculty
    },
    {
      path: '/teacher',
      name: 'teacher',
      component: TeacherPage
    },
    {
      path: '/teacher/:id',
      name: 'teacher-details',
      component: editTeacher
    },
    {
      path: '/add_teacher',
      name: 'add-teacher',
      component: addTeacher
    },
    {
      path: '/discipline',
      name: 'discipline',
      component: DisciplinePage
    },
    {
      path: '/discipline/:id',
      name: 'discipline-details',
      component: editDiscipline
    },
    {
      path: '/add_discipline',
      name: 'add-discipline',
      component: addDiscipline
    },
    {
      path: '/group',
      name: 'group',
      component: GroupPage
    },
    {
      path: '/group/:id',
      name: 'group-details',
      component: editGroup
    },
    {
      path: '/add_group',
      name: 'add-group',
      component: addGroup
    },
    {
      path: '/department',
      name: 'department',
      component: DepartmentPage
    },
    {
      path: '/department/:id',
      name: 'department-details',
      component: editDepartment
    },
    {
      path: '/add_department',
      name: 'add-department',
      component: addDepartment
    },
    {
      path: '/student',
      name: 'student',
      component: StudentPage
    },
    {
      path: '/student/:id',
      name: 'student-details',
      component: editStudent
 
    },
    {
      path: '/add_student',
      name: 'add-student',
      component: addStudent
    },
    {
      path: '/schedule',
      name: 'schedule',
      component: SchedulePage
    },
    {
      path: '/schedule/:id',
      name: 'schedule-details',
      component: editSchedule
 
    },
    {
      path: '/add_schedule',
      name: 'add-schedule',
      component: addSchedule
    },
    {
      path: '/news',
      name: 'news',
      component: NewsPage
    },
    {
      path: '/news/:id',
      name: 'news-details',
      component: editNews
    },
    {
      path: '/add_news',
      name: 'add-news',
      component: addNews
    },
  ]
})

export default router
