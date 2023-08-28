<script setup lang="ts"></script>

<style scoped>
.page {
  height: 88%;
}

h1 {
  color: black;
  padding: 2em;
  text-align: center;
  color: var(--secondary-background-color);
}

p {
  color: black;
  padding: 2em;
  text-align: center;
  color: var(--secondary-background-color);
}

.flow-content container, a{
  text-decoration: none;
}
</style>

<template>
  <div class="page hero-area">
    <section class="flow-content container">
      <h1>Your Content Was Not Found</h1>
      <p>There appears to be nothing here. Please click<router-link to="/SivaBookstoreTransact/home"> here </router-link>  to return to homepage</p>
    </section>
  </div>
</template>
