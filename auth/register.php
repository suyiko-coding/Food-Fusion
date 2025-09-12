<?php
session_start();
include('../includes/db.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'errors' => ['Invalid request method']]);
    exit;
}

function validateInput(string $firstName, string $lastName, string $email, string $password, mysqli $conn): array {
    $errors = [];

    if ($firstName === '' || $lastName === '' || $email === '' || $password === '') {
        $errors[] = "Please fill in all fields.";
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format.";
    }

    if (strlen($password) < 6) {
        $errors[] = "Password must be at least 6 characters.";
    }

    // Check for existing email
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    if (!$stmt) {
        $errors[] = "Database error: failed to prepare statement.";
        return $errors;
    }
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result && $result->num_rows > 0) {
        $errors[] = "Email already registered.";
    }
    $stmt->close();

    return $errors;
}

$firstName = trim($_POST['first_name'] ?? '');
$lastName  = trim($_POST['last_name'] ?? '');
$email     = trim($_POST['email'] ?? '');
$password  = $_POST['password'] ?? '';

$errors = validateInput($firstName, $lastName, $email, $password, $conn);

if (!empty($errors)) {
    echo json_encode(['success' => false, 'errors' => $errors]);
    exit;
}

// Insert new user
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

$insert = $conn->prepare("INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)");
if (!$insert) {
    echo json_encode(['success' => false, 'errors' => ['Database error: failed to prepare insert statement.']]);
    exit;
}
$insert->bind_param("ssss", $firstName, $lastName, $email, $hashedPassword);

if (!$insert->execute()) {
    echo json_encode(['success' => false, 'errors' => ['Failed to register user.']]);
    exit;
}

$insert->close();

$userId = $conn->insert_id;
$_SESSION['user_data'] = [
    'id' => $userId,
    'first_name' => $firstName,
    'last_name' => $lastName,
    'email' => $email
];

echo json_encode(['success' => true]);
exit;
