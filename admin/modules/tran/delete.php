<?php 
	require_once __DIR__. "/../../autoload/autoload.php";

  $id = intval(getInput('id'));

   // xoa  sp trong gio hang
   $delete = "DELETE FROM `orders`  WHERE transaction_id = $id";

   $ketqua = $db->fetchsql($delete);

   // xoa trong transaction
   $delete2 = $db->delete("tran", $id);
  
     if ($delete2) 
     {  
         $_SESSION['success'] = "Xóa thành công";
         redirectAdmin("tran");
     }
     else
     {
         $_SESSION['err'] = "Xóa thất bại";
         redirectAdmin("tran");
     }
      

 ?>