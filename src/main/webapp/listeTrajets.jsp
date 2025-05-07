<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Liste des Trajets</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        table { 
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
    </style>
</head>
<body>

    <h2>🚆 Liste des trajets enregistrés</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Départ</th>
            <th>Arrivée</th>
            <th>Durée (min)</th>
            <th>Prix (€)</th>
            <th>Date Départ</th>
            <th>Heure Départ</th>
            <th>Heure Arrivée</th>
        </tr>

        <c:forEach var="t" items="${listeTrajets}">
            <tr>
                <td>${t.id}</td>
                <td>${t.gareDepart}</td>
                <td>${t.gareArrivee}</td>
                <td>${t.duree}</td>
                <td>${t.prix}</td>
                <td>${t.dateDepart}</td>
                <td>${t.heureDepart}</td>
                <td>${t.heureArrivee}</td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <a href="adminAccueil.jsp">⬅ Retour à l'accueil Admin</a>

</body>
</html>
