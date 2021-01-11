<?php
$sql = "select * from loaisanpham where bixoa =0";
$result = DataProvider::ExecuteQuery($sql);
?>

<hr>
<h3 class="my-1">Loại sản phẩm</h3>


<ul class="list-unstyled components pt-0 ml-1">
  <?php
  while ($row = mysqli_fetch_array($result)) {
  ?>
    <li>
      <a href="index.php?layout=1&content=3&id=<?php echo $row["MaLoaiSanPham"]; ?>" class="list-group-item"><?php echo $row["TenLoaiSanPham"]; ?></a>
    </li>
  <?php
  }
  ?>

</ul>
