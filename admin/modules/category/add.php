
<?php  
    // Load file autoload chua database
        $open = "category";
       require_once __DIR__. "/../../autoload/autoload.php";

       if ($_SERVER["REQUEST_METHOD"] == "POST") 
       {
        // tạo mảng để insert dữ liệu
            $data = 
            [
                "name" => postInput('name'),
                "slug" => to_slug(postInput('name'))
            ];
            // tạo mảng thông báo lỗi
            $err = [];
            if (postInput('name') == '') {
                $err['name'] = "Mời bạn nhập đầy đủ tên danh mục";
            }
            // nếu err trống k có lỗi
            if (empty($err)) {
                $id_insert = $db->insert("category", $data);
                if ($id_insert > 0) {
                    $_SESSION['success'] = "Thêm mới thành công";
                    redirectAdmin('category');
                }
            }
       }
?> 

<!DOCTYPE html>
<html lang="en">
    <!------------------ ----------------------- head Link ------------------------------- -->
        <?php require_once __DIR__. "/../../layouts/head_link.php"; ?>
    <body id="page-top">
        <!------------------ ----------------------- header ------------------------------- -->
    <?php require_once __DIR__. "/../../layouts/header.php"; ?>
        <div id="wrapper">
            <!------------------ ----------------------- Sidebar  ------------------------------- -->
        <?php require_once __DIR__. "/../../layouts/sidebar.php"; ?>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="<?= base_url() ?>admin">Bảng điều khiển</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="">Danh mục</a>
                        </li>
                        <li class="breadcrumb-item active">Thêm mới</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Thêm mới danh mục</h1>
                    <hr>
                    <div class="themmoidanhmuc">
                        <form action="" method="post">
                          <div class="form-group">
                            <label for="name">Tên Danh Mục</label>
                            <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name category">
                            <?php if (isset($err['name'])) {  ?> 
                                <small class="text-danger"><?= $err['name']; ?></small>
                           <?php  } ?>
                            
                          </div>
                          <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div> <!-- end-themmoidanhmuc -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-------------------------------- Sticky Footer  ------------------------------- -->
                <?php require_once __DIR__. "/../../layouts/footer.php"; ?>
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
