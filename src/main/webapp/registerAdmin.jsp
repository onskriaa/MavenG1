<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head><title>Inscription Administrateur</title></head>
<body>
<h2>Créer un compte Admin</h2>

<form method="post" action="register">
    Nom : <input type="text" name="nom" value="${admin.nom}" required><br>
    Prénom : <input type="text" name="prenom" value="${admin.prenom}" required><br>
    Date de naissance : <input type="date" name="dateNaissance" value="${admin.dateNaissance}" required><br>
    Email : <input type="email" name="email" value="${admin.email}" required><br>
    Téléphone : <input type="text" name="telephone" value="${admin.telephone}" required><br>
    Mot de passe : <input type="password" name="password" required><br>
    <input type="submit" value="S'inscrire">
</form>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<a href="loginAdmin.jsp">Déjà inscrit ? Connexion</a>
</body>
</html>
