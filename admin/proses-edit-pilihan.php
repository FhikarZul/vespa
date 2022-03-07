<?php

    include '../config/koneksi.php';

    $keterangan = $_POST['keterangan'];
    $bobot = $_POST['bobot'];
    $id_pilihan = $_GET['id'];
    $id_kriteria = $_GET['id_kriteria'];
  
    $query="UPDATE `tb_pilihan` SET `pilihan`='$keterangan',`bobot`='$bobot' WHERE `id_pilihan`=".$id_pilihan; 

    
    if (mysqli_query($connect, $query)){   
        header("location:pilihan-kriteria.php?id=".$id_kriteria);
       
    }
    
?>