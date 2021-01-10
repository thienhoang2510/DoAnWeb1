<div id="quanlygiohang">
   <hr>
   <center><h1>Quản lý giỏ hàng</h1></center>
   <center><table>
       <tr width=200>
          <th width="100" width="20">STT</th>
          <th><center>Tên sản phẩm </center></th>
          <th width="100"><center>Hình</center></th>
          <th width="100"><center>Giá</center></th>
          <th width="100"><center>Số lượng</center></th>
          <th width="100"><center>Thao tác</center></th>
        </tr>
        <?php
           $tongGia = 0;
           if(isset($_SESSION["GioHang"]))
           {
               $soSanPham = count($gioHang->listProduct);
               $_SESSION["sosanpham"] = $soSanPham;
               for($i=0;$i<$soSanPham;$i++){
                   $id=$gioHang->listProduct[$i]->id;
                   $sql="SELECT * FROM SanPham WHERE MaSanPham=$id";

                   $result = DataProvider::ExecuteQuery($sql);
                   $row = mysqli_fetch_array($result);
                   ?>
                   <form name="frmGioHang" action="pages/GioHang/xlCapNhatGioHang.php" method="post">
                      <tr>
                      <td>1</td>
                      <td>
                          <?php echo $row["TenSanPham"];?>
                      </td>
                      <td align="center">
                         <img src="images/sanpham/<?php echo $row["HinhURL"];?>" width="50">
                      </td>
                      <td>
                      <?php echo $row["GiaSanPham"];?>
                      </td>
                      <td>
                      <input type="text" name="txtSL" value="<?php echo $gioHang->listProduct[$i]->num;?>" width="45" size="5"/>
                      <input type="hidden" name="hdID" value="<?php echo $gioHang->listProduct[$i]->id;?>" />
                      </td>
                      <td>
                        <input type="submit" value="Cập nhật số lượng"/>

                      </td>
                      </tr>
                      </form>
                      <?php
                      $tongGia += $row["GiaSanPham"] * $gioHang->listProduct[$i]->num;

               }
           }
           $_SESSION["TongGia"]=$tongGia;
           ?>
           </table></center>
           <div class="pprice">
              <center>Tổng thành tiền: <?php echo $tongGia; ?> đ</center>
           </div>
    <center><a href="pages/GioHang/xlDathang.php">
    <i class="fa fa-shopping-cart"></i>
    </a></center>
  </div>
