<template>
  <div class="summary-card">
    <h2>Статистика за день</h2>
    <p><strong>Всего калорий:</strong> {{ totalCalories }} ккал</p>

    <ProgressBar :totalCalories="totalCalories" :dailyGoal="dailyGoal" />

    <div class="macros">
      <p><strong>Белки:</strong> {{ proteinPercent.toFixed(1) }}% ({{ totalProtein }} г)</p>
      <p><strong>Жиры:</strong> {{ fatPercent.toFixed(1) }}% ({{ totalFat }} г)</p>
      <p><strong>Углеводы:</strong> {{ carbsPercent.toFixed(1) }}% ({{ totalCarbs }} г)</p>
    </div>
  </div>
</template>

<script>
import ProgressBar from './ProgressBar.vue';

export default {
  components: { ProgressBar },
  props: {
    meals: Array,
    dailyGoal: Number,
  },
  computed: {
    totalCalories() {
      return this.meals.reduce((sum, meal) => sum + meal.calories, 0);
    },
    totalProtein() {
      return this.meals.reduce((sum, meal) => sum + meal.protein, 0);
    },
    totalFat() {
      return this.meals.reduce((sum, meal) => sum + meal.fat, 0);
    },
    totalCarbs() {
      return this.meals.reduce((sum, meal) => sum + meal.carbs, 0);
    },
    totalMacrosCalories() {
      return (this.totalProtein * 4) + (this.totalFat * 9) + (this.totalCarbs * 4);
    },
    proteinPercent() {
      return (this.totalProtein * 4 / this.totalMacrosCalories) * 100 || 0;
    },
    fatPercent() {
      return (this.totalFat * 9 / this.totalMacrosCalories) * 100 || 0;
    },
    carbsPercent() {
      return (this.totalCarbs * 4 / this.totalMacrosCalories) * 100 || 0;
    },
  },
};
</script>
