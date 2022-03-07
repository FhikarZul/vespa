<?php

    include '../config/koneksi.php';

    $id_gap = $_GET['id'];
    $gap = $_POST['gap'];
    $bobot = $_POST['bobot'];
    $keterangan = $_POST['ket'];
  
    $query="UPDATE `tb_gap` SET `gap`='$gap',`bobot`='$bobot',`ket`='$keterangan' WHERE `id_gap`=".$id_gap; 

    
    if (mysqli_query($connect, $query)){   
        header("location:gap.php");
       
    }
    
?>