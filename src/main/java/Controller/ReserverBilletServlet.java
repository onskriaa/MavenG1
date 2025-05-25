package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import model.Trajet;
import model.Utilisateur;
import model.Arret;
import model.Billet;
import dao.TrajetDAO;
import dao.ArretDAO;
import dao.BilletDAO;
import dao.UtilisateurDAO;
import java.util.Date;
@WebServlet("/reserverBillet")
public class ReserverBilletServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idTrajet = Integer.parseInt(request.getParameter("idTrajet"));
        Trajet trajet = new TrajetDAO().getTrajetById(idTrajet);
        request.setAttribute("trajet", trajet);
        request.getRequestDispatcher("confirmerReservation.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int trajetId = Integer.parseInt(request.getParameter("trajetId"));
        String classe = request.getParameter("classe");
        String[] prefs = request.getParameterValues("preferences");

        String preferences = "";
        if (prefs != null) {
            preferences = String.join(", ", prefs);
        }

        // créer billet
        HttpSession session = request.getSession(false);
        Utilisateur u = (Utilisateur) session.getAttribute("utilisateur");

        Billet billet = new Billet();
        billet.setTrajet(new TrajetDAO().getTrajetById(trajetId));
        billet.setUtilisateur(u);
        billet.setClasse(classe);
        billet.setPreferences(preferences);
        billet.setDateReservation(new Date()); 
        billet.setUtilise(false);
        billet.setAnnulationDemandee(false);

        new BilletDAO().ajouterBillet(billet);

        // redirection vers suggestion de trajet suivant
        response.sendRedirect("suggestion.jsp?gareDepart=" + billet.getTrajet().getGareArrivee());
    }
}
