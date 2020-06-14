<?php 	  // Load file autoload chua database
      session_start();
	require_once __DIR__. "/../libraries/Database.php";
	require_once __DIR__. "/../libraries/Function.php";

    $db = new Database;

       // xử lý đăng nhập 
       $data = [
       	'username' => postInput("username"),
       	'password' => postInput("password")
       ];

      
      
       if ($_SERVER["REQUEST_METHOD"] == "POST") 
       {
       	 $sql = "SELECT * FROM admin";
       	 $product = $db->fetchsql($sql);
	       foreach ($product as $key => $value) 
	       {
	       	 if ($data['username'] == $value['username'] && $data['password'] == $value['password']) 
	       	 {
	       	 	echo '<script>
				alert("Đăng nhập thành công !");
				location.href = "/muasach/admin";
	       		</script>';
	       		$_SESSION['admin_id'] = $value['id'];
	       	 }else {
	       	 	echo '<script>
				alert("Username hoặc mật khẩu không đúng !");
	       		</script>';
	       		break;
	       	 }
	       }
       }

 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="icon" href="../../images/background/pts.jpg">
	<link rel="stylesheet" href="<?php echo base_url() ?>public/front-end/login.css">
</head>
<body>
	<!-- HTML BOX_LOGIN -->
	<div class="login">
		<div class="img">
			<div id="face">
		<div class="eye">
			<div class="eye-left">
				<div id="eyeballs"></div>
			</div>
			<div class="eye-right">
				<div id="eyeballs"></div>
			</div>
		</div>
		<div id="mouth">
			<div class="tongue"></div>
		</div>
		</div>
		</div>
		<div class="box">
			<form action="" method="POST">
				<div class="row">
				<input type="text" class="name" name="username" placeholder="Username" required="">
				</div>
				<div class="row">
				<input type="password" class="pass" name="password" placeholder="Pass" required="">
				</div>
				<div class="row">
					<button class="submit" type="submit">Sign in</button>
				</div>
			</form>
		</div>
		<!-- DESIGED -->
		<span class="span">Chưa có tài khoản||<a href="dang-ky.php" style="color: #13D8FC"> registration</a></i></span>
	</div>
</body>
</html>