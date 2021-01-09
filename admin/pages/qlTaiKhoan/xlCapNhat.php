<?php
   include "../../../lib/DataProvider.php";

   if(isset($_GET["id"]))
   {
       $id = $_GET["id"];
       $MaLoaiTaiKhoan = $_GET["cmbLoaiTaiKhoan"];
       $sql = "UPDATE TaiKhoan SET MaLoaiTaiKhoan = $MaLoaiTaiKhoan WHERE MaTaiKhoan = $id";
       DataProvider::ExecuteQuery($sql);
   }

   DataProvider::ChangeURL("../../index.php?c=1");
?>