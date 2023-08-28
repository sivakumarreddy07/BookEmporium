import { createRouter, createWebHistory } from "vue-router";
// @ts-ignore
import HomeView from "../views/HomeView.vue";
// @ts-ignore
import CategoryView from "@/views/CategoryView.vue";
// @ts-ignore
import CartView from "@/views/CartView.vue";
// @ts-ignore
import CheckoutView from "@/views/CheckoutView.vue";
// @ts-ignore
import ConfirmationView from "@/views/ConfirmationView.vue";
// @ts-ignore
import NotFound from "@/views/NotFound.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/SivaBookstoreTransact",
      name: "home",
      component: HomeView,
      alias: ["/SivaBookstoreTransact/home", "/SivaBookstoreTransact/index.html"],
    },
    {
      path: "/SivaBookstoreTransact/category/:name",
      name: "category-view",
      component: CategoryView,
    },
    {
      path: "/SivaBookstoreTransact/category",
      redirect: "/SivaBookstoreTransact/category/Classics",
    },
    {
      path: "/SivaBookstoreTransact/cart",
      name: "cart-view",
      component: CartView,
    },
    {
      path: "/SivaBookstoreTransact/checkout",
      name: "checkout-view",
      component: CheckoutView,
    },
    {
      path: "/SivaBookstoreTransact/confirmation",
      name: "confirmation-view",
      component: ConfirmationView,
    },
    {
      path: "/SivaBookstoreTransact/:pathMatch(.*)*",
      name: "not-found",
      component: NotFound,
    },
  ],
});

export default router;
