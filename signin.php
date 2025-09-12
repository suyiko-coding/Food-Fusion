<?php
ob_start();
include("includes/header.php");
include('includes/db.php');

$errorMsg = '';
$successMsg = '';

// ✅ Handle Reset Password
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reset_email'])) {
    $resetEmail = trim($_POST['reset_email']);
    $newPassword = $_POST['reset_password'] ?? '';

    if ($resetEmail === '' || $newPassword === '') {
        $errorMsg = "⚠️ Please fill in both fields.";
    } else {
        $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->bind_param("s", $resetEmail);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($user = $result->fetch_assoc()) {
            $hashedNewPassword = password_hash($newPassword, PASSWORD_DEFAULT);
            $update = $conn->prepare("UPDATE users SET password = ?, failed_attempts = 0, lockout_time = NULL WHERE email = ?");
            $update->bind_param("ss", $hashedNewPassword, $resetEmail);
            $update->execute();
            $successMsg = "✅ Password reset successful. You can now sign in.";
        } else {
            $errorMsg = "❌ Email not found.";
        }
    }
}

// ✅ Sign-in logic
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email']) && !isset($_POST['reset_email'])) {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email === '' || $password === '') {
        $errorMsg = "⚠️ Please fill in all fields.";
    } else {
        $sql = "SELECT id, password, failed_attempts, lockout_time FROM users WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if (!$user = $result->fetch_assoc()) {
            $errorMsg = "❌ Email not found.";
        } else {
            $userId = $user['id'];
            $hashedPassword = $user['password'];
            $failedAttempts = (int)$user['failed_attempts'];
            $lockoutTime = $user['lockout_time'] ? new DateTime($user['lockout_time']) : null;
            $now = new DateTime();

            if ($lockoutTime && $now < $lockoutTime) {
                $remaining = $now->diff($lockoutTime);
                $minutes = $remaining->i;
                $seconds = $remaining->s;
                $errorMsg = "🔒 Account locked. Try again in {$minutes}m {$seconds}s.";
            } elseif (password_verify($password, $hashedPassword)) {
                $resetSql = "UPDATE users SET failed_attempts = 0, lockout_time = NULL WHERE id = ?";
                $resetStmt = $conn->prepare($resetSql);
                $resetStmt->bind_param("i", $userId);
                $resetStmt->execute();

                $_SESSION['user_data'] = $user;
                header("Location: index.php");
                exit();
            } else {
                $failedAttempts++;
                if ($failedAttempts >= 3) {
                    $lockoutUntil = (new DateTime())->add(new DateInterval('PT3M'))->format('Y-m-d H:i:s');
                    $updateSql = "UPDATE users SET failed_attempts = ?, lockout_time = ? WHERE id = ?";
                    $updateStmt = $conn->prepare($updateSql);
                    $updateStmt->bind_param("isi", $failedAttempts, $lockoutUntil, $userId);
                } else {
                    $updateSql = "UPDATE users SET failed_attempts = ? WHERE id = ?";
                    $updateStmt = $conn->prepare($updateSql);
                    $updateStmt->bind_param("ii", $failedAttempts, $userId);
                }
                $updateStmt->execute();

                $errorMsg = "❌ Invalid credentials. Attempt $failedAttempts of 3.";
            }
        }
    }
}
?>

<main class="container mt-5" style="max-width: 400px;">
  <h2 class="mb-4">Sign In</h2>

  <?php if ($errorMsg): ?>
    <div class="alert alert-danger"><?= htmlspecialchars($errorMsg) ?></div>
  <?php elseif ($successMsg): ?>
    <div class="alert alert-success"><?= htmlspecialchars($successMsg) ?></div>
  <?php endif; ?>

  <form method="POST" action="signin.php" id="loginForm">
    <div class="mb-3">
      <label for="email" class="form-label">Email address</label>
      <input type="email" class="form-control" id="email" name="email" required value="<?= htmlspecialchars($_POST['email'] ?? '') ?>">
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <button type="submit" class="btn ff-btn w-100">Sign In</button>

    <p class="text-center mt-3">
      <a href="#" onclick="showResetForm()">Forgot your password?</a>
    </p>
  </form>

  <!-- ✅ Reset Password Form (hidden by default) -->
  <form method="POST" action="signin.php" id="resetForm" style="display: none;">
    <h4 class="mb-3">Reset Your Password</h4>
    <div class="mb-3">
      <label>Email:</label>
      <input type="email" name="reset_email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>New Password:</label>
      <input type="password" name="reset_password" class="form-control" required>
    </div>
    <button type="submit" class="btn ff-btn w-100">Reset Password</button>
    <p class="text-center mt-3"><a href="#" onclick="hideResetForm()">Back to Login</a></p>
  </form>

  <p class="mt-3 text-center">
    Don't have an account? <a href="#" onclick="openRegisterModal()">Sign Up</a>
  </p>
</main>

<!-- ✅ Register Modal -->
<div id="registerModal" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign Up</h5>
        <button type="button" class="btn-close" onclick="closeRegisterModal()" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="signupForm">
          <div class="mb-3">
            <label for="first_name" class="form-label">First Name</label>
            <input type="text" class="form-control" id="first_name" name="first_name" required>
          </div>
          <div class="mb-3">
            <label for="last_name" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="last_name" name="last_name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <button type="submit" class="btn ff-btn">Register</button>
        </form>
        <div id="result" class="mt-3"></div>
      </div>
    </div>
  </div>
</div>

<!-- ✅ JavaScript -->
<script>
  function openRegisterModal() {
    document.getElementById('registerModal').style.display = 'block';
  }

  function closeRegisterModal() {
    document.getElementById('registerModal').style.display = 'none';
    document.getElementById('result').innerHTML = '';
  }

  function showResetForm() {
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('resetForm').style.display = 'block';
  }

  function hideResetForm() {
    document.getElementById('resetForm').style.display = 'none';
    document.getElementById('loginForm').style.display = 'block';
  }

  document.getElementById('signupForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const formData = new FormData(this);

    try {
      const response = await fetch('auth/register.php', {
        method: 'POST',
        body: formData
      });
      const result = await response.json();
      const resultDiv = document.getElementById('result');

      if (result.success) {
        location.href = 'index.php';
      } else {
        resultDiv.innerHTML = "<p style='color: red;'>❌ " + result.errors.join("<br>") + "</p>";
      }
    } catch (error) {
      document.getElementById('result').innerHTML = "<p style='color: red;'>❌ Server error.</p>";
    }
  });

  window.onclick = function(event) {
    const modal = document.getElementById('registerModal');
    if (event.target === modal) {
      closeRegisterModal();
    }
  };
</script>

<style>
  .modal {
    display: none;
    position: fixed;
    z-index: 1050;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    padding-top: 60px;
  }
  .modal-content {
    max-width: 400px;
    margin: auto;
    padding: 20px;
    border-radius: 10px;
    background-color: white;
    position: relative;
  }
  .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    cursor: pointer;
  }
</style>

<?php include("includes/footer.php"); ?>
