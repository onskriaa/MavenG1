package Controller;

import dao.BilletDAO;
import dao.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Admin;
import model.Billet;
import model.Utilisateur;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminBillet")
public class AdminBilletServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("loginAdmin.jsp");
            return;
        }

        String action = request.getParameter("action");
        BilletDAO billetDAO = new BilletDAO();
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

        try {
            if ("confirmer".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                billetDAO.supprimerBillet(id);
                response.sendRedirect("adminBillet");
                return;

            } else if ("refuser".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Billet billet = billetDAO.getBilletById(id);
                if (billet != null) {
                    billet.setAnnulationDemandee(false);
                    billetDAO.modifierBillet(billet);
                }
                response.sendRedirect("adminBillet");
                return;

            } else if ("filtrerParUtilisateur".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("utilisateurId"));
                List<Billet> billets = billetDAO.getBilletsParUtilisateur(userId);
                List<Utilisateur> utilisateurs = utilisateurDAO.getAllUtilisateurs();
                request.setAttribute("billets", billets);
                request.setAttribute("utilisateurs", utilisateurs);
                request.getRequestDispatcher("listeEtFiltreBillets.jsp").forward(request, response);
                return;
            }

            // Par défaut : afficher toutes les demandes d'annulation
            List<Billet> demandes = billetDAO.getDemandesAnnulation();
            request.setAttribute("billets", demandes);
            request.getRequestDispatcher("adminAnnulations.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
