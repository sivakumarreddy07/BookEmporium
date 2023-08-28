<script setup lang="ts">
</script>

<style scoped>
footer {
  background: var(--secondary-background-color);
  display: flex;
  flex-direction: row;
  height:5%;
  /* gap: 1em; */
  color: #fafafa;
  justify-content: space-between;
  align-items: center;
}
.copyright{
  display: flex;
  flex-direction: row;
  justify-content: center;
  padding: 0px 2px;
}
.copyright h3{
  font-weight: 20;
  font-size: 1.2em;
  font-style: italic;
}
.links,
.social-media-icons {
  display: flex;
  flex-direction: row;
}
.links a{
  padding: 1em;
  font-weight: bold;
  font-style: italic;
  color: #fafafa;
  text-decoration: none;
  font-size: 1.2em;
}
.social-media-icons a{
  text-align: center;
  gap: 0.25em;
  font-size: 2em;
  text-decoration: none;
  color: #FAFAFA !important;
  padding: 1px 4px;
}

.social-media-icons a:hover,
.social-media-icons a:visited{
  background-color: transparent;
  color:#FAFAFA;
}
</style>

<template>
  <footer class="container">
    <section class="copyright">
      <h3>&copy</h3>
      <h3>2023 The Book Emporium</h3>
    </section>
    <section class="links">
      <a href="index.html">About</a>
      <a href="index.html">Contact</a>
      <a href="index.html">Directions</a>
    </section>
    <section class="social-media-icons">
      <a href="https://www.facebook.com">
        <i class="icon-facebook-sign"></i>
      </a>
      <a href="https://www.twitter.com" target="_blank">
        <i class="icon-twitter-sign"></i>
      </a>
      <a href="https://www.linkedin.com">
        <i class="icon-linkedin-sign"></i>
      </a>
    </section>
  </footer>
</template>
