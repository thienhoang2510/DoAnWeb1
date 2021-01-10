

<style type="text/css">
  *{ 
            margin: 2px;
            padding: 2px;
            box-sizing: border-box;
    }
    .right {
            text-align: right;
        }
        .center {
            border-style: solid;
            margin-left: auto;
            margin-right: auto;
        }

        
</style>

<div style="text-align: center">
            
            <pre>
            
            
            
            <h1>.:TẠO TÀI KHOẢN MỚI:.</h1>
            </pre>
            <hr>
        </div>
<div>
<form action="pages/dangky/xlTaoTaiKhoan.php" method="post" onsubmit="return KiemTra()">

    <table style="width: auto" class="center">
                    <tr>
                        <th class="right">
                        <div>
                            <span class="lable">Tên đăng nhập:</span>
                            <input type="text" id="us" name="us"/>
                            <span class="err" id="eUS"></span>
                        </div>
                        </th>
                    </tr>

                    <tr>
                        <th class="right">
                        <div>
                            <span class="lable">Mật Khẩu:</span>
                            <input type="password" id="ps" name="ps"/>
                            <span class="err" id="ePS"></span>
                        </div>
                        </th>
                    </tr>

                    <tr>
                        <th class="right">
                            <div>
                                <span class="lable">Nhập lại mật khẩu:</span>
                                <input type="password" id="us" name="rps"/>
                                <span class="err" id="eRPS"></span>
                            </div>
                         </th>
                    </tr>

                    <tr>
                        <th class="right"> 
                            <div>
                                 <span class="lable">Tên hiển thị:</span>
                                 <input type="text" id="name" name="name"/>
                                 <span class="err" id="eNAME"></span>
                            </div>
                        </th>
                    </tr>


                    <tr>
                        <th class="right">
                            <div>
                                <span class="lable">Địa chỉ:</span>
                                <input type="text" id="add" name="add"/>
                                <span class="err" id="eADD"></span>
                            </div>
                        </th>
                    </tr>

                    <tr>
                        <th class="right">
                            <div>
                                <span class="lable">Điện thoại:</span>
                                <input type="text" id="tel" name="tel"/>
                                <span class="err" id="eTEL"></span>
                            </div>
                        </th>
                    </tr>
     
                    <tr>
                        <th class="right">
                            <div>
                               <span class="lable">Email:</span>
                                <input type="text" id="mail" name="mail"/>
                                <span class="err" id="eMail"></span>
                            </div>
                        </th>
                    </tr>


                    <tr>
                        <th class="right">
                            <div>
                                <span class="lable"></span>
                                <input type="submit" value="Đăng ký"/>     
                            </div>
                        </th>
                    </tr>
                </table>
    </form>
</div>
<script type="text/javascript">
    function KiemTra(){
        var co=true;
        var control = document.getElementById('us');
        var err = document.getElementById('eUS');
        if(control.value=="")
        {
            co = false;
            err.innerHTML = "Tên đăng nhập không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }

        control=document.getElementById('ps');
        err.document.getElementById('ePS');
        if(control.value=="")
        {
            co = false;
            err.innerHTML="Mật khẩu không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }

        control1=documennt.getElementById('rps');
        err=document.getElementById('eRPS');
        if(control.value != control1.value)
        {
            co = false;
            err.innerHTML = "Nhập lại mật khẩu không trùng";
        }
        else
        {
            err.innerHTML="";
        }

        control=document.getElementById('name');
        err.document.getElementById('eNAME');
        if(control.value=="")
        {
            co = false;
            err.innerHTML="Tên hiển thị không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }

        control=document.getElementById('add');
        err.document.getElementById('eADD');
        if(control.value=="")
        {
            co = false;
            err.innerHTML="Địa chỉ không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }

        control=document.getElementById('tel');
        err.document.getElementById('eTEL');
        if(control.value=="")
        {
            co = false;
            err.innerHTML="Số điện thoại không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }

        control=document.getElementById('mail');
        err.document.getElementById('eMail');
        if(control.value=="")
        {
            co = false;
            err.innerHTML="Email không được rỗng";
        }
        else
        {
            err.innerHTML="";
        }
        
        return co;
    }
</script>
<?php
     if(isset($_GET["err"]))
     {
         ?>
         <div>
         <span class="err">Tên đăng nhập đã tồn tại</span>
         </div>
         <?php
     }
  ?>
