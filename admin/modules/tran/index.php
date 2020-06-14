<?php  
    // Load file autoload chua database
      $open = "tran";
       require_once __DIR__. "/../../autoload/autoload.php";
 
       // $product = $db->fetchAll("product");


       if (isset($_GET['page'])) 
       {
         $p = $_GET['page'];
       }else
       {
        $p = 1;
       }

       $sql = "SELECT tran.* FROM tran ORDER BY ID DESC  ";

       $tran = $db->fetchJone('tran', $sql, $p, 8, true);

       if (isset($tran['page'])) 
       {
          $sotrang = $tran['page'];
          unset($tran['page']);  
       }

?> 

<!DOCTYPE html>
<html lang="en">
<style>
  li{list-style: none}
  tr td, tr td a.btn{
    font-size: 13px;
  }
</style>
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
                        <li class="breadcrumb-item active">transaction</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Danh sách các đơn hàng
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
                              <th scope="col">Email</th>
                              <th scope="col">Address</th>
                              <th scope="col">Status</th>
                              <th scope="col">created_at</th>
                              <th scope="col">Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php foreach ($tran as $value) { ?>
                            <tr>
                              <th scope="row"><?= $value['id'] ?></th>
                              <td><?= $value['name'] ?></td>
                              <td><?= $value['email'] ?></td>
                              <td><?= $value['address'] ?></td>
                              <td>
                                <a href="status.php?id=<?= $value['id'] ?>" class=" btn btn-xs <?= $value['status'] == 0 ? 'btn btn-danger' : ' btn btn-info'; ?>">
                                  <?= $value['status'] == 0 ? 'Chưa xử lý' : 'Đã xử lý' ?>
                                </a>
                              </td>
                              <td><?= $value['created_at'] ?></td>
                              <td>
                                  <a href="delete.php?id=<?= $value['id'] ?>" class="btn btn-danger">
                                    <i class="fa fa-times"></i> delete
                                  </a>
                                  <a href="chi-tiet-don-hang.php?id=<?= $value['id'] ?>" class="btn btn-info">
                                    <i class="fa fa-eye"></i> views
                                  </a>
                              </td>
                            </tr>
                            <?php } ?> 
                          </tbody>
                          
                        </table>
                        <nav aria-label="Page navigation example">
                          <ul class="pagination">
                            <li class="page-item">
                              <a class="page-link" href="#"><i class="fa fa-angle-double-left"></i></a>
                            </li>
                            <?php for($i = 1; $i <= $sotrang; $i++) { ?>
                              <?php 
                                     if (isset($_GET['page'])) 
                                       {
                                         $p = $_GET['page'];
                                       }else
                                       {
                                        $p = 1;
                                       }

                               ?>
                            <li class="page-item <?= ($i == $p) ? 'active' : '' ?>">
                              <a class="page-link" href="?page=<?= $i; ?>"><?= $i; ?></a>
                            </li>
                            <?php } ?>
                            <li class="page-item">
                              <a class="page-link" href="#"><i class="fa fa-angle-double-right"></i></a>
                              </li>
                          </ul>
                        </nav>
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
