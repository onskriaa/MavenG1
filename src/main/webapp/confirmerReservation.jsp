<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty sessionScope.utilisateur or empty trajet}">
    <c:redirect url="loginUnique.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation de réservation</title>
</head>
<body>

<h2>🛒 Confirmation de réservation</h2>

<h3>Détails du trajet :</h3>
<ul>
    <li><strong>Départ :</strong> ${trajet.gareDepart}</li>
    <li><strong>Arrivée :</strong> ${trajet.gareArrivee}</li>
    <li><strong>Date :</strong> ${trajet.dateDepart}</li>
    <li><strong>Heure départ :</strong> ${trajet.heureDepart}</li>
    <li><strong>Heure arrivée :</strong> ${trajet.heureArrivee}</li>
    <li><strong>Prix :</strong> ${trajet.prix} €</li>
</ul>

<hr/>

<form method="post" action="reserverBillet">
    <input type="hidden" name="trajetId" value="${trajet.id}" />

    <label>🎫 Choisir une classe :</label>
    <select name="classe" required>
        <option value="1ère">1ère classe</option>
        <option value="2ème">2ème classe</option>
        <option value="économique">Économique</option>
    </select>

    <br><br>

    <label>🛏️ Préférences :</label><br/>
    <input type="checkbox" name="preferences" value="Fenêtre"/> Côté fenêtre<br/>
    <input type="checkbox" name="preferences" value="Famille"/> Espace famille<br/>
    <input type="checkbox" name="preferences" value="Non-fumeur"/> Wagon non-fumeur<br/>

    <br/>
    <input type="submit" value="✅ Confirmer la réservation">
</form>

<br>
<a href="trajet">🔙 Revenir à la liste des trajets</a>

</body>
</html>
