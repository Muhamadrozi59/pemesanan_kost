<%
    // Mendapatkan nama file yang sedang dibuka
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
%>

<aside class="w-64 bg-white min-h-screen shadow-sm border-r border-gray-100">
    <div class="p-6 flex items-center gap-2">
        <span class="text-2xl font-bold text-indigo-900">SMART</span>
        <span class="text-2xl font-bold text-indigo-500">KOST</span>
    </div>

    <nav class="px-0 mt-4">
        <a href="dashboardAdmin.jsp" 
           class="flex items-center px-6 py-3 transition-colors <%= pageName.equals("dashboardAdmin.jsp") ? "bg-indigo-50 text-indigo-600 border-r-4 border-indigo-500 font-medium" : "text-gray-500 hover:bg-indigo-50 hover:text-indigo-600"%>">
            <span class="mr-3"></span> Dashboard
        </a>

        <a href="jenis_kost.jsp" 
           class="flex items-center px-6 py-3 transition-colors <%= pageName.equals("jenis_kost.jsp") ? "bg-indigo-50 text-indigo-600 border-r-4 border-indigo-500 font-medium" : "text-gray-500 hover:bg-indigo-50 hover:text-indigo-600"%>">
            <span class="mr-3"></span> Data Kost
        </a>

        <a href="lokasiadmin.jsp" 
           class="flex items-center px-6 py-3 transition-colors <%= pageName.equals("lokasiadmin.jsp") ? "bg-indigo-50 text-indigo-600 border-r-4 border-indigo-500 font-medium" : "text-gray-500 hover:bg-indigo-50 hover:text-indigo-600"%>">
            <span class="mr-3"></span> lokasi
        </a>

        <a href="pesanan.jsp" 
           class="flex items-center px-6 py-3 transition-colors <%= pageName.equals("pesanan.jsp") ? "bg-indigo-50 text-indigo-600 border-r-4 border-indigo-500 font-medium" : "text-gray-500 hover:bg-indigo-50 hover:text-indigo-600"%>">
            <span class="mr-3"></span> pesanan
        </a>

        <a href="pembayaran_Admin.jsp" 
           class="flex items-center px-6 py-3 transition-colors <%= pageName.equals("pembayaran_Admin.jsp") ? "bg-indigo-50 text-indigo-600 border-r-4 border-indigo-500 font-medium" : "text-gray-500 hover:bg-indigo-50 hover:text-indigo-600"%>">
            <span class="mr-3"></span> pembayaran
        </a>
    </nav>
</aside>