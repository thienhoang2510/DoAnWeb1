<?php

	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\SMTP;
	use PHPMailer\PHPMailer\Exception;

	include "../../lib/DataProvider.php";
	require '../../vendor/autoload.php';

	if(isset($_POST["us"]))
   {
       $us = $_POST["us"];
       $mail = $_POST["mail"];
          sendEmail($mail,'Đổi mật khẩu', 'Click vào link: <a href="http://web1:8080/pages/quenmatkhau/pDoimatkhau.php?us=' . $us . '"> Đổi mật khẩu.</a>');
   }
   else{
       DataProvider::ChangeURL("../../index.php?layout=404");
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
      $msg = "Đã gửi link đổi mật khẩu vào email, vui lòng kiểm tra!";
      echo '<script type="text/javascript">alert("' . $msg . '")</script>';
      $newURL = '../../index.php';
      header('Refresh: 0;../../index.php');
  } catch (Exception $e) {
      echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"; }
}
function phpAlert($msg) {
  echo '<script type="text/javascript">alert("' . $msg . '")</script>';
}
?>
