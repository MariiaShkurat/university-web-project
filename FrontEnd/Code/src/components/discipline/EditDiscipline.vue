<template>
  <div>
    <div class="edit-form">
      <h1>Discipline</h1>
      <form action="" @submit.prevent>
        <div class="form-group">
          <label for="name">Name</label>
          <my-inputs
            id="name"
            v-model.trim="discipline.name"
            @:input="v$.discipline.name.$touch"
          />
          <span v-if="v$.discipline.name.$error" class="error">
            {{ v$.discipline.name.$errors[0].$message }}
          </span>
        </div>

        <my-buttons @click="$router.push(`/discipline`)"> Back </my-buttons>
        <my-buttons
          type="submit"
          class="btn btn-submit"
          @click="updateDiscipline"
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
import DisciplineDataService from "../../services/DisciplineDataService";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import { helpers, maxLength, minLength, required } from "@vuelidate/validators";
import { namePattern } from "../../functions";

export default {
  components: {
    MyInputs,
    MyButtons,
  },
  setup() {
    return { v$: useVuelidate() };
  },
  data() {
    return {
      discipline: {
        id: null,
        name: "",
      },
    };
  },
  validations() {
    return {
      discipline: {
        name: {
          required: helpers.withMessage("Name is required", required),
          minLength: minLength(2),
          maxLength: maxLength(32),
          namePattern: helpers.withMessage("Name is invalid", namePattern),
        },
      },
    };
  },
  methods: {
    getDiscipline(id) {
      DisciplineDataService.get(id).then((res) => {
        this.discipline.name = res.data.NAME;
        this.discipline.id = res.data.ID;

        console.log(res.data);
      });
    },
    updateDiscipline() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          ID: this.discipline.id,
          NAME: this.discipline.name,
        };
        DisciplineDataService.update(data)
          .then((res) => {
            alert("Discipline successfully edited!");
            console.log(res.data);
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/discipline`);
      }
    },
  },
  mounted() {
    this.getDiscipline(this.$route.params.id);
  },
};
</script>

<style scoped></style>
