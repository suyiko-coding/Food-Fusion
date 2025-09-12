<?php
if (!isset($currentPage)) {
    $currentPage = 'contact';
}
?>
<?php include('includes/header.php'); ?>
<?php include('includes/db.php'); ?>

<main class="container py-5">
  <h2 class="text-center mb-4">Contact Us</h2>

  <?php
  $name = $email = $message = '';
  $errors = [];

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Sanitize input
      $name = trim($_POST["name"]);
      $email = trim($_POST["email"]);
      $message = trim($_POST["message"]);

      // Validate input
      if (empty($name)) {
          $errors[] = "Name is required.";
      }

      if (empty($email)) {
          $errors[] = "Email is required.";
      } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
          $errors[] = "Invalid email format.";
      }

      if (empty($message)) {
          $errors[] = "Message is required.";
      }

      // If no errors, insert into database
      if (empty($errors)) {
          $stmt = $conn->prepare("INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)");
          $stmt->bind_param("sss", $name, $email, $message);

          if ($stmt->execute()) {
              echo '<div class="alert alert-success">Thank you! Your message has been sent.</div>';
              $name = $email = $message = ''; // Clear form fields
          } else {
              echo '<div class="alert alert-danger">Error saving your message. Please try again later.</div>';
          }

          $stmt->close();
      } else {
          echo '<div class="alert alert-danger"><ul>';
          foreach ($errors as $error) {
              echo "<li>" . htmlspecialchars($error) . "</li>";
          }
          echo '</ul></div>';
      }
  }
  ?>

  <form method="post" action="">
    <div class="mb-3">
      <label for="name" class="form-label">Your Name</label>
      <input type="text" name="name" class="form-control" id="name" value="<?php echo htmlspecialchars($name); ?>" required>
    </div>

    <div class="mb-3">
      <label for="email" class="form-label">Your Email</label>
      <input type="email" name="email" class="form-control" id="email" value="<?php echo htmlspecialchars($email); ?>" required>
    </div>

    <div class="mb-3">
      <label for="message" class="form-label">Your Message</label>
      <textarea name="message" class="form-control" id="message" rows="5" required><?php echo htmlspecialchars($message); ?></textarea>
    </div>

    <button type="submit" class="ea7933">Send Message</button>
  </form>
</main>

<?php include('includes/footer.php'); ?>

