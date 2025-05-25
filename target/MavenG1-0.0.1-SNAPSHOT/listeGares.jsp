<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Liste des Gares</title></head>
<body>
    <h2>Liste des Gares</h2>
    <a href="gare?action=add">➕ Ajouter une nouvelle gare</a>
    
    <table border="1">
        <tr><th>ID</th><th>Nom</th><th>Ville</th><th>Adresse</th><th>Actions</th></tr>
        <c:forEach var="gare" items="${gares}">
            <tr>
                <td>${gare.id}</td>
                <td>${gare.nom}</td>
                <td>${gare.ville}</td>
                <td>${gare.adresse}</td>
                <td>
                    <a href="gare?action=edit&id=${gare.id}">✏️ Modifier</a>
                    <a href="gare?action=delete&id=${gare.id}" onclick="return confirm('Confirmer la suppression ?')">🗑️ Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
    