package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.TrajetDAO;
import model.Trajet;

import java.io.IOException;
import java.util.List;

@WebServlet("/ListeTrajetsServlet")
public class ListeTrajetsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupération de tous les trajets
        List<Trajet> liste = new TrajetDAO().getAllTrajets();

        // Envoi à la JSP
        request.setAttribute("listeTrajets", liste);
        request.getRequestDispatcher("listeTrajets.jsp").forward(request, response);
    }
}
