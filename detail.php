<?php
$currentPage = 'community';
include("includes/header.php");
include("includes/db.php");

// Validate and get recipe ID
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "<div class='container mt-5'><div class='alert alert-danger'>Invalid recipe ID.</div></div>";
    include("includes/footer.php");
    exit;
}

$id = intval($_GET['id']);

// First, check if cookbook_likes table exists
$tableExists = false;
$checkTable = $conn->query("SHOW TABLES LIKE 'cookbook_likes'");
if ($checkTable && $checkTable->num_rows > 0) {
    $tableExists = true;
}

// Build SQL query
if ($tableExists) {
    $sql = 'SELECT cookbook.id, CONCAT(first_name, " ", last_name) AS full_name, 
                   title, description, image, cookbook.created_at, 
                   (SELECT COUNT(*) FROM cookbook_likes WHERE recipe_id = cookbook.id) AS likes
            FROM cookbook
            JOIN users ON cookbook.user_id = users.id
            WHERE cookbook.id = ?';
} else {
    $sql = 'SELECT cookbook.id, CONCAT(first_name, " ", last_name) AS full_name, 
                   title, description, image, cookbook.created_at, 0 AS likes
            FROM cookbook
            JOIN users ON cookbook.user_id = users.id
            WHERE cookbook.id = ?';
}

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "<div class='container mt-5'><div class='alert alert-warning'>Recipe not found.</div></div>";
    include("includes/footer.php");
    exit;
}

$recipe = $result->fetch_assoc();
?>

<main class="container mt-5" style="max-width: 800px;">

    <!-- Title -->
    <h2 style="color: #6a0dad; text-align:center; border-bottom: 2px solid #6a0dad; padding-bottom: 5px;">
        <?= htmlspecialchars($recipe['title']) ?>
    </h2>

    <!-- Image -->
    <div class="text-center mt-4">
        <?php if (!empty($recipe['image'])): ?>
            <img src="uploads/<?= htmlspecialchars($recipe['image']) ?>" 
                 alt="<?= htmlspecialchars($recipe['title']) ?>" 
                 style="max-width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        <?php else: ?>
            <img src="images/default-recipe.jpg" 
                 alt="Default Recipe" 
                 style="max-width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        <?php endif; ?>
    </div>

    <!-- Author & Date -->
    <p class="text-muted mt-3" style="font-style: italic; text-align: center;">
        Shared by <?= htmlspecialchars($recipe['full_name']) ?> 
        on <?= date('d/m/Y', strtotime($recipe['created_at'])) ?>
    </p>

    <!-- Description -->
    <p style="margin-top: 20px; line-height: 1.6; text-align: justify;">
        <?= nl2br(htmlspecialchars($recipe['description'])) ?>
    </p>

    <!-- Like Button (only if table exists) -->
    <?php if ($tableExists): ?>
    <div class="mt-4 text-center">
        <button class="btn btn-outline-danger" id="likeBtn">
            ❤️ Like
        </button>
        <span id="likeCount"><?= $recipe['likes'] ?></span>
    </div>
    <?php endif; ?>

    <!-- Back Button -->
    <div class="text-center mt-4">
        <a href="community.php" class="btn btn-secondary">← Back to Community Cookbook</a>
    </div>

</main>

<?php if ($tableExists): ?>
<script>
// Handle like button click (AJAX)
document.getElementById('likeBtn').addEventListener('click', function() {
    fetch('like.php?id=<?= $recipe['id'] ?>')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('likeCount').textContent = data.likes;
            }
        });
});
</script>
<?php endif; ?>

<?php include("includes/footer.php"); ?>
