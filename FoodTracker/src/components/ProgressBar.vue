<template>
  <div class="progress-container">
    <p><strong>Осталось калорий:</strong> {{ remainingCalories }} / {{ dailyGoal }}</p>
    <div class="progress-bar">
      <div
          class="progress"
          :style="{ width: progressPercent + '%' }"
          :class="{ over: remainingCalories < 0 }"
      ></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    totalCalories: Number,
    dailyGoal: Number,
  },
  computed: {
    remainingCalories() {
      return this.dailyGoal - this.totalCalories;
    },
    progressPercent() {
      return Math.min((this.totalCalories / this.dailyGoal) * 100, 100);
    },
  },
};
</script>
