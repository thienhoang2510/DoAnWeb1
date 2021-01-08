<nav class="navbar navbar-expand-sm bg-danger navbar-dark fixed-top">
  <div class="container-fluid">
    <!-- Brand/logo -->
    <a class="navbar-brand mr-auto" href="index.php">Quản trị quyền</a>


    <div class="text-white">
      <a href="../index.php">Trang chủ</a>
    </div>

    <!-- Links -->
    <div class="navbar-nav ml-auto">
      <?php
      if (isset($_SESSION["MaTaiKhoan"])) {
      ?>

        <div class="username"><?php echo "Hello, " . $_SESSION["TenHienThi"];  ?></div> 
        <div class="nav-icon">

          <div class="dropdown">
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <form class="p-2 text-secondary" action="">

                <div class="dropdown-divider mt-0"></div>

                <a href="../pages/dangnhap/xlDangXuat.php">Đăng xuất</a>
              </form>
            </div>
          </div>
        </div>

      <?php
      } else {
        DataProvider::ChangeURL("../index.php");
      }

      ?>
    </div>
  </div>
</nav>