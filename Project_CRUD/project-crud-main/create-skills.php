<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";

$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$query = mysqli_query($conn, "SELECT * FROM my_skills WHERE id = '$id'");
$row = mysqli_fetch_assoc($query);

if (isset($_POST['save'])) {
    $skills = $_POST['skills'];
    $percentage = $_POST['percentage'];
    $id = $row['id'] ?? '';

    //query tambah data
    if ($id) {
        $update = mysqli_query($conn, "UPDATE my_skills SET skills='$skills', percentage='$percentage' WHERE id='$id'");
        header("location:skills.php?update-berhasil");
    } else {
        $insert = mysqli_query($conn, "INSERT INTO my_skills
        (skills, percentage) 
        VALUES 
        ('$skills', '$percentage')");
        header("location:skills.php?tambah-berhasil");
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Add Skills - Admin Sofia Han</title>
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
                                <?php echo isset($_GET['edit']) ? 'Edit Skills' : 'Add new skills' ?>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="" method="post">

                                        <div class="mb-3">
                                            <label for="" class="form-label">Skills</label>
                                            <input type="text" class="form-control" name="skills"
                                                placeholder="Add Skill" required
                                                value="<?php echo ($id) ? $row['skills'] : '' ?>">
                                        </div>


                                        <div class="mb-3">
                                            <label for="" class="form-label">Percentage</label>
                                            <input type="number" class="form-control" name="percentage"
                                                placeholder="Add percentage" required max="100"
                                                value=" <?php echo ($id) ? $row['percentage'] : '' ?>">
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

            </script>

            <?php
            include "inc/js.php";
            ?>
</body>

</html>