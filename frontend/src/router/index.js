import { createRouter, createWebHistory } from "vue-router";
// import {
//   HomeView
// } from'../views/HomeView.vue'

const routes = [
  {
    path: "/",
    name: "home",
    component: () => import("../views/user/HomeView.vue"),
  },
  // 로그인
  {
    path: "/login",
    name: "login",
    component: () => import("../views/preHome/LoginView.vue"),
  },
  {
    path: "/join",
    name: "join",
    component: () => import("../views/preHome/JoinView.vue"),
  },
  {
    path: "/findpw",
    name: "findpw",
    component: () => import("../views/preHome/FindpwView.vue"),
  },
  // 마이페이지
  {
    path: "/mypage/",
    name: "mypage",
    component: () => import("../views/user/MyPage.vue"),
  },
  {
    path: "/mypage/myassey",
    name: "myassey",
    component: () => import("../views/user/MyPageDetail.vue"),
  },
  {
    path: "/mypage/myconsulting",
    name: "myconsulting",
    component: () => import("../views/user/MyPageDetail.vue"),
  },
  {
    path: "/mypage/mystudy",
    name: "mystudy",
    component: () => import("../views/user/MyPageDetail.vue"),
  },
  {
    path: "/mypage/mysleep",
    name: "mysleep",
    component: () => import("../views/user/MyPageDetail.vue"),
  },
  {
    path: "/mypage/mypoint",
    name: "mypoint",
    component: () => import("../views/user/MyPageDetail.vue"),
  },
  {
    path: "/admin/user",
    name: "adminuser",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/point",
    name: "adminpoint",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/study",
    name: "adminstudy",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/sleep",
    name: "adminsleep",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/inout",
    name: "admininout",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/consulting",
    name: "adminconsulting",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/life",
    name: "adminlife",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  {
    path: "/admin/logout",
    name: "adminlogout",
    component: () => import("../views/admin/AdminPage.vue"),
  },
  // 게시판
  {
    path: "/community",
    name: "community",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/notice1",
    name: "notice1",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/data",
    name: "data",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/faq",
    name: "faq",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/repair",
    name: "repair",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/market",
    name: "market",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/lost",
    name: "lost",
    component: () => import("../views/board/BoradDetail.vue"),
  },
  {
    path: "/community/create-article",
    name: "article",
    component: () => import("../views/board/CreateArticle.vue"),
  },
  {
    path: "/community/article/no", // 글넘버
    name: "articleNo",
    component: () => import("../views/board/BoradDetail.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
