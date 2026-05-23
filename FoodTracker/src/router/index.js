import { createRouter, createWebHistory } from 'vue-router';
import Home from '../pages/Home.vue';
import Stats from '../pages/Stats.vue';

const routes = [
    { path: '/', component: Home },
    { path: '/stats', component: Stats }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;
