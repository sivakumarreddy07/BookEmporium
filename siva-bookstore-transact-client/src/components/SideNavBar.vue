<script setup lang="ts">
import {inject} from "vue";
import type {CategoryItem} from "@/types";

import { useCategoryStore } from '@/stores/category'

const categoryStore = useCategoryStore()
categoryStore.fetchCategories()

const toggleDropdown = () => {
  //this.classList.toggle("active");
  if(document.getElementById("category-types").style.display == "block")
  {
    document.getElementById("category-types").style.display = "none";
    document.getElementById("icon-angle-down").classList.remove("icon-angle-up");
    document.getElementById("icon-angle-down").classList.add("icon-angle-down");
  }
  else {
    document.getElementById("category-types").style.display = "block";
    document.getElementById("icon-angle-down").classList.remove("icon-angle-down");
    document.getElementById("icon-angle-down").classList.add("icon-angle-up");
  }
}
</script>
<style scoped>

.category-buttons {
  display: flex;
  flex-direction: row;
  text-align: center;
  background-color: var(--neutral-color);
}

.button.selected-category-button {
  background-color: transparent;
}

.button.unselected-category-button,
.button.unselected-category-button:visited {
  background: none;
}

.button.unselected-category-button:hover,
.button.unselected-category-button:active {
  background-color: transparent;
  background: none;
}

.sidebar {
  width: 0px;
  height: 100%;
  overflow: auto;
  background: #e3e5e8;
  padding: 30px 0px;
  align-items: center;
  margin-bottom: auto;
  transition:0.4s;
  z-index: 1;
}

.sidebar ul,li,a:hover{
  border: none;
  cursor: pointer;
  background-color: #006699;
  padding: 10px 30px;
  border-radius: 8px;
}

.sidebar ul,li,button,ul,li,a{
  padding: 15px;
  //border-bottom: 1px solid #000000;
  border-bottom: 1px solid rgba(0,0,0,0.05);
  border-top: 1px solid rgba(255,255,255,0.05);
  color: #111111;
  background: none;
  text-decoration: none;
}

.category-types li:last-child{
  border-bottom: none;
}

.categories{
  border:none;
}

.categories:hover{
  background-color: #006699;
  padding: 10px 30px;
  border-radius: 8px;
}

#category-types {
  display: none;
  padding-left: 8px;
  background-color: transparent;
  //background: none;
}
.category-types li a{
  background:none;
  color:#111111;
  border:none;
}

.category-types li a:hover{
  background: none;
  background-color: #006699;
  padding: 10px 30px;
  border-radius: 8px;
}

.sidebar ul .button.category-button a:hover{
  background-color: #006699;
  //letter-spacing: 3px;
}

.button.category-button.router-link-active {
  background-color: #006699;
  padding: 10px 30px;
  border-radius: 8px;
}
</style>

<template>
  <div id="sidebar" class="sidebar">
    <ul>
      <li>
        <router-link to="/SivaBookstoreTransact">
          <i class="icon-home"></i> Home
        </router-link>
      </li>
      <li> <button @click="toggleDropdown" class="categories">Categories <i id="icon-angle-down" class="icon-angle-down"></i></button></li>
      <ul id="category-types" class="category-types">
        <li v-for="category in categoryStore.categoryList" :key="category.categoryId">
          <router-link
              :to="'/SivaBookstoreTransact/category/' + category.name"
              class="button category-button">
            {{ category.name }}
          </router-link>
        </li>
      </ul>
      <li>
        <router-link to="/SivaBookstoreTransact">
        <i class="icon-user"></i> About
        </router-link>
      </li>
      <li>
        <router-link to="/SivaBookstoreTransact">
          <i class="icon-user"></i> Contact
        </router-link>
      </li>
    </ul>
  </div>

</template>
