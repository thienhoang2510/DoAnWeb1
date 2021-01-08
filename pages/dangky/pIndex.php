<?php
   $sub = 1;
   if(isset($_GET["sub"]))
   $sub = $_GET["sub"];

   switch ($sub) {
      case 1:
         include "pages/dangky/pTaoTaiKhoan.php";
      break;
      default:
      DataProvider::ChangeURL("index.php?layout=404");
   break;

   }
?>