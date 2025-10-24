<?php
$currentPage = 'index';
include("includes/header.php");
?>

<main class="mt-5">
    <?php if (!empty($_SESSION['message'])): ?>
        <div class="alert alert-success text-center">
            <?= htmlspecialchars($_SESSION['message']); ?>
        </div>
        <?php unset($_SESSION['message']); ?>
    <?php endif; ?>

    <!-- Mission Statement -->
    <section class="mission text-center mb-5">
        <h1 class="display-5 fw-bold">Welcome to FoodFusion</h1>
        <p class="lead mt-3">
            "Discover the joy of home cooking, explore global recipes, and connect with food lovers around the world.
            FoodFusion is your go-to place for inspiration, creativity, and culinary community."
        </p>
    </section>

    <!-- Join Us Modal Trigger -->
    <div class="text-center mb-5">
        <button id="join-us" class="btn btn-ff" data-bs-toggle="modal" data-bs-target="#joinModal">
            Join Us
        </button>
    </div>

    <!-- Join Us Modal -->
    <div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="registerForm" class="modal-content" action="index.php" method="post" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="joinModalLabel">Join FoodFusion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="registerErrors" class="alert alert-danger d-none" role="alert"></div>
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" name="first_name" class="form-control" id="firstName" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" name="last_name" class="form-control" id="lastName" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" name="email" class="form-control" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn ff-btn">Join</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Submit Recipe Modal -->
    <div class="modal fade" id="submitRecipeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <form class="modal-content" action="submit_recipe.php" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Share Your Recipe</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3"><label class="form-label">Recipe Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3"><label class="form-label">Short Description</label>
                        <textarea name="description" class="form-control" required></textarea>
                    </div>
                    <div class="mb-3"><label class="form-label">Cuisine Type</label>
                        <input type="text" name="cuisine_type" class="form-control" required>
                    </div>
                    <div class="mb-3"><label class="form-label">Dietary Preference</label>
                        <input type="text" name="dietary_preference" class="form-control">
                    </div>
                    <div class="mb-3"><label class="form-label">Difficulty</label>
                        <select name="difficulty" class="form-select" required>
                            <option value="">Select</option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                        </select>
                    </div>
                    <div class="mb-3"><label class="form-label">Image Filename</label>
                        <input type="text" name="images" class="form-control" required>
                        <div class="form-text">Upload the image to assets/images manually.</div>
                    </div>
                </div>
                <div class="modal-footer"><button type="submit" class="btn btn-primary">Submit Recipe</button></div>
            </form>
        </div>
    </div>

    <!-- News Feed -->
    <section class="mb-5">
        <h2 class="text-center mb-4">Featured Recipes & Culinary Trends</h2>
        <div class="row g-4">
            <div class="col-md-4"><div class="card h-100"><img src="assets/images/recipe1.jpg" class="card-img-top"><div class="card-body"><h5>Spicy Thai Noodles</h5><p>A flavorful dish packed with heat and herbs.</p></div></div></div>
            <div class="col-md-4"><div class="card h-100"><img src="assets/images/recipe2.jpg" class="card-img-top"><div class="card-body"><h5>Vegan Chickpea Curry</h5><p>Plant-based comfort food with bold spices.</p></div></div></div>
            <div class="col-md-4"><div class="card h-100"><img src="assets/images/recipe3.jpg" class="card-img-top"><div class="card-body"><h5>Rustic Apple Tart</h5><p>Homemade pastry with fresh apples.</p></div></div></div>
        </div>
    </section>

    <!-- Carousel -->
    <section class="mb-5">
        <h2 class="text-center mb-4">Upcoming Cooking Events</h2>
        <div id="eventsCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active"><img src="assets/images/E4.jpg" class="d-block w-100"><div class="carousel-caption"><h5>Live Italian Cooking Demo</h5></div></div>
                <div class="carousel-item"><img src="assets/images/E7.jpg" class="d-block w-100"><div class="carousel-caption"><h5>Zero-Waste Kitchen Tips</h5></div></div>
                <div class="carousel-item"><img src="assets/images/E6.jpg" class="d-block w-100"><div class="carousel-caption"><h5>Baking with Kids Workshop</h5></div></div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#eventsCarousel" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>
            <button class="carousel-control-next" type="button" data-bs-target="#eventsCarousel" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>
        </div>
    </section>

    <!-- Juicer -->
    <section class="mb-5">
        <iframe src="https://www.juicer.io/api/feeds/https-www-youtube-com-underatinroof-4c13bdba-91cf-484e-965a-929192d63889/iframe" frameborder="0" width="100%" height="600px"></iframe>
    </section>

    <!-- Cookie Consent Popup -->
<style>
#cookieConsent {
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
}
#cookieConsent.show {
    opacity: 1;
}
</style>

<div id="cookieConsent" class="position-fixed bottom-0 start-0 w-100 bg-dark text-white p-3 shadow"
     style="display:none; z-index:1050;">
    <div class="container d-flex justify-content-between align-items-center">
        <span>We use cookies to improve your experience. You can accept or reject them.</span>
        <div>
            <button id="acceptCookies" class="btn btn-success btn-sm me-2">Accept</button>
            <button id="rejectCookies" class="btn btn-danger btn-sm">Reject</button>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function(){
    const popup = document.getElementById("cookieConsent");
    if(!localStorage.getItem("cookieConsent")){
        popup.style.display = "block";
        setTimeout(() => popup.classList.add("show"), 10);
    }
    document.getElementById("acceptCookies").addEventListener("click", function(){
        localStorage.setItem("cookieConsent", "accepted");
        popup.classList.remove("show");
        setTimeout(() => popup.style.display = "none", 500);
    });
    document.getElementById("rejectCookies").addEventListener("click", function(){
        localStorage.setItem("cookieConsent", "rejected");
        popup.classList.remove("show");
        setTimeout(() => popup.style.display = "none", 500);
    });
});
</script>

</main>


<script>
document.querySelector('#registerForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const errorBox = document.getElementById('registerErrors');
    errorBox.classList.add('d-none');
    errorBox.innerHTML = '';
    try {
      const response = await fetch('auth/register.php', { method: 'POST', body: formData });
      if (!response.ok) throw new Error('Network error');
      const result = await response.json();
      if (result.success) {
        window.location.href = 'index.php';
      } else if (result.errors?.length) {
        result.errors.forEach(error => { const p = document.createElement('p'); p.textContent = error; errorBox.appendChild(p); });
        errorBox.classList.remove('d-none');
      } else {
        errorBox.textContent = 'Unknown error occurred.';
        errorBox.classList.remove('d-none');
      }
    } catch (error) {
      errorBox.textContent = 'Failed to submit: ' + error.message;
      errorBox.classList.remove('d-none');
    }
});

document.addEventListener('DOMContentLoaded', () => {
    setTimeout(() => {
        const joinModal = new bootstrap.Modal(document.getElementById('joinModal'));
        joinModal.show();
    }, 1500);
});
</script>

<?php include("includes/footer.php"); ?>
