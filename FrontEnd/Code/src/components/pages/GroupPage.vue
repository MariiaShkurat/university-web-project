<template>
  <div>
    <h1 class="title">Groups</h1>
    <my-table :heads="heads" v-if="groups.length > 0">
      <my-table-row v-for="group in groups" :key="group.ID">
        <my-table-column>
          {{ group.department_name }}
        </my-table-column>
        <my-table-column>
          {{ group.NAME }}
        </my-table-column>
        <my-table-column>
          {{ group.COURSE }}
        </my-table-column>

        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/group/${group.ID}`)" />
            <DeleteIcon @click="deleteGroup(group)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_group')"
      style="padding: 10px; width: 99%"
      >Add Group</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import GroupDataServices from "../../services/GroupDataServices";
import DeleteIcon from "../icons/IconDelete.vue";
import EditIcon from "../icons/IconEdit.vue";
import { start_toggle } from "../../functions/function_toggle";
import DepartmentDataService from "../../services/DepartmentDataService";

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
    groups: [],
    heads: ["department_name", "name", "course", "actions"],
  }),
  methods: {
    getGroups() {
      GroupDataServices.getAll()
        .then((res) => {
          this.groups = res.data;
          this.groups.forEach((gr) => {
            DepartmentDataService.get(gr.DEPARTMENT_ID).then((res) => {
              gr.department_name = res.data.NAME;
            });
          });

          console.log(res.data);
          console.log(this.groups);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteGroup(group) {
      GroupDataServices.delete(group.ID)
        .then((res) => {
          alert("You have successfully deleted group: " + group.NAME + " !");
          console.log(res.data);
          this.getGroups();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getGroups();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
