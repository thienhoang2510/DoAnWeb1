<h3 class="mb-0 pb-0">Quản lý loại sản phẩm</h3>
<hr class="mt-0 pt-0">
<?php
    $a = 1;
    if(isset($_GET["a"]))
       $a=$_GET["a"];
    
    switch ($a)
    {
        case 1:
            include "pages/qlLoai/pDanhSach.php";
        break;
        case 2:
            include "pages/qlLoai/pCapNhat.php";
        break;
        case 3:
            include "pages/qlLoai/pThemMoi.php";
        break;
        default:
        include "pages/pError.php";
    break;
    }
?>