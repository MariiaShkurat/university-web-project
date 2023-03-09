<template>
  <div>
    <my-buttons class="b-btn"
    @click="$router.push(`/teacher`)"
    >
      Back
    </my-buttons>
    <h1 class="title">Add teacher</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
              id="name"
              v-model.trim="teacher.name"
              @:input="v$.teacher.name.$touch"
          />
          <span v-if="v$.teacher.name.$error" class="error">
          {{ v$.teacher.name.$errors[0].$message }}
          </span>
        </div>

        <div class="form-group">
          <label for="surname">Surname</label>
          <my-inputs
              id="surname"
              v-model.trim="teacher.surname"
              @:input="v$.teacher.surname.$touch"
          />
          <span v-if="v$.teacher.surname.$error" class="error">
          {{ v$.teacher.surname.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <my-inputs
              id="email"
              v-model.trim="teacher.email"
              @:input="v$.teacher.email.$touch"
          />
          <span v-if="v$.teacher.email.$error" class="error">
          {{ v$.teacher.email.$errors[0].$message }}
          </span>
        </div>
        <div class="form-group">
          <label for="phone">Phone</label>
          <my-inputs
              id="phone"
              v-model.trim="teacher.phone"
              @:input="v$.teacher.phone.$touch"
              v-mask="'38(0##)###-##-##'"
              placeholder="38(0__)___-__-__"
          />
          <span v-if="v$.teacher.phone.$error" class="error">
          {{ v$.teacher.phone.$errors[0].$message }}
          </span>
        </div>
        <my-buttons
            @click="createTeacher"
            class="btn btn-submit"
            style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create teacher successfully!</h4>
        <my-buttons
            class="btn btn-submit"
            @click="newTeacher"
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
import TeacherDataServices from "../../services/TeacherDataServices";
import {useVuelidate} from "@vuelidate/core/dist/index.esm";
import {email, helpers, maxLength, minLength, required} from "@vuelidate/validators";
import {personNamePattern} from "../../functions";
import {mask} from 'vue-the-mask';

export default {
  components: {
    myButtons,
    myInputs
  },
  directives: {
    mask,
  },
  setup() {
    return {v$: useVuelidate()}
  },
  data() {
    return {
      teacher: {
        id: null,
        name: '',
        surname: '',
        email: '',
        phone: '',
      },
      submitted: false
    };
  },
  validations() {
    return {
      teacher: {
        name: {
          required: helpers.withMessage('Name is required', required),
          minLength: minLength(2),
          maxLength: maxLength(22),
          personNamePattern: helpers.withMessage('Name is invalid', personNamePattern)

        },
        surname: {
          required: helpers.withMessage('Surname is required', required),
          minLength: minLength(2),
          maxLength: maxLength(22),
          personNamePattern: helpers.withMessage('Surname is invalid', personNamePattern)
        },
        email: {
          required: helpers.withMessage('Email is required', required),
          email: helpers.withMessage('Email is invalid', email),
        },
        phone: {
          required: helpers.withMessage('Phone is required', required),
          minLength: minLength(16),
        },
      }
    }
  },
  methods: {
    createTeacher() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          NAME: this.teacher.name,
          SURNAME: this.teacher.surname,
          EMAIL: this.teacher.email,
          PHONE: this.teacher.phone,
        };

        TeacherDataServices.create(data)
            .then(res => {
              this.teacher.id = res.data.ID;
              console.log(res.data)
              this.submitted = true;
              this.$router.push(`/teacher`);
            })
            .catch(e => {
              console.log(e);
            });
      }
    },

    newTeacher() {
      this.submitted = false;
      this.teacher = {};
    }
  }

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