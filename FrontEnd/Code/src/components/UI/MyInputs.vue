<template>
  <input
      :value="modelValue"
      required
      @input="updateInput($event)"
      type="text"
      class="input"
  />
</template>

<script>
export default {
  props: {
    modelValue: [String, Number, Date]
  },
  methods: {
    updateInput(event){
      this.$emit('update:modelValue', event.target.value)
    }
  }
}
</script>

<style scoped>

</style>