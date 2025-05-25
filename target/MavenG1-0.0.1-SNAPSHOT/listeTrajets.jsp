<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Liste des Trajets</title></head>
<body>
<h2>Liste des Trajets</h2>
<a href="trajet?action=add">➕ Ajouter un Trajet</a><br><br>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Départ</th>
        <th>Arrivée</th>
        <th>Durée (min)</th>
        <th>Prix (€)</th>
        <th>Date</th>
        <th>Heure départ</th>
        <th>Heure arrivée</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="trajet" items="${trajets}">
        <tr>
            <td>${trajet.id}</td>
            <td>${trajet.gareDepart}</td>
            <td>${trajet.gareArrivee}</td>
            <td>${trajet.duree}</td>
            <td>${trajet.prix}</td>
            <td>${trajet.dateDepart}</td>
            <td>${trajet.heureDepart}</td>
            <td>${trajet.heureArrivee}</td>
            <td>
                <a href="trajet?action=edit&id=${trajet.id}">✏️ Modifier</a>
                <a href="trajet?action=delete&id=${trajet.id}" onclick="return confirm('Confirmer la suppression ?');">🗑️ Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
