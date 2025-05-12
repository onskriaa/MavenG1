<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Tableau de bord - Administrateur</title>
</head>
<body>

<h2>Bienvenue, ${admin.prenom} ${admin.nom}</h2>

<hr>

<h3>📂 Gestion</h3>
<ul>
    <li><a href="gare">🛠️ Gérer les Gares</a></li>
    <li><a href="voyage">🛠️ Gérer les Voyages</a></li>
    <li><a href="trajet">🛠️ Gérer les Trajets</a></li>
    <li><a href="listeTrajets">📋 Liste des Trajets (lecture seule)</a></li> <!-- lien ajouté -->
</ul>


<h3>👤 Mon Compte</h3>
<ul>
    <li><a href="profilAdmin.jsp">👁️ Voir mon profil</a></li>
    <li><a href="logout">🔓 Déconnexion</a></li>
    <li><a href="adminBillet">📥 Demandes d’annulation de billets</a></li>
    
</ul>

</body>
</html>
