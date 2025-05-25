package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Trajet;
import model.Arret;
import dao.TrajetDAO;
import dao.ArretDAO;

import java.io.IOException;

@WebServlet("/AjoutTrajetServlet")
public class AjoutTrajetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/ajoutTrajet.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ Récupération des champs principaux du trajet
            String depart = request.getParameter("gareDepart");
            String arrivee = request.getParameter("gareArrivee");
            int duree = Integer.parseInt(request.getParameter("duree"));
            double prix = Double.parseDouble(request.getParameter("prix"));
            String dateDepart = request.getParameter("dateDepart");
            String heureDepart = request.getParameter("heureDepart");
            String heureArrivee = request.getParameter("heureArrivee");

            // ✅ Création du trajet avec tous les champs
            Trajet trajet = new Trajet(depart, arrivee, duree, prix, dateDepart, heureDepart, heureArrivee);
            TrajetDAO trajetDAO = new TrajetDAO();
            trajetDAO.ajouterTrajet(trajet);

            // ✅ Ajout des arrêts liés
            int i = 0;
            while (true) {
                String nom = request.getParameter("arretNom" + i);
                String dureeStr = request.getParameter("arretDuree" + i);
                String heure = request.getParameter("arretHeure" + i);

                if (nom == null || dureeStr == null || heure == null) break;

                int dureeArret = Integer.parseInt(dureeStr);
                Arret arret = new Arret(nom, dureeArret, heure, trajet);
                new ArretDAO().ajouterArret(arret);

                i++;
            }

            // ✅ Redirection après succès
            response.sendRedirect(request.getContextPath() + "/ajoutTrajet.jsp?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/ajoutTrajet.jsp?error=true");
        }
    }
}
