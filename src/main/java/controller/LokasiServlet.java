package controller;

import dao.lokasiDAO;
import model.lokas;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LokasiServlet")
public class LokasiServlet extends HttpServlet {
    private lokasiDAO dao = new lokasiDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String aksi = request.getParameter("aksi");
        String idStr = request.getParameter("id");
        String nama = request.getParameter("nama");

        // Logika Hapus (Pindahkan ke sini karena JSP menggunakan POST)
        if ("hapus".equals(aksi)) {
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                dao.hapus(id);
            }
        } 
        // Logika Simpan
        else if ("simpan".equals(aksi)) {
            lokas l = new lokas();
            l.setNama(nama);
            dao.simpan(l);
        } 
        // Logika Ubah
        else if ("ubah".equals(aksi)) {
            lokas l = new lokas();
            if (idStr != null) {
                l.setId(Integer.parseInt(idStr));
                l.setNama(nama);
                dao.ubah(l);
            }
        }

        // Setelah aksi selesai, selalu kembali ke halaman admin
        response.sendRedirect("lokasiadmin.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Biar aman, jika ada akses GET arahkan ke POST atau balikkan ke halaman utama
        doPost(request, response);
    }
}