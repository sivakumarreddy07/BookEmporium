<script setup lang="ts">
import { inject } from 'vue'
import type { CategoryItem } from '@/types'
import SideNavBar from '@/components/SideNavBar.vue'

import { useCategoryStore } from '@/stores/category'

const categoryStore = useCategoryStore()
categoryStore.fetchCategories()

const toggleDropdown = () => {
  //this.classList.toggle("active");
  if (document.getElementById('category-types').style.display == 'block') {
    document.getElementById('category-types').style.display = 'none'
    document.getElementById('icon-angle-down').classList.remove('icon-angle-up')
    document.getElementById('icon-angle-down').classList.add('icon-angle-down')
  } else {
    document.getElementById('category-types').style.display = 'block'
    document.getElementById('icon-angle-down').classList.remove('icon-angle-down')
    document.getElementById('icon-angle-down').classList.add('icon-angle-up')
  }
}
</script>
<style scoped>
.category-buttons {
  display: flex;
  flex-direction: row;
  background-color: #eeeeee;
  text-align: center;
  justify-content: space-between;
  padding: 5px 15px;
  opacity: 75%;
}

.category-nav {
  height: 5%;
}

.category-nav ul,
li {
  font-family: Roboto;
  font-size: 1em;
}

.button.category-button.router-link-active {
  background-color: #006699;
  padding: 3px 20px;
  border-radius: 8px;
}

.button.category-button {
  background-color: transparent;
  color: #111111;
  font-size: 1.5rem;
  font-style: italic;
}

.button.category-button:hover
{
  background-color: #006699;
  padding:3px 20px;
  border-radius: 8px;
}

</style>

<template>
  <nav class="category-nav">
    <ul class="category-buttons">
      <li v-for="category in categoryStore.categoryList" :key="category.categoryId">
        <router-link
          :to="'/SivaBookstoreTransact/category/' + category.name"
          class="button category-button"
        >
          {{ category.name }}
        </router-link>
      </li>
    </ul>
  </nav>
</template>