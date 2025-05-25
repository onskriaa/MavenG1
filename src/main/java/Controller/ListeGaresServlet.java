package Controller;

import dao.GareDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Gare;

import java.io.IOException;
import java.util.List;


@WebServlet("/listeGares")
public class ListeGaresServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Gare> gares = new GareDAO().getAllGares();
        request.setAttribute("gares", gares);
        request.getRequestDispatcher("listeGares.jsp").forward(request, response);
    }
}

