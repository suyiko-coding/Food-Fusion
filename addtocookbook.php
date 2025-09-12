<?php
ob_start();
include("includes/header.php");
include("includes/db.php");

if (!isset($_SESSION['user_data'])) {
  header("Location: signin.php");
  exit();
}

$user_id = $_SESSION['user_data']['id'];
$errorMsg = '';


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $title = trim($_POST['title'] ?? '');
  $description = trim($_POST['description'] ?? '');
  $imageName = '';

  if ($title === '' || $description === '') {
    $errorMsg = '⚠️ Please fill in all required fields.';
  } else {
    // Handle file upload if provided
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
      $uploadDir = 'uploads/';
      $originalName = basename($_FILES['image']['name']);
      $imageName = time() . '_' . $originalName;
      $uploadPath = $uploadDir . $imageName;

      if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
      }

      move_uploaded_file($_FILES['image']['tmp_name'], $uploadPath);
    }

    // Insert into the database using MySQLi
    $stmt = $conn->prepare("INSERT INTO cookbook (user_id, title, description, image) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isss", $user_id, $title, $description, $imageName);

    if ($stmt->execute()) {
      header("Location: community.php");
      exit();
    } else {
      $errorMsg = "❌ Failed to add recipe. Please try again.";
    }
  }
}
?>

<main id="cookbook" class="container mt-5" style="max-width: 600px;">
  <h2>Cookbook</h2>

  <?php if ($errorMsg): ?>
    <div class="alert alert-danger"><?= htmlspecialchars($errorMsg) ?></div>
  
  <?php endif; ?>

  <form method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="title" class="form-label">Title:</label>
      <input type="text" id="title" name="title" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="description" class="form-label">Description:</label>
      <textarea id="description" name="description" class="form-control" rows="4" required></textarea>
    </div>

    <div class="mb-3">
      <label for="image" class="form-label">Image:</label>
      <input type="file" id="image" name="image" class="form-control">
    </div>

    <button type="submit" class="btn ff-btn">Submit</button>
  </form>
</main>

<?php include("includes/footer.php"); ?>
