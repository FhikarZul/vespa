<?php

    include 'config/koneksi.php';
    session_start();
    
    $id_user = $_SESSION['id_user'];
    $id_penilaian = $_GET['id'];

    $query="DELETE FROM `tb_nilai_total` WHERE `id_user`='$id_user'";

    if (mysqli_query($connect, $query)){   
        header("location:riwayat.php");
     }
?>