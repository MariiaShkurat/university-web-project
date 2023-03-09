<template>
  <footer>
    <div class="container">
      <div class="left">
        <div class="col-1">
          <router-link class="header" :to="{}">Title</router-link>
          <ul>
            <li>
              <a style="color: white" href=""
                ><font-awesome-icon icon="fa-brands fa-twitter"
              /></a>
            </li>
            <li>
              <a style="color: white" href=""
                ><font-awesome-icon icon="fa-brands fa-youtube"
              /></a>
            </li>
            <li>
              <a style="color: white" href=""
                ><font-awesome-icon icon="fa-solid fa-paper-plane"
              /></a>
            </li>
            <li>
              <a style="color: white" href=""
                ><font-awesome-icon icon="fa-brands fa-linkedin"
              /></a>
            </li>
          </ul>
        </div>
        <div class="col-2">
          <p>
            Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
            consectetur, adipisci velit...
          </p>
        </div>
      </div>
      <div class="right">
        <p>Copyright 2022 All Rights Reserved</p>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: "footer",
  components: {},
};
</script>

<style scoped>
footer {
  padding: 25px;
  background-color: #303030;
  color: white;
  width: 100%;
  display: initial;
  margin-top: 2%;
}
.container {
  display: flex;
  flex-direction: column;
  gap: 50px;
}
@media (min-width: 800px) {
  .container {
    flex-direction: row;
    gap: 0;
  }
}
div {
  display: flex;
  flex: 1;
}
.left {
  gap: 32px;
  color: white;
  display: flex;
  flex-direction: column;
  align-items: center;
}
@media (max-width: 800px) {
  .left {
    flex-direction: row;
    align-items: initial;
    gap: 0;
  }
}
.header {
  text-align: center;
  font-size: 24px;
  color: white;
  text-decoration: none;
  font-weight: 600;
}
ul {
  margin-top: 10px;
  list-style: none;
  display: flex;
  justify-content: space-evenly;
}
.col-1,
.col-2 {
  /* gap: 32px; */
  display: flex;
  flex: 1;
}

@media (min-width: 800px) {
  .col-1,
  .col-2 {
    gap: 0;
  }
}

.col-1 {
  flex-direction: column;
}
h2 {
  text-align: center;
  @media (min-width: 800px) {
    text-align: initial;
  }
}
col > ul {
  margin-top: 5px;
  color: white;
}
li {
  display: flex;
  align-items: center;
}

.col-2 > ul {
  height: 100%;
  justify-content: center;
  flex-direction: row;
  flex-wrap: wrap;
  @media (max-width: 800px) {
    .col-2 > ul {
      flex-direction: column;
    }
  }
}
.col-2 > ul > link {
  font-size: 16px;
  font-weight: 500;
  color: white;
  text-decoration: none;
}

.right {
  gap: 32px;
  color: white;
  align-items: center;
  flex-direction: column;
  @media (min-width: 800px) {
    align-items: flex-end;
    gap: 0;
  }
}
p {
  margin-top: auto;
}
</style>
