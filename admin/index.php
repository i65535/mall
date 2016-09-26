<?php



/* 启用session机制 */
@session_start();
$_SESSION['safe_route'] = true;
header('location:../admin.php');
