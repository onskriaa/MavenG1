package view;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Personne; // Missing import for Personne class

/**
 * Servlet implementation class PersonneView
 */
@WebServlet("/PersonneView")
public class PersonneView extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonneView() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); // Set content type
        PrintWriter out = response.getWriter();
        out.print("<!DOCTYPE html><html><head> <meta charset=\"utf-8\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\"> \r\n"
                + " <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\"> </head> \r\n");
        out.print("<body><h1> Liste des personnes</h1>");
        out.print("<div class='container mt-4'>");
        String m = (String) request.getAttribute("message");
        if (m != null && !m.equals("")) {
            out.print("<div class='alert alert-danger' role='alert'>");
            out.print("<strong>" + m + "</strong></div>");
        }
        out.print("</div><table class='table table-hover'>");
        out.print("<tr class='table-primary'>"
                + "<th>Id</th><th>Cin</th><th>Nom</th><th>Prenom</th>"
                + "<th>Actions</th></tr>"); // Fixed quote characters
        
        @SuppressWarnings("unchecked")
        List<Personne> results = (List<Personne>) request.getAttribute("listPersonne");
        
        if (results != null) { // Check if results is not null
            for (Personne p : results) {
                out.print("<tr><td>" + p.getId() + " </td><td> " + p.getCin());
                out.print("</td> <td> " + p.getNom() + " </td> <td> " + p.getPrenom() + " </td> ");
                out.print("<td><a href='PersonneUpdate.html?id=" + p.getId() + "' class='btn btn-success'>Editer</a> "); // Added id parameter to edit link
                out.print("<a href='PersonneController?id=" + p.getId()
                        + "&action=delete' class='btn btn-danger'>Supprimer</a></td></tr>"); // Added action parameter
            }
        }
        out.print("</table></div>");
        out.print("<div class='container mt-3'>");
        out.print("<a href='PersonneAdd.html' class='btn btn-primary'>Ajouter une personne</a>"); // Added button to add a new person
        out.print("</div>");
        out.print("</body></html>");
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}