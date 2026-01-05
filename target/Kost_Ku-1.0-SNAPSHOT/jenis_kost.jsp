<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.KostDAO" %>
<%@ page import="model.Kost" %>

<%
    KostDAO dao = new KostDAO();
    List<Kost> list = dao.getAll();
    int no = 1;
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Data Kost</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<div class="bg-white p-6 rounded shadow">
    <h2 class="text-xl font-semibold mb-4">Data Kost</h2>

    <table class="w-full border text-sm">
        <thead class="bg-gray-200">
        <tr>
            <th class="border p-2">No</th>
            <th class="border p-2">Nama Kost</th>
            <th class="border p-2">Aksi</th>
        </tr>
        </thead>
        <tbody>
        <% for (Kost k : list) { %>
        <tr>
            <td class="border p-2 text-center"><%= no++ %></td>
            <td class="border p-2"><%= k.getNamaKost() %></td>
            <td class="border p-2 text-center">
                <a href="edit.jsp?id=<%= k.getId() %>" class="text-blue-600">Edit</a>
                |
                <a href="delete_kost.jsp?id=<%= k.getId() %>"
                   onclick="return confirm('Hapus data ini?')"
                   class="text-red-600">Hapus</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
