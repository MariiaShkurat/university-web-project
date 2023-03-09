<template>
  <div>
    <my-buttons class="b-btn" @click="$router.push(`/faculty`)">
          Back
    </my-buttons>
    <h1 class="title">Add faculty</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
              id="name"
              v-model.trim="faculty.name"
              @:input="v$.faculty.name.$touch"
          />
          <span v-if="v$.faculty.name.$error" class="error">
          {{ v$.faculty.name.$errors[0].$message }}
          </span>
        </div>

        <div class="form-group">
          <label for="short_name">Short name</label>
          <my-inputs
              id="short_name"
              v-model.trim="faculty.short_name"
              @:input="v$.faculty.short_name.$touch"
          />
          <span v-if="v$.faculty.short_name.$error" class="error">
          {{ v$.faculty.short_name.$errors[0].$message }}
          </span>
        </div>

        <my-buttons
            @click="createFaculty"
            class="btn btn-submit"
            style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create faculty successfully!</h4>
        <my-buttons
            class="btn btn-submit"
            @click="newFaculty"
        >
          Add
        </my-buttons>
      </div>

    </div>
  </div>
</template>

<script>
import myInputs from "../UI/MyInputs.vue";
import myButtons from "../UI/MyButtons.vue";
import FacultyDataService from "../../services/FacultyDataService";
import {useVuelidate} from "@vuelidate/core/dist/index.esm";
import {required, helpers, minLength, maxLength} from '@vuelidate/validators';
import {namePattern} from "../../functions";

export default {
  components: {
    myButtons,
    myInputs
  },
  setup() {
    return {v$: useVuelidate()}
  },
  data() {
    return {
      faculty: {
        id: null,
        name: '',
        short_name: '',
      },
      submitted: false
    };
  },
  validations() {
    return {
      faculty: {
        name: {
          required: helpers.withMessage('Name is required', required),
          minLength: minLength(2),
          maxLength: maxLength(64),
          namePattern: helpers.withMessage('Name is invalid', namePattern)

        },
        short_name: {
          required: helpers.withMessage('Short name is required', required),
          minLength: minLength(2),
          maxLength: maxLength(6),
          namePattern: helpers.withMessage('Short name is invalid', namePattern)
        },
      }
    }
  },
  methods: {
    createFaculty() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          name: this.faculty.name,
          short_name: this.faculty.short_name,
        };

        FacultyDataService.create(data)
            .then(res => {
              this.faculty.id = res.data.id;
              console.log(res.data)
              this.submitted = true;
              this.$router.push(`/faculty`);
            })
            .catch(e => {
              console.log(e);
            });
      } else {
        alert("Form failed validation!")
      }
    },

    newFaculty() {
      this.submitted = false;
      this.faculty = {};
    }
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