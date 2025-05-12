<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Gares</title>
</head>
<body>
    <h2>Ajouter une gare</h2>
    <form method="post" action="ajouterGare">
        Nom : <input type="text" name="nom" required><br>
        Ville : <input type="text" name="ville" required><br>
        <button type="submit">Ajouter</button>
    </form>

    <h2>Liste des gares</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Ville</th>
        </tr>
        <c:forEach var="gare" items="${gares}">
            <tr>
                <td>${gare.id}</td>
                <td>${gare.nom}</td>
                <td>${gare.ville}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
