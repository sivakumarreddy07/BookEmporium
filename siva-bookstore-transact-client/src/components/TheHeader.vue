<script setup lang="ts">
import TheHeaderDropdown from "@/components/TheHeaderDropdown.vue";
import TheCategoryNav from "@/components/TheCategoryNav.vue";
import SideNavBar from "@/components/SideNavBar.vue";
import {useCartStore} from "@/stores/cart";

const cartStore = useCartStore();
const handleClick = () => {
    document.getElementById("sidebar").style.width
    if(document.getElementById("sidebar").style.width == "15%")
    {
      document.getElementById("sidebar").style.width = "0"
      //document.getElementById("icon-reorder").style.transform = "rotate(0deg)" ;
    }
    else{
      document.getElementById("sidebar").style.width = "15%"
      //document.getElementById("icon-reorder").style.transform = "rotate(90deg)" ;
    }
};
</script>

<style scoped>
header {
  background: var(--secondary-background-color);
  display: flex;
  height: 7%;
  justify-content: space-between;
//flex-grow: 2;
}

.bookstore-logo img{
  height:7vh !important;
}
.navigation-bars {
  display: flex;
  align-items: center;
  flex-direction: row;
}

.navigation-bars button {
  cursor: pointer;
  border: none;
  background: none;
}

.title a{
  font-size: 2em;
  color: #fafafa;
  font-style: italic;
  text-decoration: none;
}

.nav-links {
  display: flex;
  flex-direction: row;
  height: fit-content;
  align-items: center;
  height: 100%;
  justify-content: space-between;
  font-size: 1.5em;
  color:#FAFAFA;
  font-style: italic;
}

.nav-links button {
  padding: 0 1em;
  font-style: italic;
  cursor: pointer;
}

@media (max-width: 600px) {
  header {
    flex-direction: column;
  }
}

.search-field form {
  width: 30em;
}


.icon-search:focus {
  outline: none;
  border-color: #e0e0e0;
  background-color: #f1f3f5;
}

.login-button {
//background-color: none; color: #fafafa; border: none;
  background: none;
}

/* .categories-button{
  padding: 7px;
} */
.cart-button {
  border: none;
  padding: 0;
  background: none;
  color: #fafafa;
  font-size: 1.4rem;
}
.fa-bag-shopping{
  font-size: 1.6rem;
}
.cart-text {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 15px;
  padding: 2px 7px;
  background-color: #006699;
  border: none;
  border-radius: 36%;
  display: inline-block;
  color: #FAFAFA;
}

.icon-user{
  color: #FAFAFA;
  font-size: 1.5em;
}

#icon-reorder {
  color: #fff;
  font-size: 1.8rem;
}

.reorder-category {
  color: #fff;
  font-size: 1.8em;
  transform: rotate(90deg);
}

.search-field {
  border-radius: 12px;
  overflow: hidden;
  display: flex;
  flex-direction: row;
  align-items: center;
}

.search-field input {
  padding: 0.2em;
  background: #EEEEEE;
  outline: none;
  border: none;
  flex: 1;
  font-style: italic;
  font-family: Roboto;
  font-size: 20px;
  height: 36px;
  width: 78%;
  opacity: 75%;
}

.search-field button {
  font-size: 19px;
  text-decoration: none;
  color: grey;
  outline: none;
  border: none;
  opacity: 75%;
  background: #EEEEEE;
  height: 36px;
  /* width: 78%;  */
  cursor: pointer;
}

</style>

<template>
  <header class="container">
    <section class="navigation-bars">
      <button @click="handleClick" id="icon-reorder" class="icon-reorder">
      </button>
      <section class="bookstore-logo">
        <router-link to="/SivaBookstoreTransact">
          <img
              src="/site-images/Bookstore-logo.png"
              alt="Another Bookstore Logo"
          />
        </router-link>

      </section>
      <section class="title">
        <router-link to="/SivaBookstoreTransact">
        <h1 class="text-logo">The Book Emporium</h1>
        </router-link>
      </section>
    </section>

    <section class="search-field">
      <form class="search-field">
        <input type="text" placeholder="search"/>
        <!-- <input type="submit" class="icon-search" style= "color:#283448;" value="&#xf002" /> -->
        <router-link to="/SivaBookstoreTransact/category/Classics"><button type="submit" class="icon-search"/></router-link>

      </form>
    </section>
    <section class="nav-links">
      <a>Hello, Siva</a>
      <button class="login-button"><i class="fa-solid fa-user"></i></button>
      <router-link to="/SivaBookstoreTransact/cart">
      <button class="cart-button">
        <i class="fa fa-bag-shopping"></i>
        <div class="cart-text">{{cartStore.count}}</div>
      </button>
      </router-link>
    </section>

  </header>
</template>
