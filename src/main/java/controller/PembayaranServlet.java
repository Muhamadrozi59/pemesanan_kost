package controller;

import dao.PembayaranDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PembayaranServlet")
public class PembayaranServlet extends HttpServlet {
    private PembayaranDAO dao = new PembayaranDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String aksi = request.getParameter("aksi");
        
        if ("bayar".equals(aksi)) {
            try {
                // ID pembayaran (tetap mengambil ID dari tabel pembayaran)
                int id = Integer.parseInt(request.getParameter("id"));
                // Jumlah yang dibayarkan saat ini
                double jumlah = Double.parseDouble(request.getParameter("jumlah_bayar"));
                
                dao.bayar(id, jumlah);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Log error di console server
            }
        }
        // Pastikan nama file redirect sesuai dengan file JSP Anda
        response.sendRedirect("pembayaran_Admin.jsp");
    }
}