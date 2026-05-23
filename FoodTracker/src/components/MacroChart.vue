<template>
  <div class="chart-container">
    <h2>Баланс БЖУ</h2>
    <DoughnutChart :chart-data="chartData" :chart-options="chartOptions" />
  </div>
</template>

<script>
import { defineComponent} from 'vue';
import { DoughnutChart } from 'vue-chart-3';
import { Chart as ChartJS, Title, Tooltip, Legend, ArcElement, DoughnutController } from "chart.js";

ChartJS.register(Title, Tooltip, Legend, ArcElement, DoughnutController);

export default defineComponent({
  components: { DoughnutChart },
  props: {
    meals: Array,
  },
  computed: {
    totalProtein() {
      return this.meals.reduce((sum, meal) => sum + meal.protein, 0);
    },
    totalFat() {
      return this.meals.reduce((sum, meal) => sum + meal.fat, 0);
    },
    totalCarbs() {
      return this.meals.reduce((sum, meal) => sum + meal.carbs, 0);
    },
    chartData() {
      return {
        labels: ['Белки', 'Жиры', 'Углеводы'],
        datasets: [
          {
            data: [this.totalProtein, this.totalFat, this.totalCarbs],
            backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56'],
          },
        ],
      };
    },
    chartOptions() {
      return {
        responsive: true,
        maintainAspectRatio: false,
      };
    },
  },
});
</script>

<style scoped>
.chart-container {
  max-width: 400px;
  margin: auto;
}
</style>
