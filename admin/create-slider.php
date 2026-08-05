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
$query = mysqli_query($conn, "SELECT * FROM sliders WHERE id = '$id'");
$row = mysqli_fetch_assoc($query);


//Jika tombol save ditekan ini ceknya
if (isset($_POST['save'])) {
    $title = $_POST['title'];
    $subtitle = $_POST['subtitle'];
    $button1_text = $_POST['button1_text'];
    $button1_link = $_POST['button1_link'];
    $button2_text = $_POST['button2_text'];
    $button2_link = $_POST['button2_link'];
    $image = $_FILES['image'];
    $description = $_POST['description'];
    $is_active = $_POST['is_active'];
    $id = $row['id'] ?? '';

    //var_dump($image); 
    //die; buat ngecek tipe datanya kalo misalkan ada error
    //untuk munculin gambar, pake var dump dulu buat liat detail error-nya
    if ($image['error'] == 0) {
        $filename = uniqid() . "_" . $image['name'];

        //bisa juga pake basename ($image['name']);

        $filepath = "assets/img/" . $filename; //fungsinya buat bikin tempat simpen gambarnya

        move_uploaded_file($image['tmp_name'], $filepath);
        // var_dump($id);
        // die;


        //query tambah data
        if ($id) {
            //kalo mau update gambar tapi gambarnya langsung kehapus ngga nyampah
            if ($id && !empty($row['image'])) {
                $old_picture_path = "assets/img/" . $row['image'];
                if (file_exists($old_picture_path)) {
                    unlink($old_picture_path);
                }
            }

            $update = mysqli_query($conn, "UPDATE sliders SET 
        title='$title', subtitle='$subtitle', button1_text='$button1_text', button1_link='$button1_link', 
        button2_text='$button2_text', button2_link='$button2_link', image='$filename', description='$description', is_active='$is_active' WHERE id='$id'");
            header("location:sliders.php?update=berhasil");
        } else {
            $insert = mysqli_query($conn, "INSERT INTO sliders
        (title, subtitle, description, button1_text, button1_link, button2_text, button2_link, image, is_active) 
        VALUES 
        ('$title','$subtitle','$description','$button1_text','$button1_link','$button2_text','$button2_link','$filename','$is_active')");
            header("location:sliders.php?tambah=berhasil");
        }


        //kalo mau update tanpa harus mengubah gambar
    } else {
        if ($id) {
            $update = mysqli_query($conn, "UPDATE sliders SET 
        title='$title', subtitle='$subtitle', button1_text='$button1_text', button1_link='$button1_link', 
        button2_text='$button2_text', button2_link='$button2_link', description='$description', is_active='$is_active' WHERE id='$id'");
            header("location:sliders.php?update-berhasil");
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Create Slider - Admin Sofia Han</title>
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
                                <?php echo isset($_GET['edit']) ? 'Edit Slider' : 'Create Slider' ?>
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
                                            <label for="" class="form-tabel">Subtitle</label>
                                            <input type="text" class="form-control" name="subtitle"
                                                placeholder="Enter subtitle" required
                                                value="<?php echo ($id) ? $row['subtitle'] : '' ?>">
                                        </div>


                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Button 1 Text</label>
                                            <input type="text" class="form-control" name="button1_text"
                                                placeholder="Enter button 1 text" required
                                                value="<?php echo ($id) ? $row['button1_text'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Button 1 Link</label>
                                            <input type="url" class="form-control" name="button1_link"
                                                placeholder="Enter button 1 link" required
                                                value="<?php echo ($id) ? $row['button1_link'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Button 2 Text</label>
                                            <input type="text" class="form-control" name="button2_text"
                                                placeholder="Enter button 2 text" required
                                                value="<?php echo ($id) ? $row['button2_text'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Button 2 Link</label>
                                            <input type="text" class="form-control" name="button2_link"
                                                placeholder="Enter button 2 link" required
                                                value="<?php echo ($id) ? $row['button2_link'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-tabel">Image</label>
                                            <input type="file" class="form-control" name="image"
                                                placeholder="Enter Image"
                                                value="<?php echo ($id) ? $row['image'] : '' ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label fw-bold">Description</label>
                                            <textarea name="description" id=""
                                                class="form-control"><?php echo isset($id) && $id ? $row['description'] : '' ?></textarea>
                                        </div>

                                        <!-- 
                                        kalo mau pake isset, berarti logikanya ?php echo isset($id) && $id ? $row['description'] : '' ?, artinya 
                                        panggil tapi aku mau ngecek dulu si id, kalo id ada, berarti si id bakal manggil kolom description buat dimunculin -->

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