package controller;

import dao.pesananDAO;
import model.pesanan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/pesananServlet")
public class PesananServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); 
        String proses = request.getParameter("proses");
        pesananDAO dao = new pesananDAO();

        try {
            if ("Simpan".equals(proses)) {
                // Tambah data baru
                pesanan p = new pesanan();
                p.setNama(request.getParameter("nama"));
                p.setNoHp(request.getParameter("nohp"));
                p.setJenisKost(request.getParameter("jenis"));
                p.setLokasi(request.getParameter("lokasi"));
                p.setTanggalMasuk(java.sql.Date.valueOf(request.getParameter("tanggal")));
                p.setDurasi(Integer.parseInt(request.getParameter("durasi")));
                p.setStatus(request.getParameter("status"));
                p.setUsername("Guest"); // tanpa login
                dao.insert(p);

            } else if ("Ubah".equals(proses)) {
                // Update data
                int id = Integer.parseInt(request.getParameter("id"));
                pesanan p = new pesanan();
                p.setId(id);
                p.setNama(request.getParameter("nama"));
                p.setNoHp(request.getParameter("nohp"));
                p.setJenisKost(request.getParameter("jenis"));
                p.setLokasi(request.getParameter("lokasi"));
                p.setTanggalMasuk(java.sql.Date.valueOf(request.getParameter("tanggal")));
                p.setDurasi(Integer.parseInt(request.getParameter("durasi")));
                p.setStatus(request.getParameter("status"));
                dao.update(p);

            } else if ("Hapus".equals(proses)) {
                // Hapus data
                int id = Integer.parseInt(request.getParameter("id"));
                dao.delete(id);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("pesanan.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
