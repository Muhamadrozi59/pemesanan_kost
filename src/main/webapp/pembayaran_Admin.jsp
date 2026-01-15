<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>

<%
    // Solusi agar tidak error 'resolves to package'
    dao.PembayaranDAO payDao = new dao.PembayaranDAO();
    List<model.Pembayaran> listPay = payDao.getAll();
    int no = 1;
%>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Management Pembayaran | SMARTKOST</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <style>body {
            font-family: 'Inter', sans-serif;
        }</style>
    </head>

    <body class="bg-gray-50 flex"> 
        <jsp:include page="sidebar.jsp" />
        <div class="flex-1 flex flex-col min-h-screen">
            <jsp:include page="headerAdmin.jsp" />

            <div class="flex-1 flex flex-col min-h-screen">
                <header class="bg-white px-8 py-4 shadow-sm flex justify-between items-center border-b border-gray-100">
                    <nav class="text-sm font-medium">
                        <span class="text-gray-400">Admin /</span> 
                        <span class="text-indigo-600 font-bold">Pembayaran</span>
                    </nav>
                </header>

                <main class="p-8">
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
                        <table id="tabelPembayaran" class="w-full text-left">
                            <thead>
                                <tr class="text-gray-400 text-xs uppercase border-b border-gray-100">
                                    <th class="pb-4 font-bold">#</th>
                                    <th class="pb-4 font-bold">Pemesan</th>
                                    <th class="pb-4 font-bold">Kost</th>
                                    <th class="pb-4 font-bold">Total</th>
                                    <th class="pb-4 font-bold">Dibayar</th>
                                    <th class="pb-4 font-bold text-red-500">Sisa</th>
                                    <th class="pb-4 font-bold">Status</th>
                                    <th class="pb-4 font-bold text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="text-sm text-gray-600 divide-y divide-gray-50">
                                <% for (model.Pembayaran p : listPay) {%>
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="py-4"><%= no++%></td>
                                    <td class="py-4 font-bold text-gray-900"><%= p.getNamaPemesan()%></td>
                                    <td class="py-4"><%= p.getNamaKost()%></td>
                                    <td class="py-4">Rp <%= String.format("%,.0f", p.getTotalBiaya())%></td>
                                    <td class="py-4 text-green-600 font-medium">Rp <%= String.format("%,.0f", p.getTotalDibayar())%></td>
                                    <td class="py-4 text-red-500 font-bold">Rp <%= String.format("%,.0f", p.getSisa())%></td>
                                    <td class="py-4">
                                        <span class="px-3 py-1 rounded-full text-xs font-bold <%= p.getStatus().equals("Lunas") ? "bg-green-100 text-green-600" : "bg-orange-100 text-orange-600"%>">
                                            <%= p.getStatus()%>
                                        </span>
                                    </td>
                                    <td class="py-4 text-center">
                                        <button onclick="bukaModal('<%= p.getId()%>', '<%= p.getNamaPemesan()%>', '<%= p.getSisa()%>')" 
                                                class="bg-indigo-600 text-white px-3 py-1 rounded text-xs <%= p.getStatus().equals("Lunas") ? "hidden" : ""%>">
                                            Bayar
                                        </button>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>

            <div id="modalBayar" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-xl p-6 w-full max-w-sm">
                    <h3 class="font-bold text-gray-700">Bayar Tagihan</h3>
                    <p id="txt_nama" class="text-sm text-gray-400 mb-4"></p>
                    <form action="PembayaranServlet" method="POST">
                        <input type="hidden" name="aksi" value="bayar">
                        <input type="hidden" name="id" id="bayar_id">
                        <input type="number" name="jumlah_bayar" required placeholder="Masukkan nominal"
                               class="w-full border p-2 rounded-lg mb-4 focus:ring-2 focus:ring-indigo-500 outline-none">
                        <div class="flex gap-2">
                            <button type="submit" class="flex-1 bg-indigo-600 text-white py-2 rounded-lg">Konfirmasi</button>
                            <button type="button" onclick="tutupModal()" class="flex-1 bg-gray-100 py-2 rounded-lg">Batal</button>
                        </div>
                    </form>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
            <script>
                                $(document).ready(function () {
                                    $('#tabelPembayaran').DataTable();
                                });
                                function bukaModal(id, nama, sisa) {
                                    document.getElementById('modalBayar').classList.replace('hidden', 'flex');
                                    document.getElementById('bayar_id').value = id;
                                    document.getElementById('txt_nama').innerText = "Pemesan: " + nama + " (Sisa: Rp " + parseFloat(sisa).toLocaleString('id-ID') + ")";
                                }
                                function tutupModal() {
                                    document.getElementById('modalBayar').classList.replace('flex', 'hidden');
                                }
            </script>
    </body>
</html>