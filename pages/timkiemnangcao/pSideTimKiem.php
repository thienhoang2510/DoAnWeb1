<div class="wrapper sidebartknc mt-3 mb-3">

    <h4 class="grid-title"><i class="fa fa-filter"></i>Tìm kiếm nâng cao</h4>
    <hr class="m-1">

    <form action="pages/timkiemnangcao/xlTimKiem.php" name="frmTimKiem" id="frmTimKiem" method="post">
        <!-- BEGIN SEARCH INPUT (AJAX)-->
        <div class="input-group py-2">
            <input type="text" name="txtTenSP" class="form-control" placeholder="Tên sản phẩm">
            <div class="input-group-append">
                <button onclick="timkiemnangcao()" id="tknc" class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <!-- END SEARCH INPUT -->

        <!-- BEGIN FILTER BY money -->
        <?php
        $sql = "SELECT * FROM sanpham order by GiaSanPham asc limit 1";
        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result)
        ?>

        <h5>Theo giá:</h5>
        Từ
        <div class="">
            <input name="minprice" id="minprice" type="text" placeholder="<?php echo $row["GiaSanPham"]; ?>" class="form-control">
        </div>

        <?php
        $sql = "SELECT * from sanpham order by GiaSanPham desc limit 1";
        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result)
        ?>

        Đến
        <div class="">
            <input name="maxprice" type="text" placeholder="<?php echo $row["GiaSanPham"]; ?>" class="form-control">
        </div>
        <!-- END FILTER BY money -->


        <!-- BEGIN FILTER BY LOẠI -->
        <h5>Theo loại sản phẩm:</h5>

        <?php
        $sql = "SELECT * FROM loaisanpham";
        $result = DataProvider::ExecuteQuery($sql);
        ?>

        <div class="list-group">
            <?php
            while ($row = mysqli_fetch_array($result)) {
            ?>
                <div class="checkbox list-group-item p-1">
                    <label><input value="<?php echo $row["MaLoaiSanPham"]; ?>" type="checkbox" name="cbloai[]" class="icheck"> <?php echo $row["TenLoaiSanPham"]; ?></label>
                </div>
            <?php
            }
            ?>
        </div>
        <!-- END FILTER BY LOẠI -->


        <!-- BEGIN FILTER BY HÃNG -->
        <h5>Theo hãng sản phẩm:</h5>

        <?php
        $sql = "select * from hangsanxuat";
        $result = DataProvider::ExecuteQuery($sql);
        ?>

        <div class="list-group">
            <?php
            while ($row = mysqli_fetch_array($result)) {
            ?>
                <div class="checkbox list-group-item p-1">
                    <label><input value="<?php echo $row["MaHangSanXuat"]; ?>" type="checkbox" name="cbhang[]" class="icheck"> <?php echo $row["TenHangSanXuat"]; ?></label>
                </div>
            <?php
            }
            ?>
        </div>

        <!-- END FILTER BY HÃNG -->

    </form>
</div>