<?php

    include '../config/koneksi.php';

    $keterangan = $_POST['keterangan'];
    $bobot = $_POST['bobot'];
    $id_kriteria = $_GET['id'];



        $query="INSERT INTO `tb_pilihan`(`pilihan`, `bobot`, `id_kriteria`) VALUES ('$keterangan','$bobot','$id_kriteria')"; 

    
        if (mysqli_query($connect, $query)){   
            echo 'berhasil';
            header("location:pilihan-kriteria.php?id=".$id_kriteria);
       
        }
    


   
?>