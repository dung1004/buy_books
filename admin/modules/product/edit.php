
<?php  
    // Load file autoload chua database
        $open = "product";
       require_once __DIR__. "/../../autoload/autoload.php";

       // kiểm tra id
        $id = intval(getInput('id'));

       $editProduct = $db->fetchID("product", $id);
       if (empty($editProduct)) 
       {
           $_SESSION['err'] = "Dữ liệu không tồn tại";
           redirectAdmin("product");
       }

       // danh sách danh mục sản phẩm
       $category = $db->fetchAll("category");

       if ($_SERVER["REQUEST_METHOD"] == "POST") 
       {
        // tạo mảng để lưu dữ liệu
            $data = 
            [
               "name" => postInput('name'),
                "slug" => to_slug(postInput('name')),
                "category_id" => postInput('category_id'),
                "codebook" => postInput('codebook'),
                "sale" => postInput('sale'),
                "price" => postInput('price'),
                "linkdrive" => postInput('linkdrive'),
                "content" => postInput('content')
            ];
           // tạo mảng thông báo lỗi
            $err = [];

             if (postInput('name') == '') {
                $err['name'] = "Mời bạn nhập tên sản phẩm";
            }
             if (postInput('category_id') == '') {
                $err['category_id'] = "Mời bạn nhập tên danh mục";
            }
             if (postInput('codebook') == '') {
                $err['codebook'] = "Mời bạn nhập mã sản phẩm";
            }
            if (postInput('sale') == '') {
                $err['sale'] = "Mời bạn nhập giá gốc sản phẩm";
            }
            if (postInput('price') == '') {
                $err['price'] = "Mời bạn nhập giá sản phẩm";
            }
            // if (postInput('linkdrive') == '') {
            //     $err['linkdrive'] = "Mời bạn nhập linkdrive sản phẩm";
            // }

             if (postInput('content') == '') {
                $err['content'] = "Mời bạn nhập nội dung sản phẩm";
            }
           
            // nếu err trống k có lỗi
            if (empty($err)) 
            {
                 if (isset($_FILES['images'])) 
                {
                    $file_name = $_FILES['images']['name'];  
                    $file_tmp = $_FILES['images']['tmp_name'];  
                    $file_type = $_FILES['images']['type'];  
                    $file_erro = $_FILES['images']['erro']; 

                    if ($file_erro == 0) {
                       $part = ROOT ."product/";
                       $data['images'] = $file_name;
                     } 
                }

                $update = $db->update("product", $data, array("id" => $id));
                if ($update > 0) 
                {
                      move_uploaded_file($file_tmp, $part.$file_name);
                      $_SESSION['success'] = "cập nhật thành công";
                      redirectAdmin("product");
                }
                else
                {
                    $_SESSION['err'] = "cập nhật thất bại";
                    redirectAdmin("product");
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
                            <a href="">sản phẩm</a>
                        </li>
                        <li class="breadcrumb-item active">edit</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Edit sản phẩm</h1>
                    <hr>
                    <div class="themmoisanpham">
                        <form action="" method="post" enctype="multipart/form-data">
                          <div class="form-group">
                            <label for="name" class="form-control-label col-md-6"><strong>Danh mục sản phẩm</strong></label>
                            <div class="col-md-10">
                                <select name="category_id" class="form-control" >
                                    <option value="">--Mời bạn chọn danh mục sản phẩm --</option>
                                    <?php foreach ($category as $value) { ?>
                                        <option value="<?= $value['id'] ?>" <?= $editProduct['category_id'] == $value['id'] ? "selected = 'selected'" : '' ?>><?= $value['name'] ?></option>
                                    <?php } ?>
                                </select>
                                  <?php if (isset($err['category'])) {  ?> 
                                        <small class="text-danger"><?= $err['category']; ?></small>
                                   <?php  } ?>
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="name" class="form-control-label col-md-6"><strong>Tên sản phẩm</strong></label>
                            <div class="col-md-10">
                               <input type="text" name="name" class="form-control" value="<?= $editProduct['name'] ?>">
                            <?php if (isset($err['name'])) {  ?> 
                                <small class="text-danger"><?= $err['name']; ?></small>
                            <?php  } ?>
                            </div>
                          </div>

                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6"><strong>Mã sản phẩm</strong></label>
                            <div class="col-md-10">
                               <input type="text" name="codebook" class="form-control" id="name"  placeholder="#CCA1Y" value="<?= $editProduct['codebook'] ?>">
                            <?php if (isset($err['codebook'])) {  ?> 
                                <small class="text-danger"><?= $err['codebook']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="name" class="form-control-label col-md-6"><strong>Giá gốc</strong></label>
                            <div class="col-md-10">
                               <input type="number" name="sale" class="form-control" id="name"  placeholder="9.000.000" value="<?= $editProduct['sale'] ?>">
                            <?php if (isset($err['sale'])) {  ?> 
                                <small class="text-danger"><?= $err['sale']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>


                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>Giá sản phẩm</strong>
                            </label>
                            <div class="col-md-10">
                               <input type="number" name="price" class="form-control"  value="<?= $editProduct['price'] ?>">
                            <?php if (isset($err['price'])) {  ?> 
                                <small class="text-danger"><?= $err['price']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>
                          
                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6"><strong>Link Drive</strong></label>
                            <div class="col-md-10">
                               <input type="text" name="linkdrive" class="form-control" id="name"  placeholder="drive.google.com/drive/folders/0B4fU5__VXkIkNmtBQW9fRE1peDA" value="<?= $editProduct['linkdrive'] ?>">
                            <?php if (isset($err['linkdrive'])) {  ?> 
                                <small class="text-danger"><?= $err['linkdrive']; ?></small>
                           <?php  } ?>
                            </div>
                          </div>


                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>Hình Ảnh</strong>
                            </label>
                            <div class="col-md-3">
                               <input type="file" name="images" class="form-control" value="<?= $editProduct['images'] ?>">
                            <?php if (isset($err['images'])) {  ?> 
                                <small class="text-danger"><?= $err['images']; ?></small>
                           <?php  } ?>
                           <img width="40px" height="40px" src="<?= uploads() ?>product/<?= $editProduct['images'] ?>" alt="">
                            </div>
                          </div>

                           <div class="form-group">
                            <label for="name" class="form-control-label col-md-6">
                              <strong>Nội dung</strong>
                            </label>
                            <div class="col-md-10">
                                <textarea name="content" class="form-control" rows="4"><?= $editProduct['content'] ?></textarea>
                                <?php if (isset($err['content'])) {  ?> 
                                    <small class="text-danger"><?= $err['content']; ?></small>
                               <?php  } ?>
                            </div>
                          </div>
                          

                          <button type="submit" class="btn btn-primary">Lưu Lại</button>
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
