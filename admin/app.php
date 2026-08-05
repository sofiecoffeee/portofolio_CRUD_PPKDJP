<?php
ob_start();
session_start();
session_regenerate_id();
include "config/koneksi.php";

//jika parameter/params delete ada

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Potfofolio Web Admin</title>
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
                        <!-- <a href="index.html" class="logo"> -->
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

                    <!--  GET: URL ?id, ?edit, ?delete
                -->
                    <?php
                    if (isset($_GET['page'])) {
                        // file exists
                        if (file_exists($_GET['page'] . '.php')) {
                            include $_GET['page'] . '.php';
                        } else {

                            include 'notfound.php';
                        }
                    }

                    ?>
                </div>
            </div>

            <footer></footer>

            <?php
            include "inc/js.php";
            ?>

</body>

</html>