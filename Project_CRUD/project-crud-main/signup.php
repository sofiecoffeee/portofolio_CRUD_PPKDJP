<?php
// 1. Sertakan file koneksi
// -------------------------------------------------------------
require_once "config/koneksi.php";

// 2. Jalankan session
session_start();


// 3. Logika PHP untuk REGISTER / SIGN UP
// a. Inisialisasi awal harus KOSONG
$message = "";

// b. Cara cek kode di dalam ini HANYA berjalan jika tombol signup diklik
if (isset($_POST['signup'])) {
    $name  = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $pass  = $_POST['password'] ?? '';

    //Cek apakah ada field yang kosong
    if (empty($name) || empty($email) || empty($pass)) {
        $message = "All fields (Name, Email, Password) are required!";

        //Cek panjang password (hanya jika semua field sudah terisi)
    } elseif (strlen($pass) < 6) {
        $message = "Password must be at least 6 characters long.";

        //Jika lolos validasi input -> Cek email di database
    } else {
        $check_stmt = mysqli_prepare($conn, "SELECT id FROM users WHERE name = ? OR email = ?");
        mysqli_stmt_bind_param($check_stmt, "ss", $name, $email);
        mysqli_stmt_execute($check_stmt);
        mysqli_stmt_store_result($check_stmt);

        if (mysqli_stmt_num_rows($check_stmt) > 0) {
            $message = "This email is already registered. Please use another email.";
        } else {
            // c. Hash password & Insert ke Database
            $hashed_password = password_hash($pass, PASSWORD_DEFAULT);
            $insert_stmt = mysqli_prepare($conn, "INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
            mysqli_stmt_bind_param($insert_stmt, "sss", $name, $email, $hashed_password);

            if (mysqli_stmt_execute($insert_stmt)) {
                header("Location: index.php?status=success_register");
                exit(); // Wajib ada exit() setelah header redirect!
            } else {
                $message = "Registration failed due to a system error. Please try again.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Register - Pusat Dunia Admin</title>
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
            width: 80%;
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
            <div class="card-body p-4">
                <div class="text-center mb-3">
                    <class="mb-4 d-inline-block">
                        <span class=" ms-2"> <img src="assets/kaiadmin-lite-1.2.0/assets/img/logo_violet.png" width=100
                                alt="">
                        </span>
                        </class>
                        <h1 class="card-title mb-1 h5">Register for an account</h1>


                        <!-- Pesan Gagal Login (Teks Merah) -->
                        <?php if (!empty($message)): ?>
                            <div class="text-danger small mt-2 text-center">
                                <?= htmlspecialchars($message) ?>
                            </div>
                        <?php endif; ?>

                </div>

                <form method="POST" class="needs-validation mt-3" novalidate>

                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <input name="name" id="name" type="text" class="form-control" placeholder="Enter your full name"
                            required autofocus>
                        <div class="invalid-feedback">Please enter your name.</div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input name="email" id="email" type="email" class="form-control" placeholder="name@example.com"
                            required autofocus>
                        <div class="invalid-feedback">Please enter a valid email.</div>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label d-flex justify-content-between">
                            <span>Password</span>
                        </label>
                        <input name="password" id="password" type="password" class="form-control"
                            placeholder="At least 6 characters" minlength="6" required autofocus>
                        <div class="invalid-feedback">Please provide a password (min 6 characters).</div>
                    </div>
                    <button class="btn btn-primary w-100" type="submit" name="signup">Sign up</button>
                </form>

                <div class="text-center mt-3 small text-muted">
                    Already have an account? <a href="index.php" class="link-primary">Sign in</a>
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/inapp-1.0.0/src/assets/js/main.js" type="module"></script>

</body>

</html>