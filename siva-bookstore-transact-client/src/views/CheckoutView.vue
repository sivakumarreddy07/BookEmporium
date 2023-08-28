<script setup lang="ts">
import { reactive, ref } from "vue";
import {asDollarsAndCents} from "@/main";
import useVuelidate from "@vuelidate/core";
import {useCartStore} from "@/stores/cart";
import {useCategoryStore} from "@/stores/category";
import {isMobilePhone, isCreditCard} from "@/validators";
import CheckoutFieldError from "@/components/CheckoutFieldError.vue";
import router from "@/router";
import {
  email,
  helpers,
  maxLength,
  minLength,
  required,
} from "@vuelidate/validators";
import type {OrderDetails, ServerErrorResponse} from "@/types";

const categoryStore = useCategoryStore();
const cartStore = useCartStore();
const cart = cartStore.cart;

const defaultServerErrorMessage = "An unexpected error occurred, please try again."
const serverErrorMessage = ref(defaultServerErrorMessage);

function emptyCartImageUrl() {
  return new URL(`/site-images/emptycart.jpeg`, import.meta.url)
    .href;
}

const months: string[] = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const form = reactive({
  name: "",
  address: "",
  phone: "",
  email: "",
  ccNumber: "",
  ccExpiryMonth: new Date().getMonth() + 1,
  ccExpiryYear: new Date().getFullYear(),
  checkoutStatus: "",
});

const rules = {
  name: {
    required: helpers.withMessage("Please provide a name.", required),
    minLength: helpers.withMessage(
      "Name must have at least 4 letters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Name can have at most 45 letters.",
      maxLength(45)
    ),
  },
  address: {
    required: helpers.withMessage("Please provide an address.", required),
    minLength: helpers.withMessage(
      "Address must have at least 4 letters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Address can have at most 45 letters.",
      maxLength(45)
    ),
  },
  phone: {
    required: helpers.withMessage("Please provide a phone number.", required),
    phone: helpers.withMessage(
      "Please provide a valid phone number.",
      (value: string) => !helpers.req(value) || isMobilePhone(value)
    ),
  },
  email: {
    required: helpers.withMessage("Please provide an email address.", required),
    email: helpers.withMessage("Please provide a valid email address.", email),
  },
  ccNumber: {
    required: helpers.withMessage("Please provide a credit card.", required),
    phone: helpers.withMessage(
      "Please provide a valid credit card.",
      (value: string) => !helpers.req(value) || isCreditCard(value)
    ),
  },
  ccExpiryMonth: {},
  ccExpiryYear: {},
};
const $v = useVuelidate(rules, form);


async function submitOrder() {
  console.log("Submit order");
  const isFormCorrect = await $v.value.$validate();
  if (!isFormCorrect) {
    form.checkoutStatus = "ERROR";
  } else {
    try {
      form.checkoutStatus = "PENDING";
      serverErrorMessage.value = defaultServerErrorMessage;

      const placeOrderResponse: OrderDetails | ServerErrorResponse =
        await cartStore
          .placeOrder({
            name: form.name,
            address: form.address,
            phone: form.phone,
            email: form.email,
            ccNumber: form.ccNumber,
            ccExpiryMonth: form.ccExpiryMonth,
            ccExpiryYear: form.ccExpiryYear,
          })

      if ("error" in placeOrderResponse) {
        form.checkoutStatus = "SERVER_ERROR";
        serverErrorMessage.value = placeOrderResponse.message
        console.log("Error placing order", placeOrderResponse);
      } else {
        form.checkoutStatus = "OK";
        await router.push({name: "confirmation-view"});
      }

    } catch (e) {
      form.checkoutStatus = "SERVER_ERROR";
      serverErrorMessage.value = defaultServerErrorMessage;
      console.log("Error placing order", e);
    }
  }
}

function helperYear(index: number) {
  return new Date().getFullYear() + index;
}
</script>

<style scoped>
.checkout-page {
  background: #bacbcc;
  color: var(--primary-color-dark);
  border-left: 1px solid var(--primary-color-dark);
  border-right: 1px solid var(--primary-color-dark);
}
.checkout-page, section{
  height: 88%;
  background-color: #FAFAFA;
}
.checkout-page-heading {
  padding: 12px;
  font-size: 25px;
  color: #111111;
}

.checkout-page-body {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 1em;
  color: #111111;
}

form {
  display: flex;
  flex-direction: column;
}

form > div {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 0.5em;
}

form > div > input,
form > div > select {
  background-color: var(--primary-background-color);
  margin-left: 0.5em;
  border-radius: 0.25em;
}

form > .error {
  color: red !important;
  text-align: right;
}

.error {
  color: red !important;
  text-align: right;
  font-size: .8em;
  font-weight: 700;
  font-style: italic;
  margin-top: 0.1em;
}

.error-text {
  color: red;
}

.checkoutStatusBox {
  margin: 1em;
  text-align: center;
}

.back-to-shopping {
  padding: 1em;
  padding-bottom: 5em;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 5em;
  align-items: center;
}

.form_button {
  width: fit-content;
  align-self: center;
  padding: 0.6em;
  font-weight: bold;
  font-size: large;
  font-family: var(--title-font-family);
  background-color: var(--secondary-background-color);
  border-radius: 40px;
  border: 2px solid var(--secondary-background-color);
}

.form_button:hover {
  color: var(--secondary-background-color);
  background-color: white;
}
.each-form-item {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 25em;
}

.label-input {
  display: flex;
  justify-content: space-between;
  width: 100%;
  font-size: 1.05em;
}

input {
  border-radius: 0.25em;
  border: 1px solid var(--primary-color-dark);
  width: 13em;
  padding: 0.3em;
}

.expiry {
  display: flex;
  justify-content: space-between;
  width: 13em;
  padding-bottom: 0.3em;
}

.exp-m-y {
  padding: 0.2em;
  border-radius: 0.25em;
}

.price-details {
  display: flex;
  padding: 1.5em;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

.checkout-outer {
  background-color: #FAFAFA;
  height: 78%;
}

.cart-page-heading {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 10%;
}

.cart-page-heading-container {
  display: flex;
  flex-direction: row;
  //width:50%;
  //justify-content: space-between;
  align-items: center;
  padding: 1em;
}

.front-back-button {
  text-decoration: none;
}

.left-right-bars {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-left: 300px;
  margin-right: 300px;
  margin-bottom: 30px;
  //border: 1px solid black;
  border-radius: 5px;
  background-color: #FAFAFA;
}

.left-bar {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.nav-buttons {
  font-family: var(--title-font-family);
  color: var(--secondary-background-color);
  padding: 0.5em;
  background-color: var(--primary-background-color);
  border-radius: 40px;
  font-weight: bold;
  border: 2px solid var(--secondary-background-color);
}

.nav-buttons:hover {
  background-color: var(--secondary-background-color);
  color: white;
}
.empty-cart-image {
  width: 300px;
  height: auto;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

/* Progress Bar Styling */

.progress-bar {
  display: flex;
  justify-content: center;
  width:90%;
  gap:15rem;
  margin-left: -5%;
}
.step {
  box-sizing: border-box;
  position: relative;
  z-index: 1;
  display: block;
  width: 25px;
  height: 25px;
  margin-bottom: 30px;
  border: 4px solid #fff;
  border-radius: 50%;
  background-color: #efefef;
}
.step:after {
  position: absolute;
  z-index: -1;
  top: 5px;
  left: 22px;
  width: 240px;
  height: 6px;
  content: '';
  background-color: #efefef;
}
.step:before {
  color: #2e2e2e;
  position: absolute;
  top: 25px;
}
.step:last-child:after {
  content: none;
}

.step.active {
  background-color: #1e6266;
}
.step.active:after {
  background-color: #1e6266;
}
.step.active:before {
  color: #1e6266;
  width:5rem;
}
.step.active + .step {
  background-color: #1e6266;
}
.step.active + .step:before {
  color: #1e6266;
  width: 10rem;
}

.step:nth-child(1):before {
  content: 'Your Cart';
  width:10rem;
  left: -20px;
}
.step:nth-child(2):before {
  right: -100px;
  content: 'Checkout Details';

}
.step:nth-child(3):before {
  right: -100px;
  content: 'Order Complete';
  width:10rem;
}
</style>

<template>
  <div class="checkout-page">
    <section v-if="cart.empty">
      <img
        class="empty-cart-image"
        :src="emptyCartImageUrl()"
        alt="empty cart"
      />
      <div class="back-to-shopping">
          <button class="button nav-buttons" @click = "router.push({name: 'category-view',params:{name:categoryStore.categoryName}})">
            <i class="fas fa-caret-left"></i> Back to Shopping
          </button>
        <h1>You need to add items to your cart to checkout!</h1>
      </div>
    </section>
    <div class="cart-page-heading" v-if="cartStore.count > 0">
      <div class="cart-page-heading-container">
        <div style="width: 10%">
          <router-link
            :to="{
              name: 'cart-view',
            }"
            class="front-back-button"
          >
            <button class="button nav-buttons">
              <i class="fas fa-caret-left"></i> Back to Cart
            </button>
          </router-link>
        </div>
        <div class="progress-bar">
          <div class="step active"></div>
          <div class="step"></div>
          <div class="step"></div>
<!--          <div class="step"></div>-->
        </div>
      </div>
      <div></div>
    </div>
    <div class="checkout-outer">
      <section v-if="!cart.empty" class="left-right-bars">
        <h1 class="checkout-page-heading">
          Checkout Form
        </h1>
        <section class="left-bar">
          <!--   set Cart STATUSES   -->
          <section
            v-show="form.checkoutStatus !== ''"
            class="checkoutStatusBox"
          >
            <div class="error-text" v-if="form.checkoutStatus === 'ERROR'">
              Error: Please fix the problems and try again.
            </div>

            <div v-else-if="form.checkoutStatus === 'PENDING'">
              Processing...
            </div>

            <div v-else-if="form.checkoutStatus === 'OK'">Order placed...</div>

            <div class="error-text" v-else>{{ serverErrorMessage }}</div>
          </section>

          <!--   display FORM   -->
          <section class="checkout-page-body">
            <form @submit.prevent="submitOrder">
              <div class="each-form-item">
                <div class="label-input">
                  <label for="name">Name</label>
                  <input
                    type="text"
                    size="20"
                    id="name"
                    name="name"
                    class="input-label"
                    v-model.lazy="$v.name.$model"
                  />
                </div>

                <checkout-field-error :field-name="$v.name"/>
              </div>

              <div class="each-form-item">
                <div class="label-input">
                  <label for="address">Address</label>
                  <input
                    type="text"
                    size="20"
                    id="name"
                    name="name"
                    v-model.lazy="$v.address.$model"
                  />
                </div>
                <checkout-field-error :field-name="$v.address"/>
              </div>

              <div class="each-form-item">
                <div class="label-input">
                  <label for="phone">Phone</label>
                  <input
                    class="textField"
                    type="text"
                    size="20"
                    id="phone"
                    name="phone"
                    v-model.lazy="$v.phone.$model"
                  />
                </div>
                <checkout-field-error :field-name="$v.phone"/>
              </div>

              <div class="each-form-item">
                <div class="label-input">
                  <label for="email">Email</label>
                  <input
                    type="text"
                    size="20"
                    id="email"
                    name="email"
                    @blur="$v.email.$touch()"
                    v-model.lazy="$v.email.$model"
                  />
                </div>
                <checkout-field-error :field-name="$v.email"/>
              </div>

              <div class="each-form-item">
                <div class="label-input">
                  <label for="ccNumber">Credit card</label>
                  <input
                    type="text"
                    size="20"
                    id="ccNumber"
                    name="ccNumber"
                    v-model.lazy="$v.ccNumber.$model"
                  />
                </div>
                <checkout-field-error :field-name="$v.ccNumber"/>
              </div>

              <div class="each-form-item">
                <div class="label-input">
                  <label>Expiry</label>
                  <div class="expiry">
                    <select class="exp-m-y" v-model="$v.ccExpiryMonth.$model">
                      <option
                        v-for="(month, index) in months"
                        :key="index"
                        :value="index + 1"
                      >
                        {{ month }} ({{ index + 1 }})
                      </option>
                    </select>

                    <select class="exp-m-y" v-model="$v.ccExpiryYear.$model">
                      <option
                        v-for="(year, index) in 20"
                        :key="index"
                        :value="helperYear(index)"
                      >
                        {{ helperYear(index) }}
                      </option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="price-details">
                <div>
                  Your Credit card will be charged
                  <strong>{{
                      asDollarsAndCents(cart.subtotal + cart.surcharge)
                    }}</strong>
                </div>
                <div>
                  (SubTotal: {{ asDollarsAndCents(cart.subtotal) }} + Surcharge:
                  {{ asDollarsAndCents(cart.surcharge) }})
                </div>
              </div>
              <input
                type="submit"
                name="submit"
                class="button form_button"
                :disabled="form.checkoutStatus === 'PENDING'"
                value="Complete Transaction"
              />
            </form>
          </section>
        </section>
      </section>
    </div>
  </div>
</template>
