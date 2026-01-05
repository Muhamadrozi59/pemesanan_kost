package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== LOGIN SERVLET MASUK ===");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("USERNAME: " + username);
        System.out.println("PASSWORD: " + password);

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {
            System.out.println("LOGIN BERHASIL | ROLE = " + user.getRole());

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("admin".equals(user.getRole())) {
                response.sendRedirect("dashboardAdmin.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }

        } else {
            System.out.println("LOGIN GAGAL");
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
