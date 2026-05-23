<template>
  <div class="container">
    <h1>Калькулятор калорий</h1>

    <DailyGoal @updateGoal="setDailyGoal" />

    <AddMealForm @mealAdded="addMeal" />

    <SummaryCard :meals="meals" :dailyGoal="dailyGoal" />

    <h2>Список продуктов</h2>
    <button @click="clearMeals" class="clear-button">Очистить список</button>

    <ul>
      <li v-for="(meal, index) in meals" :key="index">
        {{ meal.name }} — {{ meal.calories }} ккал (Б: {{ meal.protein }}г, Ж: {{ meal.fat }}г, У: {{ meal.carbs }}г)
      </li>
    </ul>
  </div>
</template>

<script>
import AddMealForm from '../components/AddMealForm.vue';
import SummaryCard from '../components/SummaryCard.vue';
import DailyGoal from '../components/DailyGoal.vue';

export default {
  components: { AddMealForm, SummaryCard, DailyGoal },
  data() {
    return {
      meals: JSON.parse(localStorage.getItem('meals')) || [],
      dailyGoal: JSON.parse(localStorage.getItem('dailyGoal')) || 2000,
    };
  },
  methods: {
    addMeal(meal) {
      this.meals.push(meal);
      localStorage.setItem('meals', JSON.stringify(this.meals));
    },
    setDailyGoal(goal) {
      this.dailyGoal = goal;
      localStorage.setItem('dailyGoal', JSON.stringify(goal));
    },
    clearMeals() {
      this.meals = [];
      localStorage.removeItem('meals');
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
