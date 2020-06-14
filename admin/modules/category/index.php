
<?php  
    // Load file autoload chua database
      $open = "category";
       require_once __DIR__. "/../../autoload/autoload.php";
 
       $category = $db->fetchAll("category");

?> 

<!DOCTYPE html>
<html lang="en">
    <!------------------ ----------------------- head Link ------------------------------- -->
        <?php require_once __DIR__. "/../../layouts/head_link.php"; ?>
    <body id="page-top">
        <!------------------ ----------------------- header ------------------------------- -->
        <?php include ("../../layouts/header.php"); ?>
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
                        <li class="breadcrumb-item active">danh mục</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Danh sách danh mục
                    <a href="add.php" class="btn btn-success">Thêm mới</a>
                </h1>
                    <hr>
                    <!-- Thông báo thành công hoặc lỗi ở đây -->
                    <?php require_once __DIR__. "/../../../partials/notification.php"; ?>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table text-center">
                          <thead>
                            <tr>
                              <th scope="col">Stt</th>
                              <th scope="col">Name</th>
                              <th scope="col">Slug</th>
                              <th scope="col">Home</th>
                              <th scope="col">Created</th>
                              <th scope="col">Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php foreach ($category as $value) { ?>
                            <tr>
                              <th scope="row"><?= $value['id'] ?></th>
                              <td><?= $value['name'] ?></td>
                              <td><?= $value['slug'] ?></td>
                              <td>
                                <a class="btn <?= $value['home'] == 1 ? "btn-info" : "btn-outline-dark" ?>" href="home.php?id=<?= $value['id'] ?>">
                                  <?= $value['home'] == 1 ? "Hiển thị" : "Không" ?>
                                </a>
                              </td>
                              <td><?= $value['created_at'] ?></td>
                              <td>
                                  <a href="edit.php?id=<?= $value['id'] ?>" class="btn btn-info"><i class="fa fa-edit"></i> Edit</a> 
                                  <a href="delete.php?id=<?= $value['id'] ?>" class="btn btn-danger"><i class="fa fa-times"></i> delete</a>
                              </td>
                            </tr>
                            <?php } ?> 
                          </tbody>
                        </table>
                    </div> <!-- end-cot-12 -->
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
