<script setup lang="ts">
import TheHomeCategoryList from "@/components/TheHomeCategoryList.vue";
import TheHeader from "@/components/TheHeader.vue";
import TheCategoryNav from "@/components/TheCategoryNav.vue";
import SideNavBar from "@/components/SideNavBar.vue";
</script>

<style scoped>
.home-page {
  display: flex;
  position: relative;
  height: 88%;
}

.category-image-items a {
  text-align: center;
  cursor: pointer;
}

.category-image-items div {
  padding: 0.5em 0;
  background: rgba(0, 0, 0, 0.5); /* last # is percent opacity */
  color: white;
  transform: translateY(-2.25em);
  margin-bottom: -2em;
}

.hero-image {
  /* Use "linear-gradient" to add a darken background effect to the image (photographer.jpg). This will make the text easier to read */
  background-image: url("/site-images/Book_Hero.jpg");

  /* Set a specific height */
  height: 100%;
  width: 100%;
  /* Position and center the image to scale nicely on all screens */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: absolute;
  left: 0;
  top: 0;

}

/* Place text in the middle of the image */
.hero-text {
  position: relative;
  top: 20%;
  left: 20%;
  transform: translate(-50%, -50%);
  color: white;
  margin-left: 3rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5em;
}

.CTA-btn {
  background-color: #60a3bc;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  margin-left: 1rem;
  text-decoration: none;
  color: #FAFAFA;
  border-radius: 10px;
  padding:5px 6px;

}
.CTA-btn:hover{
  letter-spacing: 5px;
}
.hero-text h1 {
  font-weight: bold;
  font-size: 3rem;
}

.hero-text h3 {
  font-weight: 50;
  margin-left: 0.5rem;
  margin-top: 20px;
}
</style>
<template>
  <div class="home-page">
    <div class="hero-image">
      <div class="hero-text">
        <h1> Welcome to the Book Emporium</h1>
        <h3> Uncover Literary Treasures at The Book Emporium: Where Stories Come to Life! </h3>
        <router-link to="/SivaBookstoreTransact/category/Classics"><button class="CTA-btn">SHOP BOOKS <i class="icon-book"></i></button></router-link>
      </div>
    </div>
    <side-nav-bar></side-nav-bar>
  </div>
</template>
