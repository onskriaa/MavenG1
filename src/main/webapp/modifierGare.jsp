<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Modifier Gare</title></head>
<body>
    <h2>Modifier une Gare</h2>
    <form method="post" action="gare">
        <input type="hidden" name="id" value="${gare.id}" />
        Nom : <input type="text" name="nom" value="${gare.nom}" required><br>
        Ville : <input type="text" name="ville" value="${gare.ville}" required><br>
        Adresse : <input type="text" name="adresse" value="${gare.adresse}" required><br>
        <input type="submit" value="Mettre à jour">
    </form>
    <a href="gare">Retour à la liste</a>
</body>
</html>
    