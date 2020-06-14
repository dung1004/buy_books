
<?php  
    // Load file autoload chua database
        require_once __DIR__. "/../../autoload/autoload.php";

        $id = intval(getInput('id'));

        $chi_tiet_don_hang = $db->fetchID("tran", $id);

        // show ra sản phẩm trong đơn hàng
        $select_sp = "SELECT qty, orders.transaction_id, orders.product_id, product.name, product.price FROM `orders`, product WHERE orders.product_id = product.id";
        $result = $db->fetchsql($select_sp);

        

        // kiểm tra nếu id_tran == id Get thi select ra

        foreach ($result as $key => $value) {
            if ($value['transaction_id'] == $id) {
                 $select = "SELECT qty, orders.transaction_id, orders.product_id, product.name, product.price FROM `orders`, product WHERE orders.product_id = product.id AND orders.transaction_id = $id";
                 $result2 = $db->fetchsql($select);

            }
           
        }
?> 

<!DOCTYPE html>
<html lang="en">
    <!------------------ ----------------------- head Link ------------------------------- -->
       <?php require_once __DIR__. "/../../layouts/head_link.php"; ?>
       <style>
           .thongtindonhang ul li{
            display: flex;
            justify-content: space-between;
           }
       </style>
    <body id="page-top">
        <!------------------ ----------------------- header ------------------------------- -->
    <?php  require_once __DIR__. "/../../layouts/header.php"; ?>
        <div id="wrapper">
            <!------------------ ----------------------- Sidebar  ------------------------------- -->
        <?php  require_once __DIR__. "/../../layouts/sidebar.php"; ?>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="<?= base_url() ?>admin">Bảng điều khiển</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="<?= base_url() ?>admin/modules/tran/">transaction</a>
                        </li>
                        <li class="breadcrumb-item active">views</li>
                    </ol>
                    <!-- Page Content -->
                    <h1>Thông tin chi tiết đơn hàng</h1>
                    <hr>
                    <div class="thanhtoan">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 push-md-1 cot6">
                            <h2>Thông Tin</h2>
                            <form action="" method="post">
                                 <div class="form-group">
                                    <label for="name">Họ và tên</label>
                                    <input type="text" class="form-control" name="name" value="<?= $chi_tiet_don_hang['name'] ?>" readonly="">
                                  </div>
                                    <div class="form-group ">
                                        
                                         <label for="phone">Phone 1</label>
                                        <input type="number" class="form-control" name="phone" value="<?= $chi_tiet_don_hang['phone'] ?>" readonly="">
                                        
                                  </div>
                                  <div class="form-group ">
                                    <label for="tel">Phone 2 <small class="text-muted">(Có thể có hoặc không.)</small></label>
                                    <input type="number" class="form-control" name="tel" value="<?= $chi_tiet_don_hang['tel'] ?>" readonly="">
                                  </div>

                                  
                                    <div class="form-group ">
                                     <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" value="<?= $chi_tiet_don_hang['email'] ?>" readonly="">
                                  </div>

                                   <div class="form-group ">
                                     <label for="address">Address <small class="text-muted">(Ghi rõ địa chỉ nhận hàng)</small></label>
                                    <input type="text" class="form-control" name="address" value="<?= $chi_tiet_don_hang['address'] ?>" readonly="">
                                  </div>

                                  <div class="form-group ">
                                     <label for="note">Note <small class="text-muted">(Thêm chú thích ở phía dưới.)</small></label>
                                    <textarea class="form-control" name="note" rows="6" readonly="">
                                      <?= $chi_tiet_don_hang['note'] ?>
                                    </textarea>
                                  </div>
                            </form>
                        </div>
                        <div class="col-md-6  cot6">
                            
                            <div class="thongtindonhang">
                                <ul class="list-group">
                                  <li class="list-group-item"><h2>
                                    <strong>Thông tin đơn hàng</strong>
                                  </h2>
                                </li>
                                
                                   <li class="list-group-item">
                                    <span><strong>Sản phẩm</strong></span>
                                    <strong class="text-md-right gt">Tổng tiền</strong>
                                   </li>
                                   <?php $tongall = 0; foreach ($result2 as $key => $value) : ?>
                                   <li class="list-group-item">
                                    <span style="font-size: 12px; display: inline-block; height: 50px; width: 70%"><?= $value['name'] ?> * 
                                        <strong style="font-size: 14px;"><?= $value['qty'] ?></strong>
                                    </span>
                                    <strong class="pull-right gt"><?= number_format($value['qty'] * $value['price']) ?>đ</strong>
                                   </li>
                                  <?php
                                        // tính tổng tiền all
                                        $sl = $value['qty'];
                                        $dongia = $value['price'];

                                        $tongall += ($value['qty'] * $value['price']);
                                   endforeach ; ?>

                                  <li class="list-group-item">
                                    <span>Tổng Tạm tính</span>
                                    <strong class="pull-right gt"><?= number_format($tongall) ?>đ</strong>
                                  </li>
                                   <li class="list-group-item">
                                    <span>Phí vận chuyển</span>
                                    <strong class="pull-right gt">40.000đ</strong>
                                   </li>
                                    <li class="list-group-item">
                                        <span><strong>Tổng Cộng</strong></span>
                                        <strong class="pull-right gt">
                                            <?= number_format(($tongall)-40000) ?>đ </strong>
                                    </li>
                            
                                </ul>
                            </div>
                        </div>
                    </div> <!-- end-row -->
                </div> <!-- end-container-fluid -->
            </div> <!-- end-thanhtoan -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-------------------------------- Sticky Footer  ------------------------------- -->
                <?php  require_once __DIR__. "/../../layouts/footer.php"; ?>
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
