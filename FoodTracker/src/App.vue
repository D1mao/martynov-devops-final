<template>
  <div>
    <header>
      <nav>
        <router-link to="/" @click="reloadOnHome">Главная</router-link> |
        <router-link to="/stats">Статистика</router-link>
      </nav>
    </header>
    <main>
      <router-view></router-view>
    </main>
  </div>
</template>

<script>
export default {
  methods: {
    reloadOnHome(event) {
      if (this.$route.path !== "/") {
        event.preventDefault();
        this.$router.push("/").then(() => {
          window.location.reload();
        });
      }
    },
  },
};
</script>
