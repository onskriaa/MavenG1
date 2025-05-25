package Controller;

import dao.TrajetDAO;
import model.Trajet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/trajet")
public class TrajetServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        TrajetDAO dao = new TrajetDAO();

        try {
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Trajet trajet = dao.getTrajetById(id);
                request.setAttribute("trajet", trajet);
                request.getRequestDispatcher("formTrajet.jsp").forward(request, response);

            } else if ("add".equals(action)) {
                request.getRequestDispatcher("formTrajet.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.supprimerTrajet(id);
                response.sendRedirect("trajet");

            } else {
                // 🔁 Si gareDepart fourni : filtre pour proposition de suite de trajet
                String gareDepart = request.getParameter("gareDepart");
                List<Trajet> trajets = (gareDepart != null && !gareDepart.isEmpty())
                        ? dao.getTrajetsDepuis(gareDepart)
                        : dao.getAllTrajets();

                request.setAttribute("trajets", trajets);

                // 🔐 Redirection selon type de session
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("utilisateur") != null) {
                    request.getRequestDispatcher("trajet.jsp").forward(request, response); // vue utilisateur
                } else {
                    request.getRequestDispatcher("listeTrajets.jsp").forward(request, response); // vue admin
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // ou une autre page d’erreur
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TrajetDAO dao = new TrajetDAO();
        String idStr = request.getParameter("id");

        try {
            Trajet t = new Trajet();
            t.setGareDepart(request.getParameter("gareDepart"));
            t.setGareArrivee(request.getParameter("gareArrivee"));
            t.setDuree(Integer.parseInt(request.getParameter("duree")));
            t.setPrix(Double.parseDouble(request.getParameter("prix")));
            t.setDateDepart(request.getParameter("dateDepart"));
            t.setHeureDepart(request.getParameter("heureDepart"));
            t.setHeureArrivee(request.getParameter("heureArrivee"));

            if (idStr != null && !idStr.isEmpty()) {
                t.setId(Integer.parseInt(idStr));
                dao.modifierTrajet(t);
            } else {
                dao.ajouterTrajet(t);
            }

            response.sendRedirect("trajet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // pour gestion d'erreur
        }
    }
}
