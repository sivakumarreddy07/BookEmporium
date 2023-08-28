<script setup lang="ts">
import type { BookItem } from "@/types";
import CategoryBookListItem from "@/components/CategoryBookListItem.vue";
import SideNavBar from "@/components/SideNavBar.vue";
import {useBookStore} from "@/stores/book";

const bookStore = useBookStore();

</script>

<style scoped>
.category-books{
  display: flex;
  flex-direction: row;
  height: 95%;
  justify-content: center;
}
#book-boxes {
  display: flex;
  flex-wrap: wrap;
  padding: 5rem 1em;
  gap: 1em;
  justify-content: space-around;
  width:85%;
}

.sidebar{
  margin-top: 10px;
  height: 98.5%;
}
</style>

<template>
  <div class="category-books">
    <side-nav-bar></side-nav-bar>
  <ul id="book-boxes">
    <template v-for="book in bookStore.bookList" :key="book.bookId">
      <category-book-list-item :book="book"></category-book-list-item>
    </template>
  </ul>
  </div>
</template>
