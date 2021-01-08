<?php
class MiniItemCard {
  public $masp;
  public $url;
  public $tensp;
  public $giasp;

  function __construct($masp,$url,$tensp,$giasp) {
    $this->masp = $masp;
    $this->url = $url;
    $this->tensp = $tensp;
    $this->giasp = $giasp;
  }
  function create() {
    if (isset($_SESSION["MaTaiKhoan"])) 
    {
      $carturl = 'index.php?layout=2&id='.$this->masp;
    }
    else
    {
      $carturl = 'index.php?layout=3';
    }


    echo '<div class="col d-flex align-items-stretch">'. 
    '<div class="card minicard">'. 
    "<a href=\""."index.php?layout=1&content=4&id=".$this->masp."\"><img class=\"card-img-top\" src=\"".'./images/sanpham/'.$this->url."\"></a>". 
    '<div class="card-body">'. 
    "<h6 class=\"card-title text-center\">" .$this->tensp . "</h6>". 
    ' <div class="buy d-flex justify-content-between align-items-center">'. 
    ' <div class="price text-success">'. 
    "<h5 class=\"mt-4\">" . $this->giasp . " vnđ</h5>". 
    ' </div>'. 
    '  </div>'. 
    ' </div>'. 
    '  </div>'. 
    '</div>'
    ;
  }
}

?>