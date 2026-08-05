<?php

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
        header("location:app.php?page=create-user&email=gagal");
    }

    //query tambah data
    if ($id) {
        //query update
        $update = mysqli_query($conn, "UPDATE users SET name='$name', email='$email', password='$password' WHERE id='$id'");
        header("location:app.php?page=user&update=berhasil");
    } else {
        $query = mysqli_query($conn, "SELECT * FROM users WHERE id='$id'");
        $row = mysqli_fetch_assoc($query);
    }
    $insert = mysqli_query($conn, "INSERT INTO users (name, email, password) VALUES ('$name', '$email','$password')");

    header("location:app.php?page=user&tambah=berhasil");
}

//query update password
// show all data from users table
// from biggest to smallest
// $name = $_SESSION['name'];
// if (!$name) {
//   header("location:index.php");
// }

?>

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
                        <input type="text" class="form-control" name="name" placeholder="Enter name" required
                            value="<?php echo isset($id) && $id ? $row['name'] : '' ?>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter email" required
                            value="<?php echo isset($id) && $id ? $row['email'] : '' ?>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <?php echo isset($id) && $id ?
                                'Password <small class="text-secondary"> (leave blank if you do not wish to change it) </small>'
                                : 'Password' ?>
                        </label>
                        <input type="password" class="form-control" name="password" placeholder="Enter password"
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