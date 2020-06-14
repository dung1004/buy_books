
<?php  
    // Load file autoload chua database
      $open = "category";
       require_once __DIR__. "/../../autoload/autoload.php";

       $id = intval(getInput('id'));
       $is_product = $db->fetchOne("product", "category_id = $id ");

       if ($is_product == NULL) {
          $delete = $db->delete("category", $id);
           if ($delete > 0) 
           {
               $_SESSION['success'] = "Xóa thành công";
               redirectAdmin("category");
           }
           else
           {
               $_SESSION['err'] = "Xóa thất bại";
               redirectAdmin("category");
           }
       }else{
              $_SESSION['err'] = "Danh mục có sản phẩm! bạn k thể xóa";
              redirectAdmin("category");
       }


?> 
