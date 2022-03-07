
<?php

    include '../config/koneksi.php';

    $id_kriteria = $_GET['id'];
    $kriteria = $_POST['kriteria'];
    $status = $_POST['status'];
    $nilai_standar = $_POST['nilai_standar'];
    $kategori = $_POST['kategori'];

    $query="UPDATE `tb_kriteria` SET `kriteria`='$kriteria',`status`='$status',`nilai_standar`='$nilai_standar',`id_kategori`='$kategori' WHERE `id_kriteria`=".$id_kriteria; 


    if (mysqli_query($connect, $query)){   
        header("location:kriteria.php");
    
    }

?>