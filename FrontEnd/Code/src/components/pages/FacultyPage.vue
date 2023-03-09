<template>
  <div>
    <h1 class="title">Faculties</h1>

    <my-table v-if="faculties.length > 0" :heads="heads">
      <my-table-row v-for="faculty in faculties" :key="faculty.ID">
        <my-table-column>
          {{ faculty.NAME }}
        </my-table-column>
        <my-table-column>
          {{ faculty.SHORT_NAME }}
        </my-table-column>
        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/faculty/${faculty.ID}`)" />
            <DeleteIcon @click="deleteFaculty(faculty)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_faculty')"
      style="padding: 10px; width: 99%"
      >Add Faculty</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import FacultyDataService from "../../services/FacultyDataService";
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
    faculties: [],
    heads: ["name", "short_name", "actions"],
  }),
  methods: {
    getFaculties() {
      FacultyDataService.getAll()
        .then((res) => {
          this.faculties = res.data;
          console.log(this.faculties);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteFaculty(faculty) {
      FacultyDataService.delete(faculty.ID)
        .then((res) => {
          alert(
            "You have successfully deleted faculty: " + faculty.NAME + " !"
          );
          console.log(res.data);
          this.getFaculties();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getFaculties();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
