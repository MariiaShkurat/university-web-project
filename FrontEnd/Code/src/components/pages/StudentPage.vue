<template>
  <div>
    <h1 class="title">Students</h1>
    <my-table :heads="heads" v-if="students.length > 0">
      <my-table-row v-for="student in students" :key="student.ID">
        <my-table-column>
          {{ student.group_name }}
        </my-table-column>
        <my-table-column>
          {{ student.group_course }}
        </my-table-column>
        <my-table-column>
          {{ student.NAME }}
        </my-table-column>
        <my-table-column>
          {{ student.EMAIL }}
        </my-table-column>
        <my-table-column>
          {{ student.PHONE }}
        </my-table-column>

        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/student/${student.ID}`)" />
            <DeleteIcon @click="deleteStudent(student)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_student')"
      style="padding: 10px; width: 99%"
      >Add Student</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import DeleteIcon from "../icons/IconDelete.vue";
import EditIcon from "../icons/IconEdit.vue";
import StudentDataService from "../../services/StudentDataService";
import { start_toggle } from "../../functions/function_toggle";
import GroupDataServices from "../../services/GroupDataServices";

export default {
  components: {
    DeleteIcon,
    EditIcon,
    MyButtons,
    MyTableColumn,
    MyTableRow,
    MyTable,
  },
  data: () => ({
    students: [],
    heads: ["group", "course", "name", "email", "phone", "actions"],
  }),
  methods: {
    getStudents() {
      StudentDataService.getAll()
        .then((res) => {
          this.students = res.data;
          this.students.forEach((st) => {
            GroupDataServices.get(st.GROUP_ID).then((res) => {
              st.group_name = res.data.NAME;
              st.group_course = res.data.COURSE;
            });
          });

          console.log(res.data);
          console.log(this.students);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteStudent(student) {
      StudentDataService.delete(student.ID)
        .then((res) => {
          alert(
            "You have successfully deleted student: " + student.NAME + " !"
          );
          console.log(res.data);
          this.getStudents();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getStudents();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
