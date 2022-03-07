<?php

    session_start();
    include 'config/koneksi.php';

    $id_user = $_SESSION['id_user'];

    $sql_kriteria = "SELECT * FROM `tb_kriteria`";
    $result_kriteria=mysqli_query($connect,$sql_kriteria);
    $total_kriteria=mysqli_num_rows($result_kriteria);

    $sql_jawaban_user = "SELECT * FROM `tb_jawaban_user`";
    $result_jawaban_user=mysqli_query($connect,$sql_jawaban_user);
    $total_jawaban_user=mysqli_num_rows($result_jawaban_user);

    //penentuan nilai standar
    $query_delete = "DELETE FROM `tb_penentuan_nilai_standar` WHERE `id_user`=".$id_user;
    if (mysqli_query($connect, $query_delete)){   
        echo 'clear tb_penentuan_nilai_standar<br>';
    }

    for($i=1; $i<=$total_jawaban_user; $i++){
        //get jawaban user
        $sql = "SELECT * FROM `tb_jawaban_user` WHERE `id_user`=".$id_user;
        $query = mysqli_query($connect, $sql);

        while ($row = mysqli_fetch_array($query)){

            //query builder tb_penentuan_nilai_standar
            $query_insert_nilai_standar="INSERT INTO `tb_penentuan_nilai_standar`(";
            for($i=1; $i<=$total_kriteria; $i++){
                $query_insert_nilai_standar .= " `k".$i."`, ";
            }
            $query_insert_nilai_standar .= "`id_alternatif`, `id_user` ) VALUES (";


            for($i=1; $i<=$total_kriteria; $i++){
                
                $nilai_standar;
                //get nilai standar    
                $sql_nilai_standar = "SELECT * FROM `tb_kriteria` WHERE `kode`='".('k'.$i)."'";
                $query_nilai_standar = mysqli_query($connect, $sql_nilai_standar);

                while ($row_nilai_standar = mysqli_fetch_array($query_nilai_standar)){
                    $nilai_standar = $row_nilai_standar['nilai_standar'];
                }


                //query builder tb_penentuan_nilai_standar
                $query_insert_nilai_standar .= "'".$row['k'.$i]-$nilai_standar."',";
                
            }

            //query builder tb_penentuan_nilai_standar
            $query_insert_nilai_standar .= " '".$row['id_alternatif']."', '$id_user')";

            if (mysqli_query($connect, $query_insert_nilai_standar)){   
                echo 'berhasil insert tb_penentuan_nilai_standar';
               
            }
        }
        
    }

    echo '<br>';
    echo '<br>';

    //penentuan nilai gap
    $query_delete = "DELETE FROM `tb_penentuan_nilai_gap` WHERE `id_user`=".$id_user;
    if (mysqli_query($connect, $query_delete)){   
        echo 'clear tb_penentuan_nilai_gap<br>';
    }
    for($i=1; $i<=$total_jawaban_user; $i++){
        //get nilai standar
        $sql = "SELECT * FROM `tb_penentuan_nilai_standar` WHERE `id_user`=".$id_user;
        $query = mysqli_query($connect, $sql);

        while ($row = mysqli_fetch_array($query)){

            //query builder tb_penentuan_nilai_gap
            $query_insert_nilai_gap="INSERT INTO `tb_penentuan_nilai_gap`(";
            for($i=1; $i<=$total_kriteria; $i++){
                $query_insert_nilai_gap .= " `k".$i."`, ";
            }
            $query_insert_nilai_gap .= "`id_alternatif`, `id_user` ) VALUES (";


            for($i=1; $i<=$total_kriteria; $i++){
                
                $nilai_gap;
                //get nilai standar    
                $sql_nilai_gap = "SELECT * FROM `tb_gap` WHERE `gap`='".$row['k'.$i]."'";
                $query_nilai_gap = mysqli_query($connect, $sql_nilai_gap);

                while ($row_nilai_gap = mysqli_fetch_array($query_nilai_gap)){
                    $nilai_gap = $row_nilai_gap['bobot'];
                }

                echo $nilai_gap.' ';

                //query builder tb_penentuan_nilai_gap
                $query_insert_nilai_gap .= "'".$nilai_gap."',";
                
            }

            //query builder tb_penentuan_nilai_gap
            $query_insert_nilai_gap .= " '".$row['id_alternatif']."', '$id_user')";

            if (mysqli_query($connect, $query_insert_nilai_gap)){   
                echo 'berhasil insert tb_penentuan_nilai_gap';
               
            }

            echo '<br>';
        }
        
    }


    echo '<br>';

    //penentuan nilai cf dan sf
    $query_delete = "DELETE FROM `tb_nilai_cf_sf` WHERE `id_user`=".$id_user;
    if (mysqli_query($connect, $query_delete)){   
        echo 'clear tb_nilai_cf_sf<br>';
    }


    $sql_total_cf = "SELECT * FROM `tb_kriteria` WHERE `status`='cf'";
    $result_total_cf=mysqli_query($connect,$sql_total_cf);
    $total_cf=mysqli_num_rows($result_total_cf);
    echo 'CF: '.$total_cf.'<br>';

    $sql_total_sf = "SELECT * FROM `tb_kriteria` WHERE `status`='sf'";
    $result_total_sf=mysqli_query($connect,$sql_total_sf);
    $total_sf=mysqli_num_rows($result_total_sf);
    echo 'SF: '.$total_sf.'<br>';

    echo '<br>';
    
    $sql_nilai_penentuan_nilai_gap = "SELECT * FROM `tb_penentuan_nilai_gap`";
    $query_nilai_penentuan_nilai_gap = mysqli_query($connect, $sql_nilai_penentuan_nilai_gap);     
    
    
    while ($row_nilai_penentuan_nilai_gap = mysqli_fetch_array($query_nilai_penentuan_nilai_gap)){
        
        $nilai_cf = 0;
        $nilai_sf = 0;

        for($i=1; $i<=$total_kriteria; $i++){
           
            $sql = "SELECT * FROM `tb_kriteria` WHERE `kode`='k".$i."'";
            $query = mysqli_query($connect, $sql);

            while ($row = mysqli_fetch_array($query)){
                if($row['status']=='cf'){
                    $nilai_cf = $nilai_cf + $row_nilai_penentuan_nilai_gap['k'.$i];
                    echo 'CF '.$row_nilai_penentuan_nilai_gap['k'.$i];
                    echo '<br>';
                    
                }else{
                    $nilai_sf = $nilai_sf + $row_nilai_penentuan_nilai_gap['k'.$i];
                    echo 'SF '.$row_nilai_penentuan_nilai_gap['k'.$i];

                    echo '<br>';
                    
                }
            }  
            
            
        }

        $alternatif = $row_nilai_penentuan_nilai_gap['id_alternatif'];
        $nilai_total_cf = $nilai_cf/$total_cf;
        $nilai_total_sf = $nilai_sf/$total_sf;

        echo 'Total CF: '.$nilai_total_cf." ";
        echo 'Total CF: '.$nilai_total_sf;
        echo '<br>';
        echo '<br>';


        $query="INSERT INTO `tb_nilai_cf_sf`(`cf`, `sf`, `id_alternatif`, `id_user`) VALUES ('$nilai_total_cf','$nilai_total_sf','$alternatif','$id_user')"; 

        if (mysqli_query($connect, $query)){   
            echo 'berhasil insert nilai cf dan sf';
        }
        

    }

    //nilai total
    $query_delete = "DELETE FROM `tb_nilai_total` WHERE `id_user`=".$id_user;
    if (mysqli_query($connect, $query_delete)){   
        echo 'clear tb_nilai_total<br>';
    }
    $sql_nilai_cf_sf = "SELECT * FROM `tb_nilai_cf_sf`";
    $query_nilai_cf_sf = mysqli_query($connect, $sql_nilai_cf_sf);     
    while ($row_nilai_cf_sf = mysqli_fetch_array($query_nilai_cf_sf)){
        
        $id_alternatif = $row_nilai_cf_sf['id_alternatif'];
        $nilai_total = ((70/100) * $row_nilai_cf_sf['cf']) + ((30/100) * $row_nilai_cf_sf['sf']);

        $query="INSERT INTO `tb_nilai_total`(`nilai_total`, `id_alternatif`, `id_user`) VALUES ('$nilai_total','$id_alternatif','$id_user')"; 

    
        if (mysqli_query($connect, $query)){   
            echo 'berhasil insert nilai total';
       
        }
    }

   
    
    //hilangkan ini untuk melihat proses
    echo '<script> location.replace("hasil-analisa.php"); </script> ';


?>