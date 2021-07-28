-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jul 2021 pada 20.36
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uastekweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_jadwal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_matkul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `jam` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_awal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_akhir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `kd_jadwal`, `nm_matkul`, `sks`, `jam`, `name`, `hari`, `jam_awal`, `jam_akhir`, `ruangan`, `created_at`, `updated_at`) VALUES
(4, '4', 'Olahraga', 2, 1, 'Alif Zakya Rafiq', 'Rabu', '10:20', '12:00', 'Luar Ruangan', '2021-07-26 11:12:31', '2021-07-26 11:12:31'),
(5, '5', 'Esport', 2, 1, 'M Abdul Azis', 'Rabu', '10:20', '12:00', 'L4 R10', '2021-07-26 11:13:28', '2021-07-26 11:13:28'),
(6, '6', 'Agama', 2, 2, 'Redho Prasetyo', 'Rabu', '13:00', '15:30', 'L4 R8', '2021-07-26 11:14:40', '2021-07-26 11:14:40'),
(7, '7', 'Indonesia', 2, 2, 'Desy Anindita', 'Senin', '09:40', '12:00', 'L4 R7', '2021-07-26 11:16:07', '2021-07-26 11:16:07');

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
(4, '2021_07_23_175209_create_jadwals_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2021_07_24_165610_create_dosens_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('38845442db113b6ea53b7120140222b4a1bba3895d546b145739b89dba58131eb85517a00d0b4e87', 12, 1, 'authToken', '[]', 0, '2021-07-26 10:55:07', '2021-07-26 10:55:07', '2022-07-26 17:55:07'),
('3dea65d3bfa395c97162780818610c0ff5b41a1c893214313f3e82a0d459dbe8618922449eb09b7f', 7, 1, 'authToken', '[]', 0, '2021-07-25 05:26:01', '2021-07-25 05:26:01', '2022-07-25 12:26:01'),
('8a90b81d09e439f1bd14a97af57430f7f33987324f408396da9d497ef6fff36257ed902222f32f84', 10, 1, 'authToken', '[]', 0, '2021-07-26 10:47:15', '2021-07-26 10:47:15', '2022-07-26 17:47:15'),
('9f1c0c93b476e6f0c51aa89599d9fe4152f73fa46c8e88571799cf44afd20c73bf5803d1ba6bed6a', 3, 1, 'authToken', '[]', 0, '2021-07-26 09:42:21', '2021-07-26 09:42:21', '2022-07-26 16:42:21'),
('b084e1cb2c1373758ed4cb41a2a92243ea7a27e61d70b5b212c2998548411948e7b36b6b234af608', 15, 1, 'authToken', '[]', 0, '2021-07-26 11:03:09', '2021-07-26 11:03:09', '2022-07-26 18:03:09'),
('c9ad7a86dc7430ef95d1d3d9dd1cfc592c9cf09b996fd81f77d74fcd511314e0c6a81b964896a9a7', 19, 1, 'authToken', '[]', 0, '2021-07-26 11:17:34', '2021-07-26 11:17:34', '2022-07-26 18:17:34'),
('db25ed6ae0480f183405f91145d015a766c90f6fe1ef6a748ed2b4ae3d3b9f4a15a49175ad0c7b79', 13, 1, 'authToken', '[]', 0, '2021-07-26 10:57:28', '2021-07-26 10:57:28', '2022-07-26 17:57:28'),
('e70eb149294a400555774ba53a1a4b9695b19f1ba2901a0c0a790e57f8524c395176cadd2ccb7b27', 1, 1, 'authToken', '[]', 0, '2021-07-26 10:48:42', '2021-07-26 10:48:42', '2022-07-26 17:48:42'),
('eebe9be53173547680e4fbb47d46590e47c63245ca0bb240a23f495dfb6ebacdc06fe43699f6fecb', 16, 1, 'authToken', '[]', 0, '2021-07-26 11:05:35', '2021-07-26 11:05:35', '2022-07-26 18:05:35'),
('f4cd4a8ee2323415d157ba57ffdf0f96078837659eac85ebc568dc776a9a5b5af25bc2ddb2cebb9f', 14, 1, 'authToken', '[]', 0, '2021-07-26 11:00:20', '2021-07-26 11:00:20', '2022-07-26 18:00:20'),
('f60833a0353a2f2c12a2ad38364a8b03eabcd2b4e278cb00ec0ee0e523ece79fd021c14de6843116', 11, 1, 'authToken', '[]', 0, '2021-07-26 10:52:10', '2021-07-26 10:52:10', '2022-07-26 17:52:10'),
('fd5352de0c7f4a1e4830e661dc3b14c7f87baec0197b4877b6a16470c89db2857e90bb0089d6e3e8', 8, 1, 'authToken', '[]', 0, '2021-07-26 11:16:24', '2021-07-26 11:16:24', '2022-07-26 18:16:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '7wYU0IDzCOuMqya0dUh5lkoPrJTO5pfE7Jdw7e3W', NULL, 'http://localhost', 1, 0, 0, '2021-07-23 17:50:58', '2021-07-23 17:50:58'),
(2, NULL, 'Laravel Password Grant Client', 'tQDkgxxpD0A7c10oKTxV6ZAmnU5wpxif3QiQ6IRp', 'users', 'http://localhost', 0, 1, 0, '2021-07-23 17:50:58', '2021-07-23 17:50:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-07-23 17:50:58', '2021-07-23 17:50:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nip`, `name`, `jk`, `agama`, `alamat`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, '123456', 'M Abdul Azis', 'Laki-laki', 'Islam', 'Cimahi', 'azis@gmail.com', NULL, '$2y$10$jrTYtHhViKvwO375PpQ1ee9y3BeRAg2A05cdPVZ5kOj3yG25d6/T.', NULL, '2021-07-26 10:05:01', '2021-07-26 10:05:33'),
(17, '12345', 'Redho Prasetyo', 'Laki-laki', 'Islam', 'Bangka', 'redho@gmail.com', NULL, '$2y$10$bS22Zb1xuFm7mOQwux4NB.aXn.qg0Lp9eY2S.zA0spkmVhhVbIzhO', NULL, '2021-07-26 11:07:21', '2021-07-26 11:07:21'),
(18, '2468', 'Desy Anindita', 'Perempuan', 'Islam', 'Rancaekek', 'desy@gmail.com', NULL, '$2y$10$nMct8aX8ohtpVX8aP0Hmgu6wOSrNtIwKtGG2VhVb/MIsHEG5.toP6', NULL, '2021-07-26 11:07:43', '2021-07-26 11:07:43'),
(19, '3110', 'Alif Zakya Rafiq', 'Laki-laki', 'Islam', 'Blok Citopeng Rt06 Rw22 No327 Melong Cimahi Selatan 40534', 'alifzakya.r@gmail.com', NULL, '$2y$10$PJhCGHxFgJO5Jp/A3nUkd.ojfODs8KpW6yliI3RqLjfTXOmRIr9Ly', NULL, '2021-07-26 11:17:06', '2021-07-26 11:17:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwals_kd_jadwal_unique` (`kd_jadwal`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
