<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head><title>Admin - Tableau de bord</title></head>
<body>
  <h1>Espace Admin</h1>
  <ul>
    <!-- Gestion des trajets -->
    <li><a href="ajoutTrajet.jsp">➕ Ajouter un Trajet</a></li>
    <li><a href="listeTrajets.jsp">🛠️ Gérer les Trajets</a></li>

    <!-- Gestion des gares -->
    <li><a href="gare?action=add">➕ Ajouter une Gare</a></li>
    <li><a href="gare">🛠️ Gérer les Gares</a></li>

    <!-- Gestion des voyages -->
    <li><a href="voyage?action=add">➕ Ajouter un Voyage</a></li>
    <li><a href="voyage">🛠️ Gérer les Voyages</a></li>
  </ul>
</body>
</html>
