<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Plateforme de gestion</title>
</head>
<body>

<h1>🚄 Bienvenue sur la plateforme de gestion des trajets</h1>

<c:if test="${not empty sessionScope.admin}">
    <p>Vous êtes connecté en tant qu'Administrateur : ${sessionScope.admin.prenom} ${sessionScope.admin.nom}</p>
    <a href="admin.jsp">🔧 Accéder à l'espace admin</a><br>
    <a href="logout">🔓 Déconnexion</a>
</c:if>

<c:if test="${not empty sessionScope.utilisateur}">
    <p>Bonjour ${sessionScope.utilisateur.prenom} ${sessionScope.utilisateur.nom}, bienvenue dans votre espace !</p>
    <a href="espaceUtilisateur.jsp">👤 Espace Utilisateur</a><br>
    <a href="logout">🔓 Déconnexion</a>
</c:if>

<c:if test="${empty sessionScope.admin and empty sessionScope.utilisateur}">
    <p>Veuillez vous connecter :</p>
    <a href="loginUnique.jsp"><button>🔐 Connexion</button></a>
    <p>Pas encore inscrit ? <a href="registerUser.jsp">Créer un compte utilisateur</a></p>
</c:if>

</body>
</html>
