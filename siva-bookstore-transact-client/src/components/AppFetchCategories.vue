<script setup lang="ts">
import { provide } from 'vue'
import { RouterView, useRoute } from 'vue-router'
import type { CategoryItem } from '@/types'
import TheHeader from '@/components/TheHeader.vue'
import TheFooter from '@/components/TheFooter.vue'
import { apiUrl } from '@/api'
import { useCategoryStore } from '@/stores/category'

const categoryStore = useCategoryStore()
categoryStore.fetchCategories()
const route = useRoute()
</script>

<style>
#app-fetch-categories {
  height: 100vh;
  display: flex;
  flex-direction: column;
  //justify-content: space-between; overflow: hidden;
}
</style>

<template>
    <div id="app-fetch-categories">
      <the-header></the-header>
      <router-view></router-view>
      <the-footer></the-footer>
    </div>
</template>