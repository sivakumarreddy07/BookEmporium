<script setup lang="ts">
import AppFetchCategories from "@/components/AppFetchCategories.vue";
</script>
<style scoped>
#app {
  height: 100vh;
  display: flex;
  flex-direction: column;
  //justify-content: space-between; overflow: hidden;
}
</style>
<template>
  <div id="app">
    <AppFetchCategories></AppFetchCategories>
  </div>
</template>