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
$query = mysqli_query($conn, "SELECT * FROM projects WHERE id = '$id'");
$row = mysqli_fetch_assoc($query);


//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $title = $_POST['title'];
    $article_url = $_POST['article_url'];
    $thumbnail = $_FILES['thumbnail'];
    $excerpt = $_POST['excerpt'];
    $published_at = $_POST['published_at'];
    $is_active = $_POST['is_active'];

    $id = $row['id'] ?? '';

    //var_dump($image); 
    //die; buat ngecek tipe datanya kalo misalkan ada error

    //untuk munculin gambar, pake var dump dulu buat liat detail error-nya

    $thumbnail_name = "";
    $image_gallery = "";

    // Upload thumbnail
    if ($thumbnail['error'] == 0) {
        $thumbnail_name = uniqid() . "_" . $thumbnail['name'];

        $filepath = "assets/thumbnail/" . $thumbnail_name;

        move_uploaded_file($thumbnail['tmp_name'], $filepath);
    }

    // Query tambah / update data
    if ($id) {

        // Hapus thumbnail lama jika upload thumbnail baru
        if ($thumbnail['error'] == 0 && !empty($row['thumbnail'])) {

            $old_picture_path = "assets/thumbnail/" . $row['thumbnail'];

            if (file_exists($old_picture_path)) {
                unlink($old_picture_path);
            }
        }

        $update = mysqli_query($conn, "UPDATE projects SET title='$title', article_url='$article_url', thumbnail='$thumbnail_name', excerpt='$excerpt', published_at='$published_at',
        is_active='$is_active'
        WHERE id='$id'");

        header("Location: projects.php?update-berhasil");
    } else {

        $insert = mysqli_query($conn, "INSERT INTO projects (title, article_url, thumbnail, excerpt, published_at, is_active)
        VALUES
        ('$title','$article_url','$thumbnail_name','$excerpt','$published_at','$image_gallery','$is_active')");

        header("Location: projects.php?tambah-berhasil");
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
                                            <label for="" class="form-tabel">Article Publish Date</label>
                                            <input type="date" class="form-control" name="published_at"
                                                placeholder="Enter projects description" required
                                                value="<?php echo ($id) ? $row['published_at'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label">Enter Article Highlight</label>
                                            <textarea name="excerpt"
                                                class="form-control"><?php echo isset($id) && $id ? $row['excerpt'] : ''; ?></textarea>
                                        </div>

                                        <!-- 
                                        kalo mau pake isset, berarti logikanya ?php echo isset($id) && $id ? $row['
                                                description'] : '' ?, artinya panggil tapi aku mau ngecek dulu si id,
                                                kalo id ada, berarti si id bakal manggil kolom description buat
                                                dimunculin -->


                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Article URL</label>
                                            <input type="text" class="form-control" name="article_url"
                                                placeholder="Enter Article URL" required
                                                value="<?php echo ($id) ? $row['article_url'] : '' ?>">
                                        </div>


                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Thumbnail</label>
                                            <input type="file" class="form-control" name="thumbnail"
                                                placeholder="Enter Image"
                                                value="<?php echo ($id) ? $row['thumbnail'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="is_active"
                                                    id="radioDefault1" value="1" checked>
                                                <label class="form-check-label" for="radioDefault1">
                                                    Active
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="is_active"
                                                    id="radioDefault2" value="0"
                                                    <?php echo ($id && $row['is_active'] == 1) ?  '' : 'checked' ?>>
                                                <label class="form-check-label" for="radioDefault2">
                                                    In-Active
                                                </label>
                                            </div>
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