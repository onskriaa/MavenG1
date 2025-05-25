<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Personnes</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .message { color: green; margin-bottom: 15px; }
        .form-group { margin-bottom: 10px; }
        label { display: inline-block; width: 80px; }
    </style>
</head>
<body>
    <h1>Gestion des Personnes</h1>
    
    <div class="message">${message}</div>
    
    <h2>Ajouter/Modifier une Personne</h2>
    <form action="PersonneController" method="post">
        <input type="hidden" name="id" id="personneId">
        
        <div class="form-group">
            <label for="cin">CIN:</label>
            <input type="text" id="cin" name="cin" required>
        </div>
        
        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" id="nom" name="nom" required>
        </div>
        
        <div class="form-group">
            <label for="prenom">Prénom:</label>
            <input type="text" id="prenom" name="prenom" required>
        </div>
        
        <button type="submit" name="create">Ajouter</button>
        <button type="submit" name="update" style="display:none;">Modifier</button>
        <button type="button" onclick="resetForm()">Annuler</button>
    </form>
    
    <h2>Liste des Personnes</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>CIN</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${listPersonne}" var="personne">
            <tr>
                <td>${personne.id}</td>
                <td>${personne.cin}</td>
                <td>${personne.nom}</td>
                <td>${personne.prenom}</td>
                <td>
                    <button onclick="editPersonne(${personne.id}, '${personne.cin}', '${personne.nom}', '${personne.prenom}')">Modifier</button>
                    <a href="PersonneController?id=${personne.id}" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette personne?')">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <script>
        function editPersonne(id, cin, nom, prenom) {
            document.getElementById('personneId').value = id;
            document.getElementById('cin').value = cin;
            document.getElementById('nom').value = nom;
            document.getElementById('prenom').value = prenom;
            
            document.querySelector('button[name="create"]').style.display = 'none';
            document.querySelector('button[name="update"]').style.display = 'inline-block';
        }
        
        function resetForm() {
            document.getElementById('personneId').value = '';
            document.getElementById('cin').value = '';
            document.getElementById('nom').value = '';
            document.getElementById('prenom').value = '';
            
            document.querySelector('button[name="create"]').style.display = 'inline-block';
            document.querySelector('button[name="update"]').style.display = 'none';
        }
    </script>
</body>
</html>