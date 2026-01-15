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
    <meta charset="UTF-8">
    <title>Manajemen Data Kost | SMARTKOST</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <style>
        body { font-family: 'Inter', sans-serif; }

        /* Style tombol download kecil minimalis */
        .dt-buttons {
            display: inline-flex !important;
            background-color: #f3f4f6 !important;
            padding: 4px !important;
            border-radius: 6px !important;
            margin-bottom: 20px !important;
        }
        button.dt-button {
            background: transparent !important;
            border: none !important;
            color: #4b5563 !important;
            font-size: 11px !important;
            font-weight: 500 !important;
            padding: 4px 12px !important;
            margin: 0 !important;
            transition: all 0.2s !important;
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
    </style>
</head>

<body class="bg-gray-50 flex"> 
    <jsp:include page="sidebar.jsp" />

    <div class="flex-1 flex flex-col min-h-screen">
        <jsp:include page="headerAdmin.jsp" />

        <main class="p-8">
            <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
                
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-lg font-bold text-gray-700">Daftar Jenis Kost</h2>
                    <button onclick="toggleModal(true)" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg text-sm flex items-center gap-2 transition shadow-sm">
                        <span>+</span> Tambah jenis kost
                    </button>
                </div>

                <div class="overflow-x-auto">
                    <table id="tabelKost" class="w-full text-left border-collapse">
                        <thead>
                            <tr class="text-gray-400 text-xs uppercase tracking-wider border-b border-gray-100">
                                <th class="pb-4 font-bold w-16">#</th>
                                <th class="pb-4 font-bold">Jenis Kost</th>
                               
                                <th class="pb-4 font-bold text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm text-gray-600 divide-y divide-gray-50">
                            <% for (Kost k : list) { %>
                            <tr class="hover:bg-gray-50 transition">
                                <td class="py-4 font-medium"><%= no++ %></td>
                                <td class="py-4 font-medium text-gray-800"><%= k.getNamaKost() %></td>
                                <td class="py-4 text-center">
                                    <div class="flex justify-center gap-2">
                                        <button class="bg-yellow-400 text-white px-3 py-1 rounded text-xs hover:bg-yellow-500 btn-edit"
                                                data-id="<%= k.getId() %>"
                                                data-nama="<%= k.getNamaKost() %>">
                                            Edit
                                        </button>
                                        <form action="KostServlet" method="POST" class="inline">
                                            <input type="hidden" name="id" value="<%= k.getId() %>">
                                            <button type="submit" name="proses" value="Hapus"
                                                    class="bg-red-500 text-white px-3 py-1 rounded text-xs hover:bg-red-600"
                                                    onclick="return confirm('Hapus data ini?')">
                                                Hapus
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <div class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50" id="modalKost">
        <div class="bg-white rounded-xl shadow-lg w-full max-w-md p-6 relative">
            <h3 id="modalTitle" class="text-lg font-bold mb-4 text-gray-700">Tambah Jenis Kost</h3>
            <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-800" onclick="toggleModal(false)">×</button>
            <form method="POST" action="KostServlet" id="formKost">
                <input type="hidden" name="id" id="id">
                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nama Jenis Kost</label>
                    <input type="text" name="namaKost" id="namaKost" required 
                           class="w-full border border-gray-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-indigo-500 focus:outline-none">
                </div>
                <div class="flex justify-end gap-2 mt-6">
                    <button type="submit" name="proses" value="Simpan" id="btnSimpan" class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700 transition">Simpan</button>
                    <button type="submit" name="proses" value="Ubah" id="btnUbah" class="bg-yellow-400 text-white px-4 py-2 rounded-lg hover:bg-yellow-500 transition hidden">Ubah</button>
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
        // Inisialisasi DataTable
        $('#tabelKost').DataTable({
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

    const modal = document.getElementById('modalKost');
    const form = document.getElementById('formKost');
    const modalTitle = document.getElementById('modalTitle');
    const btnSimpan = document.getElementById('btnSimpan');
    const btnUbah = document.getElementById('btnUbah');

    // FUNGSI UNTUK BUKA/TUTUP MODAL
    function toggleModal(show) {
        modal.classList.toggle('hidden', !show);
        modal.classList.toggle('flex', show);
        
        if (!show) {
            form.reset(); // Reset teks input
            document.getElementById('id').value = ""; // PAKSA ID JADI KOSONG (Penting agar dianggap data baru)
        } else {
            // Default tampilan untuk TAMBAH data
            modalTitle.innerText = "Tambah Jenis Kost";
            btnSimpan.classList.remove('hidden');
            btnUbah.classList.add('hidden');
        }
    }

    // FUNGSI UNTUK ISI DATA SAAT KLIK EDIT
    $(document).on('click', '.btn-edit', function() {
        toggleModal(true);
        modalTitle.innerText = "Ubah Jenis Kost";
        btnSimpan.classList.add('hidden');
        btnUbah.classList.remove('hidden');

        // Ambil data dari atribut data-id dan data-nama di tombol
        const id = $(this).data('id');
        const nama = $(this).data('nama');

        // Tempel ke input form
        document.getElementById('id').value = id;
        document.getElementById('namaKost').value = nama;
    });
</script>
</body>
</html>