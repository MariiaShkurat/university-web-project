<template>
  <div>
    <my-buttons class="b-btn" @click="$router.push(`/student`)">
      Back
    </my-buttons>
    <h1 class="title">Add student</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="group_id">Group</label>
          <v-select
            label="NAME"
            :options="groups"
            :reduce="(group) => group.ID"
            v-model.trim="student.group_id"
            @:input="v$.student.group_id.$touch"
            class="v-select"
          >
          </v-select>
          <span v-if="v$.student.group_id.$error" class="error">
            {{ v$.student.group_id.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="student.name"
            @:input="v$.student.name.$touch"
          />
          <span v-if="v$.student.name.$error" class="error">
            {{ v$.student.name.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <my-inputs
            id="email"
            v-model.trim="student.email"
            @:input="v$.student.email.$touch"
          />
          <span v-if="v$.student.email.$error" class="error">
            {{ v$.student.email.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="phone">Phone</label>
          <my-inputs
            id="phone"
            v-model.trim="student.phone"
            @:input="v$.student.phone.$touch"
            v-mask="'38(0##)###-##-##'"
            placeholder="38(0__)___-__-__"
          />
          <span v-if="v$.student.phone.$error" class="error">
            {{ v$.student.phone.$errors[0].$message }}
          </span>
        </div>

        <my-buttons
          @click="createStudent"
          class="btn btn-submit"
          style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create student successfully!</h4>
        <my-buttons class="btn btn-submit" @click="newStudent">
          Add
        </my-buttons>
      </div>
    </div>
  </div>
</template>

<script>
import myInputs from "../UI/MyInputs.vue";
import myButtons from "../UI/MyButtons.vue";
import GroupDataServices from "../../services/GroupDataServices";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
import StudentDataService from "../../services/StudentDataService";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import {
  email,
  helpers,
  maxLength,
  minLength,
  required,
} from "@vuelidate/validators";
import { personNamePattern } from "../../functions";
import { mask } from "vue-the-mask";

export default {
  components: {
    myButtons,
    myInputs,
    vSelect,
  },
  directives: {
    mask,
  },
  setup() {
    return { v$: useVuelidate() };
  },
  data() {
    return {
      student: {
        id: null,
        group_id: "",
        name: "",
        email: "",
        phone: "",
      },
      groups: [],
      submitted: false,
    };
  },
  validations() {
    return {
      student: {
        group_id: {
          required: helpers.withMessage("Group is required", required),
        },
        name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(22),
          personNamePattern: helpers.withMessage(
            "Name is invalid",
            personNamePattern
          ),
        },
        email: {
          required: helpers.withMessage("Email is required", required),
          email: helpers.withMessage("Email is invalid", email),
        },
        phone: {
          required: helpers.withMessage("Phone is required", required),
          minLength: minLength(16),
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
    createStudent() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          GROUP_ID: this.student.group_id,
          NAME: this.student.name,
          EMAIL: this.student.email,
          PHONE: this.student.phone,
        };
        StudentDataService.create(data)
          .then((res) => {
            this.student.id = res.data.ID;
            console.log(res.data);
            this.submitted = true;
            this.$router.push(`/students`);
          })
          .catch((e) => {
            console.log(e);
          });
      }
    },

    newStudent() {
      this.submitted = false;
      this.student = {};
    },
  },
  mounted() {
    this.getGroups();
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

.title {
  margin: auto;
}
</style>
