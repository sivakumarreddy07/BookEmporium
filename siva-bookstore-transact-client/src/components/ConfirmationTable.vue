<script setup lang="ts">
import {useCartStore} from "@/stores/cart";

import {asDollarsAndCents} from "@/main";

import {useOrderDetailsStore} from "@/stores/orderDetails";
import type { BookItem, OrderDetails } from "@/types";
import {useCategoryStore} from "@/stores/category";
import router from "@/router";

const cartStore = useCartStore();
const cart = cartStore.cart;
const categoryStore = useCategoryStore();
const orderDetailsStore = useOrderDetailsStore();
const orderDetails: OrderDetails =
  orderDetailsStore.orderDetails as OrderDetails;

// A helper function - optional to use
const bookAt = function (orderDetails: OrderDetails, index: number): BookItem {
  return orderDetails.books[index];
};
</script>



<style scoped>
table {
  border: 2px var(--secondary-background-color) solid;
  width: fit-content;
  margin-top: 1em;
  margin-bottom: 1em;
}

td {
  display: table-cell;
  padding: 0.5em 0.5em;
  background-color: white;
  vertical-align: middle;
  font-family: var(--title-font-family);
}

tr:nth-child(even) > td {
  background-color: #eeeeee;
}

td:nth-child(1) {
  text-align: left;
}

td:nth-child(2) {
  text-align: center;
}

td:nth-child(3) {
  text-align: right;
}

.book-table {
  display: flex;
  justify-content: center;
  text-align: center;
  flex-direction: column;
}

.nav-buttons {
  font-family: var(--title-font-family);
  color: var(--secondary-background-color);
  padding: 0.5em;
  background-color: white;
  border-radius: 40px;
  font-weight: bold;
  border: 2px solid var(--secondary-background-color);
  align-items: center;
}

.nav-buttons:hover {
  color: white;
  background-color: var(--secondary-background-color);
}

#final-amounts {
  text-align: right;
  color: var(--secondary-background-color);
  font-weight: bold;
}
</style>


<template>
  <div class="book-table">
    <table>
      <tr
        v-for="(item, index) in orderDetails.lineItems"
        :key="item.bookId"
      >
        <td>
          {{ orderDetails.books[index].title }}
        </td>
        <td>{{ item.quantity }}</td>
        <td>{{ asDollarsAndCents(orderDetails.books[index].price) }}</td>
      </tr>
    </table>
    <p id="final-amounts">
      subtotal:
      {{ asDollarsAndCents(orderDetails.order.amount - cart.surcharge) }}
    </p>
    <p id="final-amounts">Surcharge: $5</p>
    <p id="final-amounts">Total: {{ asDollarsAndCents(orderDetails.order.amount) }}</p>
  </div>

  <section class="back-to-shopping">
      <button class="button nav-buttons" @click = "router.push({name: 'category-view',params:{name:categoryStore.categoryName}})">
        Continue Shopping <i class="fa-solid fa-bag-shopping"></i>
      </button>
  </section>
</template>

