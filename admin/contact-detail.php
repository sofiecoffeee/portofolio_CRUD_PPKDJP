<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$query = mysqli_query($conn, "SELECT * FROM contacts WHERE id = $id");
$row = mysqli_fetch_assoc($query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Contact Detail - Admin Sofia Han</title>
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
                <div class="logo-header" data-background-color="dark">
                    <a href="dashboard.php" class="logo">
                        <img src="assets/kaiadmin-lite-1.2.0/assets/img/logo_white.png"
                            alt="logo"
                            class="navbar-brand"
                            height="80">
                    </a>
                </div>
            </div>

            <?php include "inc/navbar.php"; ?>

        </div>

        <div class="container">

            <div class="page-inner">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-bold">Contact Detail</h3>

                    <a href="contact.php" class="btn btn-secondary">
                        Back
                    </a>
                </div>

                <div class="card">

                    <div class="card-body">

                        <div class="row mb-3">

                            <div class="col-md-4">
                                <label class="form-label">Name</label>
                                <input type="text"
                                    class="form-control"
                                    readonly
                                    value="<?= $row['name']; ?>">
                            </div>

                            <div class="col-md-4">
                                <label class="form-label">Email</label>
                                <input type="text"
                                    class="form-control"
                                    readonly
                                    value="<?= $row['email']; ?>">
                            </div>

                            <div class="col-md-4">
                                <label class="form-label">Subject</label>
                                <input type="text"
                                    class="form-control"
                                    readonly
                                    value="<?= $row['subject']; ?>">
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-12">
                                <label class="form-label">Message</label>

                                <textarea
                                    class="form-control"
                                    rows="8"
                                    readonly><?= $row['message']; ?></textarea>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<?php include "inc/js.php"; ?>

</body>
</html>