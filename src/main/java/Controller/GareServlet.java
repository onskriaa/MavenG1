// ==== GareServlet.java (Controller) ====
package Controller;

import dao.GareDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Gare;
import java.io.IOException;
import java.util.List;

@WebServlet("/gare")
public class GareServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        GareDAO dao = new GareDAO();

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Gare g = dao.getGareById(id);
            request.setAttribute("gare", g);
            request.getRequestDispatcher("formGare.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("formGare.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.supprimerGare(id);
            response.sendRedirect("gare");
        } else {
            List<Gare> gares = dao.getAllGares();
            request.setAttribute("gares", gares);
            request.getRequestDispatcher("listeGares.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        GareDAO dao = new GareDAO();
        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String ville = request.getParameter("ville");
        String adresse = request.getParameter("adresse");

        Gare g = new Gare();
        g.setNom(nom);
        g.setVille(ville);
        g.setAdresse(adresse);

        if (idStr != null && !idStr.isEmpty()) {
            g.setId(Integer.parseInt(idStr));
            dao.modifierGare(g);
        } else {
            dao.ajouterGare(g);
        }

        response.sendRedirect("gare");
    }
}
