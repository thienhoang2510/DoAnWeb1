<?php
include "../../../lib/DataProvider.php";

if (isset($_POST["id"])) {
    $id = $_POST["id"];
    $ten = $_POST["txtTen"];
    $hang = $_POST["cmbHang"];
    $loai = $_POST["cmbLoai"];
    $gia = $_POST["txtGia"];
    $ton = $_POST["txtTon"];
    $ban = $_POST["txtBan"];
    $mota = $_POST["txtMoTa"];

    //ko co hinh
    if (!file_exists($_FILES['fHinh']['tmp_name']) || !is_uploaded_file($_FILES['fHinh']['tmp_name'])) {
        $sql = "UPDATE SanPham SET TenSanPham = '$ten',MaLoaiSanPham=$loai,
        MaHangSanXuat=$hang,GiaSanPham=$gia,SoLuongTon=$ton,SoLuongBan=$ban,
        MoTa='$mota' WHERE MaSanPham = $id";
    } else { //co hinh

        //----BEGIN UPLOAD IMAGE
        $target_dir  = "../../../images/sanpham/";
        $fname = basename($_FILES["fHinh"]["name"]);
        $target_file = $target_dir . $fname;
        $uploadOk = 1; //1ok
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        // Check if image file is a actual image or fake image
        $check = getimagesize($_FILES["fHinh"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }

        // Check if file already exists
        if (file_exists($target_file)) {
            $uploadOk = 0;
        }

        // Check file size
        if ($_FILES["fHinh"]["size"] > 500000) {
            $uploadOk = 0;
        }

        // Allow certain file formats
        if (
            $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif"
        ) {
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 1) {
            // if everything is ok, try to upload file
            if (move_uploaded_file($_FILES["fHinh"]["tmp_name"], $target_file)) {
                echo "The file " . basename($_FILES["fHinh"]["name"]) . " has been uploaded.";
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
        // END UPLOAD IMAGE

        $sql = "UPDATE SanPham SET TenSanPham = '$ten',MaLoaiSanPham=$loai,
        MaHangSanXuat=$hang,GiaSanPham=$gia,SoLuongTon=$ton,SoLuongBan=$ban,
        MoTa='$mota',HinhURL='$fname' WHERE MaSanPham = $id";
    }



    DataProvider::ExecuteQuery($sql);
}

DataProvider::ChangeURL("../../index.php?c=2");
