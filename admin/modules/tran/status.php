<?php 
	require_once __DIR__. "/../../autoload/autoload.php";

  $id = intval(getInput('id'));

   $editTran = $db->fetchID("tran", $id);
   if (empty($editTran)) {
       $_SESSION['err'] = "Dữ liệu không tồn tại";
       redirectAdmin("tran");
   }

   $status = $editTran['status'] == 0 ? 1 : 0;

   $update = $db->update("tran", array("status" => $status), array("id" => $id));

   if ($update > 0) 
   {
   		$_SESSION['success'] = "Cập nhật thành công";
   		redirectAdmin("tran");	
   }
   else
   {
   		$_SESSION['err'] = "Cập nhật thất bại";
   		redirectAdmin("tran");	
   }

 ?>