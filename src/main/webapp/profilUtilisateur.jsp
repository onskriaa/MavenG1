<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    model.Utilisateur u = (model.Utilisateur) session.getAttribute("utilisateur");
    if (u == null) {
        response.sendRedirect("loginUnique.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil Utilisateur</title>
</head>
<body>

<h2>👤 Mon Profil</h2>

<c:if test="${not empty success}">
    <p style="color: green;">${success}</p>
</c:if>

<form method="post" action="profil">
    <input type="hidden" name="id" value="${u.id}" />

    <label>Nom :</label>
    <input type="text" name="nom" value="${u.nom}" required><br>

    <label>Prénom :</label>
    <input type="text" name="prenom" value="${u.prenom}" required><br>

    <label>Email :</label>
    <input type="email" name="email" value="${u.email}" readonly><br>

    <label>Téléphone :</label>
    <input type="text" name="telephone" value="${u.telephone}" required><br>

    <br>
    <input type="submit" value="✅ Mettre à jour">
</form>

<br>
<a href="espaceUtilisateur.jsp">🔙 Retour à mon espace</a>

</body>
</html>
