<%@ page import="java.util.List" %>
<%@ page import="model.pesanan" %>
<%
    List<pesanan> list = (List<pesanan>) session.getAttribute("listPesanan");
    if(list == null){
        response.sendRedirect("index.jsp");
        return;
    }
%>

<h2>Pesanan Saya</h2>
<table border="1">
    <tr>
        <th>No</th>
        <th>Nama</th>
        <th>No HP</th>
        <th>Jenis Kost</th>
        <th>Lokasi</th>
        <th>Tanggal Masuk</th>
        <th>Durasi</th>
    </tr>
<%
    int no = 1;
    for(pesanan p : list){
%>
    <tr>
        <td><%= no++ %></td>
        <td><%= p.getNama() %></td>
        <td><%= p.getNoHp() %></td>
        <td><%= p.getJenisKost() %></td>
        <td><%= p.getLokasi() %></td>
        <td><%= p.getTanggalMasuk() %></td>
        <td><%= p.getDurasi() %></td>
    </tr>
<% } %>
</table>
