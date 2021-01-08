<?php
include "../../lib/DataProvider.php";
include "../../lib/ItemCard.php";
//default sql query
$query = "SELECT * FROM SanPham";
//--default sql query
//get default min price
$sql = "select * from SanPham order by GiaSanPham asc limit 1";
$result = DataProvider::ExecuteQuery($sql);
$row = mysqli_fetch_array($result);
$minprice = $row["GiaSanPham"];
//----
//get default max price
$sql = "select * from SanPham order by GiaSanPham desc limit 1";
$result = DataProvider::ExecuteQuery($sql);
$row = mysqli_fetch_array($result);
$maxprice = $row["GiaSanPham"];
//----
//BEGIN SET GIA
if (isset($_POST["minprice"]) && is_numeric($_POST["minprice"])) {
    $minprice = $_POST["minprice"];
}
if (isset($_POST["maxprice"]) && is_numeric($_POST["maxprice"])) {
    $maxprice = $_POST["maxprice"];
}
$query .= " where GiaSanPham >= $minprice and GiaSanPham <=$maxprice";
//END SET GIA
//LOAI SAN PHAM
if (isset($_POST["cbloai"])) {
    $sqlWhere = implode(' OR MaLoaiSanPham=', $_POST["cbloai"]);
    $query .= " AND (MaLoaiSanPham=" . $sqlWhere. ')';
}
//HANG SAN XUAT
if (isset($_POST["cbhang"])) {
    $sqlWhere = implode(' OR MaHangSanXuat=', $_POST["cbhang"]);
    $query .= " AND (MaHangSanXuat=" . $sqlWhere . ')';
}
//TEN SAN PHAM LIKE
if (isset($_POST["txtTenSP"])) {
    $query .= " AND (TenSanPham like " ."'%". $_POST["txtTenSP"] . "%'" . ')' ;
}
$result = DataProvider::ExecuteQuery($query);
$data = array();
while ($row = mysqli_fetch_array($result)) {
    $itemcard = new ItemCard($row["MaSanPham"], $row["HinhURL"], $row["TenSanPham"], $row["GiaSanPham"]);
    $itemcard->create();
}
