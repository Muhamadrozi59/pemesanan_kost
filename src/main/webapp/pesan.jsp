<%@ page session="true" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Step 1 - Data Diri</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white">

<div class="max-w-4xl mx-auto py-12 px-4">

    <h1 class="text-3xl font-bold text-center mb-2">Pesan Kost Impian Anda</h1>
    <p class="text-center text-slate-300 mb-10">Lengkapi langkah-langkah di bawah ini</p>

    <!-- STEPPER -->
    <div class="flex items-center justify-between mb-12">
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">1</div>
        <div class="flex-1 h-1 bg-slate-700 mx-2"></div>
        <div class="w-10 h-10 bg-slate-700 rounded-full flex items-center justify-center">2</div>
        <div class="flex-1 h-1 bg-slate-700 mx-2"></div>
        <div class="w-10 h-10 bg-slate-700 rounded-full flex items-center justify-center">3</div>
        <div class="flex-1 h-1 bg-slate-700 mx-2"></div>
        <div class="w-10 h-10 bg-slate-700 rounded-full flex items-center justify-center">4</div>
    </div>

    <!-- CARD -->
    <div class="bg-white text-gray-800 rounded-2xl shadow-xl p-8 max-w-md mx-auto">
        <h2 class="text-xl font-bold mb-6 text-center">Data Diri</h2>

        <form action="pesan" method="post" class="space-y-4">
            <input type="hidden" name="step" value="1">

            <input type="text" name="nama" placeholder="Nama Lengkap" required class="w-full p-3 border rounded-lg">
            <input type="text" name="noHp" placeholder="No HP" required class="w-full p-3 border rounded-lg">

            <select name="jenisKost" required class="w-full p-3 border rounded-lg">
                <option value="">Pilih Jenis Kost</option>
                <option value="Putra">Putra</option>
                <option value="Putri">Putri</option>
            </select>

            <input type="text" name="lokasi" placeholder="Lokasi" required class="w-full p-3 border rounded-lg">

            <button class="w-full py-3 rounded-lg bg-gradient-to-r from-purple-500 to-blue-500 text-white font-semibold">
                Lanjut
            </button>
        </form>
    </div>
</div>

</body>
</html>
