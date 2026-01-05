<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen flex items-center justify-center bg-gray-100">

<div class="bg-slate-800 w-full max-w-md p-8 rounded-2xl shadow-xl">

    <h2 class="text-2xl font-bold text-white text-center mb-6">
        Login to <span class="text-indigo-400">KostKu</span>
    </h2>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <div class="bg-red-500/20 text-red-400 p-3 rounded mb-4 text-center">
            Username atau password salah
        </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/login" method="post" class="space-y-4">

        <div>
            <label class="text-gray-300 text-sm">Username</label>
            <input type="text" name="username" required
                   class="w-full mt-1 p-3 rounded-lg bg-slate-700 
                          text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
        </div>

        <div>
            <label class="text-gray-300 text-sm">Password</label>
            <input type="password" name="password" required
                   class="w-full mt-1 p-3 rounded-lg bg-slate-700 
                          text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
        </div>

        <div class="flex gap-3 pt-2">
            <button type="submit"
                    class="w-1/2 bg-gradient-to-r from-indigo-500 to-purple-500
                           hover:opacity-90 text-white py-3 rounded-lg font-semibold">
                Login
            </button>

            <a href="index.jsp"
               class="w-1/2 text-center bg-slate-700 hover:bg-slate-600
                      text-white py-3 rounded-lg font-semibold">
                Kembali
            </a>
        </div>
    </form>

    <p class="text-gray-400 text-sm text-center mt-6">
        Belum punya akun?
        <a href="register.jsp" class="text-indigo-400 hover:underline">
            Daftar di sini
        </a>
    </p>

</div>

</body>
</html>
