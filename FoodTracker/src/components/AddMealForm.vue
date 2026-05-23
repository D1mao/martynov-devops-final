<template>
  <form @submit.prevent="addMeal">
    <div>
      <label>Название продукта:</label>
      <input type="text" v-model="meal.name" required />
    </div>

    <div>
      <label>Калории:</label>
      <input type="number" v-model.number="meal.calories" required />
    </div>

    <div>
      <label>Белки (г):</label>
      <input type="number" v-model.number="meal.protein" required />
    </div>

    <div>
      <label>Жиры (г):</label>
      <input type="number" v-model.number="meal.fat" required />
    </div>

    <div>
      <label>Углеводы (г):</label>
      <input type="number" v-model.number="meal.carbs" required />
    </div>

    <button type="submit">Добавить</button>
  </form>
</template>

<script>
export default {
  data() {
    return {
      meal: {
        name: '',
        calories: 0,
        protein: 0,
        fat: 0,
        carbs: 0,
      },
    };
  },
  methods: {
    addMeal() {
      if (this.meal.name && this.meal.calories > 0) {
        this.$emit('mealAdded', { ...this.meal });
        this.meal = { name: '', calories: 0, protein: 0, fat: 0, carbs: 0 };
      }
    },
  },
};
</script>
