<?php phpAlert(   "Xác thực thành công \\n\\nHãy tiến hành đăng nhập"   );  ?>

<?php

include "lib/DataProvider.php";
$code = $_GET['code'];
$id = $_GET['id'];
activateUser($id);

function activateUser($id){
	$sql = "UPDATE `taikhoan` SET `code` = NULL WHERE `taikhoan`.`MaTaiKhoan` = $id;";
	DataProvider::ExecuteQuery($sql);
}
?>

<?php

$newURL = 'index.php';
header('Refresh: 0;url=index.php');
?>

<?php
function phpAlert($msg) {
    echo '<script type="text/javascript">alert("' . $msg . '")</script>';
}
?>