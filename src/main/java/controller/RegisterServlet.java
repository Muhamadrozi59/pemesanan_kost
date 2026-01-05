package controller;

import config.koneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm  = request.getParameter("confirm_password");

        // VALIDASI FIELD
        if (username == null || password == null || confirm == null ||
            username.isEmpty() || password.isEmpty() || confirm.isEmpty()) {

            response.sendRedirect("register.jsp?error=empty");
            return;
        }

        // VALIDASI PASSWORD
        if (!password.equals(confirm)) {
            response.sendRedirect("register.jsp?error=pass");
            return;
        }

        try (Connection conn = koneksi.getConnection()) {

            String sql = "INSERT INTO users (username, password, nama, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);   // nanti kita hash
            ps.setString(3, username);   // default nama
            ps.setString(4, "user");

            ps.executeUpdate();

            response.sendRedirect("login.jsp?register=success");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=db");
        }
    }
}
