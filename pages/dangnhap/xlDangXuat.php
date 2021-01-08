<?php
include '../../lib/DataProvider.php';
session_start();
session_destroy();
DataProvider::ChangeURL("../../index.php");
?>