<template>
  <div class="container">
    <h1>Статистика за день</h1>

    <MacroChart :meals="meals" />

    <h2>Список продуктов</h2>
    <ul>
      <li v-for="(meal, index) in meals" :key="index">
        {{ meal.name }} — {{ meal.calories }} ккал (Б: {{ meal.protein }}г, Ж: {{ meal.fat }}г, У: {{ meal.carbs }}г)
      </li>
    </ul>
  </div>
</template>

<script>
import MacroChart from '../components/MacroChart.vue';

export default {
  components: { MacroChart },
  data() {
    return {
      meals: JSON.parse(localStorage.getItem('meals')) || [],
    };
  },
  watch: {
    meals: {
      handler(newMeals) {
        localStorage.setItem('meals', JSON.stringify(newMeals));
      },
      deep: true,
    },
  },
};
</script>

<style scoped>
h1, h2 {
  text-align: center;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  background: #f8f9fa;
  padding: 10px;
  margin: 5px 0;
  border-radius: 5px;
}
</style>
