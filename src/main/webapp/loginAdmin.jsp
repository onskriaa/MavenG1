<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head><title>Connexion Administrateur</title></head>
<body>
<h2>Connexion Admin</h2>

<form method="post" action="login">
    Email : <input type="email" name="email" value="${param.email}" required><br>
    Mot de passe : <input type="password" name="password" required><br>
    <input type="submit" value="Se connecter">
</form>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<a href="registerAdmin.jsp">Créer un compte</a>
</body>
</html>
