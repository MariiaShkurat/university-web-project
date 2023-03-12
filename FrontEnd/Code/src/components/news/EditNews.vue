<template>
  <div>
    <div class="edit-form">
      <h1>News</h1>
      <form action="" @submit.prevent>
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
        <my-buttons @click="$router.push(`/news`)"> Back </my-buttons>

        <my-buttons class="btn btn-submit" @click="updateNews">
          Update
        </my-buttons>
      </form>
    </div>
  </div>
</template>

<script>
import MyButtons from "../UI/MyButtons.vue";
import MyInputs from "../UI/MyInputs.vue";
import { useVuelidate } from "@vuelidate/core/dist/index.esm";
import {
  required,
  helpers,
  minLength,
  maxLength,
  minValue,
  maxValue,
  integer,
} from "@vuelidate/validators";
import NewsDataService from "../../services/NewsDataService";

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
      news: {
        id: null,
        news_header: "",
        news_body: "",
      },
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
    getNews(id) {
      NewsDataService.get(id).then((res) => {
        this.news.id = res.data.ID;

        this.news.news_header = res.data.HEADER;
        this.news.news_body = res.data.NEWS_BODY;
      });
    },
    updateNews() {
      this.v$.$validate();
      if (!this.v$.$error) {
        let data = {
          ID: this.news.id,
          NEWS_BODY: this.news.news_body,
          HEADER: this.news.news_header,
        };
        console.log(data);
        NewsDataService.update(data)
          .then((res) => {
            alert("News successfully edited!");
          })
          .catch((e) => {
            console.log(e);
          });
        this.$router.push(`/news`);
      } else {
        alert("Form failed validation!");
      }
    },
  },

  mounted() {
    this.getNews(this.$route.params.id);
  },
};
</script>

<style scoped></style>
