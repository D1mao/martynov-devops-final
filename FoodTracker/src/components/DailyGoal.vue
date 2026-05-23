<template>
  <div class="daily-goal">
    <h2>Дневная норма калорий</h2>
    <input type="number" v-model.number="goal" placeholder="Введите дневную норму" />
    <button @click="updateGoal">Сохранить</button>
    <p v-if="goal > 0">Текущая норма: {{ goal }} ккал</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      goal: JSON.parse(localStorage.getItem('dailyGoal')) || 2000,
    };
  },
  methods: {
    updateGoal() {
      localStorage.setItem('dailyGoal', JSON.stringify(this.goal));
      this.$emit('updateGoal', this.goal);
    },
  },
};
</script>

