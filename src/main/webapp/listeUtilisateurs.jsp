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
    <title>👥 Gestion des utilisateurs</title>
</head>
<body>

<h2>👥 Liste des utilisateurs</h2>

<!-- 🔢 Statistiques -->
<%
    int total = ((java.util.List) request.getAttribute("utilisateurs")).size();
    int actifs = 0;
    int bloques = 0;
    for (Object obj : (java.util.List) request.getAttribute("utilisateurs")) {
        if (((model.Utilisateur) obj).isBloque()) {
            bloques++;
        } else {
            actifs++;
        }
    }
%>

<p>Total : <strong><%= total %></strong> |
   ✅ Actifs : <strong><%= actifs %></strong> |
   🔒 Bloqués : <strong><%= bloques %></strong>
</p>

<table border="1" cellpadding="6">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Email</th>
        <th>Statut</th>
        <th>Action</th>
    </tr>

    <c:forEach var="u" items="${utilisateurs}">
        <tr>
            <td>${u.id}</td>
            <td>${u.prenom} ${u.nom}</td>
            <td>${u.email}</td>
            <td>
                <c:choose>
                    <c:when test="${u.bloque}">🔒 Bloqué</c:when>
                    <c:otherwise>✅ Actif</c:otherwise>
                </c:choose>
            </td>
            <td>
                <form method="post" action="adminUtilisateurs">
                    <input type="hidden" name="id" value="${u.id}" />
                    <input type="hidden" name="bloque" value="${!u.bloque}" />
                    <button type="submit">
                        <c:choose>
                            <c:when test="${u.bloque}">🔓 Débloquer</c:when>
                            <c:otherwise>🚫 Bloquer</c:otherwise>
                        </c:choose>
                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="admin.jsp">🔙 Retour tableau de bord</a>

</body>
</html>
