<?php
   include "../../../lib/DataProvider.php";

   if(isset($_GET["id"]))
   {
       $id = $_GET["id"];

    $sql = "SELECT COUNT(*) FROM TaiKhoan WHERE MaTaiKhoan = $id";
    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);
    if($row[0] == 0)
    {
        //thực hiện xóa  ra khỏi db
        $sql = "DELETE FROM TaiKhoan WHERE MaTaiKhoan = $id";
    }
    else
    {
        //thực hiện khóa 
        $sql = "UPDATE TaiKhoan SET BiXoa = 1 - BiXoa WHERE MaTaiKhoan = $id";
    }
    
    DataProvider::ExecuteQuery($sql);
   }

   DataProvider::ChangeURL("../../index.php?c=1");
?>