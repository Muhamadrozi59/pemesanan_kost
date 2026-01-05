<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen flex items-center justify-center bg-white">

    <div class="bg-slate-800 w-full max-w-md p-8 rounded-2xl shadow-xl">

        <h2 class="text-2xl font-bold text-white text-center mb-6">
            Buat Akun <span class="text-indigo-400">KostKu</span>
        </h2>

        <% if ("pass".equals(request.getParameter("error"))) { %>
            <p class="text-red-400 text-sm mb-3 text-center">
                Password dan konfirmasi tidak sama
            </p>
        <% } %>

        <% if ("db".equals(request.getParameter("error"))) { %>
            <p class="text-red-400 text-sm mb-3 text-center">
                Username sudah digunakan
            </p>
        <% } %>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <p class="text-red-400 text-sm mb-3 text-center">
                Semua field wajib diisi
            </p>
        <% } %>

        <form action="<%= request.getContextPath() %>/register" method="post" class="space-y-4">

            <div>
                <label class="text-gray-300 text-sm">Username</label>
                <input type="text" name="username" required
                       class="w-full mt-1 p-3 rounded-lg bg-slate-700 text-white">
            </div>

            <div>
                <label class="text-gray-300 text-sm">Password</label>
                <input type="password" name="password" required
                       class="w-full mt-1 p-3 rounded-lg bg-slate-700 text-white">
            </div>

            <div>
                <label class="text-gray-300 text-sm">Konfirmasi Password</label>
                <input type="password" name="confirm_password" required
                       class="w-full mt-1 p-3 rounded-lg bg-slate-700 text-white">
            </div>

            <button type="submit"
                    class="w-full bg-gradient-to-r from-indigo-500 to-purple-500
                           hover:opacity-90 text-white py-3 rounded-lg font-semibold">
                Daftar
            </button>
        </form>

        <p class="text-gray-400 text-sm text-center mt-6">
            Sudah punya akun?
            <a href="login.jsp" class="text-indigo-400 hover:underline">
                Login
            </a>
        </p>

    </div>

</body>
</html>
