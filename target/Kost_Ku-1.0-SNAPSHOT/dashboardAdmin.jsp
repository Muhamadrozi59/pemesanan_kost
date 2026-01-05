<%@ page import="dao.pesananDAO" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.pesanan" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard Admin Kost</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>

    <body class="bg-gray-100 flex">

        <%
            pesananDAO pesananDAO = new pesananDAO();
            UserDAO userDAO = new UserDAO();

            int totalPesanan = 0;
            int putra = 0;
            int putri = 0;
            int totalPengguna = 0;
            int totalPendapatan = 0;

            List<pesanan> list = null;

            try {
                totalPesanan = pesananDAO.getTotalPesanan();
                putra = pesananDAO.getTotalByJenis("Putra");
                putri = pesananDAO.getTotalByJenis("Putri");
                list = pesananDAO.getLatestPesanan(10);

                totalPengguna = userDAO.getTotalUser();
                totalPendapatan = totalPesanan * 500000;
            } catch (SQLException e) {
                out.println("<p class='text-red-500'>" + e.getMessage() + "</p>");
            }

            int totalKost = putra + putri;
        %>

        <!-- SIDEBAR -->
        <aside class="w-64 bg-white min-h-screen shadow-lg">
            <div class="p-6 text-xl font-bold text-indigo-600">SMARTKOST</div>
            <nav class="px-4 space-y-2">
                <a class="block bg-indigo-100 text-indigo-700 px-4 py-2 rounded">Dashboard</a>
                <a href="jenis_kost.jsp"
                   class="block text-gray-600 hover:bg-gray-100 px-4 py-2 rounded">
                    Data Kost
                </a>

                <a class="block text-gray-600 hover:bg-gray-100 px-4 py-2 rounded">Pesanan</a>
                <a class="block text-gray-600 hover:bg-gray-100 px-4 py-2 rounded">Pengguna</a>
            </nav>
        </aside>

        <!-- MAIN -->
        <div class="flex-1">

            <!-- TOPBAR -->
            <header class="bg-white px-6 py-4 shadow flex justify-between items-center">
                <span class="text-gray-600">Dashboard / <b>Overview</b></span>
                <a href="<%= request.getContextPath()%>/logout"
                   class="bg-red-500 text-white px-4 py-2 rounded">
                    Logout
                </a>
            </header>

            <main class="p-6 space-y-6">

                <!-- STAT CARD -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">

                    <div class="bg-white p-5 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Total Kost</p>
                        <h2 class="text-3xl font-bold text-gray-800 mt-2"><%= totalKost%></h2>
                    </div>

                    <div class="bg-white p-5 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Total Pesanan</p>
                        <h2 class="text-3xl font-bold text-gray-800 mt-2"><%= totalPesanan%></h2>
                    </div>

                    <div class="bg-white p-5 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Total Pendapatan</p>
                        <h2 class="text-2xl font-bold text-gray-800 mt-2">
                            Rp <%= String.format("%,d", totalPendapatan)%>
                        </h2>
                    </div>

                    <div class="bg-white p-5 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Total Pengguna</p>
                        <h2 class="text-3xl font-bold text-gray-800 mt-2"><%= totalPengguna%></h2>
                    </div>

                </div>

                <!-- GRAFIK -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                    <div class="bg-white p-6 rounded-xl shadow md:col-span-2">
                        <h3 class="font-semibold text-gray-700 mb-4">Grafik Pesanan</h3>
                        <canvas id="lineChart" height="120"></canvas>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow">
                        <h3 class="font-semibold text-gray-700 mb-4">Jenis Kost</h3>
                        <canvas id="donutChart"></canvas>
                    </div>

                </div>

                <!-- TABLE -->
                <div class="bg-white p-6 rounded-xl shadow">
                    <h3 class="font-semibold text-gray-700 mb-4">Pesanan Terbaru</h3>
                    <table class="w-full text-sm border">
                        <thead class="bg-gray-100">
                            <tr class="text-center">
                                <th class="border px-2 py-2">No</th>
                                <th class="border px-2 py-2">Nama</th>
                                <th class="border px-2 py-2">Jenis</th>
                                <th class="border px-2 py-2">Lokasi</th>
                                <th class="border px-2 py-2">Tanggal</th>
                                <th class="border px-2 py-2">Durasi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int no = 1;
                                if (list != null) {
                                    for (pesanan p : list) {
                            %>
                            <tr class="text-center hover:bg-gray-50">
                                <td class="border px-2 py-2"><%= no++%></td>
                                <td class="border px-2 py-2"><%= p.getNama()%></td>
                                <td class="border px-2 py-2"><%= p.getJenisKost()%></td>
                                <td class="border px-2 py-2"><%= p.getLokasi()%></td>
                                <td class="border px-2 py-2"><%= p.getTanggalMasuk()%></td>
                                <td class="border px-2 py-2"><%= p.getDurasi()%> bln</td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </main>
        </div>

        <!-- CHART SCRIPT -->
        <script>
            new Chart(document.getElementById('donutChart'), {
                type: 'doughnut',
                data: {
                    labels: ['Putra', 'Putri'],
                    datasets: [{
                            data: [<%= putra%>, <%= putri%>]
                        }]
                }
            });

            new Chart(document.getElementById('lineChart'), {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun'],
                    datasets: [{
                            label: 'Pesanan',
                            data: [
            <%= totalPesanan%>,
            <%= totalPesanan%>,
            <%= totalPesanan%>,
            <%= totalPesanan%>,
            <%= totalPesanan%>,
            <%= totalPesanan%>
                            ],
                            borderWidth: 2
                        }]
                }
            });
        </script>

    </body>
</html>
