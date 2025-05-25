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
    <title>Historique de mes voyages</title>
</head>
<body>

<h2>📜 Historique de mes voyages utilisés</h2>

<c:if test="${empty billets}">
    <p>Aucun billet utilisé pour l’instant.</p>
</c:if>

<c:if test="${not empty billets}">
    <table border="1">
        <tr>
            <th>#</th>
            <th>Trajet</th>
            <th>Date réservation</th>
            <th>Date départ</th>
            <th>Heure départ</th>
            <th>Heure arrivée</th>
            <th>Prix (€)</th>
        </tr>
        <c:forEach var="billet" items="${billets}">
            <tr>
                <td>${billet.id}</td>
                <td>${billet.trajet.gareDepart} ➜ ${billet.trajet.gareArrivee}</td>
                <td>${billet.dateReservation}</td>
                <td>${billet.trajet.dateDepart}</td>
                <td>${billet.trajet.heureDepart}</td>
                <td>${billet.trajet.heureArrivee}</td>
                <td>${billet.trajet.prix}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<a href="espaceUtilisateur.jsp">🔙 Retour à l’espace utilisateur</a>

</body>
</html>
