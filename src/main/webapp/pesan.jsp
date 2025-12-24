<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pemesanan</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<section class="content">
    <h2>Form Pemesanan</h2>
    <form class="form">
        <input type="text" placeholder="Nama Lengkap" required>
        <input type="text" placeholder="No HP" required>
        <select>
            <option>Kost Putra</option>
            <option>Kost Putri</option>
        </select>
        <input type="date">
        <button class="btn-primary">Pesan</button>
    </form>
</section>
</body>
</html>