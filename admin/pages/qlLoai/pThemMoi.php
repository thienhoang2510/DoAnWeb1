<form action="pages/qlLoai/xlThemMoi.php" method="get" onsubmit="return KiemTra();">
  <fieldset>
       <legend>Thêm mới loại sản phẩm</legend>
    <div>
       <span>Tên loại sản phẩm:</span>
       <input type="text" name="txtTen" id="txtTen" />
       <input type="submit" value="Thêm mới" />
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