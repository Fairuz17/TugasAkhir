-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jun 2021 pada 18.41
-- Versi server: 8.0.23
-- Versi PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barang_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `ukuran` varchar(11) NOT NULL,
  `stock` int NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `jenis_barang`, `merk_barang`, `ukuran`, `stock`, `harga`) VALUES
(102, 'Keramik Golongan A', 'Roman', '20 x 20', 10, 87000),
(104, 'Keramik Warna Mudaa', 'Arwana', '20 x 20', 970, 37500),
(105, 'Keramik Pure ', 'Milan', '50 x 50', 540, 94500),
(107, 'Marmer', 'Sejahtera', '40 x 40', 45, 120000),
(108, 'Keramik Golongan B', 'Viva', '30 x 30', 5000, 45000),
(110, 'Ubin', 'Makmur', '10 x 50', 100, 20000),
(112, 'Marmer bagus', 'Pro', '60 x 60', 50, 56000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int NOT NULL,
  `nama_pembeli` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_barang` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_beli` int NOT NULL,
  `total_harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `nama_supplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `no_telp` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jenis_supplier` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_barang` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telp`, `alamat`, `jenis_supplier`, `id_barang`) VALUES
(1, 'Rojikin', '0816381779455', 'Selorejo Mojowarno No 11', 'Keramik Golongan A', 102),
(2, 'Bowo', '085788908654', 'Jl Mancilan Menganto no 77', 'Keramik Pure Color', 105),
(3, 'Bowo', '085788908654', 'Jl Mancilan Menganto no 77', 'Keramik Warna Tua', 104),
(4, 'Wisnu', '03215564321', 'Jl. Raya Ujung Kulon No 10 Mojosari', 'Keramik Golongan B Merk Viva', 108),
(5, 'Wisnu', '03215564321', 'Jl. Raya Ujung Kulon No 10 Mojosari', 'Marmer Merk Sejahtera', 107);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nama_pembeli` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int NOT NULL,
  `no_telp` int NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `kondisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nama_pembeli`, `password`, `role`, `no_telp`, `alamat`, `kondisi`) VALUES
('aaa', '111', 1, 1, '', 0),
('admin', 'admin', 2, 0, '', 0),
('asd', '111', 1, 0, '', 0),
('carl_jonson', '123', 1, 1, '', 0),
('qwe', 'qwe', 1, 1, '', 0),
('root', '123', 1, 1, '', 0),
('TA', '123', 1, 2147483647, 'jalan jalan ke pasar', 0),
('user', 'user', 1, 2147483647, 'Jl. Temanggung No 5 Purwokerto', 0),
('userbaru', '123', 1, 1111, 'dasda', 0),
('we', '123', 1, 1111, 'Jl. Temanggung No 5 Purwokerto', 0),
('zsdfsf', '0987', 1, 0, 'afaefaef', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nama_pembeli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
