<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    model.Utilisateur utilisateur = (model.Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null) {
        response.sendRedirect("loginUnique.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des trajets disponibles</title>
</head>
<body>

<h2>🚆 Trajets disponibles</h2>

<c:if test="${trajets == null}">
    <p style="color:red;">⚠️ Erreur : la variable 'trajets' est null.</p>
</c:if>

<c:if test="${empty trajets}">
    <p>Aucun trajet trouvé pour le moment.</p>
</c:if>

<c:if test="${not empty trajets}">
    <table border="1" cellpadding="8">
        <thead>
            <tr>
                <th>ID</th>
                <th>Départ</th>
                <th>Arrivée</th>
                <th>Date</th>
                <th>Heure départ</th>
                <th>Heure arrivée</th>
                <th>Durée (min)</th>
                <th>Prix (€)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="t" items="${trajets}">
                <tr>
                    <td>${t.id}</td>
                    <td>${t.gareDepart}</td>
                    <td>${t.gareArrivee}</td>
                    <td>${t.dateDepart}</td>
                    <td>${t.heureDepart}</td>
                    <td>${t.heureArrivee}</td>
                    <td>${t.duree}</td>
                    <td>${t.prix}</td>
                    <td>
                        <a href="reserverBillet?idTrajet=${t.id}">🛒 Réserver</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<br>
<a href="espaceUtilisateur.jsp">🔙 Retour à mon espace</a>

</body>
</html>
