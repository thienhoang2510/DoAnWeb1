<h3 class="mb-0 pb-0">Quản lý tài khoản</h3>
<hr class="mt-0 pt-0">
<?php
    $a = 1;
    if(isset($_GET["a"]))
       $a=$_GET["a"];
    
    switch ($a)
    {
        case 1:
            include "pages/qlTaiKhoan/pDanhSach.php";
        break;
        case 2:
            include "pages/qlTaiKhoan/pCapNhat.php";
        break;
        default:
        include "pages/pError.php";
    break;
    }
?>