<script setup lang="ts">
import {useCartStore} from "@/stores/cart";
import type { BookItem } from "@/types";
import { asDollarsAndCents } from "@/main";
import {useCategoryStore} from "@/stores/category";
import router from "@/router";

const cartStore = useCartStore();
const cart = cartStore.cart;
const categoryStore=useCategoryStore();

const bookImageFileName = function (book: BookItem): string {
  let name = book.title;
  name = name.replace(/ /g, "_");
  name = name.replace(/'/g, "");
  return `${name}.jpeg`;
};

const bookImagePrefix = `${import.meta.env.BASE_URL}/book-images/`;
const updateCart = function (book: BookItem, quantity: number) {
  cart.update(book, quantity);
};

function bookImageUrl(imageFileName: string) {
  return new URL(`/book-images/${imageFileName}`, import.meta.url)
    .href;
}

function emptyCartImageUrl() {
  return new URL(`/site-images/emptycart.jpeg`, import.meta.url)
    .href;
}
</script>

<style scoped>
.cart-table {
  margin: 10px;
  display: grid;
  grid-template-columns: max-content minmax(10em, 35em) repeat(3, max-content);
  row-gap: 1em;
  border-right: solid 1px var(--primary-color-dark);
  border-left: solid 1px var(--primary-color-dark);
  background-color: #eff6f4;
}

ul {
  display: contents;
}

ul > li {
  display: contents;
}

.table-heading {
  background-color: var(--secondary-background-color);
  border: solid 1px var(--primary-color-dark);
  color: var(--primary-background-color);
}

.table-heading > * {
  background-color: var(--secondary-background-color);
  color: white;
  border-right: solid 1px var(--card-background-color);
  padding: 0.5em;
}

.heading-book {
  color: white;
  grid-column: 1 / 3;
  font-family: var(--title-font-family);
  font-weight: bold;
}

.heading-price {
  color: white;
  font-family: var(--title-font-family);
  grid-column: 3 / 5;
  text-align: right;
  font-weight: bold;
}

.heading-subtotal {
  color: white;
  font-family: var(--title-font-family);
  text-align: right;
  grid-column: 5 / 6;
  border-right: solid 1px #aaaaaa;
  font-weight: bold;
}

.cart-book-image {
  padding: 0 1em;
  display: flex;
  align-items: center;
  gap: 1em;
}

.cart-book-image > * {
  margin-left: auto;
  margin-right: 0;
}

img {
  display: block;
  width: 100px;
  height: auto;
}

.cart-book-title {
  padding: 0.5em;
}

.cart-book-price {
  padding-left: 1em;
  padding-top: 0.5em;
  text-align: right;
}

.cart-book-quantity {
  padding-left: 1em;
  padding-top: 0.5em;
  padding-right: 1em;
}

.cart-book-subtotal {
  display: flex;
  justify-content: space-between;
  padding-top: 0.5em;
  text-align: right;
  padding-left: 1em;
  padding-right: 1em;
}

/* Row separators in the table */

.line-sep {
  display: block;
  height: 2px;
  background-color: gray;
  grid-column: 1 / -1;
}

/* Increment/decrement buttons */

.icon-button {
  border: none;
  cursor: pointer;
  background-color: transparent;
}

.inc-button {
  font-size: 1.125rem;
  color: #3c9c7a;
  margin-right: 0.25em;
  border: none;
}

.inc-button:hover {
  color: #1d7a59;
}

.dec-button {
  font-size: 1.125rem;
  color: rgba(148, 121, 115, 0.97);
  float: right;
}

.dec-button:hover {
  color: var(--primary-color-dark);
}

.trash-button {
  font-size: 1.125rem;
  color: black;
  float: right;
}

.trash-button:hover {
  color: red;
}

input[type="number"] {
  width: 4em;
}

select {
  background-color: var(--primary-color);
  color: white;
  border: 2px solid var(--primary-color-dark);
  border-radius: 3px;
}

.cart-table-container {
  display: flex;
  flex-direction: row;
}

.cart-table-sidebar {
  display: flex;
  flex-direction: column;
  border: solid 1px var(--primary-color-dark);
  overflow: auto;
}

.cart-sidebar {
  margin: 10px;
  display: flex;
  flex-direction: column;
  width: 30%;
  background-color: #eff6f4;
  border: solid 1px var(--primary-color-dark);
}

.price-details {
  color: white;
  font-weight: bold;
  font-family: var(--title-font-family);
  display: flex;
  padding: 0.5em;
  background-color: var(--secondary-background-color);
}

.price-details-items {
  display: flex;
  flex-direction: column;
  padding: 0.5em;
  gap: 0.2em;
}

.total-amount-div {
  display: flex;
  justify-content: space-between;
  border-top: 1px solid var(--primary-color-dark);
  font-weight: bold;
}
.total-tax-div {
  display: flex;
  justify-content: space-between;
}

.sub-total-div {
  display: flex;
  justify-content: space-between;
}

.checkout {
  align-self: center;
}

.checkout-cta {
  font-family: var(--title-font-family);
  font-size: 20px;
  background-color: var(--secondary-background-color);
  color: white;
  font-weight: bold;
  padding: 0.6em 0.6em;
  display: flex;
  justify-content: center;
  width: 100%;
  border: 2px solid var(--secondary-background-color);
  gap: 4px;
  border-radius: 40px;
}

.checkout-cta:hover {
  color: var(--secondary-background-color);
  background-color: white;
  border: 2px solid var(--secondary-background-color);
  cursor: pointer;
  font-weight: bolder;
  border-radius: 40px;
}

.empty-cart-page {
  padding: 1em;
  display: flex;
  flex-direction: column;
  gap: 2em;
  justify-content: space-between;
  align-items: center;
}
.total-items-div {
  display: flex;
  justify-content: space-between;
}

.cart-page-button {
  color: var(--secondary-background-color);
  padding: 0.5em;
  background-color: var(--primary-background-color);
  border-radius: 40px;
  font-weight: bold;
  border: 2px solid var(--secondary-background-color);
}

.cart-page-button:hover {
  background-color: var(--secondary-background-color);
  color: white;
  cursor: pointer;
}

.clear-cart-button {
  color: var(--secondary-background-color);
  padding: 0.5em;
  background-color: var(--primary-background-color);
  border-radius: 40px;
  border: 0.5px solid var(--secondary-background-color);
  font-size: 15px;
}

.clear-cart-button:hover {
  background-color: var(--secondary-background-color);
  color: white;
  cursor: pointer;
}

.back-clear-proceed-container {
  display: flex;
  justify-content: space-around;
  gap: 15em;
  align-items: center;
  background-color: #eff6f4;
  padding: 0.5em;
  border: solid 1px var(--primary-color-dark);
}

.back-clear-proceed {
  display: flex;
  justify-content: flex-start;
  gap: 10px;
}

.empty-cart-image {
  width: 300px;
  height: auto;
}

checkout-cta, a {
  text-decoration: none;
}
</style>

<template>
  <div class="cart-table-sidebar" v-if="cartStore.count > 0">
    <div class="cart-table-container">
      <div class="cart-table">
        <ul>
          <li class="table-heading">
            <div class="heading-book">Book</div>
            <div class="heading-price">Price / Quantity</div>
            <div class="heading-subtotal">Amount</div>
          </li>

          <template
            v-for="item in cart.items"
            :key="item.book.bookId"
          >
            <li>
              <div class="cart-book-image">
                <img
                  :src="`${bookImagePrefix}${bookImageFileName(item.book)}`"
                  :alt="item.book.title"
                  width="100px"
                  height="auto"
                />
              </div>
              <div class="cart-book-title">{{ item.book.title }}</div>
              <div class="cart-book-price">
                {{ asDollarsAndCents(item.book.price) }}
              </div>
              <div class="cart-book-quantity">
                &nbsp;
                <button
                  class="icon-button inc-button"
                  @click="updateCart(item.book, item.quantity + 1)"
                >
                  <i class="fa-sharp fa-solid fa-circle-plus"></i>
                </button>
                <span class="quantity">{{ item.quantity }}</span>
                <button
                  class="icon-button dec-button"
                  @click="updateCart(item.book, item.quantity - 1)"
                >
                  <i class="fas fa-minus-square"></i>
                </button>
              </div>
              <div class="cart-book-subtotal">
                <div>
                  {{ asDollarsAndCents(item.book.price * item.quantity) }}
                </div>
                <div>
                  <button
                    class="icon-button trash-button"
                    @click="
                      updateCart(item.book, item.quantity - item.quantity)
                    "
                  >
                    <i
                      class="fas fa-trash-alt"
                      aria-hidden="true"
                    ></i>
                  </button>
                </div>
              </div>
            </li>
            <li class="line-sep"></li>
          </template>
        </ul>
      </div>
      <div class="cart-sidebar">
        <div class="price-details">Price Details</div>
        <div class="price-details-items">
          <div class="total-items-div">
            <div>#books</div>
            <div>{{ cartStore.count }}</div>
          </div>
          <div class="sub-total-div">
            <div class="sub-total">Sub Total</div>
            <div class="sub-total">
              {{ asDollarsAndCents(cart.subtotal) }}
            </div>
          </div>
<!--          <div class="total-tax-div">-->
<!--            <div class="total-tax">Surcharge</div>-->
<!--            <div class="total-tax">-->
<!--              {{ asDollarsAndCents(cart.surcharge) }}-->
<!--            </div>-->
<!--          </div>-->
          <div class="total-amount-div">
            <div class="total-amount">Total Amount</div>
            <div class="total-amount">
              {{
                asDollarsAndCents(
                  cart.subtotal
                )
              }}
            </div> <!-- + cart.surcharge -->
          </div>
        </div>
        <div class="checkout">
          <router-link :to="'/SivaBookstoreTransact/checkout'">
            <button class="checkout-cta">
              <div class="proceed-checkout">CHECKOUT <i class="fa-solid fa-credit-card"></i></div>
            </button>
          </router-link>
        </div>
      </div>
    </div>
    <div class="back-clear-proceed-container" v-if="cartStore.count > 0">

      <div class="back-clear-proceed" v-if="cartStore.count > 0">
          <button class="cart-page-button" @click = "router.push({name: 'category-view',params:{name:categoryStore.categoryName}})">
            Continue Shopping <i class="fa-solid fa-bag-shopping"></i>
          </button>
        <button class="clear-cart-button" @click="cartStore.clearCart()">
          Clear Cart <i class="fa-solid fa-trash"></i>
        </button>
      </div>

      <div class="total-items-div">
        <div class="total-items">
          Your cart contains {{ cartStore.count }}
          <span v-if="cartStore.count === 1">book</span>
          <span v-else>books</span>
        </div>
      </div>
    </div>
  </div>
  <div v-else class="empty-cart-page">
    <img class="empty-cart-image"
         :src="emptyCartImageUrl()"
         alt="emptycart"
         width="100px"
         height="auto"
    />
    <div class="back-clear-proceed">
        <button class="cart-page-button" @click = "router.push({name: 'category-view',params:{name:categoryStore.categoryName}})">
          Continue Shopping <i class="fa-solid fa-bag-shopping"></i>
        </button>
    </div>
  </div>
</template>
