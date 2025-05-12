<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><c:choose><c:when test="${not empty voyage}">Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose> un Voyage</title>
</head>
<body>
    <h2>
        <c:choose>
            <c:when test="${not empty voyage}">Modifier un Voyage</c:when>
            <c:otherwise>Ajouter un Voyage</c:otherwise>
        </c:choose>
    </h2>

    <form method="post" action="voyage">
        <c:if test="${not empty voyage}">
            <input type="hidden" name="id" value="${voyage.id}" />
        </c:if>

        Nom du train : <input type="text" name="nomTrain" value="${voyage.nomTrain}" required><br>
        Destination : <input type="text" name="destination" value="${voyage.destination}" required><br>
        Date du voyage : <input type="date" name="dateVoyage" value="${voyage.dateVoyage}" required><br>
        Prix : <input type="number" step="0.01" name="prix" value="${voyage.prix}" required><br>

        <br>
        Places disponibles :
		<input type="number" name="placesDisponibles" value="${voyage.placesDisponibles}" required><br>
        
        <input type="submit" value="<c:choose><c:when test='${not empty voyage}'>Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose>">
    </form>

    <br>
    <a href="voyage">🔙 Retour à la liste des voyages</a>
</body>
</html>
