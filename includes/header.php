<?php
session_start();
if (!isset($currentPage)) {
    $currentPage = '';
}

function isLoggedIn() {
    return isset($_SESSION['user_data']) && !empty($_SESSION['user_data']);
}

function getUserData() {
    if (!isLoggedIn()) {
        return null;
    }

    return $_SESSION['user_data'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FoodFusion | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
    <link rel="icon" type="image/png" href="assets/images/favicon.png">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg custom-navbar shadow-sm">
  <div class="container">
    <a class="navbar-brand brand-sunset" href="index.php">
    <img src="assets/images/favicon.png"
         style="height: 40px; width: auto; margin-right: 8px;">
    FoodFusion
</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

        <li class="nav-item">
          <a class="nav-link custom-link <?php if ($currentPage === 'index') echo 'active'; ?>" href="index.php">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link custom-link <?php if ($currentPage === 'about') echo 'active'; ?>" href="about.php">About Us</a>
        </li>

        <li class="nav-item">
          <a class="nav-link custom-link <?php if ($currentPage === 'recipes') echo 'active'; ?>" href="recipes.php">Recipe Collection</a>
        </li>

        <li class="nav-item">
          <a class="nav-link custom-link <?php if ($currentPage === 'community') echo 'active'; ?>" href="community.php">Community Cookbook</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link custom-link dropdown-toggle <?php if ($currentPage === 'culinary' || $currentPage === 'educational') echo 'active'; ?>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Resources
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="culinary.php">Culinary</a></li>
            <li><a class="dropdown-item" href="educational.php">Educational</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link custom-link <?php if ($currentPage === 'contact') echo 'active'; ?>" href="contact.php">Contact Us</a>
        </li>

        <?php if (!isLoggedIn()): ?>
          <li class="nav-item">
            <a class="nav-link nav-link-login" href="signin.php">
              Sign In
            </a>
          </li>
        <?php else: ?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-link-login" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
             <i class="fa-solid fa-user-circle me-1"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
              <li><a class="dropdown-item" href="profile.php">Profile</a></li>
              <li><a class="dropdown-item" href="addtocookbook.php">Add to Cookbook</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="auth/logout.php">Logout</a></li>
            </ul>
          </li>
        <?php endif; ?>
      </ul>
    </div>
  </div>
</nav>

