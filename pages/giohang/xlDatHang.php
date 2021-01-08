<?php
session_start();
include "../../lib/DataProvider.php";
include "../../lib/ShoppingCart.php";

if(isset($_SESSION["GioHang"]))
{
    $gioHang = unserialize($_SESSION["GioHang"]);
    $maTaiKhoan =$_SESSION["MaTaiKhoan"];

    date_default_timezone_set("Asia/Ho_Chi_Minh");
    $ngayLap=date("Y-m-d H:i:s");
    $ngayLapTam=date("Y-m-d");
    $maTinhTrang = 1;
    $tongGia = $_SESSION["TongGia"];

    //xu ly tao ma don dat hang voi ddmmyyxxx
    $sql = "SELECT MaDonDatHang FROM DonDatHang WHERE NgayLap like '$ngayLapTam%' ORDER BY MaDonDatHang DESC LIMIT 1";
    $result = DataProvider::ExecuteQuery($sql);
    $row = mysqli_fetch_array($result);
    $r="081012003";
    $sttMaDonDatHang = 0;
    if($row != null)
    {
        $sttMaDonDatHang = substr($row["MaDonDatHang"],6,3);
    }
    $sttMaDonDatHang += 1;
    $sttMaDonDatHang = sprintf("%03s",$sttMaDonDatHang);
    $maDonDatHang = date("d").date("m").substr(date("Y"),2,2).$sttMaDonDatHang;

    //tao don dat hang moi va luu xuong csdl bang don dat hang
    $sql = "INSERT INTO DonDatHang(MaDonDatHang,NgayLap,TongThanhTien,MaTaiKhoan,MaTinhTrang) VALUES ('$maDonDatHang','$ngayLap',$tongGia,$maTaiKhoan,$maTinhTrang)";
    DataProvider::ExecuteQuery($sql);
    
    //-------------------------------------------
    //xu ly them chi tiet don hang
    $soluongSanPham = count($gioHang->listProduct);
    for($i = 0;$i < $soluongSanPham; $i++)
    {
        $id = $gioHang->listProduct[$i]->id;
        $sl = $gioHang->listProduct[$i]->num;

        //2.1 lay thong tin san pham: gia san pham , so luong ton
        $sql = "SELECT GiaSanPham, SoLuongTon FROM SanPham WHERE MaSanPham = $id";
        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result);

        $soLuongTonHienTai = $row["SoLuongTon"];
        $giaSanPham = $row["GiaSanPham"];

        $sttChiTietDonDatHang = sprintf("%02s",$i);
        $maChiTietDonDatHang = $maDonDatHang.$sttChiTietDonDatHang;

        //2.2 them 1 dong moi vao bang Chitietdon dathang
        $sql = "INSERT INTO ChiTietDonDatHang(MaChiTietDonDatHang,SoLuong,GiaBan,MaDonDatHang,MaSanPham) VALUES ('$maChiTietDonDatHang',$sl,$giaSanPham,'$maDonDatHang',$id)";
        DataProvider::ExecuteQuery($sql);

        //2.3 update lai so luong ton cua bang san pham
        $soLuongTonMoi = $soLuongTonHienTai - $sl;
        $sql = "UPDATE SanPham SET SoLuongTon = $soLuongTonMoi WHERE MaSanPham=$id";
        DataProvider::ExecuteQuery($sql);
    }
    unset($_SESSION["GioHang"]);
    DataProvider::ChangeURL("../../index.php?layout=2&sub=2");

}
else
         DataProvider::ChangeURL("../../index.php?layout=404");
?>
