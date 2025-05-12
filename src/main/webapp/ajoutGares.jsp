<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter Gare</title>
</head>
<body>
    <h2>Ajouter une Gare</h2>
    <form method="post" action="gare">
        <input type="hidden" name="id" value="" />
        <label>Nom :</label> <input type="text" name="nom" required><br>
        <label>Ville :</label> <input type="text" name="ville" required><br>
        <label>Adresse :</label> <input type="text" name="adresse" required><br>
        <input type="submit" value="Ajouter">
    </form>

    <br>
    <a href="gare">Voir la liste des gares</a>
</body>
</html>
