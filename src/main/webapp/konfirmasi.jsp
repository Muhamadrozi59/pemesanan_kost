<%@ page session="true" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Step 3 - Konfirmasi</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white">

<div class="max-w-4xl mx-auto py-12 px-4">

    <h1 class="text-3xl font-bold text-center mb-2">Pesan Kost Impian Anda</h1>
    <p class="text-center text-slate-300 mb-10">Periksa kembali data Anda</p>

    <!-- STEPPER -->
    <div class="flex items-center justify-between mb-12">
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">1</div>
        <div class="flex-1 h-1 bg-purple-500 mx-2"></div>
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">2</div>
        <div class="flex-1 h-1 bg-purple-500 mx-2"></div>
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">3</div>
        <div class="flex-1 h-1 bg-slate-700 mx-2"></div>
        <div class="w-10 h-10 bg-slate-700 rounded-full flex items-center justify-center">4</div>
    </div>

    <!-- CARD -->
    <div class="bg-white text-gray-800 rounded-2xl shadow-xl p-8 max-w-md mx-auto">
        <h2 class="text-xl font-bold mb-6 text-center">Konfirmasi Pesanan</h2>

        <div class="space-y-2 text-sm">
            <p><b>Nama:</b> <%= session.getAttribute("nama") %></p>
            <p><b>No HP:</b> <%= session.getAttribute("noHp") %></p>
            <p><b>Jenis Kost:</b> <%= session.getAttribute("jenisKost") %></p>
            <p><b>Lokasi:</b> <%= session.getAttribute("lokasi") %></p>
            <p><b>Tanggal Masuk:</b> <%= session.getAttribute("tanggalMasuk") %></p>
            <p><b>Durasi:</b> <%= session.getAttribute("durasi") %> bulan</p>
        </div>

        <form action="pesan" method="post" class="mt-6">
            <input type="hidden" name="step" value="3">
            <button class="w-full py-3 rounded-lg bg-green-500 text-white font-semibold">
                Konfirmasi & Pesan
            </button>
        </form>
    </div>
</div>

</body>
</html>
