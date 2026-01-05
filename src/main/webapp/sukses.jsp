<%@ page session="true" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Pesanan Berhasil</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white">

<div class="max-w-4xl mx-auto py-20 px-4">

    <!-- STEPPER -->
    <div class="flex items-center justify-between mb-12 max-w-xl mx-auto">
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">1</div>
        <div class="flex-1 h-1 bg-purple-500 mx-2"></div>
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">2</div>
        <div class="flex-1 h-1 bg-purple-500 mx-2"></div>
        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">3</div>
        <div class="flex-1 h-1 bg-purple-500 mx-2"></div>
        <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center">?</div>
    </div>

    <!-- CARD -->
    <div class="bg-white text-gray-800 rounded-2xl shadow-xl p-8 max-w-md mx-auto text-center">
        <h2 class="text-2xl font-bold text-green-600 mb-4">Pesanan Berhasil!</h2>
        <p class="mb-6">Terima kasih, pesanan Anda telah tersimpan.</p>

        <a href="index.jsp"
           class="block mb-3 w-full py-3 rounded-lg bg-gradient-to-r from-purple-500 to-blue-500 text-white font-semibold">
            Kembali ke Home
        </a>

        <a href="pesan?step=5"
           class="block w-full py-3 rounded-lg bg-gray-500 text-white font-semibold">
            Lihat Pesanan Saya
        </a>
    </div>
</div>

</body>
</html>
