<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Authentication page.
 *
 * Allows users to sign in, register, or recover a forgotten password.
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= $basePath ?>css/app.css">
    <title>Login</title>
</head>

<body>

<header>
    <nav>
        <ul>
            <li><a href="<?= $router->generate('landing') ?>">Home</a></li>
        </ul>
    </nav>
</header>
<main class="login-page">
    <div class="login-container">
        <h1 class="brand-name">RepForge</h1>
        <section class="login-box">
            <h2> Login</h2>
            <form action="<?= $router->generate('dashboard') ?>" method="get">
                <div class="form-group">
                    <label for="DisplayName">Display Name</label>
                    <input
                            type="text"
                            id="DisplayName"
                            name="DisplayName"
                            required
                    >
                    <label for="password">Password</label>
                    <input
                            type="password"
                            id="password"
                            name="password"
                            required
                    >
                </div>
                <button type="submit">Login</button>
            </form>
            <div class="login-links">
                <a href="#">Forgot Password?</a>
                <a href="#">Create Account</a>
            </div>
        </section>
    </div>
</main>

</body>
</html>


