<?php
include "../../lib/DataProvider.php";
if(isset($_POST["ps"]))
   {
        $ps = $_POST["ps"];

    	$sql = "UPDATE taikhoan SET MatKhau = '$ps' WHERE changepass = 1";
        $result = DataProvider::ExecuteQuery($sql);

        $sql = "UPDATE taikhoan SET changepass = NULL WHERE changepass = 1";
        $result = DataProvider::ExecuteQuery($sql);

		$msg = "Đổi mật khẩu thành công!";
		echo '<script type="text/javascript">alert("' . $msg . '")</script>';
		$newURL = '../../index.php';
		header('Refresh: 0;../../index.php');
   }
?>