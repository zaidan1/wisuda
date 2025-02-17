<?php
session_start();
require 'admin/db_connnection.php'; // Mengimpor koneksi database

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$userId = $_SESSION['user_id']; // Ambil user_id dari sesi

// Maksimal ukuran file (5MB)
$maxFileSize = 5 * 1024 * 1024;

// Query untuk mengambil status dokumen dan alasan penolakan dari database berdasarkan create_by
$sql = "SELECT status, reason_reject FROM dokumen WHERE create_by = ?";
$stmt = $koneksi->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$stmt->store_result();

// Cek apakah ada data dokumen untuk pengguna
if ($stmt->num_rows > 0) {
    // Jika ada, ambil status dan alasan penolakan
    $stmt->bind_result($statusDokumen, $reasonReject);
    $stmt->fetch();
} else {
    // Jika tidak ada data dokumen, set status default menjadi 'not_uploaded'
    $statusDokumen = 'not_uploaded';
    $reasonReject = '';
}

$stmt->close();

// Cek apakah form telah di-submit
if (isset($_POST['submit'])) {
    // Direktori penyimpanan file
    $targetDir = __DIR__ . "/uploads/"; // Gunakan path absolut

    // Pastikan folder uploads ada
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true); // Buat folder jika belum ada
    }

    // Ambil informasi file
    $fileAkte = $_FILES["file_akte"];
    $fileIjasa = $_FILES["file_ijasa"];
    $filePembayaran = $_FILES["file_pembayaran"];

    // Validasi apakah file ada
    if ($fileAkte['error'] != 0 || $fileIjasa['error'] != 0 || $filePembayaran['error'] != 0) {
        $_SESSION['upload_error'] = "Gagal mengunggah, periksa file yang dipilih.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Validasi jenis file akte (hanya PDF)
    $fileAkteExt = strtolower(pathinfo($fileAkte["name"], PATHINFO_EXTENSION));
    if ($fileAkteExt !== 'pdf') {
        $_SESSION['upload_error'] = "File akte harus dalam format PDF.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Validasi jenis file ijazah (hanya PDF)
    $fileIjasaExt = strtolower(pathinfo($fileIjasa["name"], PATHINFO_EXTENSION));
    if ($fileIjasaExt !== 'pdf') {
        $_SESSION['upload_error'] = "File ijazah harus dalam format PDF.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Validasi jenis file pembayaran (hanya PNG atau JPG)
    $filePembayaranExt = strtolower(pathinfo($filePembayaran["name"], PATHINFO_EXTENSION));
    if (!in_array($filePembayaranExt, ['png', 'jpg', 'jpeg'])) {
        $_SESSION['upload_error'] = "File pembayaran harus dalam format PNG atau JPG.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Validasi ukuran file
    if ($fileAkte['size'] > $maxFileSize || $fileIjasa['size'] > $maxFileSize || $filePembayaran['size'] > $maxFileSize) {
        $_SESSION['upload_error'] = "Ukuran file tidak boleh lebih dari 5MB.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Proses upload file akte
    $fileAkteName = uniqid() . "_" . basename($fileAkte["name"]);
    $targetFilePathAkte = $targetDir . $fileAkteName;
    if (!move_uploaded_file($fileAkte["tmp_name"], $targetFilePathAkte)) {
        $_SESSION['upload_error'] = "Gagal mengunggah file akte.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Proses upload file ijazah
    $fileIjasaName = uniqid() . "_" . basename($fileIjasa["name"]);
    $targetFilePathIjasa = $targetDir . $fileIjasaName;
    if (!move_uploaded_file($fileIjasa["tmp_name"], $targetFilePathIjasa)) {
        $_SESSION['upload_error'] = "Gagal mengunggah file ijazah.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Proses upload file pembayaran
    $filePembayaranName = uniqid() . "_" . basename($filePembayaran["name"]);
    $targetFilePathPembayaran = $targetDir . $filePembayaranName;
    if (!move_uploaded_file($filePembayaran["tmp_name"], $targetFilePathPembayaran)) {
        $_SESSION['upload_error'] = "Gagal mengunggah file pembayaran.";
        header("Location: daftar_wisuda.php");
        exit();
    }

    // Update atau insert dokumen ke database
    if ($statusDokumen === 'not_uploaded') {
        // Jika dokumen belum pernah diunggah, lakukan INSERT
        $sqlInsert = "INSERT INTO dokumen (create_by, file_akte, file_ijasa, file_pembayaran, status) VALUES (?, ?, ?, ?, 'pending')";
        $stmtInsert = $koneksi->prepare($sqlInsert);
        $stmtInsert->bind_param("isss", $userId, $fileAkteName, $fileIjasaName, $filePembayaranName);
        if ($stmtInsert->execute()) {
            $_SESSION['upload_success'] = "Dokumen berhasil diunggah. Status saat ini: pending.";
        } else {
            $_SESSION['upload_error'] = "Gagal menyimpan dokumen, silahkan coba lagi.";
        }
        $stmtInsert->close();
    } else {
        // Jika dokumen sudah ada (termasuk status rejected), lakukan UPDATE
        $sqlUpdate = "UPDATE dokumen SET file_akte = ?, file_ijasa = ?, file_pembayaran = ?, status = 'pending' WHERE create_by = ?";
        $stmtUpdate = $koneksi->prepare($sqlUpdate);
        $stmtUpdate->bind_param("sssi", $fileAkteName, $fileIjasaName, $filePembayaranName, $userId);
        if ($stmtUpdate->execute()) {
            $_SESSION['upload_success'] = "Dokumen berhasil diperbarui. Status saat ini: pending.";
        } else {
            $_SESSION['upload_error'] = "Gagal memperbarui dokumen, silahkan coba lagi.";
        }
        $stmtUpdate->close();
    }

    $koneksi->close();

    header("Location: dashboard.php");
    exit();
}
?>