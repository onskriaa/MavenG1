<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Plateforme de gestion des trajets</title>
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <style>
        :root {
            --primary-color: #0078d7;
            --secondary-color: #f0f6ff;
            --accent-color: #ff6b6b;
            --text-color: #333;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #6c757d;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        .logo i {
            margin-right: 10px;
            font-size: 28px;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 25px;
        }
        
        nav ul li a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s;
        }
        
        nav ul li a:hover {
            color: var(--primary-color);
        }
        
        .hero {
            background: linear-gradient(to right, #1a73e8, #0078d7);
            color: white;
            padding: 50px 0;
            text-align: center;
            margin-bottom: 40px;
        }
        
        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
        }
        
        .user-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .user-section p {
            margin-bottom: 15px;
        }
        
        .search-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .form-group {
            flex: 1 1 200px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 16px;
        }
        
        .search-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 25px;
        }
        
        .search-btn:hover {
            background-color: #005bb0;
        }
        
        .results {
            margin-top: 30px;
        }
        
        .results h3 {
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .train-list {
            border-collapse: collapse;
            width: 100%;
        }
        
        .train-list th {
            background-color: var(--secondary-color);
            padding: 12px 15px;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
        }
        
        .train-list td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--medium-gray);
        }
        
        .train-list tr:nth-child(even) {
            background-color: var(--light-gray);
        }
        
        .train-list tr:hover {
            background-color: #e8f4ff;
        }
        
        .reserve-btn {
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 15px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .reserve-btn:hover {
            background-color: #ff4d4d;
        }
        
        .available {
            color: green;
            font-weight: 500;
        }
        
        .limited {
            color: orange;
            font-weight: 500;
        }
        
        .auth-buttons {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #005bb0;
        }
        
        .btn-secondary {
            background-color: white;
            color: var(--text-color);
            border: 1px solid var(--medium-gray);
        }
        
        .btn-secondary:hover {
            background-color: var(--light-gray);
        }
        
        footer {
            background-color: white;
            padding: 20px 0;
            border-top: 1px solid var(--medium-gray);
            margin-top: 40px;
            text-align: center;
            color: var(--dark-gray);
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-train"></i>
                    TrainExpress
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp" class="active">Accueil</a></li>
                        <li><a href="horaires.jsp">Horaires</a></li>
                        <li><a href="tarifs.jsp">Tarifs</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    
    <section class="hero">
        <div class="container">
            <h1>🚄 Explorez la France en train</h1>
            <p>Voyagez facilement, rapidement et confortablement à travers le pays avec notre service de réservation de billets.</p>
        </div>
    </section>

    <div class="container">
        <!-- Section utilisateur/admin connecté -->
        <c:if test="${not empty sessionScope.admin}">
            <div class="user-section">
                <p>Vous êtes connecté en tant qu'Administrateur : ${sessionScope.admin.prenom} ${sessionScope.admin.nom}</p>
                <div class="auth-buttons">
                    <a href="admin.jsp" class="btn btn-primary"><i class="fas fa-cog"></i> Accéder à l'espace admin</a>
                    <a href="logout" class="btn btn-secondary"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.utilisateur}">
            <div class="user-section">
                <p>Bonjour ${sessionScope.utilisateur.prenom} ${sessionScope.utilisateur.nom}, bienvenue dans votre espace !</p>
                <div class="auth-buttons">
                    <a href="espaceUtilisateur.jsp" class="btn btn-primary"><i class="fas fa-user"></i> Espace Utilisateur</a>
                    <a href="logout" class="btn btn-secondary"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty sessionScope.admin and empty sessionScope.utilisateur}">
            <div class="user-section">
                <p>Connectez-vous pour réserver vos billets et gérer vos voyages</p>
                <div class="auth-buttons">
                    <a href="loginUnique.jsp" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Connexion</a>
                    <a href="registerUser.jsp" class="btn btn-secondary"><i class="fas fa-user-plus"></i> Créer un compte</a>
                </div>
            </div>
        </c:if>

        <!-- Section recherche de trajets (accessible à tous) -->
        <section class="search-section">
            <h2><i class="fas fa-search"></i> Rechercher un trajet</h2>
            <p>Trouvez les meilleurs trajets en train en quelques clics</p>
            
            <form action="rechercheTrajet" method="post" class="search-form">
                <div class="form-group">
                    <label for="depart">Ville de départ</label>
                    <input type="text" id="depart" name="depart" placeholder="Ex: Paris" required>
                </div>
                
                <div class="form-group">
                    <label for="destination">Destination</label>
                    <input type="text" id="destination" name="destination" placeholder="Ex: Lyon" required>
                </div>
                
                <div class="form-group">
                    <label for="date">Date du voyage</label>
                    <input type="date" id="date" name="date" required>
                </div>
                
                <button type="submit" class="search-btn">
                    <i class="fas fa-search"></i> Rechercher
                </button>
            </form>
            
            <!-- Résultats de recherche (à afficher conditionnellement) -->
            <c:if test="${not empty trajets}">
                <div class="results">
                    <h3>Résultats de recherche</h3>
                    <table class="train-list">
                        <thead>
                            <tr>
                                <th>Départ</th>
                                <th>Destination</th>
                                <th>Date</th>
                                <th>Heure départ</th>
                                <th>Heure arrivée</th>
                                <th>Durée</th>
                                <th>Prix</th>
                                <th>Disponibilité</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${trajets}" var="trajet">
                                <tr>
                                    <td>${trajet.villeDepart}</td>
                                    <td>${trajet.villeArrivee}</td>
                                    <td>${trajet.dateVoyage}</td>
                                    <td>${trajet.heureDepart}</td>
                                    <td>${trajet.heureArrivee}</td>
                                    <td>${trajet.duree}</td>
                                    <td>${trajet.prix} €</td>
                                    <td class="${trajet.placesDisponibles > 20 ? 'available' : 'limited'}">
                                        ${trajet.placesDisponibles} places
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${empty sessionScope.utilisateur}">
                                                <a href="loginUnique.jsp?redirect=reservation&trajetId=${trajet.id}" class="reserve-btn">
                                                    Se connecter pour réserver
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="reservation?trajetId=${trajet.id}" class="reserve-btn">
                                                    Réserver
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </section>
    </div>
    
    <footer>
        <div class="container">
            <p>&copy; 2025 TrainExpress - Tous droits réservés</p>
        </div>
    </footer>

    <script>
        // Définir la date minimale au jour actuel pour le champ de date
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const yyyy = today.getFullYear();
            let mm = today.getMonth() + 1;
            let dd = today.getDate();
            
            if (dd < 10) dd = '0' + dd;
            if (mm < 10) mm = '0' + mm;
            
            const formattedToday = yyyy + '-' + mm + '-' + dd;
            document.getElementById('date').setAttribute('min', formattedToday);
            document.getElementById('date').value = formattedToday;
        });
    </script>
</body>
</html>