<template>
  <div class="navbar">
    <p>Title</p>
    <div class="navbar_menu">
      <nav>
        <ul id="menuList">
          <li><a @click="$router.push('/')">Home</a></li>
          <li><a @click="$router.push('/faculty')">Faculty</a></li>
          <li><a @click="$router.push('/teacher')">Teacher</a></li>
          <li><a @click="$router.push('/discipline')">Discipline</a></li>
          <li><a @click="$router.push('/group')">Group</a></li>
          <li><a @click="$router.push('/department')">Department</a></li>
          <li><a @click="$router.push('/student')">Student</a></li>
          <li><a @click="$router.push('/schedule')">Schedule</a></li>
          <li><a @click="$router.push('/news')">News</a></li>
        </ul>
      </nav>
      <i>
        <slot name="menu"></slot>
      </i>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  methods: {},
};
</script>

<style></style>
