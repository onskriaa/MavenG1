package Controller;

import dao.BilletDAO;
import dao.TrajetDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Billet;
import model.Trajet;
import model.Utilisateur;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/billet")
public class BilletServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect("loginUnique.jsp");
            return;
        }

        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        String action = request.getParameter("action");
        BilletDAO dao = new BilletDAO();

        switch (action != null ? action : "") {

            case "historique":
                List<Billet> historiques = dao.getBilletsUtilises(utilisateur.getId());
                request.setAttribute("billets", historiques);
                request.getRequestDispatcher("historique.jsp").forward(request, response);
                break;

            case "mesreservations":
                List<Billet> reservations = dao.getBilletsNonUtilises(utilisateur.getId());
                request.setAttribute("billets", reservations);
                request.getRequestDispatcher("mesReservations.jsp").forward(request, response);
                break;

            case "demandesuppression":
                try {
                    int billetId = Integer.parseInt(request.getParameter("id"));
                    Billet billet = dao.getBilletById(billetId);
                    if (billet != null && billet.getUtilisateur().getId() == utilisateur.getId()) {
                        billet.setAnnulationDemandee(true);
                        dao.modifierBillet(billet);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("ID de billet invalide.");
                }
                response.sendRedirect("billet?action=mesreservations");
                break;

            case "reserver":
                try {
                    int trajetId = Integer.parseInt(request.getParameter("idTrajet"));
                    Trajet trajet = new TrajetDAO().getTrajetById(trajetId);

                    Billet billet = new Billet();
                    billet.setUtilisateur(utilisateur);
                    billet.setTrajet(trajet);
                    billet.setDateReservation(new Date());
                    billet.setUtilise(false);
                    billet.setAnnulationDemandee(false);

                    dao.ajouterBillet(billet);
                    request.setAttribute("success", "Billet réservé avec succès !");
                } catch (Exception e) {
                    request.setAttribute("error", "Erreur lors de la réservation.");
                    e.printStackTrace();
                }

                List<Billet> billets = dao.getBilletsNonUtilises(utilisateur.getId());
                request.setAttribute("billets", billets);
                request.getRequestDispatcher("mesReservations.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("espaceUtilisateur.jsp");
                break;
        }
    }
}
