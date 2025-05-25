package Controller;

import dao.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/profil")
public class ProfilServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupère l'utilisateur connecté
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null) {
            response.sendRedirect("loginUnique.jsp");
            return;
        }

        // Mise à jour des infos depuis le formulaire
        utilisateur.setNom(request.getParameter("nom"));
        utilisateur.setPrenom(request.getParameter("prenom"));
        utilisateur.setTelephone(request.getParameter("telephone"));

        new UtilisateurDAO().modifierUtilisateur(utilisateur);
        session.setAttribute("utilisateur", utilisateur); // mettre à jour la session

        request.setAttribute("success", "Profil mis à jour avec succès !");
        request.getRequestDispatcher("profilUtilisateur.jsp").forward(request, response);
    }
}
