<?php

    include '../config/koneksi.php';

    $id_gap = $_GET['id'];

    
    $query="DELETE FROM `tb_gap` WHERE `id_gap`=".$id_gap; 

    
    if (mysqli_query($connect, $query)){   
        header("location:gap.php");
    }
    
?>