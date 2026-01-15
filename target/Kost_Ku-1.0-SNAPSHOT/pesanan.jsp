<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.pesananDAO" %>
<%@ page import="model.pesanan" %>

<%
    pesananDAO dao = new pesananDAO();
    List<pesanan> list = dao.getAllPesanan();
%>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Manajemen Pesanan Kost | SMARTKOST</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        
        <style>
            body { font-family: 'Inter', sans-serif; }

            /* STYLE TOMBOL KECIL MINIMALIS */
            .dt-buttons {
                display: inline-flex !important;
                background-color: #f3f4f6 !important; /* bg-gray-100 */
                padding: 4px !important;
                border-radius: 6px !important;
                margin-bottom: 20px !important;
            }
            button.dt-button {
                background: transparent !important;
                border: none !important;
                color: #4b5563 !important; /* text-gray-600 */
                font-size: 11px !important;
                font-weight: 500 !important;
                padding: 4px 12px !important;
                margin: 0 !important;
                transition: all 0.2s !important;
                box-shadow: none !important;
            }
            button.dt-button:hover {
                background-color: white !important;
                border-radius: 4px !important;
                box-shadow: 0 1px 2px rgba(0,0,0,0.05) !important;
                color: #111827 !important;
            }
            .dataTables_filter { margin-bottom: 20px !important; }
            .dataTables_filter input {
                border: 1px solid #e5e7eb !important;
                border-radius: 4px !important;
                padding: 4px 8px !important;
                font-size: 13px !important;
                outline: none !important;
            }
            .dataTables_filter label {
                font-size: 11px !important;
                font-weight: 700 !important;
                color: #9ca3af !important;
            }
        </style>
    </head>
    <body class="bg-gray-50 flex">

        <jsp:include page="sidebar.jsp" />

        <div class="flex-1 flex flex-col min-h-screen">
            <jsp:include page="headerAdmin.jsp" />

            <main class="p-8">
                <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6">

                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-lg font-bold text-gray-700">Daftar Pesanan Kost</h2>
                        <button class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg text-sm flex items-center gap-2 transition shadow-sm"
                                onclick="toggleModal(true)">
                            + Tambah Pesanan
                        </button>
                    </div>

                    <div class="overflow-x-auto">
                        <table id="tabelPesanan" class="w-full text-left border-collapse">
                            <thead>
                                <tr class="text-gray-400 text-xs uppercase tracking-wider border-b border-gray-100">
                                    <th class="pb-4 font-bold w-16">#</th>
                                    <th class="pb-4 font-bold">Nama</th>
                                    <th class="pb-4 font-bold">No HP</th>
                                    <th class="pb-4 font-bold">Jenis</th>
                                    <th class="pb-4 font-bold">Lokasi</th>
                                    <th class="pb-4 font-bold">Tanggal</th>
                                    <th class="pb-4 font-bold">Durasi</th>
                                    <th class="pb-4 font-bold text-center">Status</th>
                                    <th class="pb-4 font-bold text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="text-sm text-gray-600 divide-y divide-gray-50">
                                <%
                                    int no = 1;
                                    for (pesanan p : list) {
                                %>
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="py-4 font-medium"><%= no++%></td>
                                    <td class="py-4 font-medium text-gray-800"><%= p.getNama()%></td>
                                    <td class="py-4"><%= p.getNoHp()%></td>
                                    <td class="py-4"><%= p.getJenisKost()%></td>
                                    <td class="py-4"><%= p.getLokasi()%></td>
                                    <td class="py-4"><%= p.getTanggalMasuk()%></td>
                                    <td class="py-4"><%= p.getDurasi()%> bln</td>
                                    <td class="py-4 text-center">
                                        <% if ("LUNAS".equals(p.getStatus())) { %>
                                        <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-xs font-semibold">LUNAS</span>
                                        <% } else { %>
                                        <span class="bg-yellow-100 text-yellow-700 px-3 py-1 rounded-full text-xs font-semibold">DIBOOKING</span>
                                        <% }%>
                                    </td>
                                    <td class="py-4 text-center">
                                        <div class="flex justify-center gap-2">
                                            <button class="bg-yellow-400 text-white px-3 py-1 rounded text-xs hover:bg-yellow-500 btn-edit"
                                                    data-id="<%= p.getId()%>"
                                                    data-nama="<%= p.getNama()%>"
                                                    data-nohp="<%= p.getNoHp()%>"
                                                    data-jenis="<%= p.getJenisKost()%>"
                                                    data-lokasi="<%= p.getLokasi()%>"
                                                    data-tanggal="<%= p.getTanggalMasuk()%>"
                                                    data-durasi="<%= p.getDurasi()%>"
                                                    data-status="<%= p.getStatus()%>">
                                                Edit
                                            </button>
                                            <form action="pesananServlet" method="POST" class="inline">
                                                <input type="hidden" name="id" value="<%= p.getId()%>">
                                                <button type="submit" name="proses" value="Hapus"
                                                        class="bg-red-500 text-white px-3 py-1 rounded text-xs hover:bg-red-600"
                                                        onclick="return confirm('Anda yakin ingin menghapus data ini?')">
                                                    Hapus
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>

        <div class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50" id="modalPesanan">
            <div class="bg-white rounded-xl shadow-lg w-full max-w-lg p-6 relative">
                <h3 id="modalTitle" class="text-lg font-bold mb-4">Tambah Pesanan</h3>
                <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-800" onclick="toggleModal(false)">×</button>
                <form method="POST" action="pesananServlet" id="formPesanan">
                    <input type="hidden" name="id" id="id">
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Nama</label>
                        <input type="text" name="nama" id="nama" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">No HP</label>
                        <input type="text" name="nohp" id="nohp" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Jenis Kost</label>
                        <input type="text" name="jenis" id="jenis" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Lokasi</label>
                        <input type="text" name="lokasi" id="lokasi" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Tanggal Masuk</label>
                        <input type="date" name="tanggal" id="tanggal" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Durasi (bln)</label>
                        <input type="number" name="durasi" id="durasi" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                    </div>
                    <div class="mb-3">
                        <label class="block text-sm font-medium text-gray-700">Status</label>
                        <select name="status" id="status" class="w-full border border-gray-200 rounded px-3 py-2 focus:ring-2 focus:ring-indigo-500">
                            <option value="DIBOOKING">DIBOOKING</option>
                            <option value="LUNAS">LUNAS</option>
                        </select>
                    </div>
                    <div class="flex justify-end gap-2 mt-4">
                        <button type="submit" name="proses" value="Simpan" id="btnSimpan" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Simpan</button>
                        <button type="submit" name="proses" value="Ubah" id="btnUbah" class="bg-yellow-400 text-white px-4 py-2 rounded hover:bg-yellow-500 hidden">Ubah</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>

        <script>
            $(document).ready(function() {
                $('#tabelPesanan').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        { extend: 'copy', text: 'Copy', exportOptions: { columns: ':not(:last-child)' } },
                        { extend: 'excel', text: 'Excel', exportOptions: { columns: ':not(:last-child)' } },
                        { extend: 'pdf', text: 'PDF', exportOptions: { columns: ':not(:last-child)' } },
                        { extend: 'print', text: 'Print', exportOptions: { columns: ':not(:last-child)' } }
                    ],
                    language: {
                        search: "SEARCH:",
                        info: "Showing _TOTAL_ entries",
                        paginate: { next: "Next", previous: "Previous" }
                    }
                });
            });

            // Modal Logic (Tetap Sama)
            const modal = document.getElementById('modalPesanan');
            const btnSimpan = document.getElementById('btnSimpan');
            const btnUbah = document.getElementById('btnUbah');
            const form = document.getElementById('formPesanan');
            const modalTitle = document.getElementById('modalTitle');

            function toggleModal(show) {
                modal.classList.toggle('hidden', !show);
                modal.classList.toggle('flex', show);
                if (!show) form.reset();
                modalTitle.innerText = "Tambah Pesanan";
                btnSimpan.classList.remove('hidden');
                btnUbah.classList.add('hidden');
            }

            document.querySelectorAll('.btn-edit').forEach(btn => {
                btn.addEventListener('click', () => {
                    toggleModal(true);
                    modalTitle.innerText = "Ubah Pesanan";
                    btnSimpan.classList.add('hidden');
                    btnUbah.classList.remove('hidden');

                    form.id.value = btn.dataset.id;
                    form.nama.value = btn.dataset.nama;
                    form.nohp.value = btn.dataset.nohp;
                    form.jenis.value = btn.dataset.jenis;
                    form.lokasi.value = btn.dataset.lokasi;
                    form.tanggal.value = btn.dataset.tanggal;
                    form.durasi.value = btn.dataset.durasi;
                    form.status.value = btn.dataset.status;
                });
            });
        </script>
    </body>
</html>