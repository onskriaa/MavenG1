<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><c:choose><c:when test="${not empty gare}">Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose> une Gare</title>
</head>
<body>
    <h2>
        <c:choose>
            <c:when test="${not empty gare}">Modifier une Gare</c:when>
            <c:otherwise>Ajouter une Gare</c:otherwise>
        </c:choose>
    </h2>

    <form method="post" action="gare">
        <!-- Si gare != null → mode modification -->
        <c:if test="${not empty gare}">
            <input type="hidden" name="id" value="${gare.id}" />
        </c:if>

        Nom : <input type="text" name="nom" value="${gare.nom}" required><br>
        Ville : <input type="text" name="ville" value="${gare.ville}" required><br>
        Adresse : <input type="text" name="adresse" value="${gare.adresse}" required><br>
        <br>
        <input type="submit" value="<c:choose><c:when test='${not empty gare}'>Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose>">
    </form>

    <br>
    <a href="gare">🔙 Retour à la liste</a>
</body>
</html>
