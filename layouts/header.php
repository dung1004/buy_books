 <div class="header" >
   <a name="top"></a>
    <div id="header_top" class="bg-white">
        <div class="container">
            <div class="row">
                <div class="col-md-2 cot2">
                    <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i aria-hidden="true" class="fa fa-bars"></i>
                    </button>
                    <a href="<?= base_url() ?>">
                        <h4 class="name_web"><span>TH</span><strong>Book</strong></h4>
                    </a>
                    
                </div>
                <div class="col-md-10 col-xs-12 cot10">
                    <div class="row">
                        <div class="col-md-6 col-xs-12 cot6_phai">
                            <form action="search.php">
                                <input  type="text" name="search" placeholder="Tìm kiếm trên hệ thống..." class="form-control textSearch">
                                <input type="submit" class="submit" name="ok"  value="Search" />
                            </form>
                        </div>
                        <!-- end - cot6 -->
                        <div class="col-md-6 cot6_trai text-sm-right">
                            <div class="cart">
                                <a href="cart.php">
                                <button class="btn btn-defau btn_cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="gio_hang">
                                <span class="value">
                                 <?php if (isset($_SESSION['cart'])) {
                                     echo count($_SESSION['cart']);
                                 }else{
                                    echo 0;
                                 }
                                  ?>
                                </span>
                                <span class="text">GIỎ HÀNG</span>
                                </span>
                                </button>
                                </a>
                            </div>
                            <!-- <div class="login">
                                <a class="btn btn-defau btn_login" href="dang-ky.php">
                                <i class="fa fa-user"></i>
                                <span class="user_login">
                                <span class="dang_nhap">ĐĂNG NHẬP / <br>
                                <span class="dang_ky">ĐĂNG KÝ</span></span>
                                </span>
                                </a>
                            </div> -->
                            <div class="hotline">
                                <button class="btn btn-defaul btn_lh">
                                <i class="fa fa-phone-square"></i>
                                <span class="lien_he">
                                <span class="text">HOTLINE</span><br>
                                <span class="number">0989.679.562</span>
                                </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end-cot 10 -->
            </div>
            <!-- end-row -->
        </div>
        <!-- end-container -->
    </div>
    <!-- end-bg-white -->
    <div id="header_bottom" class="bg-xanh">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-md-center cot3_phai">
                    <i class="fa fa-bars"></i>
                    <span>Danh Mục Sản Phẩm</span>
                </div>
                <!-- end-cot3 -->
                <div class="col-md-9 cot9_trai">
                    <nav class="navbar navbar-light bg-faded">
                        <a class="navbar-brand" href="#"><i class="fa fa-home"></i></a>
                        <ul class="nav navbar-nav">
                            <li class="nav-item">
                                <a class="btn btn-secondary" href="huong-dan-dat-hang.php"> Hướng dẫn mua hàng</a>
                                <a class="btn btn-secondary" href="gioi-thieu-thbook.php"> Giới thiệu về THBook</a>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#">Tài Liệu Miễn Phí</a>
                            </li> -->
                        </ul>
                    </nav>
                </div>
                <!-- end-cot9 -->
            </div>
            <!-- end-row -->
        </div>
        <!-- end-contaienr -->
    </div>
    <!-- end-bg-xanh -->
</div>