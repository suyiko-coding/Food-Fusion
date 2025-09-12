<?php

include("includes/db.php");
include("includes/header.php");

// ✅ Redirect if user is not logged in
if (!isset($_SESSION['user_data'])) {
    header("Location: signin.php");
    exit();
}

$user = $_SESSION['user_data'];

// Optional: fetch full user details from DB
$stmt = $conn->prepare("SELECT first_name, last_name, email, created_at FROM users WHERE id = ?");
$stmt->bind_param("i", $user['id']);
$stmt->execute();
$result = $stmt->get_result();
$userDetails = $result->fetch_assoc();
?>

<main class="container mt-5" style="max-width: 600px;">
    <h2 class="mb-4">👤 Your Profile</h2>

    <div class="card p-4 shadow-sm">
        <p><strong>Full Name:</strong> <?= htmlspecialchars($userDetails['first_name'] . ' ' . $userDetails['last_name']) ?></p>
        <p><strong>Email:</strong> <?= htmlspecialchars($userDetails['email']) ?></p>
        <p><strong>Member Since:</strong> <?= date('F j, Y', strtotime($userDetails['created_at'])) ?></p>

        <!-- Optional buttons -->
        <hr>
        <a href="#" class="btn btn-outline-primary btn-sm">Edit Profile</a>
        <a href="#" class="btn btn-outline-secondary btn-sm">Change Password</a>
    </div>
</main>

<?php include("includes/footer.php"); ?>
