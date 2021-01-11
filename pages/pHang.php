<?php
$sql = "select * from hangsanxuat where BiXoa = 0";
$result = DataProvider::ExecuteQuery($sql);
?>




<h3 class="my-1">Hãng sản xuất</h3>

<ul class="list-unstyled components pt-0 ml-1">

  <?php
  while ($row = mysqli_fetch_array($result)) {
  ?>
    <li>
      <a href="index.php?layout=1&content=2&id=<?php echo $row["MaHangSanXuat"]; ?>" class="list-group-item"><?php echo $row["TenHangSanXuat"]; ?></a>
    </li>
  <?php
  }
  ?>
</ul>
