
<?php  
    // Load file autoload chua database
      $open = "admin";
       require_once __DIR__. "/../../autoload/autoload.php";

       $id = intval(getInput('id'));

       $delete = $db->delete("admin", $id);
       if ($delete > 0) 
       {
           $_SESSION['success'] = "Xóa thành công";
           redirectAdmin("admin");
       }
       else
       {
           $_SESSION['err'] = "Xóa thất bại";
           redirectAdmin("admin");
       }

?> 
