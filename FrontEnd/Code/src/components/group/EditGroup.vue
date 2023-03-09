<template>
  <div>
    <div class="edit-form">
      <h1>Group</h1>
      <form action="" @submit.prevent>
        <div class="form-group">
          <label for="department_id">Department</label>
          <v-select
            label="NAME"
            :options="departments"
            :reduce="(department) => department.ID"
            v-model.trim="group.department_id"
            @:input="v$.group.department_id.$touch"
            class="v-select"
          >
          </v-select>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="group.group_name"
            @:input="v$.group.group_name.$touch"
          />
          <span v-if="v$.group.group_name.$error" class="error">
            {{ v$.group.group_name.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="course">Course</label>
          <my-inputs
            id="course"
            type="number"
            v-model.trim="group.course"
            @:input="v$.group.course.$touch"
          />
          <span v-if="v$.group.course.$error" class="error">
            {{ v$.group.course.$errors[0].$message }}
          </span>
        </div>

        <my-buttons @click="$router.push(`/group`)"> Back </my-buttons>
        <my-buttons type="submit" class="btn btn-submit" @click="updateGroup">
          Update
        </my-buttons>
      </form>
    </div>
  </div>
</template>

<script>
import MyButtons from "../UI/MyButtons.vue";
import MyInputs from "../UI/MyInputs.vue";
import GroupDataServices from "../../services/GroupDataServices";
import DepartmentDataService from "../../services/DepartmentDataService";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
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
import { groupPattern } from "../../functions";

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
      group: {
        id: null,
        department_id: "",
        group_name: "",
        course: "",
      },
      departments: [],
    };
  },
  validations() {
    return {
      group: {
        department_id: {
          required: helpers.withMessage("Department is required", required),
        },
        group_name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(64),
          groupPattern: helpers.withMessage("Name is invalid", groupPattern),
        },
        course: {
          required: helpers.withMessage("Course is required", required),
          minValue: helpers.withMessage(
            "Course must be between 1 and 6",
            minValue(1)
          ),
          maxValue: helpers.withMessage(
            "Course must be between 1 and 6",
            maxValue(6)
          ),
          integer: helpers.withMessage("Course is integer)", integer),
        },
      },
    };
  },
  methods: {
    getDepartment() {
      DepartmentDataService.getAll()
        .then((res) => {
          this.departments = res.data;
          console.log(this.departments);
          console.log(res.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    getGroup(id) {
      GroupDataServices.get(id).then((res) => {
        this.group.id = res.data.ID;
        this.group.department_id = res.data.DEPARTMENT_ID;
        this.group.group_name = res.data.NAME;
        this.group.course = res.data.COURSE;
        console.log(res.data);
      });
    },
    updateGroup() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          ID: this.group.id,
          DEPARTMENT_ID: this.group.department_id,
          NAME: this.group.group_name,
          COURSE: this.group.course,
        };
        GroupDataServices.update(data)
          .then((res) => {
            alert("Group successfully edited!");
            console.log(res.data);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/group`);
      }
    },
  },
  mounted() {
    this.getGroup(this.$route.params.id);
    this.getDepartment();
  },
};
</script>

<style scoped></style>
