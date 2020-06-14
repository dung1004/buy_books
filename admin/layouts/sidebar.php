<!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url() ?>admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Bảng điều khiển</span>
                    </a>
                </li>
                 <li class="nav-item <?= isset($open) && $open == 'category' ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= modules("category") ?>">
                    <i class="fa fa-list"></i>
                    <span>Danh mục sản phẩm</span>
                    </a>
                </li>
                <li class="nav-item <?= isset($open) && $open == 'product' ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= modules("product") ?>">
                    <i class="fa fa-database"></i>
                    <span>Sản phẩm</span>
                    </a>
                </li>
                 <li class="nav-item <?= isset($open) && $open == 'tran' ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= modules("tran") ?>">
                    <i class="fa fa-user-circle"></i>
                    <span>Transaction</span>
                    </a>
                </li>
                <li class="nav-item <?= isset($open) && $open == 'admin' ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= modules("admin") ?>">
                    <i class="fa fa-user-circle"></i>
                    <span>Admin</span>
                    </a>
                </li>
            </ul>