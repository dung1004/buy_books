
<?php  
    // Load file autoload chua database
       require_once __DIR__. "/autoload/autoload.php";
 
       $category = $db->fetchAll("category");

?> 

<!DOCTYPE html>
<html lang="en">
    <!------------------ ----------------------- head Link ------------------------------- -->
        <?php require_once __DIR__. "/layouts/head_link.php"; ?>
    <body id="page-top">
        <!------------------ ----------------------- header ------------------------------- -->
    <?php require_once __DIR__. "/layouts/header.php"; ?>
        <div id="wrapper">
            <!------------------ ----------------------- Sidebar  ------------------------------- -->
        <?php require_once __DIR__. "/layouts/sidebar.php"; ?>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="<?= base_url() ?>admin">Bảng điều khiển</a>
                        </li>
                        <li class="breadcrumb-item active">Blank Page</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Chào bạn đến với trang quản trị của Admin</h1>
                    <hr>
                    <p>This is a great starting point for new custom pages.</p>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-------------------------------- Sticky Footer  ------------------------------- -->
                <?php require_once __DIR__. "/layouts/footer.php"; ?>
            <!-- /.content-wrapper -->
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="/muasach/public/admin/vendor/jquery/jquery.min.js"></script>
        <script src="/muasach/public/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="/muasach/public/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="/muasach/public/admin/js/sb-admin.min.js"></script>
    </body>
</html>
