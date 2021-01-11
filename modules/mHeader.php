<?php
$layout = 1;
if (isset($_GET["layout"]))
$layout = $_GET["layout"];
$side = 1;
if (isset($_GET["side"]))
$side = $_GET["side"];
?>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.php"><strong>Shoes Store</strong></a>
<a href="index.php">
                                <img src="imgs/logo/logo.jpg" width=50px height=50px alt="Logo">
                            </a>
    <!-- mobile button  -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!-- /mobile button  -->

    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav mx-auto">
        <li class="nav-item">
          <!--active class  -->
          <a class="nav-link<?php if($layout==1&&$side!=2) echo " active"; ?>" href="index.php">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link<?php if($layout==1&&$side==2) echo " active"; ?>" href="index.php?layout=1&side=2&content=5">Sản phẩm</a>
        </li>
      </ul>
    </div>


    <div class="nav-icons-container d-flex align-items-center justify-content-between">
      <div class="nav-icon">


        <form class="input-group" action="index.php?layout=1&side=2&content=5" method="post">
          <input type="text" class="form-control" placeholder="Search" name="searchTxt">
          <div class="input-group-append">
            <button class="btn btn-info" type="submit"><i class="fa fa-search"></i></button>
          </div>
        </form>


      </div>



      <?php
      if (isset($_SESSION["MaTaiKhoan"])) {
      ?>

        <div class="username"><?php echo "Hello, " . $_SESSION["TenHienThi"];  ?></div>,
        <div class="nav-icon">

          <div class="dropdown">
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <form class="p-2 text-secondary" action="">



                <?php
                if ($_SESSION["MaLoaiTaiKhoan"] == 2) {
                ?>
                  <a href="./admin/index.php">Quyền Admin</a>
                <?php
                }

                ?>
                <div class="dropdown-divider mt-0"></div>

                <a href="./pages/dangnhap/xlDangXuat.php">Đăng xuất </a>
              </form>



            </div>
          </div>
        </div>

      <?php
      } else {
      ?>
        <div class="nav-icon">

          <div class="username">Người dùng</div>

        </div>

        <div class="nav-icon">
          <div class="dropdown">
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <form class="p-2 text-secondary" method="POST" action="./pages/dangnhap/xlDangNhap.php">
                <div class="form-group">
                  <input name="username" type="text" class="form-control" placeholder="Nhập tên tài khoản" required>
                </div>
                <div class="form-group">
                  <input name="password" type="password" class="form-control" placeholder="Nhập mật khẩu" required>
                </div>
                <button type="submit" class="btn btn-primary my-2">Đăng nhập!</button>
              </form>
              <div class="dropdown-divider mt-0"></div>
              <a class="dropdown-item" href="./index.php?layout=3">Đăng ký tài khoản</a>
              <a class="dropdown-item" href="./index.php?layout=4">Quên mật khẩu</a>

            </div>
          </div>
        </div>

      <?php

      }

      ?>



      <?php
      if (isset($_SESSION["sosanpham"])) #neu co san pham trong gio
      {
        $soSanPham = $_SESSION["sosanpham"];
      } else {
        $soSanPham = 0;
      }
      #hien thi badge so luong sp ở dưới
      ?>


      <div class="nav-icon">

        <div class="dropdown">
          <a href="./index.php?layout=2">
            <i class="fa fa-shopping-cart"></i>
            <span class="badge"><?php echo $soSanPham ?></span>
          </a>


        </div>
      </div>
    </div>

  </div>

  </div>

</nav>
