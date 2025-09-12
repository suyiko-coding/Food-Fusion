<?php
include("includes/db.php");

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo json_encode(['success' => false]);
    exit;
}

$id = intval($_GET['id']);

// Insert like
$stmt = $conn->prepare("INSERT INTO cookbook_likes (recipe_id) VALUES (?)");
$stmt->bind_param("i", $id);
$stmt->execute();

// Count updated likes
$result = $conn->query("SELECT COUNT(*) AS likes FROM cookbook_likes WHERE recipe_id = $id");
$row = $result->fetch_assoc();

echo json_encode(['success' => true, 'likes' => $row['likes']]);
