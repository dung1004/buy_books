
<?php  
    // Load file autoload chua database
      $open = "category";
       require_once __DIR__. "/../../autoload/autoload.php";

       $id = intval(getInput('id'));

       $delete = $db->delete("product", $id);
       if ($delete > 0) {
           $_SESSION['success'] = "Xóa thành công";
           redirectAdmin("product");
       }else{
           $_SESSION['err'] = "Xóa thất bại";
           redirectAdmin("product");
       }

?> 
