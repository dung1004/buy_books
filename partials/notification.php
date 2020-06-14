<?php if (isset($_SESSION['success'])) :?> 
    <div class="alert alert-success">
        <?= $_SESSION['success']; unset($_SESSION['success']); ?>
    </div>
<?php endif ; ?>
  <?php if (isset($_SESSION['err'])) :?> 
    <div class="alert alert-warning">
        <?= $_SESSION['err']; unset($_SESSION['err']); ?>
    </div>
<?php endif ; ?>