 <div class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 cot1">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="<?= base_url() ?>">
                                    <h4 class="name_web"><span>TH</span><strong>Book</strong></h4>
                                </a>
                            </li>
                            <li class="list-group-item">
                                <h3>THBOOK - SÁCH LUYỆN THI SỐ 1 VIỆT NAM</h3>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-phone"></i> <span>Điện thoại: <strong>0989.679.562</strong></span>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-envelope"></i> <span>Email: <strong>trankimhoang1998@gmail.com</strong></span>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-globe"></i> <span>Website: <strong><a href="http://www.thbook.vn">http://www.THbook.vn</a></strong></span>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-map-marker"></i> <span>Địa chỉ: <strong>Hòa Khánh Bắc-Liên Chiểu-Đà Nẵng</strong></span>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 cot2">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h3>THÔNG TIN</h3>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-angle-right"></i>
                                <a href="gioi-thieu-thbook.php">Giới thiệu về SHBook</a>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-angle-right"></i>
                                <a href="huong-dan-dat-hang.php">Hướng dẫn mua hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-5 cot2 cot4">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h3>KẾT NỐI VỚI SHBOOK</h3>
                            </li>
                            <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Ftailieuonthi101112&tabs=timeline&width=350&height=300&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="350" height="300" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
                        </ul>
                    </div>
                </div>
                <!--  end-row -->
            </div>
            <!--  end-container -->
             <div class="toAnchor">
                <a href="#" id="link"><i class="fa fa-angle-up"></i></a>
            </div>
        </div>
        <div class="footer_bottom text-md-center text-xs-center">
            <span>Copyright © 2019 thuộc Công ty TNHH Dịch vụ văn hóa Sư phạm</span>
        </div>
       
    </div>
    <!--  end-footer -->
</div>
<script type="text/javascript" src="<?= base_url() ?>public/front-end/vendor/bootstrap.js"></script>
<script type="text/javascript" src="<?= base_url() ?>public/front-end/vendor/jquery.min.js"></script>
<script type="text/javascript" src="<?= base_url() ?>public/front-end/vendor/owl.carousel.js"></script>
<script type="text/javascript" src="<?= base_url() ?>public/front-end/1.js"></script>
<script type="text/javascript">
    $(function(){

    $updateCart = $(".updateCart");
    $updateCart.click(function(e) {
        e.preventDefault();
        $qty = $(this).parents("tr").find(".qty").val();
        $key = $(this).attr("data-key");

        $.ajax({
            url: 'cap-nhat-gio-hang.php',
            type: 'GET',
            data: {'qty':$qty, 'key':$key},
            success:function(data)
            {
                if (data == 1) 
                {
                    location.href='cart.php';
                }
            }
        });
    })

});
</script>