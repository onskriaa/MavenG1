<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Voyages</title>
</head>
<body>
    <h2>Liste des Voyages</h2>
    <a href="voyage?action=add">➕ Ajouter un nouveau voyage</a>
    <br><br>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom du Train</th>
            <th>Destination</th>
            <th>Date</th>
            <th>Prix</th>
            <th>Actions</th>
            <th>Places disponibles</th>
            
        </tr>
        <c:forEach var="voyage" items="${voyages}">
            <tr>
                <td>${voyage.id}</td>
                <td>${voyage.nomTrain}</td>
                <td>${voyage.destination}</td>
                <td>${voyage.dateVoyage}</td>
                <td>${voyage.prix}</td>
                <th>Places disponibles</th>
                
                <td>
                    <a href="voyage?action=edit&id=${voyage.id}">✏️ Modifier</a>
                    <a href="voyage?action=delete&id=${voyage.id}" onclick="return confirm('Supprimer ce voyage ?')">🗑️ Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
