<?php
include "config/classDB.php";
if (isset($_POST['register'])) {
    extract($_POST);
    $pass = password_hash($password, PASSWORD_DEFAULT);
    $ins = $dbo->insert("pelanggan", "null,'$nama_pelanggan','$alamat','$no_hp','$username','$pass','1'");
    if ($ins) {
        echo "<script>alert('Register Berhasil!! Silakan Login');location.href='login.php';</script>";
    } else {
        echo "<script>alert('Register Gagal!! Periksa Data Anda');location.href='register.php';</script>";
    }
}
?>