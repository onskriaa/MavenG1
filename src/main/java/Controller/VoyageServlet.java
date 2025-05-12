package Controller;

import dao.VoyageDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Voyage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/voyage")
public class VoyageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        VoyageDAO dao = new VoyageDAO();

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Voyage v = dao.getVoyageById(id);
            request.setAttribute("voyage", v);
            request.getRequestDispatcher("formVoyage.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("formVoyage.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.supprimerVoyage(id);
            response.sendRedirect("voyage");
        } else {
            List<Voyage> voyages = dao.getAllVoyages();
            request.setAttribute("voyages", voyages);
            request.getRequestDispatcher("listeVoyages.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VoyageDAO dao = new VoyageDAO();
        String idStr = request.getParameter("id");
        String nomTrain = request.getParameter("nomTrain");
        String destination = request.getParameter("destination");
        String dateStr = request.getParameter("dateVoyage");
        String prixStr = request.getParameter("prix");
        String placesStr = request.getParameter("placesDisponibles");
       


        Voyage v = new Voyage();
        v.setNomTrain(nomTrain);
        v.setDestination(destination);
        v.setPlacesDisponibles(Integer.parseInt(placesStr));

        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            v.setDateVoyage(date);
        } catch (Exception e) {
            e.printStackTrace();
        }

        v.setPrix(Double.parseDouble(prixStr));

        if (idStr != null && !idStr.isEmpty()) {
            v.setId(Integer.parseInt(idStr));
            dao.modifierVoyage(v);
        } else {
            dao.ajouterVoyage(v);
        }

        response.sendRedirect("voyage");
    }
}