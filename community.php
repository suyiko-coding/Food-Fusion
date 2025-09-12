<?php
$currentPage = 'community';
include("includes/header.php");
include("includes/db.php");

$sql = 'SELECT cookbook.id,
               CONCAT(first_name, " ", last_name) AS full_name,
               title, description, image, cookbook.created_at,
               COUNT(cookbook_likes.id) AS likes_count
        FROM cookbook
        JOIN users ON cookbook.user_id = users.id
        LEFT JOIN cookbook_likes ON cookbook.id = cookbook_likes.recipe_id
        GROUP BY cookbook.id, full_name, title, description, image, cookbook.created_at
        ORDER BY cookbook.created_at DESC';

$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();

$recipes = [];
while ($row = $result->fetch_assoc()) {
    $recipes[] = $row;
}
?>

<main class="mt-5">
  <section class="text-center mb-4">
    <h1 class="display-6">Community Cookbook</h1>
    <p class="lead">Discover what our FoodFusion community is cooking and sharing from around the world!</p>
  </section>

  <div class="row" id="community">
    <?php foreach($recipes as $recipe): ?>
      <div class="col-md-6 col-lg-4 mb-4">
        <a href="detail.php?id=<?php echo $recipe['id'] ?>" class="text-decoration-none text-dark">
          <div class="card h-100 shadow-sm recipe-card">
            <?php if (!empty($recipe['image'])): ?>
              <img src="uploads/<?php echo htmlspecialchars($recipe['image']) ?>" class="card-img-top" alt="<?php echo htmlspecialchars($recipe['title']) ?>">
            <?php else: ?>
              <img src="images/default-recipe.jpg" class="card-img-top" alt="Default Recipe Image">
            <?php endif; ?>
            <div class="card-body">
              <h5 class="card-title"><?php echo htmlspecialchars($recipe['title']) ?></h5>
              <p class="card-text"><?php echo nl2br(htmlspecialchars($recipe['description'])) ?></p>
            </div>
            <div class="card-footer bg-white d-flex justify-content-between align-items-center">
              <small class="text-muted">
                Posted by <?php echo htmlspecialchars($recipe['full_name']) ?>
                on <?php echo date('F j, Y', strtotime($recipe['created_at'])) ?>
              </small>
              <small class="text-muted">
                <?php echo (int)$recipe['likes_count'] ?> <?php echo ((int)$recipe['likes_count'] === 1) ? 'Like' : 'Likes' ?>
              </small>
            </div>
          </div>
        </a>
      </div>
    <?php endforeach; ?>
  </div>
</main>

<style>
.recipe-card {
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.recipe-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}
</style>

<?php include("includes/footer.php"); ?>
 