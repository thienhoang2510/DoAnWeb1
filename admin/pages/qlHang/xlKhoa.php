<?php
   include "../../../lib/DataProvider.php";

   if(isset($_GET["id"]))
   {
       $id = $_GET["id"];
        //kiểm tra có sản phẩm thuộc về hãng đang muốn xóa hay không?
       $sql = "SELECT COUNT(*) FROM SanPham WHERE MaHangSanXuat = $id";
       $result = DataProvider::ExecuteQuery($sql);
       $row = mysqli_fetch_array($result);
       if($row[0] == 0)
       {
           //thực hiện xóa hãng ra khỏi db
           $sql = "DELETE FROM HangSanXuat WHERE MaHangSanXuat = $id";
       }
       else
       {
           //thực hiện khóa hãng do đã có sản phẩm thuộc về loại này
           $sql = "UPDATE HangSanXuat SET BiXoa = 1 - BiXoa WHERE MaHangSanXuat = $id";
       }
       
       DataProvider::ExecuteQuery($sql);
   }

   DataProvider::ChangeURL("../../index.php?c=4");
?>