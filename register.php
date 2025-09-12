<?php
$currentPage = 'register';
include("includes/header.php");
?>

<!-- Trigger button (you can place this anywhere on your site) -->
<button class="btn btn-primary" onclick="openRegisterModal()">Sign Up</button>

<!-- Modal -->
<div id="registerModal" class="modal" style="display:none;">
  <div class="modal-content" style="max-width: 400px; margin: auto; padding: 20px; border-radius: 10px; background-color: white; position: relative;">
    <span class="close" onclick="closeRegisterModal()" style="position: absolute; top: 10px; right: 15px; font-size: 20px; cursor: pointer;">&times;</span>

    <h2>Sign Up</h2>

    <form id="signupForm">
      <label>First Name:</label><br>
      <input type="text" name="first_name" required><br><br>

      <label>Last Name:</label><br>
      <input type="text" name="last_name" required><br><br>

      <label>Email:</label><br>
      <input type="email" name="email" required><br><br>

      <label>Password:</label><br>
      <input type="password" name="password" required><br><br>

      <button type="submit" class="btn btn-success">Register</button>
    </form>

    <div id="result" style="margin-top: 15px;"></div>
    <p class="mt-3">Already have an account? <a href="signin.php">Sign In</a></p>
  </div>
</div>

<script>
  // Show modal
  function openRegisterModal() {
    document.getElementById('registerModal').style.display = 'block';
  }

  // Close modal
  function closeRegisterModal() {
    document.getElementById('registerModal').style.display = 'none';
    document.getElementById('result').innerHTML = '';
  }

  // AJAX form submission
  document.getElementById('signupForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const form = e.target;
    const formData = new FormData(form);

    const response = await fetch('signup.php', {
      method: 'POST',
      body: formData
    });

    const result = await response.json();
    const resultDiv = document.getElementById('result');

    if (result.success) {
      resultDiv.innerHTML = "<p style='color: green;'>✅ Registration successful! You can now <a href='signin.php'>log in</a>.</p>";
      form.reset();
    } else {
      resultDiv.innerHTML = "<p style='color: red;'>❌ " + result.errors.join("<br>") + "</p>";
    }
  });

  // Optional: Close modal if clicked outside
  window.onclick = function(event) {
    const modal = document.getElementById('registerModal');
    if (event.target === modal) {
      closeRegisterModal();
    }
  };
</script>

<!-- Optional: Add basic modal styling -->
<style>
  .modal {
    display: none;
    position: fixed;
    z-index: 1050;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.5);
    padding-top: 60px;
  }
</style>

<?php include("includes/footer.php"); ?>
