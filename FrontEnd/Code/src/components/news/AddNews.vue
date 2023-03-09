<template>
  <div>
    <my-buttons class="b-btn" @click="$router.push(`/news`)"> Back </my-buttons>
    <h1 class="title">Add News</h1>
    <div class="form">
      <div v-if="!submitted">
        <div class="form-group">
          <label for="news_header">Header</label>
          <my-inputs
            id="news_header"
            v-model.trim="news.news_header"
            @:input="v$.news.news_header.$touch"
          />
          <span v-if="v$.news.news_header.$error" class="error">
            {{ v$.news.news_header.$errors[0].$message }}
          </span>
        </div>

        <div class="form-group">
          <label for="news_body">Body</label>
          <my-inputs
            id="news_body"
            v-model.trim="news.news_body"
            @:input="v$.news.news_body.$touch"
          />
          <span v-if="v$.news.news_body.$error" class="error">
            {{ v$.news.news_body.$errors[0].$message }}
          </span>
        </div>

        <my-buttons
          @click="createNews"
          class="btn btn-submit"
          style="width: 95%"
        >
          Create
        </my-buttons>
      </div>

      <div v-else>
        <h4>You create news successfully!</h4>
        <my-buttons class="btn btn-submit" @click="newNews"> Add </my-buttons>
      </div>
    </div>
  </div>
</template>

<script>
import myInputs from "../UI/MyInputs.vue";
import myButtons from "../UI/MyButtons.vue";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import {
  required,
  helpers,
  minLength,
  maxLength,
  integer,
  minValue,
  maxValue,
} from "@vuelidate/validators";
import NewsDataService from "../../services/NewsDataService";

export default {
  components: {
    myButtons,
    myInputs,
  },
  setup() {
    return { v$: useVuelidate() };
  },
  data() {
    return {
      news: {
        news_header: "",
        news_body: "",
      },
      submitted: false,
    };
  },
  validations() {
    return {
      news: {
        news_header: {
          required: helpers.withMessage("Header is required", required),
          minLength: minLength(5),
          maxLength: maxLength(256),
        },
        news_body: {
          required: helpers.withMessage("Body is required", required),
          minLength: minLength(5),
          maxLength: maxLength(256),
        },
      },
    };
  },
  methods: {
    createNews() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          HEADER: this.news.news_header,
          NEWS_BODY: this.news.news_body,
        };

        NewsDataService.create(data)
          .then((res) => {
            this.news.id = res.data.ID;
            console.log(res.data);
            this.submitted = true;
            this.$router.push(`/news`);
          })
          .catch((e) => {
            console.log(e);
          });
      } else {
        alert("Form failed validation!");
      }
    },

    newNews() {
      this.submitted = false;
      this.news = {};
    },
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
