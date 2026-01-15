<%-- 
    Document   : edit_lokasi
    Created on : 14 Jan 2026, 10.15.44
    Author     : MyBook Hype AMD
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.lokasiDAO" %>
<%@ page import="model.lokas" %>
<%@ page import="java.util.List" %>

<%
    // Mengambil ID dari URL
    String idStr = request.getParameter("id");
    lokas dataLama = null;
    
    if (idStr != null) {
        int id = Integer.parseInt(idStr);
        lokasiDAO dao = new lokasiDAO();
        // Mencari data spesifik dari list (atau buat method getById di DAO)
        List<lokas> list = dao.getAll();
        for (lokas l : list) {
            if (l.getId() == id) {
                dataLama = l;
                break;
            }
        }
    }

    if (dataLama == null) {
        response.sendRedirect("jenis_kost.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Lokasi | SMARTKOST</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-gray-50 flex">

    <jsp:include page="sidebar.jsp" />

    <div class="flex-1 flex flex-col min-h-screen">
        
        <header class="bg-white px-8 py-4 shadow-sm flex justify-between items-center border-b border-gray-100">
            <nav class="text-sm font-medium">
                <span class="text-gray-400">Data Kost /</span> 
                <span class="text-indigo-600 font-bold">Edit Lokasi</span>
            </nav>
        </header>

        <main class="p-8 flex justify-center">
            <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-8 w-full max-w-lg">
                <div class="mb-6">
                    <h2 class="text-xl font-bold text-gray-800">Ubah Lokasi</h2>
                    <p class="text-sm text-gray-400">Pastikan nama lokasi sudah benar sebelum disimpan.</p>
                </div>

                <form action="LokasiServlet" method="POST" class="space-y-6">
                    <input type="hidden" name="id" value="<%= dataLama.getId() %>">
                    <input type="hidden" name="aksi" value="ubah">

                    <div>
                        <label class="block text-sm font-semibold text-gray-600 mb-2">Nama Lokasi</label>
                        <input type="text" name="nama" value="<%= dataLama.getNama() %>" required
                               class="w-full px-4 py-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:outline-none transition">
                    </div>

                    <div class="flex gap-3 pt-4 border-t border-gray-50">
                        <button type="submit" 
                                class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2 rounded-lg transition shadow-md">
                            Simpan Perubahan
                        </button>
                        <a href="jenis_kost.jsp" 
                           class="flex-1 bg-gray-100 hover:bg-gray-200 text-gray-600 text-center font-bold py-2 rounded-lg transition">
                            Batal
                        </a>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
