<?php

$sql = "select * from sanpham where BiXoa = 0 order by SoLuongBan desc";
$result = DataProvider::ExecuteQuery($sql);
?>
  
<p><h2>Sản phẩm bán chạy nhất</h2></p>

<div class="row">


<?php
for ($i=0;$i<12;$i++)
{
    $row = mysqli_fetch_array($result);
    $itemcard = new ItemCard($row["MaSanPham"], $row["HinhURL"], $row["TenSanPham"], $row["GiaSanPham"]);
    $itemcard->create();

}
?>
      </div>

<!-- /.row -->
