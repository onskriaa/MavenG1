package Controller;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissanceStr = request.getParameter("dateNaissance");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        // Vérifie si un admin avec cet email existe déjà
        if (dao.getAdminByEmail(email) != null) {
            request.setAttribute("error", "Cet email est déjà utilisé.");
            Admin admin = new Admin();
            admin.setNom(nom);
            admin.setPrenom(prenom);
            admin.setEmail(email);
            admin.setTelephone(telephone);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        // Création d’un nouvel admin
        Admin admin = new Admin();
        admin.setNom(nom);
        admin.setPrenom(prenom);
        admin.setEmail(email);
        admin.setPassword(password);
        admin.setTelephone(telephone);

        try {
            Date dateNaissance = new SimpleDateFormat("yyyy-MM-dd").parse(dateNaissanceStr);
            admin.setDateNaissance(dateNaissance);
        } catch (Exception e) {
            request.setAttribute("error", "Date de naissance invalide.");
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("registerAdmin.jsp").forward(request, response);
            return;
        }

        dao.ajouterAdmin(admin);

        // Connexion automatique après inscription
        request.getSession().setAttribute("admin", admin);
        response.sendRedirect("admin.jsp");
    }
}
