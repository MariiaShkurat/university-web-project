<template>
  <div>
    <my-buttons class="b-btn" @click="$router.push(`/schedule`)">
      Back
    </my-buttons>
    <h1 class="title">Add schedule</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="group_id">Group</label>
          <v-select
            label="NAME"
            :options="groups"
            :reduce="(group) => group.ID"
            v-model.trim="schedule.group_id"
            @:input="v$.schedule.group_id.$touch"
            class="v-select"
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
          <label for="discipline_id">discipline</label>
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
            v-model.trim="schedule.name"
            @:input="v$.schedule.name.$touch"
          />
          <span v-if="v$.schedule.name.$error" class="error">
            {{ v$.schedule.name.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="time">Time</label>
          <my-inputs
            type="time"
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

        <my-buttons
          @click="createSchedule"
          class="btn btn-submit"
          style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create schedule successfully!</h4>
        <my-buttons @click="$router.push(`/schedule`)"> Back </my-buttons>
        <my-buttons class="btn btn-submit" @click="newSchedule">
          Add
        </my-buttons>
      </div>
    </div>
  </div>
</template>

<script>
import myInputs from "../UI/MyInputs.vue";
import myButtons from "../UI/MyButtons.vue";
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
  maxValue,
  minLength,
  minValue,
  required,
} from "@vuelidate/validators";
import { namePattern } from "../../functions";

export default {
  components: {
    myButtons,
    myInputs,
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
        name: "",
        time: "",
        classroom: "",
      },
      groups: [],
      teachers: [],
      disciplines: [],
      submitted: false,
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
        name: {
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
    createSchedule() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          GROUP_ID: this.schedule.group_id,
          TEACHER_ID: this.schedule.teacher_id,
          DISCIPLINE_ID: this.schedule.discipline_id,
          NAME: this.schedule.name,
          TIME: this.schedule.time,
          CLASSROOM: this.schedule.classroom,
        };
        ScheduleDataService.create(data)
          .then((res) => {
            this.schedule.id = res.data.ID;
            console.log(res.data);
            this.submitted = true;
            this.$router.push(`/schedule`);
          })
          .catch((e) => {
            console.log(e);
          });
      }
    },

    newSchedule() {
      this.submitted = false;
      this.schedule = {};
    },
  },
  mounted() {
    this.getGroups();
    this.getTeachers();
    this.getDisciplines();
  },
};
</script>

<style scoped>
.form {
  font-size: 24px;
  font-weight: 600;
  max-width: 400px;
  margin: auto;
}
</style>
