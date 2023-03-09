<template>
  <div>
    <my-buttons class="b-btn"
            @click="$router.push(`/discipline`)"
        >
          Back
        </my-buttons>
    <h1 class="title">Add discipline</h1>
    <div class="form">
      <div v-if="!submitted">
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
        <my-buttons
            @click="createDiscipline"
            style="width: 95%"
            class="btn btn-submit"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create discipline successfully!</h4>
        <my-buttons
            class="btn btn-submit"
            @click="newDiscipline"
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
import DisciplineDataService from "../../services/DisciplineDataService";
import {useVuelidate} from "@vuelidate/core/dist/index.esm";
import {helpers, maxLength, minLength, required} from "@vuelidate/validators";
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
      discipline: {
        id: null,
        name: '',
      },
      submitted: false
    };
  },
  validations() {
    return {
      discipline: {
        name: {
          required: helpers.withMessage('Name is required', required),
          minLength: minLength(2),
          maxLength: maxLength(32),
          namePattern: helpers.withMessage('Name is invalid', namePattern)
        },
      }
    }
  },
  methods: {
    createDiscipline() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          NAME: this.discipline.name,
        };

        DisciplineDataService.create(data)
            .then(res => {
              this.discipline.id = res.data.ID;
              console.log(res.data)
              this.submitted = true;
              this.$router.push(`/discipline`);
            })
            .catch(e => {
              console.log(e);
            });
      }
    },

    newDiscipline() {
      this.submitted = false;
      this.discipline = {};
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