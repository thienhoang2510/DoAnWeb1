<?php
session_start();
include "../lib/DataProvider.php";

//Kiểm tra có người dùng đăng nhập với quyền admin hay chưa?

if (!isset($_SESSION["MaLoaiTaiKhoan"]) || $_SESSION["MaLoaiTaiKhoan"] != 2)
    DataProvider::ChangeURL("../index.php");

$c = 0;
if (isset($_GET["c"]))
    $c = $_GET["c"];
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Phân hệ quản lý</title>

    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font-awesome -->
    <link rel="stylesheet" href="../lib/fontawesome/css/all.min.css">
    <!-- Bootstrap core JavaScript -->
    <script src="../lib/jquery/jquery.min.js"></script>
    <script src="../lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <?php
    include "modules/mHeader.php";
    ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-2 pl-0">
                <?php
                include "modules/mSidebar.php";
                ?>
            </div>


            <div class="col-10">
                <?php
                switch ($c) {
                    case 0:
                        include "pages/pIndex.php";
                        break;
                    case 1:
                        include "pages/qlTaiKhoan/pIndex.php";
                        break;
                    case 2:
                        include "pages/qlSanPham/pIndex.php";
                        break;
                    case 3:
                        include "pages/qlLoai/pIndex.php";
                        break;
                    case 4:
                        include "pages/qlHang/pIndex.php";
                        break;
                    case 5:
                        include "pages/qlDonDatHang/pIndex.php";
                        break;
                    default:
                        include "pages/pError.php";
                        break;
                }
                ?>
              
            </div>
        </div>
    </div>
    <?php
                include "modules/mFooter.php";
                ?>
</body>

</html>
