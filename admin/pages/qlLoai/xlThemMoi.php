<?php
   include "../../../lib/DataProvider.php";

   if(isset($_GET["txtTen"]))
   {
       $ten = $_GET["txtTen"];

       $sql = "INSERT INTO LoaiSanPham(TenLoaiSanPham, BiXoa) VALUES('$ten',0)";
       DataProvider::ExecuteQuery($sql);
   }

   DataProvider::ChangeURL("../../index.php?c=3");
?>