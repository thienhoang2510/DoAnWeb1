<?php
   include "../../../lib/DataProvider.php";

   if(isset($_GET["id"]))
   {
       $id = $_GET["id"];
       $ten = $_GET["txtTen"];

       $sql = "UPDATE LoaiSanPham SET TenLoaiSanPham = '$ten' WHERE MaLoaiSanPham = $id";

       DataProvider::ExecuteQuery($sql);
   }

   DataProvider::ChangeURL("../../index.php?c=3");
?>