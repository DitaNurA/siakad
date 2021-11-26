-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2021 pada 04.09
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad_ppl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi_guru`
--

CREATE TABLE `absensi_guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kehadiran_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_card` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_guru` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp_lahir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_hari` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id`, `nama_hari`, `created_at`, `updated_at`) VALUES
(1, 'Senin', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(2, 'Selasa', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(3, 'Rabu', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(4, 'Kamis', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(5, 'Jum\'at', '2021-11-26 02:00:03', '2021-11-26 02:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hari_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ket` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kehadiran`
--

INSERT INTO `kehadiran` (`id`, `ket`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Hadir', '3C0', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(2, 'Izin', '0CF', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(3, 'Bertugas Keluar', 'F90', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(4, 'Sakit', 'FF0', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(5, 'Terlambat', '7F0', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(6, 'Tanpa Keterangan', 'F00', '2021-11-26 02:00:03', '2021-11-26 02:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_mapel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` int(11) NOT NULL,
  `kelompok` enum('A','B','C') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_12_092809_create_hari_table', 1),
(5, '2020_03_12_092854_create_guru_table', 1),
(6, '2020_03_12_092926_create_absensi_guru_table', 1),
(7, '2020_03_12_092941_create_jadwal_table', 1),
(8, '2020_03_12_092953_create_kehadiran_table', 1),
(9, '2020_03_12_093010_create_kelas_table', 1),
(10, '2020_03_12_093018_create_mapel_table', 1),
(11, '2020_03_12_093027_create_nilai_table', 1),
(12, '2020_03_12_093036_create_paket_table', 1),
(13, '2020_03_12_093050_create_pengumuman_table', 1),
(14, '2020_03_12_093102_create_rapot_table', 1),
(15, '2020_03_12_093117_create_ruang_table', 1),
(16, '2020_03_12_093130_create_siswa_table', 1),
(17, '2020_03_16_102220_create_ulangan_table', 1),
(18, '2020_04_07_094355_create_sikap_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kkm` int(11) NOT NULL DEFAULT 70,
  `deskripsi_a` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_b` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_c` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_d` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ket` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `ket`, `created_at`, `updated_at`) VALUES
(1, 'Bisnis kontruksi dan Properti', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(2, 'Desain Permodelan dan Informasi Bangunan', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(3, 'Elektronika Industri', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(4, 'Otomasi Industri', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(5, 'Teknik Pemesinan', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(6, 'Teknik dan Bisnis Sepeda Motor', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(7, 'Rekayasa Perangkat Lunak', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(8, 'Teknik Pengelasan', '2021-11-26 02:00:03', '2021-11-26 02:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opsi` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `opsi`, `isi`, `created_at`, `updated_at`) VALUES
(1, 'pengumuman', 'pengumuman', '2021-11-26 02:00:03', '2021-11-26 02:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rapot`
--

CREATE TABLE `rapot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `p_nilai` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_predikat` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_nilai` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `k_predikat` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `k_deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ruang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`, `created_at`, `updated_at`) VALUES
(1, 'Ruang 01', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(2, 'Ruang 02', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(3, 'Ruang 03', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(4, 'Ruang 04', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(5, 'Ruang 05', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(6, 'Ruang 06', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(7, 'Ruang 07', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(8, 'Ruang 08', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(9, 'Ruang 09', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(10, 'Ruang 10', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(11, 'Ruang 11', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(12, 'Ruang 12', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(13, 'Ruang 13', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(14, 'Ruang 14', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(15, 'Ruang 15', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(16, 'Ruang 16', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(17, 'Ruang 17', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(18, 'Ruang 18', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(19, 'Ruang 19', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(20, 'Ruang 20', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(21, 'Ruang 21', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(22, 'Ruang 22', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(23, 'Ruang 23', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(24, 'Ruang 24', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(25, 'Ruang 25', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(26, 'Ruang 26', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(27, 'Ruang 27', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(28, 'Ruang 28', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(29, 'Ruang 29', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(30, 'Ruang 30', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(31, 'Ruang 31', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(32, 'Ruang 32', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(33, 'Ruang 33', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(34, 'Ruang 34', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(35, 'Ruang 35', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(36, 'Ruang 36', '2021-11-26 02:00:03', '2021-11-26 02:00:03'),
(37, 'Ruang 37', '2021-11-26 02:00:04', '2021-11-26 02:00:04'),
(38, 'Ruang 38', '2021-11-26 02:00:04', '2021-11-26 02:00:04'),
(39, 'Ruang 39', '2021-11-26 02:00:04', '2021-11-26 02:00:04'),
(40, 'Ruang 40', '2021-11-26 02:00:04', '2021-11-26 02:00:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sikap`
--

CREATE TABLE `sikap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `sikap_1` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sikap_2` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sikap_3` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_induk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_siswa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp_lahir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulangan`
--

CREATE TABLE `ulangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `ulha_1` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ulha_2` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uts` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ulha_3` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uas` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Guru','Siswa','Operator') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_induk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `no_induk`, `id_card`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$9HGm9Es.weRNqxgQ9DfS9eqrVZQkD0/WoC0yyBQfSjHlFEpcI8Il.', 'Admin', NULL, NULL, NULL, '2021-11-26 02:00:04', '2021-11-26 02:00:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi_guru`
--
ALTER TABLE `absensi_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rapot`
--
ALTER TABLE `rapot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sikap`
--
ALTER TABLE `sikap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ulangan`
--
ALTER TABLE `ulangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi_guru`
--
ALTER TABLE `absensi_guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rapot`
--
ALTER TABLE `rapot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `sikap`
--
ALTER TABLE `sikap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ulangan`
--
ALTER TABLE `ulangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
