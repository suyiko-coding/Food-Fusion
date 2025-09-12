<?php
if (!isset($currentPage)) {
    $currentPage = 'recipes';
}
?>
<?php include('includes/header.php'); ?>
<?php include('includes/db.php'); ?>

<main class="container py-5">
  <h2 class="text-center mb-4">Recipe Collection</h2>

  <!-- Filter Section -->
  <div class="row g-3 mb-4">
    <div class="col-md-4">
      <label for="cuisine" class="form-label">Cuisine Type</label>
      <select class="form-select" id="cuisine">
        <option value="">All Cuisines</option>
        <option value="Italian">Italian</option>
        <option value="Indian">Indian</option>
        <option value="Mexican">Mexican</option>
        <option value="Chinese">Chinese</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="diet" class="form-label">Dietary Preference</label>
      <select class="form-select" id="diet">
        <option value="">All Preferences</option>
        <option value="Vegan">Vegan</option>
        <option value="Gluten-Free">Gluten-Free</option>
        <option value="Vegetarian">Vegetarian</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="difficulty" class="form-label">Difficulty</label>
      <select class="form-select" id="difficulty">
        <option value="">All Levels</option>
        <option value="Easy">Easy</option>
        <option value="Medium">Medium</option>
        <option value="Hard">Hard</option>
      </select>
    </div>
  </div>

  <!-- Recipes Grid -->
  <div id="recipeCollection" class="row g-4">
    <!-- Recipe cards will be injected here by JS -->
  </div>
</main>

<!-- JS Script for loading recipes -->
<script>
  function fetchRecipes() {
    const cuisine = document.getElementById('cuisine').value;
    const diet = document.getElementById('diet').value;
    const difficulty = document.getElementById('difficulty').value;

    const url = `api/get_recipes.php?cuisine=${cuisine}&diet=${diet}&difficulty=${difficulty}`;

    fetch(url)
      .then(res => res.json())
      .then(data => {
        const container = document.getElementById('recipeCollection');
        container.innerHTML = '';

        if (data.length === 0) {
          container.innerHTML = '<p class="text-muted text-center">No recipes found.</p>';
          return;
        }

        data.forEach(recipe => {
          const card = `
            <div class="col-md-3">
              <div class="card h-100">
                <img src="assets/images/${recipe.image}" class="card-img-top" alt="${recipe.name}">
                <div class="card-body">
                  <h5 class="card-title">${recipe.name}</h5>
                  <p class="card-text">${recipe.description}</p>
                </div>
              </div>
            </div>
          `;
          container.innerHTML += card;
        });
      })
      .catch(err => {
        console.error('Error loading recipes:', err);
      });
  }

  // Fetch recipes on page load
  window.addEventListener('DOMContentLoaded', fetchRecipes);

  // Fetch again on filter change
  ['cuisine', 'diet', 'difficulty'].forEach(id => {
    document.getElementById(id).addEventListener('change', fetchRecipes);
  });
</script>

<?php include('includes/footer.php'); ?>
