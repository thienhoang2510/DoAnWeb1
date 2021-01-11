<?php
if (isset($_POST['searchTxt'])) { //nội dung tìm kiếm
    $value = $_POST['searchTxt'];
    $sql = "select * from sanpham where BiXoa = 0 and TenSanPham like '%$value%'";
    $result = DataProvider::ExecuteQuery($sql);
} else {
    $sql = "SELECT * FROM sanpham WHERE BiXoa = 0";
    $result = DataProvider::ExecuteQuery($sql);
    $value = '';
}
?>

<!-- BEGIN RESULT -->
<div class="wrapper m-3">
    <div class="row">
        <div class="col-md-12">
            <h3><i class="fa fa-search"></i> Kết quả</h3>
            <hr>
            </div>
        </div>
    </div>
    <hr>
    <!-- BEGIN DANH SÁCH SẢN PHẨM -->
    <div class="result">
        <h4>Danh sách sản phẩm</h4>
        <hr class="w-50">
        <div class="row" id="data">
            <?php
            // TÌM TỔNG SỐ RECORDS
            $sql = "select count(MaSanPham) as total from sanpham";
            $result = DataProvider::ExecuteQuery($sql);
            $row = mysqli_fetch_array($result);
            $total_records = $row['total'];
            // BƯỚC 3: TÌM LIMIT VÀ CURRENT_PAGE
            $current_page = isset($_GET['page']) ? $_GET['page'] : 1;
            $limit = 9;
            // BƯỚC 4: TÍNH TOÁN TOTAL_PAGE VÀ START
            // tổng số trang
            $total_page = ceil($total_records / $limit);
    
            // Giới hạn current_page trong khoảng 1 đến total_page
            if ($current_page > $total_page){
                $current_page = $total_page;
            }
            else if ($current_page < 1){
                $current_page = 1;
            }
    
            // Tìm Start
            $start = ($current_page - 1) * $limit;
    
            $sql = "select * from sanpham where TenSanPham like '%$value%' LIMIT $start, $limit";
            $result = DataProvider::ExecuteQuery($sql);

            while ($row = mysqli_fetch_array($result)) {
                $itemcard = new ItemCard($row["MaSanPham"], $row["HinhURL"], $row["TenSanPham"], $row["GiaSanPham"]);
                $itemcard->create();
            }
            ?>
        <?php
        include "modules/mPagenumber.php";
        ?>
        </div>

        <!-- Phân trang -->

        <hr class="w-50">

    </div>
</div>
