<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
</head>
<body>

<h2>Connexion à la plateforme</h2>

<form method="post" action="login">
    <label>Email :</label>
    <input type="email" name="email" required><br>

    <label>Mot de passe :</label>
    <input type="password" name="password" required><br>

    <label>Se connecter en tant que :</label>
    <select name="role" required>
        <option value="admin">Administrateur</option>
        <option value="utilisateur">Utilisateur</option>
    </select><br><br>

    <input type="submit" value="Se connecter">
</form>

<!-- Message d'erreur si connexion invalide -->
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<p>Pas encore inscrit ? <a href="registerUser.jsp">Créer un compte utilisateur</a></p>
<a href="index.jsp">🔙 Retour à l'accueil</a>

</body>
</html>
