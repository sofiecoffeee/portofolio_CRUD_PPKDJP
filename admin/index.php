<?php
// 1. Sertakan file koneksi
// -------------------------------------------------------------
require_once "config/koneksi.php";

// 2. Jalankan session
session_start();


//2. logic php untuk login
// -------------------------------------------------------------

if (isset($_POST['login'])) {
    $email = trim($_POST['email'] ?? '');
    $pass  = $_POST['password'] ?? '';

    if (empty($email) || empty($pass)) {
        $message = "All fields (Email, Password) are required!";
    } else {
        // Gunakan Prepared Statement untuk keamanan dari SQL Injection        
        // Cek apakah user ditemukan DAN password cocok
        // Catatan: Jika password di database sudah di-hash, gunakan: password_verify($pass, $row['password'])
        // if ($row && password_verify($pass, $row['password'])) {
        // mysqli_fetch_all($login, MYSQLI_ASSOC);
        // var_dump($row);
        $stmt = mysqli_prepare($conn, "SELECT * FROM users WHERE email = ?");
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);

        $result = mysqli_stmt_get_result($stmt);
        $row    = mysqli_fetch_assoc($result);

        // Cek apakah user ditemukan DAN password cocok
        if ($row && password_verify($pass, $row['password'])) {
            $_SESSION['NAME'] = $row['name'];

            // KALAU BERHASIL MASUK KE DASHBOARD
            header("location:dashboard.php");
            exit();
        } else {
            $message = "Login failed! Please check your email and password.";
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Signin- Admin Sofia Han</title>
    <style>
    /* 1. Body dibuat full tinggi layar (100vh) dan posisinya di-center sempurna */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
    }

    /* 2. Kartu / Box Login tetap dipertahankan style-nya */
    .card {
        background: white;
        padding: 20px;
        border-radius: 8px;
        width: 100%;
        max-width: 420px;
        /* Ukuran pas untuk form login */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* 3. Elemen pendukung lainnya */
    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .toggle-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
    }

    .toggle-link a {
        color: #007bff;
        text-decoration: none;
        cursor: pointer;
    }

    .alert {
        background-color: #ffdddd;
        color: #a00000;
        padding: 10px;
        border-radius: 4px;
        margin-bottom: 15px;
        text-align: center;
    }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" sizes="180x180"
        href="assets/inapp-1.0.0/src/assets/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32"
        href="assets/inapp-1.0.0/src/assets/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16"
        href="assets/inapp-1.0.0/src/assets/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="assets/inapp-1.0.0/src/assets/images/favicon_io/site.webmanifest">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

</head>

<body>


    <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="card " style="max-width:420px; width:100%;">
            <div class="card-body p-5">
                <div class="text-center mb-3">
                    <class="mb-4 d-inline-block">
                        <span class=" ms-2"> <img src="assets/kaiadmin-lite-1.2.0/assets/img/logo_violet.png" width=100
                                alt=""></span>
                        </class=>
                        <h1 class="card-title mb-1 h5">Sign in to your account</h1>

                        <?php if (isset($_GET['status']) && $_GET['status'] === 'success_register'): ?>
                        <div class="text-success small mt-2 text-center">
                            Registration successful! Please sign in.
                        </div>
                        <?php endif; ?>

                        <!-- Teks Error Merah Tanpa Box -->
                        <?php if (!empty($message)): ?>
                        <div class="text-danger mt-2 text-center">
                            <?= htmlspecialchars($message) ?>
                        </div>
                        <?php endif; ?>
                </div>

                <form method="POST" class="needs-validation mt-3" novalidate>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input name="email" id="email" type="email" class="form-control" placeholder="name@example.com"
                            required autofocus>
                        <div class="invalid-feedback">Please enter a valid email.</div>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label d-flex justify-content-between">
                            <span>Password</span>
                            <a href="#" class="small link-primary">Forgot Password?</a>
                        </label>
                        <input name="password" id="password" type="password" class="form-control" placeholder="Password"
                            minlength="6" required autofocus>
                        <div class="invalid-feedback">Please provide a password (min 6 characters).</div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="form-check">
                            <input id="remember" class="form-check-input" type="checkbox">
                            <label class="form-check-label small" for="remember">Remember me</label>
                        </div>
                    </div>

                    <button class="btn btn-primary w-100" type="submit" name="login">Sign in</button>
                </form>

                <div class="text-center mt-3 small text-muted">
                    Don't have an account? <a href="signup.php" class="link-primary">Sign up</a>
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/inapp-1.0.0/src/assets/js/main.js" type="module"></script>

</body>

</html>