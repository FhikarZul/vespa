<?php

    include '../config/koneksi.php';

    $id_kategori = $_GET['id'];
    $kategori = $_POST['kategori'];
  
    $query="UPDATE `tb_kategori` SET `kategori`='$kategori'  WHERE `id_kategori`=".$id_kategori; 

    
    if (mysqli_query($connect, $query)){   
        header("location:kategori.php");
       
    }
    
?>