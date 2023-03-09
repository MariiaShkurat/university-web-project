<template>
  <div>
    <div class="edit-form">
      <h1>Schedule</h1>
      <form action="">
        <div class="form-group">
          <label for="group_id">Group</label>
          <v-select
            label="NAME"
            :options="groups"
            :reduce="(group) => group.ID"
            v-model.trim="schedule.group_id"
            class="v-select"
            @:input="v$.schedule.group_id.$touch"
          >
          </v-select>
          <span v-if="v$.schedule.group_id.$error" class="error">
            {{ v$.schedule.group_id.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="teacher_id">Teacher</label>
          <v-select
            label="NAME"
            :options="teachers"
            :reduce="(teacher) => teacher.ID"
            v-model.trim="schedule.teacher_id"
            @:input="v$.schedule.teacher_id.$touch"
            class="v-select"
          >
          </v-select>
          <span v-if="v$.schedule.teacher_id.$error" class="error">
            {{ v$.schedule.teacher_id.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="discipline_id">Disciplines</label>
          <v-select
            label="NAME"
            :options="disciplines"
            :reduce="(discipline) => discipline.ID"
            v-model.trim="schedule.discipline_id"
            @:input="v$.schedule.discipline_id.$touch"
            class="v-select"
          >
          </v-select>
          <span v-if="v$.schedule.discipline_id.$error" class="error">
            {{ v$.schedule.discipline_id.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="schedule.schedule_name"
            @:input="v$.schedule.schedule_name.$touch"
          />
          <span v-if="v$.schedule.schedule_name.$error" class="error">
            {{ v$.schedule.schedule_name.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="time">Time</label>
          <my-inputs
            id="time"
            v-model.trim="schedule.time"
            @:input="v$.schedule.time.$touch"
          />
          <span v-if="v$.schedule.time.$error" class="error">
            {{ v$.schedule.time.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="classroom">Classroom</label>
          <my-inputs
            id="classroom"
            v-model.trim="schedule.classroom"
            @:input="v$.schedule.classroom.$touch"
          />
          <span v-if="v$.schedule.classroom.$error" class="error">
            {{ v$.schedule.classroom.$errors[0].$message }}
          </span>
        </div>

        <my-buttons @click="$router.push(`/schedule`)"> Back </my-buttons>
        <my-buttons
          type="submit"
          class="btn btn-submit"
          @click="updateSchedule"
        >
          Update
        </my-buttons>
      </form>
    </div>
  </div>
</template>

<script>
import MyButtons from "../UI/MyButtons.vue";
import MyInputs from "../UI/MyInputs.vue";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
import GroupDataServices from "../../services/GroupDataServices";
import TeacherDataServices from "../../services/TeacherDataServices";
import DisciplineDataService from "../../services/DisciplineDataService";
import ScheduleDataService from "../../services/ScheduleDataService";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import {
  helpers,
  integer,
  maxLength,
  minLength,
  minValue,
  required,
} from "@vuelidate/validators";
import { namePattern } from "../../functions";

export default {
  components: {
    MyInputs,
    MyButtons,
    vSelect,
  },
  setup() {
    return { v$: useVuelidate() };
  },
  data() {
    return {
      schedule: {
        id: null,
        group_id: "",
        teacher_id: "",
        discipline_id: "",
        schedule_name: "",
        time: "",
        classroom: "",
      },
      groups: [],
      teachers: [],
      disciplines: [],
    };
  },
  validations() {
    return {
      schedule: {
        group_id: {
          required: helpers.withMessage("Group is required", required),
        },
        teacher_id: {
          required: helpers.withMessage("Teacher is required", required),
        },
        discipline_id: {
          required: helpers.withMessage("Discipline is required", required),
        },
        schedule_name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(64),
          namePattern: helpers.withMessage("Name is invalid", required),
        },
        time: {
          required: helpers.withMessage("Time is required", required),
        },
        classroom: {
          required: helpers.withMessage("Classroom is required", required),
          minLength: minValue(1),
          maxLength: maxLength(6),
          integer: helpers.withMessage(
            "Name of classroom is integer)",
            integer
          ),
        },
      },
    };
  },
  methods: {
    getGroups() {
      GroupDataServices.getAll()
        .then((res) => {
          this.groups = res.data;
          console.log(res.data);
          console.log(this.groups);
        })
        .catch((e) => {
          console.log(e);
        });
    },
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
    getDisciplines() {
      DisciplineDataService.getAll()
        .then((res) => {
          this.disciplines = res.data;
          console.log(res.data);
          console.log(this.disciplines);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    getSchedule(id) {
      ScheduleDataService.get(id).then((res) => {
        this.schedule.id = res.data.ID;
        this.schedule.group_id = res.data.GROUP_ID;
        this.schedule.teacher_id = res.data.TEACHER_ID;
        this.schedule.discipline_id = res.data.DISCIPLINE_ID;
        this.schedule.schedule_name = res.data.NAME;
        this.schedule.time = res.data.TIME;
        this.schedule.classroom = res.data.CLASSROOM;
        console.log(res.data);
      });
    },
    updateSchedule() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          ID: this.schedule.id,
          GROUP_ID: this.schedule.group_id,
          TEACHER_ID: this.schedule.teacher_id,
          DISCIPLINE_ID: this.schedule.discipline_id,
          NAME: this.schedule.schedule_name,
          TIME: this.schedule.time,
          CLASSROOM: this.schedule.classroom,
        };
        ScheduleDataService.update(data)
          .then((res) => {
            alert("Schedule successfully edited!");
            console.log(res.data);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/schedule`);
      }
    },
  },
  mounted() {
    this.getGroups();
    this.getTeachers();
    this.getDisciplines();
    this.getSchedule(this.$route.params.id);
  },
};
</script>

<style scoped></style>
