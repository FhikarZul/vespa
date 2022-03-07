<?php

    include '../config/koneksi.php';

    $kriteria = $_POST['kriteria'];
    $status = $_POST['status'];
    $nilai_standar = $_POST['nilai_standar'];
    $kategori = $_POST['kategori'];

    //cek data sama
    $sql = "SELECT * FROM `tb_kriteria` WHERE `kriteria`='$kriteria'";
	$query = mysqli_query($connect, $sql);       
	$cek = mysqli_num_rows($query);

	if($cek > 0){
        
        header("location:tambah-kriteria.php?m=gagal");

    }else{

        //auto kode kriteria
        $auto_kode = "SELECT * FROM `tb_kriteria`";
        $result_auto_kode=mysqli_query($connect,$auto_kode);
        $result=mysqli_num_rows($result_auto_kode);
        $kode = 'k'.$result;

        //insert kriteria
        $query="INSERT INTO `tb_kriteria`(`kriteria`, `status`, `nilai_standar`, `kode`, `id_kategori`) VALUES ('$kriteria','$status','$nilai_standar','$kode', '$kategori')"; 

        //get total kriteria
        $sql = "SELECT * FROM `tb_kriteria`";
        $result=mysqli_query($connect,$sql);
        $total_kriteria=mysqli_num_rows($result)+1;

        // drop table tb_jawaban_user
        $query_drop=" DROP TABLE `tb_jawaban_user`"; 
        if(mysqli_query($connect, $query_drop)){
            echo '<br>Berhasil drop tb_jawaban_user';
        }

        // drop table penentuan_nilai_standar
        $query_drop=" DROP TABLE `tb_penentuan_nilai_standar`"; 
        if(mysqli_query($connect, $query_drop)){
            echo '<br>Berhasil drop tb_penentuan_nilai_standar';
        }

        // drop table penentuan_nilai_gap
        $query_drop=" DROP TABLE `tb_penentuan_nilai_gap`"; 
        if(mysqli_query($connect, $query_drop)){
            echo '<br>Berhasil drop tb_penentuan_nilai_gap';
        }

        //create table tb_jawaban_user
        $query_create_tb_jawaban_user="CREATE TABLE tb_jawaban_user(id_jawaban int PRIMARY KEY AUTO_INCREMENT, ";

        for($i=1; $i<=$total_kriteria; $i++){

            $query_create_tb_jawaban_user .= " k".$i." int, ";
                
        }

        $query_create_tb_jawaban_user .= "id_alternatif int, id_user int, FOREIGN KEY(id_alternatif) REFERENCES tb_alternatif(id_alternatif), FOREIGN KEY(id_user) REFERENCES tb_user(id_user))";

        if (mysqli_query($connect, $query_create_tb_jawaban_user)){   
                echo '<br>Berhasil create tb_jawaban_user';
        }


        //create table tb_penentuan_nilai_standar
        $query_create_tb_penentuan_nilai_standar="CREATE TABLE tb_penentuan_nilai_standar(id_jawaban int PRIMARY KEY AUTO_INCREMENT, ";

        for($i=1; $i<=$total_kriteria; $i++){

            $query_create_tb_penentuan_nilai_standar .= " k".$i." int, ";
                
        }

        $query_create_tb_penentuan_nilai_standar .= "id_alternatif int, id_user int, FOREIGN KEY(id_alternatif) REFERENCES tb_alternatif(id_alternatif), FOREIGN KEY(id_user) REFERENCES tb_user(id_user))";

        if (mysqli_query($connect, $query_create_tb_penentuan_nilai_standar)){   
                echo '<br>Berhasil create tb_penentuan_nilai_standar';
        }

        //create table tb_penentuan_nilai_gap
        $query_create_tb_penentuan_nilai_gap="CREATE TABLE tb_penentuan_nilai_gap(id_jawaban int PRIMARY KEY AUTO_INCREMENT, ";

        for($i=1; $i<=$total_kriteria; $i++){

            $query_create_tb_penentuan_nilai_gap .= " k".$i." decimal(4,2), ";
                
        }

        $query_create_tb_penentuan_nilai_gap .= "id_alternatif int, id_user int, FOREIGN KEY(id_alternatif) REFERENCES tb_alternatif(id_alternatif), FOREIGN KEY(id_user) REFERENCES tb_user(id_user))";

        if (mysqli_query($connect, $query_create_tb_penentuan_nilai_gap)){   
                echo '<br>Berhasil create tb_penentuan_nilai_gap';
        }






        if (mysqli_query($connect, $query)){   
            echo 'berhasil';
            header("location:kriteria.php");
        
        }
    
    }

   
?>