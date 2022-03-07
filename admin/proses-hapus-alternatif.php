<?php

    include '../config/koneksi.php';

    $id_alternatif = $_GET['id'];

    
    $query="DELETE FROM `tb_alternatif` WHERE `id_alternatif`=".$id_alternatif; 

    
    if (mysqli_query($connect, $query)){   
        header("location:alternatif.php");
    }
    
?>