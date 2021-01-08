<?php
   session_start();
   include "../../lib/DataProvider.php";
   include "../../lib/ShoppingCart.php";

   if(isset($_POST["txtSL"]))
   {
       $sl = $_POST["txtSL"];
       if(is_nan($sl)==false)
       {
           //neu so luong la so thi moi xu ly
           $id = $_POST["hdID"];
           $gioHang = unserialize($_SESSION["GioHang"]);

           if($sl > 0)
           {
               //xu ly cap nhap so luon moi

               $gioHang->update($id, $sl);
               $_SESSION["GioHang"]=serialize($gioHang);

           }
           else
           {
               if($sl == 0)
               {
                   $gioHang->delete($id);
                   $_SESSION["GioHang"]=serialize($gioHang);
               }
           }
           DataProvider::ChangeURL("../../index.php?layout=2");
       }
       else
       {
           //neu so luong moi khong la so thi khong xu ly mac dinh da ve trang qua ly gio hang
           DataProvider::ChangeURL("../../index.php?layout=2");
       }
   }
   else
   {
       DataProvider::ChangeURL("../../index.php?a=404");
    
   }
?>