<template>
  <div class="table_div">
    <table id="table">
      <thead>
      <tr>
        <th
            v-if="heads.length > 0 "
            v-for="head in heads"
            :key="head.id"
        >
          {{ head }}
        </th>
      </tr>
      </thead>
      <slot></slot>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    heads: {
      type: Array,
      required: false
    }
  },
}
</script>

<style scoped>

</style>