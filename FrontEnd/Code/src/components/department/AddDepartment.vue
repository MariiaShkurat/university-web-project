<template>
  <div>
    <my-buttons class="b-btn" @click="$router.push(`/department`)">
      Back
    </my-buttons>
    <h1 class="title">Add department</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="faculty_id">Faculty</label>
          <v-select
            :options="faculties"
            :reduce="(faculty) => faculty.ID"
            v-model.trim="department.faculty_id"
            @:input="v$.department.faculty_id.$touch"
            class="v-select"
            label="NAME"
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
            v-model.trim="department.name"
            @:input="v$.department.name.$touch"
          />
          <span v-if="v$.department.name.$error" class="error">
            {{ v$.department.name.$errors[0].$message }}
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

        <my-buttons
          @click="createDepartment"
          class="btn btn-submit"
          style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create department successfully!</h4>
        <my-buttons class="btn btn-submit" @click="newDepartment">
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
import DepartmentDataService from "../../services/DepartmentDataService";
import FacultyDataService from "../../services/FacultyDataService";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import { helpers, maxLength, minLength, required } from "@vuelidate/validators";
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
      department: {
        id: null,
        faculty_id: "",
        name: "",
        short_name: "",
      },
      faculties: [],
      submitted: false,
    };
  },
  validations() {
    return {
      department: {
        faculty_id: {
          required: helpers.withMessage("Faculty is required", required),
        },
        name: {
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
          console.log(1);
          console.log(res.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    createDepartment() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          FACULTY_ID: this.department.faculty_id,
          NAME: this.department.name,
          SHORT_NAME: this.department.short_name,
        };
        DepartmentDataService.create(data)
          .then((res) => {
            this.department.id = res.data.ID;
            console.log(res.data);
            this.submitted = true;
            this.$router.push(`/department`);
          })
          .catch((e) => {
            console.log(e);
          });
      }
    },

    newDepartment() {
      this.submitted = false;
      this.department = {};
    },
  },
  mounted() {
    this.getFaculty();
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
