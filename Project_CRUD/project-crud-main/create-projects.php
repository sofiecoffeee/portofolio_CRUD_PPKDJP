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
$query = mysqli_query($conn, "SELECT, p.id, p.title, p.job_category, p.image, jc.name_category FROM projects p
    JOIN job_category jc ON p.job_category = jc.id WHERE p.id = '$id'
");
$row = mysqli_fetch_assoc($query);

//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $title = $_POST['title'];
    $job_category = $_POST['job_category'];

    //Simpen gambar tanpa copy copy gambarnya
    $image = $_FILES['image']['name'];
    $tmp = $_FILES['image']['tmp_name'];

    move_uploaded_file($tmp, "img/" . $image);

    mysqli_query($conn, "INSERT INTO projects(title, job_category_id, image)
        VALUES('$title','$job_category','$image')
    ");

    if ($id) {
        if (isset($_POST['update'])) {

            // cek apakah upload gambar baru
            if ($_FILES['image']['name'] != "") {
                $image = $_FILES['image']['name'];
                $tmp = $_FILES['image']['tmp_name'];

                move_uploaded_file(
                    $tmp,
                    "images/" . $image
                );

                $update = mysqli_query($conn, " UPDATE projects SET title='$title' job_category='$job_category', image='$image'WHERE id='$id'");
            } else {
                $insert = mysqli_query($conn, " UPDATE projects SET title='$title' job_category='$job_category 'WHERE id='$id'");
            }
        } else {
            // kalau tidak upload gambar
            $update = mysqli_query($conn, " UPDATE projects SET title='$title', job_category='$job_category' WHERE id='$id' VALUES ($'$title', $job_category");
            header("location: project.php=tambah-berhasil");
        }
    } else {
        $insert = mysqli_query($conn, " UPDATE projects SET title='$title' job_category='$job_category', WHERE id='$id'");
    }
}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Create Projects - Admin Sofia Han</title>
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
                                <?php echo isset($_GET['edit']) ? 'Edit Projects' : 'Create Projects' ?>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="" method="post" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Title</label>
                                            <input type="text" class="form-control" name="title"
                                                placeholder="Enter title" required
                                                value="<?php echo ($id) ? $row['title'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Job Category</label>
                                            <?php $job_category = mysqli_query($conn, "SELECT * FROM job_category"); ?>

                                            <select name="job_category_id" class="form-control" required>
                                                <option value="">-- Pilih Category --</option>
                                                <?php while ($cat = mysqli_fetch_assoc($job_category)) { ?>
                                                    <option value="<?= $cat['id']; ?>"
                                                        <?php
                                                        if ($id && $row['job_category'] == $cat['id']) {
                                                            echo "selected";
                                                        }
                                                        ?>>
                                                        <?= $cat['name_category']; ?>
                                                    </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Thumbnail</label>
                                            <input type="file" class="form-control" name="thumbnail"
                                                placeholder="Enter Image"
                                                value="<?php echo ($id) ? $row['thumbnail'] : '' ?>">
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