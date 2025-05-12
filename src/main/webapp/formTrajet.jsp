<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title><c:choose><c:when test="${not empty trajet}">Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose> un Trajet</title></head>
<body>
<h2><c:choose><c:when test="${not empty trajet}">Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose> un Trajet</h2>
<form method="post" action="trajet">
    <c:if test="${not empty trajet}">
        <input type="hidden" name="id" value="${trajet.id}" />
    </c:if>
    Gare de départ : <input type="text" name="gareDepart" value="${trajet.gareDepart}" required><br>
    Gare d'arrivée : <input type="text" name="gareArrivee" value="${trajet.gareArrivee}" required><br>
    Durée (min) : <input type="number" name="duree" value="${trajet.duree}" required><br>
    Prix (€) : <input type="number" step="0.01" name="prix" value="${trajet.prix}" required><br>
    Date de départ : <input type="date" name="dateDepart" value="${trajet.dateDepart}" required><br>
    Heure de départ : <input type="time" name="heureDepart" value="${trajet.heureDepart}" required><br>
    Heure d'arrivée : <input type="time" name="heureArrivee" value="${trajet.heureArrivee}" required><br>
    <br>
    <input type="submit" value="<c:choose><c:when test='${not empty trajet}'>Modifier</c:when><c:otherwise>Ajouter</c:otherwise></c:choose>">
</form>
<a href="trajet">🔙 Retour à la liste</a>
</body>
</html>