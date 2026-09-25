<?php

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
    <link rel="stylesheet" href="css/app.css">
    <title>Login</title>
</head>

<body>

<header>
    <nav>
        <ul>
            <li><a href="/repforge/landing">Home</a></li>
        </ul>
    </nav>
</header>
<main>
    <h1> Login</h1>
    <form action="/repforge/dashboard" method="get">
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
        <button type="submit">Login</button>
    </form>
</main>
</body>
</html>


