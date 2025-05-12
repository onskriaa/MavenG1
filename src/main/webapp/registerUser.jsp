<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription Utilisateur</title>
</head>
<body>

<h2>Créer un compte utilisateur</h2>

<form method="post" action="registerUser">
    Nom : <input type="text" name="nom" value="${utilisateur.nom}" required><br>
    Prénom : <input type="text" name="prenom" value="${utilisateur.prenom}" required><br>
    Email : <input type="email" name="email" value="${utilisateur.email}" required><br>
    Mot de passe : <input type="password" name="password" required><br>
    Téléphone : <input type="text" name="telephone" value="${utilisateur.telephone}" required><br>
    <input type="submit" value="S'inscrire">
</form>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<a href="loginUnique.jsp">🔐 Déjà inscrit ? Connexion</a><br>
<a href="index.jsp">🏠 Retour à l'accueil</a>

</body>
</html>
