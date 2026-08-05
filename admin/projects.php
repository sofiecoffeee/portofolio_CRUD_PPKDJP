<?php
session_start();
session_regenerate_id();

include "config/koneksi.php";
// show all data from users table
// from biggest to smallest
$query = mysqli_query($conn, "SELECT * FROM projects ORDER BY id DESC");
$rows = mysqli_fetch_all($query, MYSQLI_ASSOC);

//jika parameter/params delete ada
if (isset($_GET['delete'])) {
    $delete = $_GET['delete'];

    $img = mysqli_query($conn, "SELECT image FROM projects WHERE id='$delete'");
    $rowImg = mysqli_fetch_assoc($img); {
        $old_picture_path = "assets/img/" . $rowImg['image'];
        if (file_exists($old_picture_path)) {
            unlink($old_picture_path);
        }
    }

    $delete = mysqli_query($conn, "DELETE FROM projects WHERE id='$delete'");
    header("location:projects.php?hapus=berhasil");
}

// $name = $_SESSION['name'];
// if (!$name) { 
//   header("location:index.php");

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Projects - Admin Sofia Han</title>
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
                            <h3 class="fw-bold mb-3">Projects</h3>
                        </div>
                        <div class="ms-md-auto py-2 py-md-0">
                            <!-- <a href="#" class="btn btn-label-info btn-round me-2">Manage</a> -->
                            <a href="create-projects.php" class="btn btn-primary btn-round">Add Projects</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Title</th>
                                                <th>Subtitle</th>
                                                <th>Job Category</th>
                                                <th>Image</th>
                                                <th>Article URL</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <?php foreach ($rows as $index => $row): ?>
                                            <tr>
                                                <td><?php echo $index += 1 ?></td>
                                                <td> <img src="assets/img/<?php echo $row['image'] ?>" width="50" alt="">
                                                </td>

                                                <td><?php echo $row['title'] ?></td>
                                                <td><?php echo $row['job_category'] ?></td>
                                                <td><?php echo $row['image'] ?></td>
                                                <td><?php echo $row['article_url'] ?></td>

                                                <td>
                                                    <a class="btn btn-success btn-sm"
                                                        href="create-projects.php?edit=<?php echo $row['id'] ?>">Edit</a>
                                                    <a onclick="return confirm('Are you sure wanna delete this data?')"
                                                        class=" btn btn-danger btn-sm"
                                                        href="projects.php?delete=<?php echo $row['id'] ?>">Delete</a>
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php endforeach ?>
                                        </tbody>
                                    </table>
                                </div>
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