-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Apr 2024 pada 07.21
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_resto_xirpl_nino`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `kategori` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `kategori`) VALUES
(2, 'Minuman'),
(8, 'Dessert');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `idkategori` int(11) DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`idmenu`, `nama_menu`, `deskripsi`, `harga`, `foto`, `idkategori`, `update_at`, `created_at`) VALUES
(13, 'es teh', 'seger', 3000, '20231123033158es teh1.jpeg', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'bakso', 'bakso enak', 15000, '20240123070531bakso1.jpeg', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'eskrim', 'enak', 10000, '20240305081432download (11)2.jpeg', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderdetail`
--

CREATE TABLE `orderdetail` (
  `idorderdetail` int(11) NOT NULL,
  `idorder` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orderdetail`
--

INSERT INTO `orderdetail` (`idorderdetail`, `idorder`, `idmenu`, `jumlah`, `harga`, `keterangan`) VALUES
(1, 3, 13, 1, 3000, ''),
(2, 4, 13, 1, 3000, ''),
(3, 5, 13, 1, 3000, ''),
(4, 6, 13, 2, 3000, ''),
(5, 6, 15, 2, 15000, ''),
(6, 7, 13, 2, 3000, ''),
(7, 8, 13, 2, 3000, ''),
(8, 9, 13, 1, 3000, ''),
(9, 9, 16, 2, 10000, ''),
(10, 10, 15, 1, 15000, ''),
(11, 11, 13, 3, 3000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `idorder` int(11) NOT NULL,
  `idpelanggan` int(11) DEFAULT NULL,
  `idpetugas` int(11) DEFAULT NULL,
  `tglorder` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` double DEFAULT NULL,
  `bayar` double DEFAULT NULL,
  `kembali` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`idorder`, `idpelanggan`, `idpetugas`, `tglorder`, `total`, `diskon`, `pajak`, `bayar`, `kembali`) VALUES
(8, 4, NULL, '2024-03-05', NULL, NULL, NULL, NULL, NULL),
(9, 1, NULL, '2024-03-05', NULL, NULL, NULL, NULL, NULL),
(10, 1, NULL, '2024-03-05', 15000, 0, 1650, 0, -15000),
(11, 1, NULL, '2024-03-05', 104000, 0, 11440, 0, -104000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `status` enum('aktif','suspend') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `alamat`, `no_hp`, `username`, `password`, `status`) VALUES
(1, 'Nino', '', '0895703355533', 'Nino', '$2y$10$8e.XJa2ZgzY4ItECvmx8OeOMp1BxPBujm6ufWcpVMLAaQA/GnQ4Vy', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `idpetugas` int(11) NOT NULL,
  `nama_petugas` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` enum('kasir','dapur','manager','owner') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`idpetugas`, `nama_petugas`, `alamat`, `no_hp`, `username`, `password`, `role`) VALUES
(13, 'Nino', 'JL. Sultan Agung 69', '0895703355533', 'Nino', '$2y$10$y2J.2qGM89ohErod9z1.qe8ohCb9.nWhqAgd2ixYmvhZi.tqIQZMq', 'owner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indeks untuk tabel `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`idorderdetail`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorder`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`idpetugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `idorderdetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `idpetugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
