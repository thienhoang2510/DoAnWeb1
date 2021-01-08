<div class="wrapper mt-4">
    <h3>Thông tin chi tiết sản phẩm</h3>

    <?php
    
    if (isset($_GET["id"]))
        $id = $_GET["id"];
    else
        DataProvider::ChangeURL("index.php?layout=404");

    $sql = "SELECT s.MaSanPham, s.TenSanPham, s.GiaSanPham,s.SoLuongTon, s.SoLuocXem, s.HinhURL, s.MoTa, h.TenHangSanXuat, l.TenLoaiSanPham,s.MaLoaiSanPham From
SanPham s, HangSanXuat h, LoaiSanPham l where s.BiXoa=0 and s.MaHangSanXuat=h.MaHangSanXuat and s.MaLoaiSanPham=l.MaLoaiSanPham and s.MaSanPham=$id";
    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);

    if ($row == null)
        DataProvider::ChangeURL("index.php?layout=404");

    ?>

    <div class="row my-4 chitietsp">
        <div class="col-lg-6 col-md-6 mb-6 chitietleft">
            <img class="img-fluid" src="images/sanpham/<?php echo $row["HinhURL"]; ?>">
            <div id="mota">
                <?php echo $row["MoTa"]; ?>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 mb-6 chitietright">
            <div>
                <span class="label">Tên sản phẩm:</span>
                <span class="productname"><?php echo $row["TenSanPham"]; ?></span>
            </div>
            <div>
                <span class="label">Giá:</span>
                <span class="price"><?php echo $row["GiaSanPham"]; ?>đ</span>
            </div>
            <div>
                <span class="label">Hãng sản xuất:</span>
                <span class="factory"><?php echo $row["TenHangSanXuat"]; ?></span>
            </div>
            <div>
                <span class="label">Loại sản phẩm:</span>
                <span class="data"><?php echo $row["TenLoaiSanPham"]; ?></span>
            </div>
            <div>
                <span class="label">Số Lượng:</span>
                <span class="data"><?php echo $row["SoLuongTon"]; ?> sản phẩm</span>
            </div>
            <div>
                <span class="label">Số lượt xem:</span>
                <span class="data"><?php echo $row["SoLuocXem"] + 1; ?> lượt</span>
            </div>
            <div>

            </div>

            <div class="giohang">
                <?php
                                                        if (isset($_SESSION["MaTaiKhoan"])) {
                ?>
                    <a href="index.php?layout=2&id=<?php echo $row["MaSanPham"]; ?>" class="btn btn-danger mt-3"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a>
                <?php

                                                        }
                ?>
            </div>
        </div>


        <div class="col-12 mt-3">
            <hr>
            <h4>Sản phẩm liên quan</h4>
            <hr class="w-50">
            <div class="row">
                <?php
                                                        //cập nhập lại số lược xem vào csdl
                                                        $SoLuocXem = $row["SoLuocXem"] + 1;
                                                        $sql = "UPDATE SanPham SET SoLuocXem=$SoLuocXem where MaSanPham=$id";
                                                        DataProvider::ExecuteQuery($sql);

                                                        //san pham lien quan
                                                        require_once 'lib/MiniItemCard.php';
                                                        $maloai = $row["MaLoaiSanPham"];
                                                        $sql = "select * from SanPham s join LoaiSanPham l on s.MaLoaiSanPham = l.MaLoaiSanPham where s.BiXoa = 0 and s.MaSanPham !=$id and s.MaLoaiSanPham = $maloai limit 5";
                                                        $result = DataProvider::ExecuteQuery($sql);
                                                        while ($row2 = mysqli_fetch_array($result)) {
                                                            $itemcard = new MiniItemCard($row2["MaSanPham"], $row2["HinhURL"], $row2["TenSanPham"], $row2["GiaSanPham"]);
                                                            $itemcard->create();
                                                        }

                ?>
            </div>
        </div>
    </div>


</div>