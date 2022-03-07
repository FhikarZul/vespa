<?php

    include '../config/koneksi.php';

    $id_kategori = $_GET['id'];

    
    $query="DELETE FROM `tb_kategori` WHERE `id_kategori`=".$id_kategori; 

    
    if (mysqli_query($connect, $query)){   
        header("location:kategori.php");
    }
    
?>