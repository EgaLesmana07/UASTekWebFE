import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'login',
        component: () => import('@/views/auth/Login.vue')
    },
    {
        path: '/register',
        name: 'register',
        component: () => import('@/views/auth/Register.vue')
    },
    {
        path: '/dashboard',
        name: 'dashboard',
        component: () => import('@/views/dashboard/Index.vue')
    },
    {
        path: '/jadwal',
        name: 'jadwal',
        component: () => import('@/views/dashboard/Jadwal.vue')
    },
    {
        path: '/profil',
        name: 'profil',
        component: () => import('@/views/dashboard/Profil.vue')
    },
    {
        path: '/edit/:id',
        name: 'edit',
        component: () => import('@/views/dashboard/Edit.vue')
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router