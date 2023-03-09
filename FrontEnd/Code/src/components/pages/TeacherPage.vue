<template>
  <div>
    <h1 class="title">Teachers</h1>
    <my-table :heads="heads" v-if="teachers.length > 0">
      <my-table-row v-for="teacher in teachers" :key="teacher.ID">
        <my-table-column>
          {{ teacher.NAME }}
        </my-table-column>
        <my-table-column>
          {{ teacher.SURNAME }}
        </my-table-column>
        <my-table-column>
          {{ teacher.EMAIL }}
        </my-table-column>
        <my-table-column>
          {{ teacher.PHONE }}
        </my-table-column>
        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/teacher/${teacher.ID}`)" />
            <DeleteIcon @click="deleteTeacher(teacher)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_teacher')"
      style="padding: 10px; width: 99%"
      >Add Teacher</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import TeacherDataServices from "../../services/TeacherDataServices";
import DeleteIcon from "../icons/IconDelete.vue";
import EditIcon from "../icons/IconEdit.vue";
import { start_toggle } from "../../functions/function_toggle";

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
    teachers: [],
    heads: ["name", "surname", "email", "phone", "actions"],
  }),
  methods: {
    getTeachers() {
      TeacherDataServices.getAll()
        .then((res) => {
          this.teachers = res.data;
          console.log(res.data);
          console.log(this.teachers);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteTeacher(teacher) {
      TeacherDataServices.delete(teacher.ID)
        .then((res) => {
          alert(
            "You have successfully deleted teacher: " + teacher.NAME + " !"
          );
          console.log(res.data);
          this.getTeachers();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getTeachers();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
