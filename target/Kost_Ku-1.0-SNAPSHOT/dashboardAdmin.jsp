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

    pesananDAO pDAO = new pesananDAO();
    UserDAO uDAO = new UserDAO();

    int totalPesanan = pDAO.getTotalPesanan();
    int putra = pDAO.getTotalByJenis("Putra");
    int putri = pDAO.getTotalByJenis("Putri");
    int totalPengguna = uDAO.getTotalUser();
    
    // MENGAMBIL PENDAPATAN DARI DATABASE (HASIL DURASI X 500.000)
    int totalPendapatan = pDAO.getRealRevenue(); 

    int totalKost = 2;

    int jan = pDAO.getTotalByMonth(1);
    int feb = pDAO.getTotalByMonth(2);
    int mar = pDAO.getTotalByMonth(3);
    int apr = pDAO.getTotalByMonth(4);
    int mei = pDAO.getTotalByMonth(5);
    int jun = pDAO.getTotalByMonth(6);

    List<pesanan> list = pDAO.getLatestPesanan(10);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard Admin | SMARTKOST</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>body { font-family: 'Inter', sans-serif; }</style>
    </head>

    <body class="bg-gray-50 flex">

        <jsp:include page="sidebar.jsp" />

        <div class="flex-1 flex flex-col min-h-screen">
            <jsp:include page="headerAdmin.jsp"/>
            
            <main class="p-8 space-y-8">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <p class="text-sm text-gray-400 font-medium">Total Kost</p>
                        <h3 class="text-2xl font-bold text-gray-800"><%=totalKost%></h3>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <p class="text-sm text-gray-400 font-medium">Total Pesanan</p>
                        <h3 class="text-2xl font-bold text-gray-800 text-indigo-600"><%=totalPesanan%></h3>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <p class="text-sm text-gray-400 font-medium">Total Pendapatan</p>
                        <h3 class="text-2xl font-bold text-gray-800 text-green-600">Rp <%=String.format("%,d", totalPendapatan)%></h3>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <p class="text-sm text-gray-400 font-medium">Total Pengguna</p>
                        <h3 class="text-2xl font-bold text-gray-800"><%=totalPengguna%></h3>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="md:col-span-2 bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <h4 class="text-sm font-bold text-gray-700 mb-4 uppercase">Tren Pesanan 2026</h4>
                        <canvas id="lineChart" height="120"></canvas>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                        <h4 class="text-sm font-bold text-gray-700 mb-4 uppercase">Distribusi Jenis</h4>
                        <canvas id="donutChart"></canvas>
                    </div>
                </div>

                <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="p-6 border-b border-gray-50">
                        <h4 class="text-sm font-bold text-gray-700 uppercase">Pesanan Terbaru</h4>
                    </div>
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-gray-50 text-gray-400 text-[10px] uppercase font-bold tracking-wider">
                            <tr>
                                <th class="px-6 py-3">No</th>
                                <th class="px-6 py-3">Nama</th>
                                <th class="px-6 py-3">Jenis</th>
                                <th class="px-6 py-3">Lokasi</th>
                                <th class="px-6 py-3">Tanggal Masuk</th>
                                <th class="px-6 py-3 text-center">Durasi</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm text-gray-600 divide-y divide-gray-50">
                            <%
                                int no = 1;
                                for (pesanan p : list) {
                            %>
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-4"><%=no++%></td>
                                <td class="px-6 py-4 font-bold text-gray-800"><%=p.getNama()%></td>
                                <td class="px-6 py-4"><%=p.getJenisKost()%></td>
                                <td class="px-6 py-4"><%=p.getLokasi()%></td>
                                <td class="px-6 py-4"><%=p.getTanggalMasuk()%></td>
                                <td class="px-6 py-4 text-center"><span class="bg-indigo-50 text-indigo-600 px-2 py-1 rounded text-xs font-bold"><%=p.getDurasi()%> bln</span></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </main>

            <footer class="text-center py-4 bg-white border-t border-gray-100 text-gray-400 text-[10px]">
                &copy; 2026 <b>SMARTKOST</b>. Management System Dashboard.
            </footer>
        </div>

        <script>
            new Chart(document.getElementById("lineChart"), {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun'],
                    datasets: [{
                        label: 'Pesanan',
                        data: [<%=jan%>, <%=feb%>, <%=mar%>, <%=apr%>, <%=mei%>, <%=jun%>],
                        borderColor: '#6366f1',
                        backgroundColor: 'rgba(99, 102, 241, 0.1)',
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: { plugins: { legend: { display: false } } }
            });

            new Chart(document.getElementById("donutChart"), {
                type: 'doughnut',
                data: {
                    labels: ['Putra', 'Putri'],
                    datasets: [{
                        data: [<%=putra%>, <%=putri%>],
                        backgroundColor: ['#4f46e5', '#ec4899']
                    }]
                },
                options: { cutout: '70%' }
            });
        </script>
    </body>
</html>