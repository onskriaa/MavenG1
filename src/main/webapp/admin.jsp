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
    <title>Tableau de bord - Administrateur</title>
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
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
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
            min-height: 100vh;
            display: flex;
        }
        
        .sidebar {
            width: 280px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
            transition: all 0.3s ease;
        }
        
        .sidebar-header {
            padding: 20px;
            text-align: center;
            background-color: #1a2530;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin-bottom: 15px;
        }
        
        .sidebar-logo i {
            margin-right: 10px;
            font-size: 28px;
        }
        
        .admin-info {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .admin-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-right: 15px;
        }
        
        .admin-details {
            flex: 1;
        }
        
        .admin-name {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 2px;
        }
        
        .admin-role {
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }
        
        .sidebar-menu {
            padding: 10px 0;
        }
        
        .menu-section {
            margin-bottom: 10px;
        }
        
        .menu-section-title {
            padding: 10px 20px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: rgba(255, 255, 255, 0.6);
            font-weight: 600;
        }
        
        .menu-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .menu-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-left-color: var(--primary-color);
        }
        
        .menu-item.active {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-left-color: var(--primary-color);
        }
        
        .menu-item i {
            margin-right: 15px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }
        
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 20px;
            transition: all 0.3s ease;
        }
        
        .page-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--medium-gray);
        }
        
        .page-title {
            font-size: 26px;
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 5px;
        }
        
        .page-subtitle {
            color: var(--dark-gray);
            font-size: 16px;
        }
        
        .dashboard-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .summary-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
            display: flex;
            align-items: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .summary-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-right: 20px;
        }
        
        .card-icon.purple {
            background-color: #7e57c2;
            color: white;
        }
        
        .card-icon.blue {
            background-color: #2196f3;
            color: white;
        }
        
        .card-icon.green {
            background-color: #4caf50;
            color: white;
        }
        
        .card-icon.orange {
            background-color: #ff9800;
            color: white;
        }
        
        .card-info {
            flex: 1;
        }
        
        .card-value {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .card-label {
            color: var(--dark-gray);
            font-size: 14px;
        }
        
        .content-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            overflow: hidden;
        }
        
        .section-header {
            padding: 20px;
            border-bottom: 1px solid var(--light-gray);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            display: flex;
            align-items: center;
        }
        
        .section-title i {
            margin-right: 10px;
            color: var(--primary-color);
        }
        
        .section-content {
            padding: 20px;
        }
        
        .management-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }
        
        .management-item {
            background-color: var(--light-gray);
            border-radius: 8px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--text-color);
            min-height: 160px;
        }
        
        .management-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: var(--secondary-color);
        }
        
        .management-icon {
            font-size: 36px;
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .management-title {
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 8px;
        }
        
        .management-description {
            color: var(--dark-gray);
            font-size: 14px;
        }
        
        .user-management-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }
        
        .user-management-item {
            background-color: white;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--text-color);
        }
        
        .user-management-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-color: var(--primary-color);
        }
        
        .user-management-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
            background-color: var(--secondary-color);
            color: var(--primary-color);
        }
        
        .user-management-title {
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 8px;
        }
        
        .user-management-description {
            color: var(--dark-gray);
            font-size: 14px;
        }
        
        .logout-btn {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 4px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
            width: 80%;
        }
        
        .logout-btn:hover {
            background-color: var(--danger-color);
        }
        
        .logout-btn i {
            margin-right: 10px;
        }
        
        @media screen and (max-width: 1024px) {
            .sidebar {
                width: 70px;
            }
            
            .sidebar-logo span, 
            .admin-details, 
            .menu-item span, 
            .menu-section-title {
                display: none;
            }
            
            .sidebar-logo {
                justify-content: center;
            }
            
            .sidebar-logo i {
                margin-right: 0;
            }
            
            .admin-avatar {
                margin-right: 0;
            }
            
            .menu-item {
                justify-content: center;
                padding: 15px;
            }
            
            .menu-item i {
                margin-right: 0;
                font-size: 20px;
            }
            
            .main-content {
                margin-left: 70px;
            }
            
            .logout-btn span {
                display: none;
            }
            
            .logout-btn i {
                margin-right: 0;
            }
        }
    </style>
</head>

<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <i class="fas fa-train"></i>
                <span>TrainExpress</span>
            </div>
        </div>
        
        <div class="admin-info">
            <div class="admin-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="admin-details">
                <div class="admin-name">${admin.prenom} ${admin.nom}</div>
                <div class="admin-role">Administrateur</div>
            </div>
        </div>
        
        <div class="sidebar-menu">
            <div class="menu-section">
                <div class="menu-section-title">Tableau de bord</div>
                <a href="admin.jsp" class="menu-item active">
                    <i class="fas fa-home"></i>
                    <span>Accueil</span>
                </a>
            </div>
            
            <div class="menu-section">
                <div class="menu-section-title">Gestion</div>
                <a href="gare" class="menu-item">
                    <i class="fas fa-building"></i>
                    <span>Gérer les Gares</span>
                </a>
                <a href="voyage" class="menu-item">
                    <i class="fas fa-route"></i>
                    <span>Gérer les Voyages</span>
                </a>
                <a href="trajet" class="menu-item">
                    <i class="fas fa-map-marked-alt"></i>
                    <span>Gérer les Trajets</span>
                </a>
                <a href="listeTrajets" class="menu-item">
                    <i class="fas fa-list-alt"></i>
                    <span>Liste des Trajets</span>
                </a>
            </div>
            
            <div class="menu-section">
                <div class="menu-section-title">Utilisateurs</div>
                <a href="adminUtilisateurs" class="menu-item">
                    <i class="fas fa-users"></i>
                    <span>Gérer les Utilisateurs</span>
                </a>
                <a href="adminBillet" class="menu-item">
                    <i class="fas fa-ticket-alt"></i>
                    <span>Demandes d'annulation</span>
                </a>
            </div>
            
            <div class="menu-section">
                <div class="menu-section-title">Mon compte</div>
                <a href="profilAdmin.jsp" class="menu-item">
                    <i class="fas fa-user-circle"></i>
                    <span>Voir mon profil</span>
                </a>
            </div>
        </div>
        
        <a href="logout" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span>Déconnexion</span>
        </a>
    </div>
    
    <div class="main-content">
        <div class="page-header">
            <h1 class="page-title">Tableau de bord administrateur</h1>
            <div class="page-subtitle">Bienvenue, ${admin.prenom} ${admin.nom}. Gérez votre système de réservation de train depuis cette interface.</div>
        </div>
        
        <div class="dashboard-summary">
            <div class="summary-card">
                <div class="card-icon blue">
                    <i class="fas fa-train"></i>
                </div>
                <div class="card-info">
                    <div class="card-value" id="totalTrains">--</div>
                    <div class="card-label">Trains actifs</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="card-icon green">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <div class="card-info">
                    <div class="card-value" id="totalReservations">--</div>
                    <div class="card-label">Réservations</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="card-icon purple">
                    <i class="fas fa-users"></i>
                </div>
                <div class="card-info">
                    <div class="card-value" id="totalUsers">--</div>
                    <div class="card-label">Utilisateurs</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="card-icon orange">
                    <i class="fas fa-exchange-alt"></i>
                </div>
                <div class="card-info">
                    <div class="card-value" id="totalCancellations">--</div>
                    <div class="card-label">Demandes d'annulation</div>
                </div>
            </div>
        </div>
        
        <div class="content-section">
            <div class="section-header">
                <div class="section-title">
                    <i class="fas fa-cogs"></i>
                    Gestion du système
                </div>
            </div>
            <div class="section-content">
                <div class="management-grid">
                    <a href="gare" class="management-item">
                        <div class="management-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="management-title">Gérer les Gares</div>
                        <div class="management-description">Ajout, modification et suppression des gares</div>
                    </a>
                    
                    <a href="voyage" class="management-item">
                        <div class="management-icon">
                            <i class="fas fa-route"></i>
                        </div>
                        <div class="management-title">Gérer les Voyages</div>
                        <div class="management-description">Configuration des itinéraires et des horaires</div>
                    </a>
                    
                    <a href="trajet" class="management-item">
                        <div class="management-icon">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <div class="management-title">Gérer les Trajets</div>
                        <div class="management-description">Planification et modification des trajets</div>
                    </a>
                    
                    <a href="listeTrajets" class="management-item">
                        <div class="management-icon">
                            <i class="fas fa-list-alt"></i>
                        </div>
                        <div class="management-title">Liste des Trajets</div>
                        <div class="management-description">Consultation des trajets (lecture seule)</div>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="content-section">
            <div class="section-header">
                <div class="section-title">
                    <i class="fas fa-user-shield"></i>
                    Gestion des utilisateurs
                </div>
            </div>
            <div class="section-content">
                <div class="user-management-grid">
                    <a href="adminUtilisateurs" class="user-management-item">
                        <div class="user-management-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="user-management-title">Gérer les Utilisateurs</div>
                        <div class="user-management-description">Administration des comptes utilisateurs</div>
                    </a>
                    
                    <a href="adminBillet" class="user-management-item">
                        <div class="user-management-icon">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <div class="user-management-title">Demandes d'annulation</div>
                        <div class="user-management-description">Traitement des demandes d'annulation de billets</div>
                    </a>
                    
                    <a href="profilAdmin.jsp" class="user-management-item">
                        <div class="user-management-icon">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <div class="user-management-title">Mon profil</div>
                        <div class="user-management-description">Consulter et modifier vos informations</div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
  
</body>
</html>