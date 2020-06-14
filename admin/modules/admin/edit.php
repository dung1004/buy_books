
<?php  
    // Load file autoload chua database
        $open = "admin";
       require_once __DIR__. "/../../autoload/autoload.php";

        // kiểm tra id
        $id = intval(getInput('id'));

       $editAdmin = $db->fetchID("admin", $id);
       if (empty($editAdmin)) 
       {
           $_SESSION['err'] = "Dữ liệu không thay đổi";
           redirectAdmin("product");
       }



       if ($_SERVER["REQUEST_METHOD"] == "POST") 
       {
        
        // tạo mảng để insert dữ liệu
            $data = 
            [
                "name" => postInput('name'),
                "username" => postInput('username')
            ];
            
            // tạo mảng thông báo lỗi
            $err = [];
            if (postInput('name') == '') {
                $err['name'] = "Mời bạn nhập tên admin ";
            }
             if (postInput('username') == '') {
                $err['username'] = "Mời bạn nhập username";
            }
            // check user
           else{
              if (postInput('username') != $editAdmin['username']) 
              {
                  $is_check = $db->fetchOne("admin", " username = ' " .$data['username']. " ' ");

                if ($is_check != NULL) {
                  $err['username'] = "username đã tồn tại";
                }
              }
           }

            // check pass word
            if (postInput('password') != NULL && postInput('configPassword') != NULL) 
            {
              if (postInput('password') != postInput('configPassword')) 
              {
                $err['password'] = "Mật khẩu thay đổi k khớp";
              }
              else
              {
                $data['password'] = postInput('password');
              }
            }
           
            // nếu err trống k có lỗi
            if (empty($err)) {
                // insert du lieu
                $id_update = $db->update("admin", $data, array("id" => $id));
                if ($id_update > 0) 
                {
                  $_SESSION['success'] = "Cập nhật thành công";
                  redirectAdmin("admin");
                }
                else{
                  $_SESSION['err'] = "Cập nhật thất bại";
                  redirectAdmin("admin");
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
                            <a href="">Admin</a>
                        </li>
                        <li class="breadcrumb-item active">Thêm mới</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Edit tài khoản admin</h1>
                    <hr>
                    <div class="themmoisanpham">
                        <form action="" method="post" enctype="multipart/form-data">
                          <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>Name</strong>
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="name" class="form-control" id="name" value="<?= $editAdmin['name'] ?>"   placeholder="Enter name product">
                            <?php if (isset($err['name'])) {  ?> 
                                <small class="text-danger"><?= $err['name']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>

                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>username</strong>
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="username" class="form-control" id="name" value="<?= $editAdmin['username'] ?>"  placeholder="username" >
                            <?php if (isset($err['username'])) {  ?> 
                                <small class="text-danger"><?= $err['username']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>

                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>Password</strong>
                            </label>
                            <div class="col-md-10">
                               <input type="password" name="password" class="form-control" id="name"  placeholder="**********" value="<?= $editAdmin['password'] ?>">
                            <?php if (isset($err['password'])) {  ?> 
                                <small class="text-danger"><?= $err['password']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>configPassword</strong>
                            </label>
                            <div class="col-md-10">
                               <input type="password" name="configPassword" class="form-control" id="name"  placeholder="**********">
                            <?php if (isset($err['configPassword'])) {  ?> 
                                <small class="text-danger"><?= $err['configPassword']; ?></small>
                           <?php  } ?>
                            </div>
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
