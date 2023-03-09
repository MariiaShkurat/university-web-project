<template>
  <div>
    <div class="edit-form">
      <h1>Department</h1>
      <form action="" @submit.prevent>
        <div class="form-group">
          <label for="faculty_id">Faculty</label>
          <v-select
            label="NAME"
            :options="faculties"
            :reduce="(faculty) => faculty.ID"
            :value="department.faculty_id"
            v-model.trim="department.faculty_id"
            @:input="v$.department.faculty_id.$touch"
            class="v-select"
          >
          </v-select>
          <span v-if="v$.department.faculty_id.$error" class="error">
            {{ v$.department.faculty_id.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="department.department_name"
            @:input="v$.department.department_name.$touch"
          />
          <span v-if="v$.department.department_name.$error" class="error">
            {{ v$.department.department_name.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="short_name">Short_name</label>
          <my-inputs
            id="short_name"
            v-model.trim="department.short_name"
            @:input="v$.department.short_name.$touch"
          />
          <span v-if="v$.department.short_name.$error" class="error">
            {{ v$.department.short_name.$errors[0].$message }}
          </span>
        </div>

        <my-buttons @click="$router.push(`/department`)"> Back </my-buttons>
        <my-buttons
          type="submit"
          class="btn btn-submit"
          @click="updateDepartment"
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
import DepartmentDataService from "../../services/DepartmentDataService";
import FacultyDataService from "../../services/FacultyDataService";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import { helpers, maxLength, minLength, required } from "@vuelidate/validators";
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
      department: {
        id: "",
        faculty_id: "",
        department_name: "",
        short_name: "",
      },
      faculties: [],
    };
  },
  validations() {
    return {
      department: {
        faculty_id: {
          required: helpers.withMessage("Faculty is required", required),
        },
        department_name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(64),
          namePattern: helpers.withMessage("Name is invalid", namePattern),
        },
        short_name: {
          required: helpers.withMessage("Short name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(6),
          namePattern: helpers.withMessage(
            "Short name is invalid",
            namePattern
          ),
        },
      },
    };
  },
  methods: {
    getFaculty() {
      FacultyDataService.getAll()
        .then((res) => {
          console.log(0);
          this.faculties = res.data;
          console.log(this.faculties);

          console.log(res.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    getDepartment(id) {
      DepartmentDataService.get(id).then((res) => {
        this.department.faculty_id = res.data.FACULTY_ID;
        this.department.department_name = res.data.NAME;
        this.department.short_name = res.data.SHORT_NAME;
        this.department.id = res.data.ID;

        console.log(res.data);
      });
    },
    updateDepartment() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          ID: this.department.id,
          FACULTY_ID: this.department.faculty_id,
          NAME: this.department.department_name,
          SHORT_NAME: this.department.short_name,
        };
        DepartmentDataService.update(data)
          .then((res) => {
            alert("Department successfully edited!");
            console.log(res.data);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/department`);
      }
    },
  },
  mounted() {
    this.getFaculty();
    this.getDepartment(this.$route.params.id);
  },
};
</script>

<style scoped></style>
