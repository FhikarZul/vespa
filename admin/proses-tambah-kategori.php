<?php

    include '../config/koneksi.php';

    $kategori = $_POST['kategori'];

    //cek data sama
    $sql = "SELECT * FROM `tb_kategori` WHERE `kategori`='$kategori'";
	$query = mysqli_query($connect, $sql);       
	$cek = mysqli_num_rows($query);

	if($cek > 0){
        header("location:tambah-kategori.php?m=gagal");
    }else{

        if(!preg_match("/^[a-zA-Z0-9- ]*$/", $kategori)){
            header("location:tambah-kategori.php?m=symbol_error");
        }else{
            $query="INSERT INTO `tb_kategori`(`kategori`) VALUES ('$kategori')"; 

    
            if (mysqli_query($connect, $query)){   
                echo 'berhasil';
                header("location:kategori.php");
           
            }
        }

        
    }


   
?>