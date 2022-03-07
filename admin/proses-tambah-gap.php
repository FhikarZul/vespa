<?php

    include '../config/koneksi.php';

    $gap = $_POST['gap'];
    $bobot = $_POST['bobot'];
    $keterangan = $_POST['ket'];

     //cek data sama
     $sql = "SELECT * FROM `tb_gap` WHERE `gap`='$gap'";
     $query = mysqli_query($connect, $sql);       
     $cek = mysqli_num_rows($query);
 
     if($cek > 0){
         
         header("location:tambah-gap.php?m=gagal");
 
     }else{

        $query="INSERT INTO `tb_gap`(`gap`, `bobot`, `ket`) VALUES ('$gap','$bobot','$keterangan')"; 

    
        if (mysqli_query($connect, $query)){   
            echo 'berhasil';
            header("location:gap.php");
       
        }
    
    }

   
?>