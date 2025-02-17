<?php
// Hubungkan ke database
include 'admin/db_connnection.php';

// Ambil data pengumuman dari tabel pengumuman
$query = "SELECT judul, pengumuman FROM pengumuman ORDER BY created_at ASC";
$result = mysqli_query($koneksi, $query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Home</title>
    <script id="www-widgetapi-script" src="https://s.ytimg.com/yts/jsbin/www-widgetapi-vflS50iB-/www-widgetapi.js" async=""></script>
    <link rel="stylesheet preload" as="style" href="assets/css/preload.min.css" />
    <link rel="stylesheet preload" as="style" href="assets/css/icomoon.css" />
    <link rel="stylesheet preload" as="style" href="assets/css/libs.min.css" />
    <link rel="stylesheet" href="assets/css/index.css" />
</head>

<body>
    <div class="promobar d-flex align-items-center">
        <div class="container d-flex align-items-center justify-content-between">
            <ul class="promobar_socials d-flex align-items-center">
                <li class="promobar_socials-item">
                    <a class="link" href="https://www.facebook.com/BandungSTMIK/?locale=id_ID" target="_blank" rel="noopener noreferrer">
                        <i class="icon-facebook"></i>
                    </a>
                </li>
                <li class="promobar_socials-item">
                    <a class="link" href="https://www.instagram.com/stmikbandung" target="_blank" rel="noopener noreferrer">
                        <i class="icon-instagram"></i>
                    </a>
                </li>
                <li class="promobar_socials-item">
                    <a class="link" href="https://www.youtube.com/@stmikbandung113" target="_blank" rel="noopener noreferrer">
                        <i class="icon-youtube-play"></i>
                    </a>
                </li>
                <li class="promobar_socials-item">
                    <a class="link" href="https://www.linkedin.com/company/stmik-bandung/" target="_blank" rel="noopener noreferrer">
                        <i class="icon-linkedin-brands"></i>
                    </a>
                </li>
            </ul>
            <div class="promobar_main d-flex align-items-center">
                <a class="btn btn--yellow" href="register.php">
                    <span>Daftar</span>
                </a>
                <a class="btn btn--blue" href="login.php">
                    <span>Masuk</span>
                </a>
            </div>
        </div>
    </div>
    <header class="header" data-page="home">
        <div class="container d-flex flex-wrap justify-content-between align-items-center">
            <div class="logo header_logo">
                <a class="d-lg-table" href="index.php">
                    <span class="logo_picture">
                        <img src="assets/img/logo_1.png" alt="STMIK" />
                    </span>
                </a>
            </div>
            <nav class="header_nav collapse" id="headerMenu">
                <ul class="header_nav-list">
                    <li class="header_nav-list_item">
                        <a class="nav-item" href="#home" data-page="home">Home</a>
                    </li>
                    <li class="header_nav-list_item">
                        <a class="nav-item" href="#persyaratan" data-page="about">Persyaratan</a>
                    </li>
                    <li class="header_nav-list_item">
                        <a class="nav-item" href="#pengunguman" data-page="pricing">Pengunguman</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- homepage content start -->
    <main>
        <!-- hero section start -->
        <section class="hero" id="home">
            <div class="container d-lg-flex align-items-center">
                <div class="hero_content">
                    <h1 class="hero_content-header" data-aos="fade-up">PENDAFTARAN WISUDA STMIK BANDUNG</h1>
                    <div class="hero_content-rating d-flex flex-column flex-sm-row align-items-center">
                        <p class="text" data-aos="fade-left">1000 orang sudah wisuda, Kamu Kapan?</p>
                    </div>
                    <p class="hero_content-text" data-aos="fade-up" data-aos-delay="50">
                        Ayo, Kami mengundang Anda untuk bergabung dalam acara wisuda yang akan
                        menjadi tonggak penting dalam perjalanan pendidikan Anda. Ini adalah saatnya
                        untuk merayakan pencapaian dan semua kerja keras yang telah Anda lakukan!
                    </p>
                    <div class="hero_content-action d-flex flex-wrap">
                        <a class="btn btn--gradient" href="login.php" data-aos="fade-left">
                            <span class="text">Daftar Sekarang</span>
                        </a>
                    </div>
                </div>
                <div class="hero_media col-lg-6">
                    <img src="assets/img/wisuda.jpg" alt="wisuda">
                </div>
            </div>
        </section>
        <!-- hero section end -->

        <!-- features section start -->
        <div class="features" id="persyaratan">
            <div class="container">
                <div class="popular_header">
                    <h2 class="popular_header-title" data-aos="fade-up">Persyaratan</h2>
                    <p class="popular_header-text" data-aos="fade-down">
                        Diberitahukan kepada seluruh calon wisudawan/wisudawati bahwa untuk mengikuti upacara wisuda, wajib memenuhi persyaratan sebagai berikut:
                    </p>
                </div>
                <ul class="features_list d-md-flex flex-wrap">
                    <li class="features_list-item col-md-4" data-order="1" data-aos="fade-up">
                        <div class="card">
                            <div class="content">
                                <div class="card_media">
                                    <i class="icon-user-graduate-solid icon"></i>
                                </div>
                                <div class="card_main">
                                    <h5 class="card_main-title">Foto Copy Ijazah</h5>
                                    <p class="card_main-text">
                                        Menyiapkan Foto Copy Ijazah Terakhir 1 Lembar
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="features_list-item col-md-4" data-order="2" data-aos="fade-up">
                        <div class="card">
                            <div class="content">
                                <div class="card_media">
                                    <i class="icon-globe-solid icon"></i>
                                </div>
                                <div class="card_main">
                                    <h5 class="card_main-title">Bukti Pembayaran</h5>
                                    <p class="card_main-text">
                                        Melampirkan Bukti Pembayaran Biaya Wisuda Dari Bagian Keuangan
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="features_list-item col-md-4" data-order="3" data-aos="fade-up">
                        <div class="card">
                            <div class="content">
                                <div class="card_media">
                                    <i class="icon-headset-solid icon"></i>
                                </div>
                                <div class="card_main">
                                    <h5 class="card_main-title">Akte Kelahiran</h5>
                                    <p class="card_main-text">
                                        Menyiapkan akta kelahiran 1 Lembar
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- Info Nomor Rekening -->
            <div class="rekening" id="info-rekening">
                <div class="container">
                    <div class="popular_header">
                        <h2 class="popular_header-title" data-aos="fade-up">Info Nomor Rekening</h2>
                        <p class="popular_header-text" data-aos="fade-down">
                            Untuk pembayaran biaya wisuda, harap transfer ke nomor rekening berikut:
                        </p>
                    </div>
                    <div class="rekening_card d-flex justify-content-center">
                        <div class="card col-md-6" style="border: 1px solid #ddd; padding: 20px; border-radius: 8px; background: #f9f9f9; text-align: left;">
                            <div class="card_logo">
                                <img src="assets/img/BNI_logo.png" alt="Logo BNI" style="max-width: 100px; margin-bottom: 15px;">
                            </div>
                            <div class="card_main" style="font-size: 20px;">
                                <p><strong>Bank :</strong> BNI</p>
                                <p><strong>Nomor Rekening :</strong> 22 733 5108 8</p>
                                <p><strong>Atas Nama :</strong> STMIK Bandung</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Info Nomor Rekening End -->
            <!-- features section end -->

            <!-- Pengunguman section start -->
            <section class="popular" id="pengunguman">
                <div class="container">
                    <div class="popular_header">
                        <h2 class="popular_header-title" data-aos="fade-up">Pengumuman</h2>
                        <p class="popular_header-text" data-aos="fade-down">
                            Informasi Pengumuman Wisuda :
                        </p>

                        <?php if (mysqli_num_rows($result) > 0): ?>
                            <?php while ($row = mysqli_fetch_assoc($result)): ?>
                                <div class="timeline-item">
                                    <h3><?= htmlspecialchars($row['judul']); ?></h3>
                                    <p class="description"><?= htmlspecialchars($row['pengumuman']); ?></p>
                                </div>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <p class="no-announcements">Tidak ada pengumuman saat ini.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </section>
    </main>

    <!-- homepage content end -->
    <footer class="footer">
        <div class="container">
            <div class="footer_wrapper">
                <div class="footer_block">
                    <div class="logo logo--footer">
                        <a class="d-lg-table" href="index.php">
                            <span class="logo_picture">
                                <img src="assets/img/logo_1.png" alt="Logo" />
                            </span>
                        </a>
                    </div>
                    <p class="footer_block-text">
                        STMIK Bandung merupakan STMIK pertama di Jawa Barat dan pelopor pendidikan tinggi informatika swasta dengan fokus untuk mencetak tenaga profesional dan technopreneur IT.
                        Dalam upaya memberikan kesempatan kepada masyarakat yang tidak mempunyai waktu luang mengikuti pendidikan di hari kerja. STMIK BANDUNG membuka Program Kelas Karyawan atau Program Kuliah Karyawan jenjang S1. Kualitas dan proses pendidikan di STMIK BANDUNG sama dirancang sama dengan Kualitas dan proses pendidikan pada hari biasa. Setiap perkuliahaan diatur secara terstruktur dan terjadwal dengan pemilihan tenaga pengajar terbaik dan berpengalaman di bidangnya. Proses belajar didukung oleh fasilitas terbaik.
                    </p>
                    <ul class="footer_block-socials d-flex align-items-center">
                        <li class="footer_block-socials_item">
                            <a class="link" href="https://www.facebook.com/BandungSTMIK/?locale=id_ID" target="_blank" rel="noopener noreferrer">
                                <i class="icon-facebook"></i>
                            </a>
                        </li>
                        <li class="footer_block-socials_item">
                            <a class="link" href="https://www.instagram.com/stmikbandung" target="_blank" rel="noopener noreferrer">
                                <i class="icon-instagram"></i>
                            </a>
                        </li>
                        <li class="footer_block-socials_item">
                            <a class="link" href="https://www.youtube.com/@stmikbandung113" target="_blank" rel="noopener noreferrer">
                                <i class="icon-youtube-play"></i>
                            </a>
                        </li>
                        <li class="footer_block-socials_item">
                            <a class="link" href="https://www.linkedin.com/company/stmik-bandung/" target="_blank" rel="noopener noreferrer">
                                <i class="icon-linkedin-brands"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="wrapper d-flex flex-column">
                        <a class="link link--contacts text text--sm d-inline-flex align-items-center" href="mailto:example@domain.com">
                            <i class="icon-envelope icon"></i>
                            info@stmik-amikbandung.ac.id
                        </a>
                        <a class="link link--contacts text text--sm d-inline-flex align-items-center" href="tel:+123456789">
                            <i class="icon-phone-solid icon"></i>
                            +62 811-2391-136
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer_secondary">
                <div class="container d-flex flex-column flex-sm-row align-items-center justify-content-sm-between">
                    <a class="footer_secondary-scroll" id="scrollToTop" href="#home">
                        <i class="icon-angle-up icon"></i>
                    </a>
                    <p class="footer_secondary-copyright">STMIK Bandung @ <span id="currentYear"></span> All rights reserve</p>
                </div>
            </div>
    </footer>
    <script src="assets/js/common.min.js"></script>
</body>

</html>