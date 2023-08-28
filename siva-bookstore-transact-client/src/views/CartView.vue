<script setup lang="ts">
import CartTable from '@/components/CartTable.vue'
import { useCartStore } from '@/stores/cart'

const cartStore = useCartStore()
const clearCart = function () {
  cartStore.clearCart()
}
</script>
<style scoped>
.cart-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 88%;
}

.buttons {
  display: flex;
  flex-direction: row;
}

.checkout {
  background-color: #60a3bc;
  border: none;
  font-size: 1.2rem;
  cursor: pointer;
  margin-left: 1rem;
  text-decoration: none !important;
  color: #111111;
  border-radius: 10px;
  padding: 5px 6px;
}

.continue {
  background-color: #60a3bc;
  border: none;
  font-size: 1.2rem;
  cursor: pointer;
  margin-left: 1rem;
  text-decoration: none;
  color: #111111;
  border-radius: 10px;
  padding: 5px 6px;
}
</style>

<template>
  <div class="cart-page">
    <cart-table></cart-table>
  </div>
</template>