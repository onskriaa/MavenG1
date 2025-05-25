package Controller;

import dao.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Admin;
import model.Utilisateur;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminUtilisateurs")
public class AdminUtilisateurServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("loginAdmin.jsp");
            return;
        }

        UtilisateurDAO dao = new UtilisateurDAO();
        List<Utilisateur> utilisateurs = dao.getAllUtilisateurs();
        request.setAttribute("utilisateurs", utilisateurs);
        request.getRequestDispatcher("listeUtilisateurs.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean bloque = Boolean.parseBoolean(request.getParameter("bloque"));

        UtilisateurDAO dao = new UtilisateurDAO();
        Utilisateur utilisateur = dao.getUtilisateurById(id);
        if (utilisateur != null) {
            utilisateur.setBloque(bloque);
            dao.modifierUtilisateur(utilisateur);
        }

        response.sendRedirect("adminUtilisateurs");
    }
}
