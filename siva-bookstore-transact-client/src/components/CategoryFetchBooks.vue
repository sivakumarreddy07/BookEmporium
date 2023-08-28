<script setup lang="ts">
import TheCategoryNav from "@/components/TheCategoryNav.vue";
import TheCategoryBookList from "@/components/TheCategoryBookList.vue";
import {useRoute} from "vue-router";
import {useBookStore} from "@/stores/book";
import {useCategoryStore} from "@/stores/category";
import {watch} from "vue";
import router from "@/router";

const route = useRoute();
const categoryStore = useCategoryStore();
const bookStore = useBookStore();

watch(
  () => route.params.name,
  async (newName) => {
    try {
    await categoryStore.setSelectedCategoryName(newName as string);
    await bookStore.fetchBooks(newName as string);
    } catch (e)
    {
      router.push("/SivaBookstoreTransact/error");
    }
  },
  { immediate: true }
);
</script>

<style scoped>
.category-page {
  justify-content: space-evenly;
  height: 88%;
}

.category-content {
  display: flex;
  flex-direction: row;
  height: 95%;
}
</style>

<template>
  <div class="category-page">
    <the-category-nav></the-category-nav>
    <the-category-book-list></the-category-book-list>
  </div>
</template>