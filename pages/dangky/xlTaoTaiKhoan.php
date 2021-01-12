<?php
  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\SMTP;
  use PHPMailer\PHPMailer\Exception;

   session_start();
   include "../../lib/DataProvider.php";
  
  // Load Composer's autoloader
  require '../../vendor/autoload.php';

   if(isset($_POST["us"]))
   {
       $us = $_POST["us"];
       $ps = $_POST["ps"];
       $name = $_POST["name"];
       $add = $_POST["add"];
       $tel = $_POST["tel"];
       $mail = $_POST["mail"];
       $code = generateRandomString();;

       $sql = "SELECT *FROM TaiKhoan WHERE TenDangNhap = '$us'";
       $result = DataProvider::ExecuteQuery($sql);
       $row = mysqli_fetch_array($result);
       if($row != null)
       {
           $curURL = $_SESSION["path"];
           DataProvider::ChangeURL("../../..".$curURL."&err=1");

       }
       else
       {
          $sql = "INSERT INTO TaiKhoan(TenDangNhap,MatKhau,TenHienThi,DiaChi,DienThoai,Email,MaLoaiTaiKhoan,code) 
                  VALUES('$us','$ps','$name','$add','$tel','$mail',1,'$code')";
                    DataProvider::ExecuteQuery($sql);
          $sql1 = "SELECT MaTaiKhoan FROM TaiKhoan WHERE TenDangNhap='$us' AND MatKhau='$ps'";
          $result1 = DataProvider::ExecuteQuery($sql1);
          $row1 = mysqli_fetch_array($result1);

          $id = $row1["MaTaiKhoan"];
          sendEmail($mail,'Kích hoạt tài khoản','Vui lòng click vào link <a href="http://web1:8080/activate.php?id=' . $id . '&code=' . $code . '"> kích hoạt tài khoản.</a>');

          $msg = "Vui lòng xác thực tài khoản trước khi đăng nhập!";
          echo '<script type="text/javascript">alert("' . $msg . '")</script>';

          $newURL = '../../index.php';
          header('Refresh: 0;../../index.php');

       }
   }
   else{
       DataProvider::ChangeURL("../../index.php?layout=404");
   }

   function generateRandomString($length = 10) {
      $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
    return $randomString;
    }

function sendEmail($to, $subject, $content) {
  $mail = new PHPMailer(true);

  try {
      //Server settings
      $mail->isSMTP();                                            // Send using SMTP
      $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
      $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
      $mail->Username   = 'doanwebbanhangltweb@gmail.com';                     // SMTP username
      $mail->Password   = 'tuankiet123';                               // SMTP password
      $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
      $mail->Port       = 587;                                    // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS`  above
      $mail->CharSet    = 'UTF-8';
  
      //Recipients
      $mail->setFrom('doanwebbanhangltweb@gmail.com', 'Host');
      $mail->addAddress($to);     // Add a recipient
  
      // Content
      $mail->isHTML(true);                                  // Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $content;
  
      $mail->send();
      echo 'Message has been sent';
  } catch (Exception $e) {
      echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"; }
}
?>

