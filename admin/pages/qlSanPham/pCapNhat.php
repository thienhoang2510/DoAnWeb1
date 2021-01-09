<?php
if (!isset($_GET["id"]))
    DataProvider::ChangeURL("index.php?c=404");

$id = $_GET["id"];
$sql = "SELECT s.MaSanPham, s.TenSanPham, s.HinhURL, s.GiaSanPham, s.NgayNhap, s.SoLuongTon, s.SoLuongBan, s.SoLuocXem, s.MoTa, s.BiXoa, l.TenLoaiSanPham,
     s.MaHangSanXuat, h.TenHangSanXuat, s.MaLoaiSanPham  FROM SanPham s, LoaiSanPham l, HangSanXuat h WHERE s.MaLoaiSanPham = l.MaLoaiSanPham AND s.MaHangSanXuat = h.MaHangSanXuat AND s.MaSanPham = $id";
$result = DataProvider::ExecuteQuery($sql);
$row = mysqli_fetch_array($result);
?>
<form action="pages/qlSanPham/xlCapNhat.php" method="post" onsubmit="return KiemTra();" enctype="multipart/form-data">
    <fieldset class="ThemSanPham">
        <legend class="border-bottom w-50">Cập nhật thông tin sản phẩm</legend>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Tên sản phẩm</span>
            </div>
            <input type="text" name="txtTen" id="txtTen" value="<?php echo $row["TenSanPham"]; ?>" />
            <o id="errTen"></i>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Hãng sản xuất</span>
            </div>
            <select name="cmbHang">
                <?php
                $sql = "SELECT *FROM HangSanXuat WHERE BiXoa = 0";
                $result = DataProvider::ExecuteQuery($sql);
                while ($row1 = mysqli_fetch_array($result)) {
                ?>
                    <option value="<?php echo $row1["MaHangSanXuat"]; ?>" <?php if ($row["MaHangSanXuat"] == $row1["MaHangSanXuat"]) echo "selected";
                                                                            ?>><?php echo $row1["TenHangSanXuat"]; ?></option>
                <?php
                }
                ?>
            </select>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Loại sản phẩm</span>
            </div>
            <select name="cmbLoai">
                <?php
                $sql = "SELECT *FROM LoaiSanPham WHERE BiXoa = 0";
                $result = DataProvider::ExecuteQuery($sql);
                while ($row1 = mysqli_fetch_array($result)) {
                ?>
                    <option value="<?php echo $row1["MaLoaiSanPham"]; ?>" <?php if ($row["MaLoaiSanPham"] == $row1["MaLoaiSanPham"]) echo "selected";
                                                                            ?>><?php echo $row1["TenLoaiSanPham"]; ?></option>
                <?php
                }
                ?>
            </select>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Hình</span>
            </div>
            <input type="file" name="fHinh" /><br />
            <img class="img-thumbnail" src="../images/sanpham/<?php echo $row["HinhURL"]; ?>" width="75" />
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Giá</span>
            </div>
            <input type="text" name="txtGia" id="txtGia" value="<?php echo $row["GiaSanPham"]; ?>" />
            <i id="errGia"></i>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Số lượng tồn</span>
            </div>
            <input type="text" name="txtTon" id="txtTon" value="<?php echo $row["SoLuongTon"]; ?>" />
            <i id="errTon"></i>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Số lượng bán</span>
            </div>
            <input type="text" name="txtBan" id="txtBan" value="<?php echo $row["SoLuongBan"]; ?>" />
            <i id="errBan"></i>
        </div>
        <div class="input-group mb-1">
            <div class="input-group-prepend">
                <span class="input-group-text">Mô tả</span>
            </div>
            <textarea rows="5" name="txtMoTa"><?php echo $row["MoTa"]; ?></textarea>
        </div>
        <div>
            <input type="hidden" name="id" value="<?php echo $row["MaSanPham"]; ?>" />
            <input class="btn btn-primary" type="submit" value="Cập nhật" />
        </div>
    </fieldset>
</form>
<script type="text/javascript">
    function KiemTra() {
        var ten = document.getElementById("txtTen");
        var err = document.getElementById("error");
        if (ten.value == "") {
            err.innerHTML = "Tên sản phẩm không được rỗng";
            ten.focus();
            return false;
        } else
            err.innerHTML = "";

        var ten = document.getElementById("txtGia");
        var err = document.getElementById("errGia");
        if (ten.value == "") {
            err.innerHTML = "Giá sản phẩm không được rỗng";
            ten.focus();
            return false;
        } else
            err.innerHTML = "";

        var ten = document.getElementById("txtTon");
        var err = document.getElementById("errTon");
        if (ten.value == "") {
            err.innerHTML = "Số lượng tồn không được rỗng";
            ten.focus();
            return false;
        } else
            err.innerHTML = "";

        return true;
    }
</script>