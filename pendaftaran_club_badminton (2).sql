-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Feb 2024 pada 02.57
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendaftaran_club_badminton`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'linar', 'linar123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usia` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `email`, `password`, `usia`) VALUES
(122000, 'Yusup Dwi S.', 'Laki-Laki', '2007-02-09', 'KP. Pos Kidul RT 01 RW 17', 'yusupdwisaputra072@gmail.com', 'yusuppp012', 17),
(123000, 'Shalman Alfharizi', 'Laki-Laki', '2007-02-04', 'KP. Pojok Kumagai RT 03 RW 12', 'Shalman.a.@gmail.com', 'shalmann22', 17),
(124000, 'Pasya Muhammad Rizky', 'Laki-Laki', '2007-04-16', 'Batujajar Regency Blok J No 12', 'Pasyaa.M.rizky@gmail.com', 'pasyaa015', 17),
(125000, 'Anastasya Putri Ananda', 'Perempuan', '2006-02-04', 'Permata Regency Blok H No 33', 'anastasyaanandaa.p@gmail.com', 'tasya111', 17);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `danggota`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `danggota` (
`nama` varchar(50)
,`jenis_kelamin` varchar(50)
,`kategori` varchar(50)
,`usia` int(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_usia`
--

CREATE TABLE `kategori_usia` (
  `id` int(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `usia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori_usia`
--

INSERT INTO `kategori_usia` (`id`, `kategori`, `usia`) VALUES
(121000, 'Remaja', 17),
(122000, 'Remaja', 16),
(123000, 'Remaja', 16),
(124000, 'Remaja', 16),
(125000, 'Remaja', 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelatih`
--

CREATE TABLE `pelatih` (
  `id_pelatih` int(50) NOT NULL,
  `nama_pelatih` varchar(50) NOT NULL,
  `no_telepon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelatih`
--

INSERT INTO `pelatih` (`id_pelatih`, `nama_pelatih`, `no_telepon`) VALUES
(11111, 'Bagas Pratama', '082124352265'),
(11121, 'Putri', '082215442897'),
(11131, 'Asep Palpale', '081234119866`'),
(11141, 'Bambang Susanto', '081256789976'),
(11151, 'Sunandar Gunawan', '0881243556894');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(50) NOT NULL,
  `tanggal_pendaftaran` date NOT NULL,
  `status_pendaftaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `tanggal_pendaftaran`, `status_pendaftaran`) VALUES
(121000, '2023-08-01', 'sukses'),
(122000, '2023-08-01', 'sukses'),
(123000, '2023-08-01', 'sukses'),
(124000, '2023-08-01', 'sukses'),
(125000, '2023-08-01', 'sukses');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vstatus`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vstatus` (
`id` int(50)
,`nama` varchar(50)
,`jenis_kelamin` varchar(50)
,`tanggal_lahir` date
,`tanggal_pendaftaran` date
,`status_pendaftaran` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `danggota`
--
DROP TABLE IF EXISTS `danggota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `danggota`  AS SELECT `anggota`.`nama` AS `nama`, `anggota`.`jenis_kelamin` AS `jenis_kelamin`, `kategori_usia`.`kategori` AS `kategori`, `kategori_usia`.`usia` AS `usia` FROM (`anggota` join `kategori_usia` on(`anggota`.`id` = `kategori_usia`.`id`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `vstatus`
--
DROP TABLE IF EXISTS `vstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vstatus`  AS SELECT `anggota`.`id` AS `id`, `anggota`.`nama` AS `nama`, `anggota`.`jenis_kelamin` AS `jenis_kelamin`, `anggota`.`tanggal_lahir` AS `tanggal_lahir`, `pendaftaran`.`tanggal_pendaftaran` AS `tanggal_pendaftaran`, `pendaftaran`.`status_pendaftaran` AS `status_pendaftaran` FROM (`anggota` join `pendaftaran` on(`pendaftaran`.`id` = `anggota`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_usia`
--
ALTER TABLE `kategori_usia`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelatih`
--
ALTER TABLE `pelatih`
  ADD PRIMARY KEY (`id_pelatih`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652625508;

--
-- AUTO_INCREMENT untuk tabel `kategori_usia`
--
ALTER TABLE `kategori_usia`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125001;

--
-- AUTO_INCREMENT untuk tabel `pelatih`
--
ALTER TABLE `pelatih`
  MODIFY `id_pelatih` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11152;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125001;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
