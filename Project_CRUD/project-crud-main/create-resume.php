<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$query = mysqli_query($conn, "SELECT * FROM resume WHERE id = '$id'");
$row = mysqli_fetch_assoc($query);

//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $title = $_POST['title'];
    $subtitle = $_POST['subtitle'];
    $year_start = $_POST['year_start'];
    $year_end = $_POST['year_end'];
    $description = $_POST['description'];

    //query tambah data
    if ($id) {
        //query update
        $update = mysqli_query($conn, "UPDATE resume SET year_start='$year_start', year_end='$year_end', title='$title', subtitle='$subtitle', description='$description' WHERE id='$id'");
        header("location:resume.php?update-berhasil");
    } else {
        $insert = mysqli_query($conn, "INSERT INTO resume (year_start, year_end, title, subtitle, description) VALUES ('$year_start', '$year_end', '$title', '$subtitle', '$description')");
    }
    header("location:resume.php?tambah-berhasil");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Create Resume - Admin Sofia Han</title>
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
                                <?php echo isset($_GET['edit']) ? 'Edit Resume' : 'Create New Resume' ?>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="" method="post">

                                        <div class="mb-3">
                                            <label for="" class="form-label">Title</label>
                                            <input type="text" class="form-control" name="title"
                                                placeholder="Enter title" required
                                                value="<?php echo ($id) ? $row['title'] : '' ?>">
                                        </div>


                                        <div class="mb-3">
                                            <label for="" class="form-label">Subtitle</label>
                                            <input type="text" class="form-control" name="subtitle"
                                                placeholder="Enter subtitle" required
                                                value="<?php echo ($id) ? $row['subtitle'] : '' ?>">
                                        </div>


                                        <div class="mb-3">
                                            <label for="" class="form-label">Year Start</label>
                                            <select class="form-select" id="year_start" name="year_start">
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label">Year End</label>
                                            <select class="form-select" id="year_end" name="year_end">
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label fw-bold">Description</label>
                                            <textarea name="description" id=""
                                                class="form-control"><?php echo isset($id) && $id ? $row['description'] : '' ?></textarea>
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

            <footer>

            </footer>

            <!-- pake javascript untuk menampilkan tahun mulai dari 1901 sampai 2155 -->
            <script>
            //Start year
            document.addEventListener("DOMContentLoaded", function() {
                const year_start = document.getElementById(
                    "year_start");
                const year_old = 1901;
                const current_year = new Date().getFullYear();


                for (let year = current_year; year >= year_old; year--) {
                    const option = document.createElement("option");
                    option.value = year;
                    option.textContent = year;

                    year_start.appendChild(option);
                }


                //end year
                const year_end = document.getElementById(
                    "year_end");


                for (let year = current_year; year >= year_old; year--) {
                    const option = document.createElement("option");
                    option.value = year;
                    option.textContent = year;

                    year_end.appendChild(option);
                }
                year_start.value = <?php echo isset($id) && $id ? $row['year_start'] : 'current_year' ?>;
                year_end.value = <?php echo isset($id) && $id ? $row['year_end'] : 'current_year' ?>

            })
            </script>

            <?php
            include "inc/js.php";
            ?>
</body>

</html>