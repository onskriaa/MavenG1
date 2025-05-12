<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    model.Admin admin = (model.Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Demandes d'annulation</title>
</head>
<body>

<h2>📋 Demandes d'annulation de billets</h2>

<c:if test="${empty billets}">
    <p>Aucune demande d'annulation en attente.</p>
</c:if>

<c:if test="${not empty billets}">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Utilisateur</th>
            <th>Trajet</th>
            <th>Date réservation</th>
            <th>Date départ</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="billet" items="${billets}">
            <tr>
                <td>${billet.id}</td>
                <td>${billet.utilisateur.nom} ${billet.utilisateur.prenom}</td>
                <td>${billet.trajet.gareDepart} ➜ ${billet.trajet.gareArrivee}</td>
                <td>${billet.dateReservation}</td>
                <td>${billet.trajet.dateDepart}</td>
                <td>
                    <a href="adminBillet?action=confirmer&id=${billet.id}">✅ Confirmer</a>
                    <a href="adminBillet?action=refuser&id=${billet.id}">❌ Refuser</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<a href="admin.jsp">🔙 Retour tableau de bord admin</a>

</body>
</html>
