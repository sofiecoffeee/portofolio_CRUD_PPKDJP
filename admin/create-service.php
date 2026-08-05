<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";

// //pake fetch all di save (create data) untuk create data karena nampilin semua data, 
// $id = isset($_GET['save']) ? $_GET['save'] : '';
// $query = mysqli_query($conn, "SELECT * FROM sliders ORDER BY id DESC");
// $row = mysqli_fetch_all($query, MYSQLI_ASSOC);

//pake mysqli_fetch_assoc (query); untuk edit data karena dia cuma nampilin 1 data
$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$query = mysqli_query($conn, "SELECT * FROM service WHERE id = '$id'");
$row = mysqli_fetch_assoc($query);


//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $service_name = $_POST['service_name'];
    $icon = $_POST['icon'];
    $id = $row['id'] ?? '';

    //query tambah data
    if ($id) {
        $update = mysqli_query($conn, "UPDATE service SET service_name='$service_name', icon='$icon' WHERE id='$id'");
        header("location:service.php?update-berhasil");
    } else {
        $insert = mysqli_query($conn, "INSERT INTO service
        (service_name, icon) 
        VALUES 
        ('$service_name', '$icon')");
        header("location:service.php?tambah=berhasil");
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Create Service - Admin Sofia Han</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
    <?php
    include "inc/css.php";
    ?>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php
        include "inc/sidebar.php";
        ?>
        <!-- End Sidebar -->

        <div class="main-panel">
            <div class="main-header">
                <div class="main-header-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="dashboard.html" class="logo">
                            <img src="assets/kaiadmin-lite-1.2.0/assets/img/logo_white.png" alt="navbar brand"
                                class="navbar-brand" height="80">
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
                <?php
                include "inc/navbar.php";
                ?>
                <!-- End Navbar -->
            </div>

            <div class="container">
                <div class="page-inner">
                    <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                        <div>
                            <h3 class="fw-bold mb-3">
                                <?php echo isset($_GET['edit']) ? 'Edit Service' : 'Create Service' ?>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="" method="post">

                                        <div class="mb-3">
                                            <label for="" class="form-label">Service Name</label>
                                            <input type="text" class="form-control" name="service_name"
                                                placeholder="Enter service" required
                                                value="<?php echo ($id) ? $row['service_name'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label">Icons</label>
                                            <input type="text" class="form-control" name="icon"
                                                placeholder="Insert Icon" required
                                                value="<?php echo ($id) ? $row['icon'] : '' ?>">
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


                <footer></footer>

                <?php
                include "inc/js.php";
                ?>
</body>

</html>