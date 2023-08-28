<script setup lang="ts">
import { defineProps, inject } from "vue";
import type {BookItem,CategoryItem} from "@/types";
import {useRoute} from "vue-router";
import {provide} from "vue";
import { useCategoryStore } from '@/stores/category';
import {useCartStore} from "@/stores/cart";

const cartStore = useCartStore();
const categoryStore = useCategoryStore()
categoryStore.fetchCategories()
const props = defineProps<{
  book: BookItem;
}>();
const bookImageFileName = function (book: BookItem): string {
  let name = book.title;
  name = name.replace(/ /g, "_");
  name = name.replace(/'/g, "");
  return `${name}.jpeg`;
};
const route = useRoute();
const bookImagePrefix = `${import.meta.env.BASE_URL}/book-images/`;

const handleEvents = function(book: BookItem):boolean {
  let categoryName = route.params.name;
  let item = categoryStore.categoryList.filter(({name}) => name.includes(categoryName));
  let id = item[0].categoryId;
  if(book.categoryId.toString() == id)
  {
    return true;
  }
  else{
    return false;
  }
}
</script>
<style scoped>

.book-box {
  display: flex;
  flex-direction: row;
  /* background-color: var(--card-background-color); */
  padding: 1em;
  gap: 1.5em;
  width: 40%;
  box-shadow: 0 0 5px #aaa;
  height: fit-content;
}

.book-image{
  position: relative;
}
.book-title {
  font-weight: bold;
}

.category-book-list{
  display: flex;
}
.book-image img{
  height: 200px;
  width: auto;
}

.book-title{
  font-size: 1.5rem;
}
.book-author{
  font-style: italic;
  color: #1c1b1b;
  margin-bottom: 1rem;
}
.book-price{
  margin-bottom: 2rem;
  font-weight: bold;
  color: #ff0000;
}
.add-to-cart-btn{
  border-radius: 10px;
  padding: 0.3rem 0.6rem;
  border: none;
  background-color: #006699 ;
  color:#FAFAFA;
  cursor: pointer;
}

.add-to-cart-btn:focus{
  box-shadow:1px 1px 10px #10b7e4;
}

#ReadNow{
  border: none;
  background-color: #006699;
  position: absolute;
  top: 0;
  margin-left: 1rem;
  cursor: pointer;
  color:#FAFAFA;
  font-style: italic;
  font-size: 1rem;
}
#ReadNow, .fa-glasses{
  padding: 1px 4px;
}
</style>

<template>
  <li class="book-box" v-if="handleEvents(book)">
    <div class="book-image">
      <img
          :src="`${bookImagePrefix}${bookImageFileName(book)}`"
          :alt="book.title"
      />
      <button id="ReadNow" v-if=book.isPublic>ReadNow <i class="fa-solid fa-glasses"></i></button>
    </div>
    <div class="book-content">
      <div class="book-title">{{ book.title }}</div>
      <div class="book-author">{{ book.author }}</div>
      <div class="book-price">${{ (book.price / 100).toFixed(2) }}</div>
      <button class="add-to-cart-btn" @click=cartStore.addToCart(book) ><i class="fa fa-bag-shopping"></i> Add to Bag</button>
    </div>

  </li>
</template>
