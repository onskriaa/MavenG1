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
    <title>Mes Réservations</title>
</head>
<body>
<h2>🎟 Mes Réservations en cours</h2>

<c:if test="${empty billets}">
    <p>Vous n'avez aucune réservation active.</p>
</c:if>

<c:if test="${not empty billets}">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Trajet</th>
            <th>Date réservation</th>
            <th>Date départ</th>
            <th>Heure départ</th>
            <th>Heure arrivée</th>
            <th>Prix (€)</th>
            <th>Actions</th>
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
                <td>
                    <c:choose>
                        <c:when test="${billet.annulationDemandee}">
                            <span style="color:gray;">Demande envoyée</span>
                        </c:when>
                        <c:otherwise>
                            <a href="billet?action=demandesuppression&id=${billet.id}" onclick="return confirm('Confirmer l\'annulation de ce billet ?');">❌ Annuler</a><br/>
                        </c:otherwise>
                    </c:choose>
                    <a href="pdfBillet?id=${billet.id}" target="_blank">📄 Télécharger PDF</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<a href="espaceUtilisateur.jsp">🔙 Retour</a>
</body>
</html>
