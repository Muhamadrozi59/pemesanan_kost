package controller;

import dao.pesananDAO;
import model.pesanan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/pesan")
public class PesanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String step = request.getParameter("step");

        if(step == null){
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            switch(step){
                case "1":
                    // Step 1: Data diri
                    session.setAttribute("nama", request.getParameter("nama"));
                    session.setAttribute("noHp", request.getParameter("noHp"));
                    session.setAttribute("jenisKost", request.getParameter("jenisKost"));
                    session.setAttribute("lokasi", request.getParameter("lokasi"));
                    response.sendRedirect("pesan_step2.jsp"); // lanjut ke step 2
                    break;

                case "2":
                    // Step 2: Detail kost
                    session.setAttribute("tanggalMasuk", request.getParameter("tanggalMasuk"));
                    session.setAttribute("durasi", request.getParameter("durasi"));
                    response.sendRedirect("konfirmasi.jsp"); // lanjut ke konfirmasi
                    break;

                case "3":
                    // Step 3: Konfirmasi & simpan pesanan
                    pesanan p = new pesanan();
                    p.setNama((String) session.getAttribute("nama"));
                    p.setNoHp((String) session.getAttribute("noHp"));
                    p.setJenisKost((String) session.getAttribute("jenisKost"));
                    p.setLokasi((String) session.getAttribute("lokasi"));
                    p.setTanggalMasuk(Date.valueOf((String) session.getAttribute("tanggalMasuk")));
                    p.setDurasi(Integer.parseInt((String) session.getAttribute("durasi")));

                    // Username kosong karena tanpa login
                    p.setUsername("Guest");

                    new pesananDAO().insert(p);

                    // Hapus session step tapi biarkan session lain tetap ada jika perlu
                    session.removeAttribute("nama");
                    session.removeAttribute("noHp");
                    session.removeAttribute("jenisKost");
                    session.removeAttribute("lokasi");
                    session.removeAttribute("tanggalMasuk");
                    session.removeAttribute("durasi");

                    response.sendRedirect("sukses.jsp");
                    break;

                default:
                    response.sendRedirect("index.jsp");
            }
        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
}
