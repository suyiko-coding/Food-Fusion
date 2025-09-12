<?php
session_start();
include("includes/db.php");

// Get form input with fallback to empty string
$name        = $_POST['name'] ?? '';
$description = $_POST['description'] ?? '';
$cuisine     = $_POST['cuisine_type'] ?? '';
$diet        = $_POST['dietary_preference'] ?? '';
$difficulty  = $_POST['difficulty'] ?? '';
$image       = $_POST['images'] ?? '';

// Check if all required fields are filled
if ($name && $description && $cuisine && $difficulty && $image) {
    $stmt = $conn->prepare("
        INSERT INTO recipes (name, description, cuisine_type, dietary_preference, difficulty, image)
        VALUES (?, ?, ?, ?, ?, ?)
    ");
    $stmt->bind_param("ssssss", $name, $description, $cuisine, $diet, $difficulty, $image);

    if ($stmt->execute()) {
        $_SESSION['message'] = "✅ Recipe submitted successfully!";
    } else {
        $_SESSION['message'] = "❌ Error: " . $stmt->error;
    }

    $stmt->close();
} else {
    $_SESSION['message'] = "⚠️ Please fill out all required fields.";
}

$conn->close();

// Redirect back to the cookbook page
header("Location: community_cookbook.php");
exit;
?>
