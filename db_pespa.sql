-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2022 pada 04.53
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pespa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alternatif`
--

CREATE TABLE `tb_alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `alternatif` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_alternatif`
--

INSERT INTO `tb_alternatif` (`id_alternatif`, `alternatif`) VALUES
(1, 'Vespa Tipe 98'),
(2, 'Vespa 98 Series II'),
(3, 'Vespa Circuito 125'),
(4, 'Vespa 125'),
(5, 'Vespa 150 GS'),
(6, 'Vespa 150 GS VS5'),
(7, 'Vespa 150 VBA'),
(8, 'Vespa Kongo 50'),
(9, 'Vespa 90 Super Sprint '),
(10, 'Vespa 125 Primavera'),
(11, 'Vespa 180 Rally'),
(12, 'Vespa 150 Sprint Veloce'),
(13, 'Vespa 50 Special'),
(14, 'Vespa Primavera ET3'),
(15, 'Vespa P150S'),
(16, 'Vespa 150 Exclucive');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gap`
--

CREATE TABLE `tb_gap` (
  `id_gap` int(11) NOT NULL,
  `gap` int(11) DEFAULT NULL,
  `bobot` decimal(2,1) DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_gap`
--

INSERT INTO `tb_gap` (`id_gap`, `gap`, `bobot`, `ket`) VALUES
(1, 0, '5.0', 'Kompetensi Sesuai Kebutuhan'),
(2, 1, '4.5', 'Kompetensi Kelebihan 1 tingkat/level'),
(3, -1, '4.0', 'Kompetensi Kekurangan 1 tingkat/level'),
(4, 2, '3.5', 'Kompetensi Kelebihan 2 tingkat/level'),
(5, -2, '3.0', 'Kompetensi Kekurangan 2 tingkat/level'),
(6, 3, '2.5', 'Kompetensi Kelebihan 3 tingkat/level'),
(7, -3, '2.0', 'Kompetensi Kekurangan 3 tingkat/level'),
(8, 4, '1.5', 'Kompetensi Kelebihan 4 tingkat/level'),
(9, -4, '1.0', 'Kompetensi Kekurangan 4 tingkat/level');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jawaban_user`
--

CREATE TABLE `tb_jawaban_user` (
  `id_jawaban` int(11) NOT NULL,
  `k1` int(11) DEFAULT NULL,
  `k2` int(11) DEFAULT NULL,
  `k3` int(11) DEFAULT NULL,
  `k4` int(11) DEFAULT NULL,
  `k5` int(11) DEFAULT NULL,
  `k6` int(11) DEFAULT NULL,
  `k7` int(11) DEFAULT NULL,
  `k8` int(11) DEFAULT NULL,
  `k9` int(11) DEFAULT NULL,
  `k10` int(11) DEFAULT NULL,
  `k11` int(11) DEFAULT NULL,
  `k12` int(11) DEFAULT NULL,
  `k13` int(11) DEFAULT NULL,
  `k14` int(11) DEFAULT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jawaban_user`
--

INSERT INTO `tb_jawaban_user` (`id_jawaban`, `k1`, `k2`, `k3`, `k4`, `k5`, `k6`, `k7`, `k8`, `k9`, `k10`, `k11`, `k12`, `k13`, `k14`, `id_alternatif`, `id_user`) VALUES
(8, 2, 2, 1, 2, 2, 3, 2, 2, 2, 2, 3, 3, 2, 3, 8, 1),
(9, 1, 2, 2, 2, 3, 3, 2, 3, 3, 2, 3, 1, 3, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Kelengkapan Berkas'),
(2, 'Kondisi Fisik Bodi'),
(3, 'Kondisi Mesin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kriteria` text DEFAULT NULL,
  `status` enum('cf','sf') DEFAULT NULL,
  `nilai_standar` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id_kriteria`, `kriteria`, `status`, `nilai_standar`, `kode`, `id_kategori`) VALUES
(1, 'STNK', 'cf', 3, 'k1', 1),
(2, 'BPKB', 'cf', 3, 'k2', 1),
(3, 'Surat Faktur Motor', 'sf', 2, 'k3', 1),
(4, 'Dek Vespa', 'cf', 3, 'k4', 2),
(5, 'Garpu Depan', 'cf', 3, 'k5', 2),
(6, 'Batok Vespa', 'cf', 3, 'k6', 2),
(7, 'Kaki Vespa', 'sf', 2, 'k7', 2),
(8, 'Tepong Vespa', 'sf', 2, 'k8', 2),
(9, 'Magnet', 'cf', 3, 'k9', 3),
(10, 'Spull', 'cf', 3, 'k10', 3),
(11, 'Karbu', 'sf', 2, 'k11', 3),
(12, 'Penghisapan', 'cf', 3, 'k12', 3),
(13, 'Gir Susun', 'sf', 2, 'k13', 3),
(14, 'Piston', 'sf', 2, 'k14', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai_cf_sf`
--

CREATE TABLE `tb_nilai_cf_sf` (
  `id_nilai` int(11) NOT NULL,
  `cf` decimal(4,2) DEFAULT NULL,
  `sf` decimal(4,2) DEFAULT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_nilai_cf_sf`
--

INSERT INTO `tb_nilai_cf_sf` (`id_nilai`, `cf`, `sf`, `id_alternatif`, `id_user`) VALUES
(93, '4.25', '4.67', 8, 1),
(94, '4.13', '4.75', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai_total`
--

CREATE TABLE `tb_nilai_total` (
  `id_nilai_total` int(11) NOT NULL,
  `nilai_total` decimal(4,2) DEFAULT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_nilai_total`
--

INSERT INTO `tb_nilai_total` (`id_nilai_total`, `nilai_total`, `id_alternatif`, `id_user`) VALUES
(63, '4.38', 8, 1),
(64, '4.32', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penentuan_nilai_gap`
--

CREATE TABLE `tb_penentuan_nilai_gap` (
  `id_jawaban` int(11) NOT NULL,
  `k1` decimal(4,2) DEFAULT NULL,
  `k2` decimal(4,2) DEFAULT NULL,
  `k3` decimal(4,2) DEFAULT NULL,
  `k4` decimal(4,2) DEFAULT NULL,
  `k5` decimal(4,2) DEFAULT NULL,
  `k6` decimal(4,2) DEFAULT NULL,
  `k7` decimal(4,2) DEFAULT NULL,
  `k8` decimal(4,2) DEFAULT NULL,
  `k9` decimal(4,2) DEFAULT NULL,
  `k10` decimal(4,2) DEFAULT NULL,
  `k11` decimal(4,2) DEFAULT NULL,
  `k12` decimal(4,2) DEFAULT NULL,
  `k13` decimal(4,2) DEFAULT NULL,
  `k14` decimal(4,2) DEFAULT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penentuan_nilai_gap`
--

INSERT INTO `tb_penentuan_nilai_gap` (`id_jawaban`, `k1`, `k2`, `k3`, `k4`, `k5`, `k6`, `k7`, `k8`, `k9`, `k10`, `k11`, `k12`, `k13`, `k14`, `id_alternatif`, `id_user`) VALUES
(398, '4.00', '4.00', '4.00', '4.00', '4.00', '5.00', '5.00', '5.00', '4.00', '4.00', '4.50', '5.00', '5.00', '4.50', 8, 1),
(399, '3.00', '4.00', '5.00', '4.00', '5.00', '5.00', '5.00', '4.50', '5.00', '4.00', '4.50', '3.00', '4.50', '5.00', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penentuan_nilai_standar`
--

CREATE TABLE `tb_penentuan_nilai_standar` (
  `id_jawaban` int(11) NOT NULL,
  `k1` int(11) DEFAULT NULL,
  `k2` int(11) DEFAULT NULL,
  `k3` int(11) DEFAULT NULL,
  `k4` int(11) DEFAULT NULL,
  `k5` int(11) DEFAULT NULL,
  `k6` int(11) DEFAULT NULL,
  `k7` int(11) DEFAULT NULL,
  `k8` int(11) DEFAULT NULL,
  `k9` int(11) DEFAULT NULL,
  `k10` int(11) DEFAULT NULL,
  `k11` int(11) DEFAULT NULL,
  `k12` int(11) DEFAULT NULL,
  `k13` int(11) DEFAULT NULL,
  `k14` int(11) DEFAULT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penentuan_nilai_standar`
--

INSERT INTO `tb_penentuan_nilai_standar` (`id_jawaban`, `k1`, `k2`, `k3`, `k4`, `k5`, `k6`, `k7`, `k8`, `k9`, `k10`, `k11`, `k12`, `k13`, `k14`, `id_alternatif`, `id_user`) VALUES
(433, -1, -1, -1, -1, -1, 0, 0, 0, -1, -1, 1, 0, 0, 1, 8, 1),
(434, -2, -1, 0, -1, 0, 0, 0, 1, 0, -1, 1, -2, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pilihan`
--

CREATE TABLE `tb_pilihan` (
  `id_pilihan` int(11) NOT NULL,
  `pilihan` text DEFAULT NULL,
  `bobot` int(11) DEFAULT NULL,
  `id_kriteria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pilihan`
--

INSERT INTO `tb_pilihan` (`id_pilihan`, `pilihan`, `bobot`, `id_kriteria`) VALUES
(60, 'Ada', 2, 1),
(61, 'Tidak Ada', 1, 1),
(62, 'Ada', 2, 2),
(63, 'Tidak Ada', 1, 2),
(64, 'Ada', 2, 3),
(65, 'Tidak Ada', 1, 3),
(66, 'Baik', 3, 4),
(67, 'Kurang Baik', 2, 4),
(68, 'Tidak Baik', 1, 4),
(69, 'Baik', 3, 5),
(70, 'Kurang Baik', 2, 5),
(71, 'Tidak Baik', 1, 5),
(72, 'Baik', 3, 6),
(73, 'Kurang Baik', 2, 6),
(74, 'Tidak Baik', 1, 6),
(75, 'Baik', 3, 7),
(76, 'Kurang Baik', 2, 7),
(77, 'Tidak Baik', 1, 7),
(78, 'Baik', 3, 8),
(79, 'Kurang Baik', 2, 8),
(80, 'Tidak Baik', 1, 8),
(81, 'Baik', 3, 9),
(82, 'Kurang Baik', 2, 9),
(83, 'Tidak Baik', 1, 9),
(84, 'Baik', 3, 10),
(85, 'Kurang Baik', 2, 10),
(86, 'Tidak Baik', 1, 10),
(87, 'Baik', 3, 11),
(88, 'Kurang Baik', 2, 11),
(89, 'Tidak Baik', 1, 11),
(90, 'Baik', 3, 12),
(91, 'Kurang Baik', 2, 12),
(92, 'Tidak Baik', 1, 12),
(93, 'Baik', 3, 13),
(94, 'Kurang Baik', 2, 13),
(95, 'Tidak Baik', 1, 13),
(96, 'Baik', 3, 14),
(97, 'Kurang Baik', 2, 14),
(98, 'Tidak Baik', 1, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` enum('admin','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'penjual', 'penjual', 'user'),
(4, 'admin', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `tb_gap`
--
ALTER TABLE `tb_gap`
  ADD PRIMARY KEY (`id_gap`);

--
-- Indeks untuk tabel `tb_jawaban_user`
--
ALTER TABLE `tb_jawaban_user`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id_kriteria`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_nilai_cf_sf`
--
ALTER TABLE `tb_nilai_cf_sf`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indeks untuk tabel `tb_nilai_total`
--
ALTER TABLE `tb_nilai_total`
  ADD PRIMARY KEY (`id_nilai_total`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_penentuan_nilai_gap`
--
ALTER TABLE `tb_penentuan_nilai_gap`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_penentuan_nilai_standar`
--
ALTER TABLE `tb_penentuan_nilai_standar`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_pilihan`
--
ALTER TABLE `tb_pilihan`
  ADD PRIMARY KEY (`id_pilihan`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_gap`
--
ALTER TABLE `tb_gap`
  MODIFY `id_gap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_jawaban_user`
--
ALTER TABLE `tb_jawaban_user`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai_cf_sf`
--
ALTER TABLE `tb_nilai_cf_sf`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai_total`
--
ALTER TABLE `tb_nilai_total`
  MODIFY `id_nilai_total` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `tb_penentuan_nilai_gap`
--
ALTER TABLE `tb_penentuan_nilai_gap`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT untuk tabel `tb_penentuan_nilai_standar`
--
ALTER TABLE `tb_penentuan_nilai_standar`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT untuk tabel `tb_pilihan`
--
ALTER TABLE `tb_pilihan`
  MODIFY `id_pilihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jawaban_user`
--
ALTER TABLE `tb_jawaban_user`
  ADD CONSTRAINT `tb_jawaban_user_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_jawaban_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD CONSTRAINT `tb_kriteria_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_nilai_cf_sf`
--
ALTER TABLE `tb_nilai_cf_sf`
  ADD CONSTRAINT `tb_nilai_cf_sf_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`);

--
-- Ketidakleluasaan untuk tabel `tb_nilai_total`
--
ALTER TABLE `tb_nilai_total`
  ADD CONSTRAINT `tb_nilai_total_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_nilai_total_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_penentuan_nilai_gap`
--
ALTER TABLE `tb_penentuan_nilai_gap`
  ADD CONSTRAINT `tb_penentuan_nilai_gap_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_penentuan_nilai_gap_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_penentuan_nilai_standar`
--
ALTER TABLE `tb_penentuan_nilai_standar`
  ADD CONSTRAINT `tb_penentuan_nilai_standar_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_penentuan_nilai_standar_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_pilihan`
--
ALTER TABLE `tb_pilihan`
  ADD CONSTRAINT `tb_pilihan_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
