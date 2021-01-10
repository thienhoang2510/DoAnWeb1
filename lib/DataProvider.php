<?php
class DataProvider
{
    public static function ExecuteQuery($sql)
    {
        $connection=mysqli_connect('acctive','root','','Shopgiay_db') or
        die("couldn't connect to acctive");
        mysqli_query($connection,"set names 'utf8'");
        $result = mysqli_query($connection,$sql);
        mysqli_close($connection);
        return $result;
    } 
    public static function ChangeURL($path)
    {
        echo'<script type="text/javascript">';
        echo'location="'.$path.'";';
        echo'</script>';
    }
}

?>
