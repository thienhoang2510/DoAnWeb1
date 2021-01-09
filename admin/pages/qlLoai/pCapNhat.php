<?php
    if(!isset($_GET["id"]))
       DataProvider::ChangeURL("index.php?c=404");

    $id = $_GET["id"];
    $sql = "SELECT * FROM LoaiSanPham WHERE MaLoaiSanPham = $id";
    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);
?>
<form action="pages/qlLoai/xlCapNhat.php" method="get" onsubmit="return KiemTra();">
   <fieldset>
      <legend>Cập nhật thông tin loại sản phẩm</legend>
      <div>
         <span>Tên loại sản phẩm:</span>
         <input type="text" name="txtTen" value="<?php echo $row["TenLoaiSanPham"]; ?>" />
         <input type="hidden" name="id" value="<?php echo $row["MaLoaiSanPham"]; ?>" />
         <input type="submit" value="Cập nhật" />
      </div>
      <div id="error"></div>
    </fieldset>
</form>
<script type="text/javascript">
   function KiemTra()
   {
       var ten = document.getElementById("txtTen");
       var err = document.getElementById("error");
       if(ten.value == "")
       {
           err.innerHTML = "Tên loại không được rỗng";
           ten.focus();
           return false;
       }
       else
           err.innerHTML = "";

        return true;
   }
</script>
    