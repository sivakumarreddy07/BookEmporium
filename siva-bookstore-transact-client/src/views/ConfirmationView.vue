<script setup lang="ts">
import ConfirmationTable from "@/components/ConfirmationTable.vue";


import { useOrderDetailsStore } from "@/stores/orderDetails";
import { computed } from "vue";
import type {OrderDetails} from "@/types";
import {useCartStore} from "@/stores/cart";
const orderDetailsStore = useOrderDetailsStore();
const orderDetails = orderDetailsStore.orderDetails as OrderDetails;
const cartStore = useCartStore();
const cart = cartStore.cart;

const orderDate = computed(function () {
  let date = new Date(orderDetails.order.dateCreated);
  return date.toLocaleTimeString();
});

const ccExpDate = computed(function (): Date {
  return new Date(orderDetails.customer.ccExpDate);
});

const ccExpYear = computed(function (): number {
  return ccExpDate.value.getFullYear();
});

const ccExpMonth = computed(function (): string {
  let month = ccExpDate.value.getMonth() + 1;
  let result = "" + month;
  if (month < 10) {
    result = "0" + month;
  }
  return result;
});
</script>

<style scoped>
#confirmation-view {
  display: flex;
  flex-direction: column;
  height: 88%;
  align-items: flex-start;
  justify-content: space-between;
  align-items: center;
  gap: 1em;
  border-left: 1px solid var(--primary-color-dark);
  border-right: 1px solid var(--primary-color-dark);
  padding-left: 10em;
  padding-right: 10em;
  padding-top: 2em;
  padding-bottom: 2em;
  overflow: auto;
}
ul {
  text-align: left;
}
ul > li {
  margin: 0.25em;
}

#no-details {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 7em;
  height: 88%;
  padding: 5em;
  border-left: solid 1px var(--primary-color-dark);
  border-right: solid 1px var(--primary-color-dark);
  background-color: #EEEEEE;
}

#confirmation-num-time {
  border-radius: 0.5em;
  padding: 2em;
  background: var(--secondary-background-color);
  color: white;
  text-align: center;
  width: 400px;
}

#confirmation-info {
  border-radius: 0.5em;
  border: 1px solid var(--primary-color-dark);
  padding: 2em;
  background: #DBFBF0;
  font-weight: bold;
  color: var(--secondary-background-color);
  text-align: center;
  width: 400px;
}

#customer-info {
  font-size: 25px;
  text-decoration: underline;
}

.back-to-home {
  font-family: var(--title-font-family);
  color: white;
  padding: 0.5em;
  background-color: var(--secondary-background-color);
  border-radius: 40px;
  font-weight: bold;
  text-decoration: none;
  border: 2px solid var(--secondary-background-color);
  align-items: center;
}

.back-to-home:hover {
  color: var(--secondary-background-color);
  background-color: white;
}

#sorry-msg {
  font-weight: bold;
  font-family: var(--title-font-family);
}

</style>

<template>
  <div id="no-details" v-if="!orderDetails.order">
    <p id="sorry-msg">We are sorry, the order you requested could not be found</p>
    <router-link class="buttons back-to-home" :to="{ name: 'home' }"
    >Back to Home</router-link
    >
  </div>
  <div v-else id="confirmation-view">
    <ul id="confirmation-num-time">
      <li>
        <strong
        >Confirmation #:
          {{ orderDetails.order.confirmationNumber }}</strong
        >
      </li>
      <li>{{ new Date(orderDetails.order.dateCreated) }}</li>
    </ul>
    <confirmation-table> </confirmation-table>
    <ul id="confirmation-info">
      <li id="customer-info"> Customer Information</li>
      <li>{{ orderDetails.customer.customerName }}</li>
      <li>{{ orderDetails.customer.address }}</li>
      <li>{{ orderDetails.customer.email }}</li>
      <li>{{ orderDetails.customer.phone }}</li>
      <li>
        ** ** ** {{ orderDetails.customer.ccNumber.slice(-4) }} ({{
          new Date(orderDetails.customer.ccExpDate).getMonth() + 1
        }}-{{ new Date(orderDetails.customer.ccExpDate).getFullYear() }})
      </li>
    </ul>
    <div id="customerInfo"></div>
  </div>
</template>
