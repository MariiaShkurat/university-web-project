<template>
  <div>
    <h1 class="title">Schedule</h1>

    <my-table :heads="heads" v-if="schedules.length > 0">
      <my-table-row v-for="schedule in schedules" :key="schedule.ID">
        <my-table-column>
          {{ schedule.NAME }}
        </my-table-column>
        <my-table-column>
          {{ schedule.group_name }}
        </my-table-column>
        <my-table-column>
          {{ schedule.teacher_name }}
        </my-table-column>
        <my-table-column>
          {{ schedule.discipline_name }}
        </my-table-column>
        <my-table-column>
          {{ schedule.TIME }}
        </my-table-column>
        <my-table-column>
          {{ schedule.CLASSROOM }}
        </my-table-column>

        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/schedule/${schedule.ID}`)" />
            <DeleteIcon @click="deleteSchedule(schedule)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_schedule')"
      style="padding: 10px; width: 99%"
      >Add Schedule</my-buttons
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
import ScheduleDataService from "../../services/ScheduleDataService";
import { start_toggle } from "../../functions/function_toggle";
import GroupDataServices from "../../services/GroupDataServices";
import TeacherDataServices from "../../services/TeacherDataServices";
import DisciplineDataService from "../../services/DisciplineDataService";

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
    schedules: [],
    heads: [
      "schedule_name",
      "group_name",
      "teacher_name",
      "discipline_name",
      "time",
      "classroom",
      "action",
    ],
  }),
  methods: {
    getSchedules() {
      ScheduleDataService.getAll()
        .then((res) => {
          this.schedules = res.data;
          this.schedules.forEach((sch) => {
            GroupDataServices.get(sch.GROUP_ID).then((res) => {
              sch.group_name = res.data.NAME;
            });
          });
          this.schedules.forEach((sch) => {
            TeacherDataServices.get(sch.TEACHER_ID).then((res) => {
              sch.teacher_name = res.data.NAME;
            });
          });
          this.schedules.forEach((sch) => {
            DisciplineDataService.get(sch.DISCIPLINE_ID).then((res) => {
              sch.discipline_name = res.data.NAME;
            });
          });
          console.log(res.data);
          console.log(this.schedules);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteSchedule(schedule) {
      ScheduleDataService.delete(schedule.ID)
        .then((res) => {
          alert(
            "You have successfully deleted schedule: " + schedule.NAME + " !"
          );
          console.log(res.data);
          this.getSchedules();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getSchedules();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
