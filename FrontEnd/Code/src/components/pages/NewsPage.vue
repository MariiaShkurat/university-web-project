<template>
  <div class="filling">
    <h1 class="title">News</h1>

    <my-table :heads="heads" v-if="newss.length > 0">
      <my-table-row v-for="news in newss" :key="news.ID">
        <my-table-column>
          {{ news.HEADER }}
        </my-table-column>
        <my-table-column>
          {{ news.NEWS_BODY }}
        </my-table-column>
        <my-table-column class="edit-delete-btns">
          <template #icon>
            <EditIcon @click="$router.push(`/news/${news.ID}`)" />
            <DeleteIcon @click="deleteNews(news)" />
          </template>
        </my-table-column>
      </my-table-row>
    </my-table>
    <my-buttons
      @click="$router.push('/add_news')"
      style="padding: 10px; width: 99%"
      >Add News</my-buttons
    >
  </div>
</template>

<script>
import MyTable from "../UI/MyTable.vue";
import MyTableRow from "../UI/MyTableRow.vue";
import MyTableColumn from "../UI/MyTableColumn.vue";
import MyButtons from "../UI/MyButtons.vue";
import FacultyDataService from "../../services/FacultyDataService";
import DeleteIcon from "../icons/IconDelete.vue";
import EditIcon from "../icons/IconEdit.vue";
import { start_toggle } from "../../functions/function_toggle";
import NewsDataService from "../../services/NewsDataService";

export default {
  components: {
    DeleteIcon,
    EditIcon,
    MyButtons,
    MyTableColumn,
    MyTableRow,
    MyTable,
  },
  data: () => ({
    newss: [],
    heads: ["header", "news_body", "actions"],
  }),
  methods: {
    getNews() {
      NewsDataService.getAll()
        .then((res) => {
          this.newss = res.data;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    deleteNews(news) {
      NewsDataService.delete(news.ID)
        .then((res) => {
          alert("You have successfully deleted news: " + news.HEADER + " !");
          this.getNews();
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.getNews();
    start_toggle();
  },
};
</script>

<style scoped>
.edit-delete-btns {
  justify-content: space-between;
}
</style>
