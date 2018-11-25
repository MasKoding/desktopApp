-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Nov 2018 pada 16.41
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penggajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `no_absensi` varchar(4) NOT NULL,
  `tgl_absensi` date NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `jml_hadir` int(2) NOT NULL,
  `jml_tdk_hdr` int(2) NOT NULL,
  `jml_lembur` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`no_absensi`, `tgl_absensi`, `keterangan`, `jml_hadir`, `jml_tdk_hdr`, `jml_lembur`) VALUES
('A001', '2018-08-05', 'Tepat waktu', 1, 0, 0),
('A002', '2018-08-06', 'Telat', 2, 0, 1),
('A003', '2018-08-06', 'Tepat waktu', 1, 0, 0),
('A004', '2018-08-08', 'Telat', 3, 0, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `kd_akun` varchar(3) NOT NULL,
  `nm_akun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`kd_akun`, `nm_akun`) VALUES
('223', 'depri'),
('887', 'Dimas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bagian_karyawan`
--

CREATE TABLE `bagian_karyawan` (
  `kode_bagian` varchar(5) NOT NULL,
  `bagian` varchar(30) NOT NULL,
  `gaji_harian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bagian_karyawan`
--

INSERT INTO `bagian_karyawan` (`kode_bagian`, `bagian`, `gaji_harian`) VALUES
('B001', 'Manager', 500000),
('B002', 'Logistik', 250000),
('B003', 'Programmer', 6000000),
('B004', 'Supervisor', 9000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailabsensi`
--

CREATE TABLE `detailabsensi` (
  `id_karyawan` varchar(5) NOT NULL,
  `no_absensi` varchar(4) NOT NULL,
  `jam_masuk` time(6) NOT NULL,
  `jam_keluar` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detailabsensi`
--

INSERT INTO `detailabsensi` (`id_karyawan`, `no_absensi`, `jam_masuk`, `jam_keluar`) VALUES
('K0001', 'A001', '08:00:00.000000', '16:00:00.000000'),
('K0001', 'A002', '08:01:00.000000', '17:00:00.000000'),
('K0002', 'A003', '07:55:00.000000', '16:00:00.000000'),
('K0001', 'A004', '09:00:00.000000', '17:00:00.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jurnal`
--

CREATE TABLE `detail_jurnal` (
  `no_jurnal` varchar(9) NOT NULL,
  `kd_akun` varchar(3) NOT NULL,
  `debet` int(8) NOT NULL,
  `kredit` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `no_slip` varchar(11) NOT NULL,
  `tgl_slip` date NOT NULL,
  `upah_lembur` int(6) NOT NULL,
  `tunj_hadir` int(7) NOT NULL,
  `uang_makan` int(6) NOT NULL,
  `uang_transport` int(6) NOT NULL,
  `bonus` int(7) NOT NULL,
  `Jht` int(6) NOT NULL,
  `total_gaji` int(7) NOT NULL,
  `id_karyawan` varchar(5) NOT NULL,
  `no_absensi` varchar(4) NOT NULL,
  `no_kasbon` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`no_slip`, `tgl_slip`, `upah_lembur`, `tunj_hadir`, `uang_makan`, `uang_transport`, `bonus`, `Jht`, `total_gaji`, `id_karyawan`, `no_absensi`, `no_kasbon`) VALUES
('S00001', '2018-08-04', 15000, 100000, 300000, 150000, 200000, 71500, 186678500, 'K0002', 'A003', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `no_jurnal` varchar(5) NOT NULL,
  `tgl_jurnal` varchar(10) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `no_slip` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(5) NOT NULL,
  `nm_karyawan` varchar(25) NOT NULL,
  `kd_bagian` varchar(5) NOT NULL,
  `bagian` varchar(15) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `status` varchar(20) NOT NULL,
  `gaji_harian` int(6) NOT NULL,
  `jen_kel` varchar(20) NOT NULL,
  `ttl` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nm_karyawan`, `kd_bagian`, `bagian`, `alamat`, `no_hp`, `status`, `gaji_harian`, `jen_kel`, `ttl`) VALUES
('K0001', 'Dimas Priyandi', 'B001', 'Manager', 'bogor rt01', '0897867867', 'Belum Menikah', 500000, 'Laki-Laki', '28/10/1997'),
('K0002', 'depri', 'B003', 'Programmer', 'bogor', '088728782983', 'Belum Menikah', 6000000, 'Laki-Laki', '28/10/1997');

-- --------------------------------------------------------

--
-- Struktur dari tabel `potongan`
--

CREATE TABLE `potongan` (
  `no_kasbon` varchar(5) NOT NULL,
  `tgl_kasbon` date NOT NULL,
  `jml_kasbon` int(7) NOT NULL,
  `id_karyawan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `potongan`
--

INSERT INTO `potongan` (`no_kasbon`, `tgl_kasbon`, `jml_kasbon`, `id_karyawan`) VALUES
('P0001', '2018-08-05', 30000, 'K0002'),
('P0002', '2018-08-07', 20000, 'K0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `nm_user` varchar(25) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `password` varchar(10) NOT NULL,
  `hak_akses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `nm_user`, `alamat`, `password`, `hak_akses`) VALUES
('U001', 'admin', 'bogor', 'admin', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`no_absensi`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kd_akun`);

--
-- Indexes for table `bagian_karyawan`
--
ALTER TABLE `bagian_karyawan`
  ADD PRIMARY KEY (`kode_bagian`);

--
-- Indexes for table `detailabsensi`
--
ALTER TABLE `detailabsensi`
  ADD KEY `no_absensi` (`no_absensi`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`no_slip`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`no_jurnal`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`no_kasbon`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
