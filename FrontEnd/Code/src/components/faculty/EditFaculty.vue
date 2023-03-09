<template>
  <div>
    <div class="edit-form">
      <h1>Faculty</h1>
      <form action="" @submit.prevent>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="faculty.NAME"
            @:input="v$.faculty.NAME.$touch"
          />
          <span v-if="v$.faculty.NAME.$error" class="error">
            {{ v$.faculty.NAME.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="short_name">Short name</label>
          <my-inputs
            id="short_name"
            v-model.trim="faculty.SHORT_NAME"
            @:input="v$.faculty.SHORT_NAME.$touch"
          />
          <span v-if="v$.faculty.SHORT_NAME.$error" class="error">
            {{ v$.faculty.SHORT_NAME.$errors[0].$message }}
          </span>
        </div>
        <my-buttons @click="$router.push(`/faculty`)"> Back </my-buttons>

        <my-buttons class="btn btn-submit" @click="updateFaculty">
          Update
        </my-buttons>
      </form>
    </div>
  </div>
</template>

<script>
import FacultyDataService from "../../services/FacultyDataService";
import MyButtons from "../UI/MyButtons.vue";
import MyInputs from "../UI/MyInputs.vue";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import { required, helpers, minLength, maxLength } from "@vuelidate/validators";
import { namePattern } from "../../functions";

export default {
  components: {
    MyInputs,
    MyButtons,
  },
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      faculty: {
        NAME: "",
        SHORT_NAME: "",
      },
      changed: false,
    };
  },
  validations() {
    return {
      faculty: {
        NAME: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(64),
          namePattern: helpers.withMessage("Name is invalid", namePattern),
        },
        SHORT_NAME: {
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
    getFaculty(id) {
      FacultyDataService.get(id).then((res) => {
        this.faculty = res.data;
        console.log(res.data);
      });
    },
    updateFaculty() {
      this.v$.$validate();
      if (!this.v$.$error) {
        FacultyDataService.update(this.faculty)
          .then((res) => {
            alert("Faculty successfully edited!");
            console.log(res.data);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/faculty`);
      } else {
        alert("Form failed validation!");
      }
    },
  },

  mounted() {
    this.getFaculty(this.$route.params.id);
  },
};
</script>

<style scoped></style>
