<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$query = mysqli_query($conn, "SELECT * FROM users ORDER BY id DESC");
$row = mysqli_fetch_assoc($query);


//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'] ? password_hash($_POST['password'], PASSWORD_DEFAULT) : $row['password'];
    // $pass = sha1($password);

    //biar emailnya nggak sama
    $checkEmail = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
    $showEmail = mysqli_fetch_assoc($checkEmail);
    if ($showEmail) {
        header("location:create-user.php?tambah=gagal");
    }

    //query tambah data
    if ($id) {
        //query update
        $update = mysqli_query($conn, "UPDATE users SET name='$name', email='$email', password='$password' WHERE id='$id'");
        header("location:user.php?update=berhasil");
    } else {
        $query = mysqli_query($conn, "SELECT * FROM users WHERE id='$id'");
        $row = mysqli_fetch_assoc($query);
    }
    $insert = mysqli_query($conn, "INSERT INTO users (name, email, password) VALUES ('$name', '$email','$password')");

    header("location:user.php?tambah=berhasil");
}

//query update password
// show all data from users table
// from biggest to smallest
// $name = $_SESSION['name'];
// if (!$name) {
//   header("location:index.php");
// }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Create Users - Admin Sofia Han</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
    <?php include "inc/css.php"; ?>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php include "inc/sidebar.php"; ?>
        <!-- End Sidebar -->

        <div class="main-panel">
            <div class="main-header">
                <div class="main-header-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img src="assets/kaiadmin-lite-1.2.0/assets/img/logo_white.png" alt="navbar brand"
                                class="navbar-brand" height="80" />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <!-- Navbar Header -->
                <?php include "inc/navbar.php"; ?>
                <!-- End Navbar -->
            </div>

            <div class="container">
                <div class="page-inner">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                        <div>
                            <h3 class="fw-bold mb-3">
                                <?php echo isset($_GET['edit']) ? 'Edit User' : 'Create New User' ?>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="" method="post">

                                        <?php if (isset($_GET['tambah']) && $_GET['tambah'] == 'gagal') { ?>
                                        <div class="alert alert-danger" role="alert">
                                            Email sudah terdaftar!
                                        </div>
                                        <?php } ?>

                                        <div class="mb-3">
                                            <label class="form-label">Name</label>
                                            <input type="text" class="form-control" name="name" placeholder="Enter name"
                                                required value="<?php echo isset($id) && $id ? $row['name'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="email" class="form-control" name="email"
                                                placeholder="Enter email" required
                                                value="<?php echo isset($id) && $id ? $row['email'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">
                                                <?php echo isset($id) && $id ?
                                                    'Password <small class="text-secondary"> (leave blank if you do not wish to change it) </small>'
                                                    : 'Password' ?>
                                            </label>
                                            <input type="password" class="form-control" name="password"
                                                placeholder="Enter password"
                                                <?php echo isset($id) && $id ? '' : 'required'; ?>>
                                        </div>

                                        <div class="mb-3">
                                            <button class="btn btn-primary" name="save" type="submit">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer></footer>
    </div> <!-- Penutup main-panel -->
    </div> <!-- Penutup wrapper -->

    <?php include "inc/js.php"; ?>
</body>

</html>