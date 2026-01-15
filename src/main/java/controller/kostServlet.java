package controller;

import dao.KostDAO;
import model.Kost;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// 1. Pastikan mapping URL ini sama persis dengan 'action' di form JSP Anda
@WebServlet("/KostServlet") 
public class kostServlet extends HttpServlet { // Nama class huruf kecil tidak masalah, tapi disarankan KostServlet (Capital)

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String proses = request.getParameter("proses");
        String idStr = request.getParameter("id");
        String namaKost = request.getParameter("namaKost");
        
        KostDAO dao = new KostDAO();
        Kost k = new Kost();

        try {
            if (idStr != null && !idStr.isEmpty()) {
                k.setId(Integer.parseInt(idStr));
            }
            
            k.setNamaKost(namaKost);

            if ("Simpan".equals(proses)) {
                dao.simpan(k);
            } else if ("Ubah".equals(proses)) {
                dao.ubah(k);
            } else if ("Hapus".equals(proses)) {
                if (idStr != null && !idStr.isEmpty()) {
                    dao.hapus(Integer.parseInt(idStr));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 2. PERIKSA INI: Pastikan nama file JSP Anda benar. 
        // Jika nama filenya 'jenis_kost.jsp', maka ganti 'daftar_kost.jsp' menjadi 'jenis_kost.jsp'
        response.sendRedirect("jenis_kost.jsp"); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Disamakan agar tidak bingung saat redirect
        response.sendRedirect("jenis_kost.jsp");
    }
}