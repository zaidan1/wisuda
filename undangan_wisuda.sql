-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Des 2024 pada 22.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `undangan_wisuda`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'assets/imgs/default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `name`, `email`, `password`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Admin Utama ', 'admin@example.com', '$2y$10$s52qIkHKeWFDyPZSPbdyP.QWU35leszN6p3jhHgRgwn4w0MzCHK5.', 'uploads/foto_profile/675d1bb3a45fa_th (2).jpeg', '2024-10-29 07:19:19', '2024-12-14 05:47:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id_dok` int(11) NOT NULL,
  `file_akte` varchar(255) DEFAULT NULL,
  `file_ijasa` varchar(255) DEFAULT NULL,
  `file_pembayaran` varchar(255) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `tgl_wisuda` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `reason_reject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokumen`
--

INSERT INTO `dokumen` (`id_dok`, `file_akte`, `file_ijasa`, `file_pembayaran`, `create_by`, `created_at`, `status`, `tgl_wisuda`, `waktu`, `reason_reject`) VALUES
(1, '675c113a93e69_akte kelahiran.pdf', '675c113a9403d_ijasah.pdf', '675c113a941be_bukti payment.png', 18, '2024-12-13 10:49:30', 'approved', '2025-02-08', '07:00:00', NULL),
(2, '676effdc35978_Dashboard Admin - Data Wisuda.pdf', '676effdc35b63_Dashboard Admin.pdf', '676effdc35cd4_DALL·E 2024-12-28 00.02.59 - A comic-style image of Soekarno, the first president of Indonesia, standing behind a podium and delivering a speech. He is wearing a black suit with a.jpg', 22, '2024-12-13 10:51:30', 'rejected', '2025-02-08', '07:00:00', 'Jelek'),
(3, '675c12328fc97_akte kelahiran.pdf', '675c12328ff12_ijasah.pdf', '675c12329013d_bukti payment.png', 17, '2024-12-13 10:53:38', 'pending', '2025-02-08', '07:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `fakultas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `fakultas`) VALUES
(1, 'Fakultas Ilmu Komputer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guest`
--

CREATE TABLE `guest` (
  `id_guest` int(11) NOT NULL,
  `kepada` varchar(255) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` enum('Pending','Approved') DEFAULT 'Pending',
  `bukti_pembayaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guest`
--

INSERT INTO `guest` (`id_guest`, `kepada`, `create_by`, `created_at`, `status`, `bukti_pembayaran`) VALUES
(1, 'Orang Tua', 18, '2024-12-13 17:47:58', 'Approved', '1734086878.png'),
(2, 'Bapak Mursyid', 18, '2024-12-13 17:48:53', 'Approved', '1734086933.png'),
(3, 'Ibu Junaidah', 18, '2024-12-13 17:49:08', 'Approved', '1734086948.png'),
(4, 'Bapak Mansur', 22, '2024-12-13 17:51:51', 'Pending', '1734087111.png'),
(5, 'Ibu Marini', 22, '2024-12-13 17:52:20', 'Pending', '1734087140.png'),
(6, 'Gibran Alfi Ananta', 17, '2024-12-13 17:54:05', 'Pending', '1734087245.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(100) DEFAULT NULL,
  `fakultas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `jurusan`, `fakultas_id`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Sistem Informasi', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pengumuman` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `judul`, `pengumuman`, `created_at`) VALUES
(3, 'Pendaftaran wisuda periode XXXIV TA 2024/2025 telah dibuka!', 'Pendaftaran online berlangsung dari 1 Januari 2025 hingga 31 Januari 2025, diikuti unggah berkas hingga 24 Januari 2025. Pengambilan kartu undangan dapat dilakukan di dashboard mahasiswa, dan prosesi wisuda akan dilaksanakan pada 8 Februari 2025 di Aula Hotel Savoy Homann, mulai pukul 07.00 WIB - Selesai. Pastikan semua dokumen lengkap dan diverifikasi sebelum batas waktu. Untuk informasi lebih lanjut, silakan hubungi P. Riski – Administrasi(0823-1476-1638), B. Sirli – Pembiayaan (0852-3735-0325), P. Misdi – Pembagian Toga (0858-1552-8540).', '2024-12-13 12:16:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fakultas` int(11) DEFAULT NULL,
  `jurusan` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `foto_profile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_users`, `nama`, `nim`, `password`, `fakultas`, `jurusan`, `is_admin`, `created_at`, `foto_profile`) VALUES
(1, 'Ine Siti Halimah', '3223009', '$2y$10$SuoYmxxVq5Xybckwq76kw.xbGv.xCwtFxjyDpzlolqJ0hY/7ElPNy', 1, 2, NULL, '2024-12-13 17:29:27', NULL),
(2, 'Firda Milasatty', '3223006', '$2y$10$10ISZY90MJWylSpWe1r5t.8S/xtP1py80a2j90vn69xaVbPxjleW2', 1, 2, NULL, '2024-12-13 17:30:04', NULL),
(3, 'Muhamad Rahayu Sidiq', '3223015', '$2y$10$Hf055l0afclyYwSHi3NHzeOrkP965XMVbMv4vHBMgIAS0zLlksML.', 1, 2, NULL, '2024-12-13 17:30:43', NULL),
(4, ' Neng Najwah', '3223017', '$2y$10$ogbP/Mp9..MpWjMuLICUFOkeS/mH/.zlhMcVu3cwIslzJV3gydjg6', 1, 2, NULL, '2024-12-13 17:31:12', NULL),
(5, 'Sutisna', '3223019', '$2y$10$hJKVIpuyz8nt8QhWgnubUOCfTOTNfc1KTIRHObureHpHlw99gZB.2', 1, 2, NULL, '2024-12-13 17:31:39', NULL),
(6, 'Syahri Ibnu Istnaeni', '3223020', '$2y$10$fbmxg4KbPQo0K5gxFQsD8.eY1NFsTFgvxYZFYR1fisg0uIyCBnLD.', 1, 1, NULL, '2024-12-13 17:33:18', NULL),
(7, 'Zaidan Muhammad Turmudzi', '3223022', '$2y$10$8qxt2zTp5JQUNpscjB/QMOUtrQz4e4mo61K0J37tyohUD4dPvECDK', 1, 1, NULL, '2024-12-13 17:33:39', NULL),
(8, 'Rifa Ibtisam', '3223707', '$2y$10$.P5xuuj1C4SKBpPLyXEXyegeQoV0dAjGi1vgFCk3N9IumCrJzq8Vy', 1, 1, NULL, '2024-12-13 17:34:05', NULL),
(9, 'Fahmi Ramdani', '3223023', '$2y$10$iFJOt1vBoKYgNyG5MvutSe4R.EG7aOf9U2Bsk8r8ACh716YW/cJf6', 1, 1, NULL, '2024-12-13 17:34:25', NULL),
(10, 'Rochmat Faizal Gumelar', '3222013', '$2y$10$pIWH/yFfssk/tw94tqvh5..3Gh1DloQKBwls3knjiNeYkCF3UT0xC', 1, 1, NULL, '2024-12-13 17:34:45', NULL),
(11, ' Ririn Marlina', '3222016', '$2y$10$ja5GVAyhbrttkMmwudO60uekTjqSbLJfJL4Id2uB/8vUd7EjZrrqy', 1, 1, NULL, '2024-12-13 17:35:51', NULL),
(12, 'Tia Setiawati', '3222019', '$2y$10$xwvGBot8WWvjhQMe9ozsRO9uzqXLZq8h12.fJvSgHp.tPyBfr.GjC', 1, 1, NULL, '2024-12-13 17:36:11', NULL),
(13, 'Daryat', '3222021', '$2y$10$ErwX9MKL8qzCBEugHttXw.8EzqEfoTdDxov5GrykhNd4.zUh57Tea', 1, 1, NULL, '2024-12-13 17:36:31', NULL),
(14, 'Muhamad Fauzi Putra Pratama', '3222024', '$2y$10$n2IQTuFYRaxzhzvIx2KQsOfJR4D4R0B8MnlY4ovbeELoyqw2Gu9aS', 1, 1, NULL, '2024-12-13 17:36:58', NULL),
(15, 'Gibran Alfi Ananta', '3222039', '$2y$10$Er8bSg3V22DswRVuWPRnUufLTuSV7yTKIg7LjuQYN5hcJgSf1T1Pu', 1, 2, NULL, '2024-12-13 17:37:22', NULL),
(16, ' Awaludin Farhan', '3222041', '$2y$10$SGJJIhULMJtBmu1Q2NP7c.F2yPam0mx.2HlBaFgNVksuJYnoRdOTW', 1, 1, NULL, '2024-12-13 17:37:43', NULL),
(17, ' Leyka Aura Febrianty', '3222047', '$2y$10$BgvPb7pWyX5RtlPUiYmOWuHPHEaqeJE8dsJHiK3jKLPsSZDcMHrk.', 1, 2, NULL, '2024-12-13 17:38:01', 'uploads/foto_profile/675d1afb2a914_th (7).jpeg'),
(18, 'Elfa Arselawati ', '3222056', '$2y$10$ueDJEZN6QPp4YGOcaY/0Ne/kF0O74f7KzUYm0Q6pYN3SqcR11RM3O', 1, 2, NULL, '2024-12-13 17:38:20', 'uploads/foto_profile/675d1a12284dd_th (6).jpeg'),
(19, 'Effi Agung Mulyana', '3223027', '$2y$10$sXGNV/pll1TGD1rGDvAUpOvD0mHqPl2oV5sA3BTjsi13EMxsmPoyO', 1, 1, NULL, '2024-12-13 17:38:44', NULL),
(20, 'Rama Ichsan Hidayat', '3223028', '$2y$10$4zKj0aSNwinHR8cGV4e7hORsuxt8btqFr2wVWxl4/eJ2ryVCXhoaK', 1, 2, NULL, '2024-12-13 17:39:09', NULL),
(21, 'Yusfi Anugrah', '3220039', '$2y$10$.XVAR8teGr9NMhFR/oNE9OrEahIe5uX/maBdsTQvfTVtP7YLWATJG', 1, 1, NULL, '2024-12-13 17:39:33', NULL),
(22, 'Moch Adi Nizar', '3223703', '$2y$10$0HQuvYUr7dXtLEScSnVzYOj2T1foewhy2SVyj8nUJz4iO8bJHRnNO', 1, 2, NULL, '2024-12-13 17:39:51', 'uploads/foto_profile/675d1a2da6f20_th.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id_dok`),
  ADD KEY `create_by` (`create_by`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indeks untuk tabel `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id_guest`),
  ADD KEY `create_by` (`create_by`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`),
  ADD KEY `fakultas_id` (`fakultas_id`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `fakultas` (`fakultas`),
  ADD KEY `jurusan` (`jurusan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id_dok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `guest`
--
ALTER TABLE `guest`
  MODIFY `id_guest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `users` (`id_users`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `users` (`id_users`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `fk_jurusan_fakultas` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id_fakultas`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_jurusan_users` FOREIGN KEY (`jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
