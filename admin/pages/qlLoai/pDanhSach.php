<a href="index.php?c=3&a=3">
<i class="fa fa-plus mb-2 btn btn-primary"> Thêm mới</i>
</a>
<table class="table" cellspacing="0" border="1">
    <tr>
       <th width="100">STT</th>
       <th width="300"> Tên Loại</th>
       <th width="100">Tình trạng</th>
       <th width="200">Thao tác</th>
      
    </tr>
    <?php
       $sql = "SELECT *FROM LoaiSanPham";
              $result = DataProvider::ExecuteQuery($sql);
              $i=1;
              while ($row = mysqli_fetch_array($result))
              {
                  ?>
                  <tr>
                       <td><?php echo $i++; ?></td>
                       <td><?php echo $row["TenLoaiSanPham"]; ?></td>
                      
                  <td>
                      <?php
                if ($row["BiXoa"] == 1)
                echo '<i class="fa fa-ban"></i>';
                else
                echo '<i class="fa fa-check"></i>';
                       ?>
                  </td>
                 
                  <td>
                     <a href="pages/qlLoai/xlKhoa.php?id=<?php echo $row["MaLoaiSanPham"] ?>">
                     <i class="fa fa-lock btn btn-secondary"></i>
                    </a>
                    <a href="index.php?c=3&a=2&id=<?php echo $row["MaLoaiSanPham"] ?> ">
                    <i class="fa fa-edit btn btn-info"></i>
                    </a>
                </td>
             </tr>
         <?php
     }
 ?>
</table>
      