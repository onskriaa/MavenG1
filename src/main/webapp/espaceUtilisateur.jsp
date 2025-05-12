<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    model.Utilisateur utilisateur = (model.Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null) {
        response.sendRedirect("loginUnique.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Espace Utilisateur</title>
</head>
<body>

<h2>👋 Bienvenue ${utilisateur.prenom} ${utilisateur.nom}</h2>

<p>📧 Email : ${utilisateur.email}</p>
<p>📞 Téléphone : ${utilisateur.telephone}</p>

<hr>

<h3>🧭 Navigation</h3>
<ul>
    <li><a href="trajet.jsp">🚆 Voir les trajets disponibles</a></li>
    <li><a href="billet?action=historique">📜 Historique de mes voyages (billets utilisés)</a></li>
    <li><a href="billet?action=mesreservations">🎟 Gérer mes réservations (modifier / annuler / télécharger PDF)</a></li>
    <li><a href="profilUtilisateur.jsp">👤 Voir / Modifier mon profil</a></li>
    <li><a href="logout">🔓 Déconnexion</a></li>
</ul>

</body>
</html>
