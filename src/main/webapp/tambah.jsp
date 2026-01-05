<%@ page import="dao.KostDAO, model.Kost" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String nama = request.getParameter("nama");

    Kost k = new Kost();
    k.setId(id);
    k.setNamaKost(nama);

    new KostDAO().insert(k);
    response.sendRedirect("jenis_kost.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Tambah Kost</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="p-8 bg-gray-100">

<form method="post" class="bg-white p-6 rounded shadow w-96">
    <h2 class="text-lg font-semibold mb-4">Tambah Kost</h2>

    <input name="id" placeholder="ID Kost"
           class="border p-2 w-full mb-3" required>

    <input name="nama" placeholder="Nama Kost"
           class="border p-2 w-full mb-3" required>

    <button class="bg-indigo-600 text-white px-4 py-2 rounded">
        Simpan
    </button>
</form>

</body>
</html>
