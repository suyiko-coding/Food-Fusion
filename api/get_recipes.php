<?php
include('../includes/db.php');


// Get filter parameters from the URL
$cuisine = $_GET['cuisine'] ?? '';
$diet = $_GET['diet'] ?? '';
$difficulty = $_GET['difficulty'] ?? '';

// Basic SQL query to fetch all recipes
$sql = "SELECT * FROM recipes WHERE 1=1";  // Default query (fetch all)

if ($cuisine != '') {
    $sql .= " AND cuisine_type = ?";
}
if ($diet != '') {
    $sql .= " AND dietary_preference = ?";
}
if ($difficulty != '') {
    $sql .= " AND difficulty = ?";
}

// Prepare the SQL statement
$stmt = $conn->prepare($sql);

// Bind parameters based on the filters
if ($cuisine && $diet && $difficulty) {
    $stmt->bind_param("sss", $cuisine, $diet, $difficulty);
} elseif ($cuisine && $diet) {
    $stmt->bind_param("ss", $cuisine, $diet);
} elseif ($cuisine && $difficulty) {
    $stmt->bind_param("ss", $cuisine, $difficulty);
} elseif ($diet && $difficulty) {
    $stmt->bind_param("ss", $diet, $difficulty);
} elseif ($cuisine) {
    $stmt->bind_param("s", $cuisine);
} elseif ($diet) {
    $stmt->bind_param("s", $diet);
} elseif ($difficulty) {
    $stmt->bind_param("s", $difficulty);
}

$stmt->execute();
$result = $stmt->get_result();

// Fetch the results
$recipes = [];
while ($row = $result->fetch_assoc()) {
    $recipes[] = $row;
}

// Return the recipes in JSON format
echo json_encode($recipes);
?>
