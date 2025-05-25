<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un nouveau trajet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }
        table {
            border-collapse: collapse;
        }
        td {
            padding: 8px;
        }
        input[type="text"], input[type="number"], input[type="date"], input[type="time"] {
            padding: 6px;
            width: 200px;
        }
        input[type="submit"], button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #45a049;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        button.remove-btn {
            background-color: red;
            margin-left: 10px;
        }
        button.remove-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

    <h2>Ajouter un nouveau trajet</h2>

    <!-- ✅ Message de succès -->
    <c:if test="${param.success == 'true'}">
        <p class="success">✅ Trajet ajouté avec succès !</p>
    </c:if>

    <!-- ✅ Message d’erreur -->
    <c:if test="${param.error == 'true'}">
        <p class="error">❌ Une erreur est survenue lors de l’ajout du trajet.</p>
    </c:if>

    <!-- ✅ Formulaire d’ajout -->
    <form action="${pageContext.request.contextPath}/AjoutTrajetServlet" method="post">
        <table>
            <tr>
                <td>Gare Départ :</td>
                <td><input type="text" name="gareDepart" required></td>
            </tr>
            <tr>
                <td>Gare Arrivée :</td>
                <td><input type="text" name="gareArrivee" required></td>
            </tr>
            <tr>
                <td>Durée (minutes) :</td>
                <td><input type="number" name="duree" required></td>
            </tr>
            <tr>
                <td>Prix (€) :</td>
                <td><input type="number" name="prix" step="0.01" required></td>
            </tr>
            <tr>
                <td>Date de départ :</td>
                <td><input type="date" name="dateDepart" required></td>
            </tr>
            <tr>
                <td>Heure de départ :</td>
                <td><input type="time" name="heureDepart" required></td>
            </tr>
            <tr>
                <td>Heure d'arrivée :</td>
                <td><input type="time" name="heureArrivee" required></td>
            </tr>
            <tr><td colspan="2"><strong>Gares d’arrêt :</strong></td></tr>
            <tbody id="arretContainer">
                <tr id="arretRow0">
                    <td>Gare :</td>
                    <td>
                        <input type="text" name="arretNom0" required>
                        Durée (min) : <input type="number" name="arretDuree0" required>
                        Heure : <input type="time" name="arretHeure0" required>
                        <button type="button" class="remove-btn" onclick="removeArret('arretRow0')">❌</button>
                    </td>
                </tr>
            </tbody>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <button type="button" onclick="addArret()">+ Ajouter un arrêt</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Ajouter">
                </td>
            </tr>
        </table>
    </form>

    <br>
    <a href="adminAccueil.jsp">⬅ Retour à l'accueil Admin</a>

   <script>
let index = 1;

function addArret() {
    const container = document.getElementById("arretContainer");
    const row = document.createElement("tr");
    const rowId = `arretRow${index}`;
    row.setAttribute("id", rowId);

    row.innerHTML = `
        <td>Gare :</td>
        <td>
            <input type="text" name="arretNom${index}" required>
            Durée (min) : <input type="number" name="arretDuree${index}" required>
            Heure : <input type="time" name="arretHeure${index}" required>
            <button type="button" class="remove-btn" onclick="removeArret('${rowId}')">❌</button>
        </td>
    `;

    container.appendChild(row);
    index++;
}

function removeArret(rowId) {
    const row = document.getElementById(rowId);
    if (row) {
        row.remove();
    }
}
</script>

</body>
</html>
