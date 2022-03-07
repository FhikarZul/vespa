<?php

    include '../config/koneksi.php';

    $alternatif = $_POST['alternatif'];

    //cek data sama
    $sql = "SELECT * FROM `tb_alternatif` WHERE `alternatif`='$alternatif'";
	$query = mysqli_query($connect, $sql);       
	$cek = mysqli_num_rows($query);

	if($cek > 0){
        
        header("location:tambah-alternatif.php?m=gagal");

    }else{

        if(!preg_match("/^[a-zA-Z0-9- ]*$/", $alternatif)){
            header("location:tambah-alternatif.php?m=symbol_error");
        }else{
            $query="INSERT INTO `tb_alternatif`(`alternatif`) VALUES ('$alternatif')"; 

            if (mysqli_query($connect, $query)){   
                echo 'berhasil';
                header("location:alternatif.php");
        
            }
        }
    
    }

   
?>