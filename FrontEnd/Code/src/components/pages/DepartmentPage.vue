<template>
  <div>
    <h1 class="title">Departments</h1>

    <my-table :heads="heads" v-if="departments.length > 0">
      <my-table-row v-for="department in departments" :key="department.ID">
        <my-table-column>
          {{ department.FACULTY_NAME }}
        </my-table-column>
        <my-table-column>
          {{ department.NAME }}
        </my-table-column>
        <my-table-column>
          {{ department.SHORT_NAME }}
        </my-table-column>
        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/department/${department.ID}`)" />
            <DeleteIcon @click="deleteDepartment(department)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_department')"
      style="padding: 10px; width: 99%"
      >Add Department</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import DepartmentDataService from "../../services/DepartmentDataService";
import DeleteIcon from "../icons/IconDelete.vue";
import EditIcon from "../icons/IconEdit.vue";
import { start_toggle } from "../../functions/function_toggle";
import FacultyDataService from "../../services/FacultyDataService";

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
    departments: [],
    heads: ["faculty_name", "name", "short_name", "actions"],
  }),
  methods: {
    getDepartment() {
      DepartmentDataService.getAll()
        .then((res) => {
          this.departments = res.data;
          this.departments.forEach((dep) => {
            FacultyDataService.get(dep.FACULTY_ID).then((res) => {
              dep.FACULTY_NAME = res.data.NAME;
            });
          });
        
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteDepartment(department) {
      DepartmentDataService.delete(department.ID)
        .then((res) => {
          alert(
            "You have successfully deleted department: " +
              department.NAME +
              " !"
          );
          console.log(res.data);
          this.getDepartment();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getDepartment();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
.title {
  text-align: center;
}
</style>
