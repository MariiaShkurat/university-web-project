<template>
  <div>
    <div class="edit-form">
      <h1>Teacher</h1>
      <form action="" @submit.prevent>
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
        <my-buttons @click="$router.push(`/teacher`)"> Back </my-buttons>
        <my-buttons type="submit" class="btn btn-submit" @click="updateTeacher">
          Update
        </my-buttons>
      </form>
    </div>
  </div>
</template>

<script>
import MyButtons from "../UI/MyButtons.vue";
import MyInputs from "../UI/MyInputs.vue";
import TeacherDataServices from "../../services/TeacherDataServices";
import { mask } from "vue-the-mask";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import {
  email,
  helpers,
  maxLength,
  minLength,
  required,
} from "@vuelidate/validators";
import { namePattern, personNamePattern } from "../../functions";

export default {
  components: {
    MyInputs,
    MyButtons,
  },
  directives: {
    mask,
  },
  setup() {
    return { v$: useVuelidate() };
  },
  data() {
    return {
      teacher: {
        id: null,
        name: "",
        surname: "",
        email: "",
        phone: "",
      },
    };
  },
  validations() {
    return {
      teacher: {
        name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(22),
          personNamePattern: helpers.withMessage(
            "Name is invalid",
            personNamePattern
          ),
        },
        surname: {
          required: helpers.withMessage("Surname is required", required),
          minLength: minLength(2),
          maxLength: maxLength(22),
          personNamePattern: helpers.withMessage(
            "Surname is invalid",
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
    getTeacher(id) {
      TeacherDataServices.get(id).then((res) => {
        this.teacher.id = res.data.ID;
        this.teacher.name = res.data.NAME;
        this.teacher.surname = res.data.SURNAME;
        this.teacher.email = res.data.EMAIL;
        this.teacher.phone = res.data.PHONE;
        console.log(res.data);
      });
    },
    updateTeacher() {
      this.v$.$validate();

      if (!this.v$.$error) {
        let data = {
          ID: this.teacher.id,
          NAME: this.teacher.name,
          SURNAME: this.teacher.surname,
          EMAIL: this.teacher.email,
          PHONE: this.teacher.phone,
        };
        TeacherDataServices.update(data)
          .then((res) => {
            alert("Teacher successfully edited!");
            // this.submitted = true;
            console.log(res.data);
            // this.$router.push('/professors');
            // setTimeout(()=> router.push('/professors'), 2000);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/teacher`);
      }
    },
  },
  mounted() {
    this.getTeacher(this.$route.params.id);
  },
};
</script>

<style scoped></style>
