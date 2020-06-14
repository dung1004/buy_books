<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="<?= base_url() ?>admin">Xin chào Admin</a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
            </button>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="<?= base_url() ?>" >
                    <i class="fas fa-home fa-fw"></i>
                    Trang chủ
                    </a>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link " href="<?= base_url() ?>login/dang-xuat.php" >
                    <i class="fas fa-user-circle fa-fw"></i>
                    Đăng xuất
                    </a>
                </li>
            </ul>
        </nav>