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
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>📋 Billets réservés / Filtrer par utilisateur</title>
</head>
<body>

<h2>🔍 Filtrer les billets par utilisateur</h2>

<form method="get" action="adminBillet">
    <label>Choisir un utilisateur :</label>
    <select name="utilisateurId">
        <c:forEach var="u" items="${utilisateurs}">
            <option value="${u.id}"
                <c:if test="${param.utilisateurId == u.id}">selected</c:if>>
                ${u.nom} ${u.prenom} (${u.email})
            </option>
        </c:forEach>
    </select>
    <input type="submit" value="Afficher les billets">
    <input type="hidden" name="action" value="filtrerParUtilisateur" />
</form>

<hr>

<h2>📋 Liste des billets réservés</h2>

<c:if test="${empty billets}">
    <p>Aucun billet trouvé.</p>
</c:if>

<c:if test="${not empty billets}">
    <table border="1" cellpadding="6">
        <tr>
            <th>ID Billet</th>
            <th>Utilisateur</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Trajet</th>
            <th>Date réservation</th>
            <th>Date départ</th>
            <th>Heure départ</th>
            <th>Heure arrivée</th>
            <th>Utilisé</th>
        </tr>
        <c:forEach var="b" items="${billets}">
            <tr>
                <td>${b.id}</td>
                <td>${b.utilisateur.prenom} ${b.utilisateur.nom}</td>
                <td>${b.utilisateur.email}</td>
                <td>${b.utilisateur.telephone}</td>
                <td>${b.trajet.gareDepart} ➜ ${b.trajet.gareArrivee}</td>
                <td>${b.dateReservation}</td>
                <td>${b.trajet.dateDepart}</td>
                <td>${b.trajet.heureDepart}</td>
                <td>${b.trajet.heureArrivee}</td>
                <td>
                    <c:choose>
                        <c:when test="${b.utilise}">✅</c:when>
                        <c:otherwise>❌</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<a href="admin.jsp">🔙 Retour tableau de bord admin</a>

</body>
</html>
