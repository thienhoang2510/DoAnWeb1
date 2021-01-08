<h3 class="mb-0 pb-0">Quản lý đơn đặt hàng</h3>
<hr class="mt-0 pt-0">
<?php
    $a = 1;
    if(isset($_GET["a"]))
       $a=$_GET["a"];
    
    switch ($a)
    {
        case 1:
            include "pages/qlDonDatHang/pDanhSach.php";
        break;
        case 2:
            include "pages/qlDonDatHang/pChiTietDonDatHang.php";
        break;
        case 3:
            include "pages/qlDonDatHang/pThemMoi.php";
        break;
        default:
        include "pages/pError.php";
    break;
    }
?>