<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🚄 Liste des Trajets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-title {
            font-size: 26px;
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .page-title i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .page-subtitle {
            color: var(--dark-gray);
            font-size: 16px;
        }

        .add-btn {
            background-color: var(--success-color);
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .add-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .add-btn i {
            margin-right: 8px;
        }

        .stats-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
            display: flex;
            align-items: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-right: 15px;
        }

        .stat-icon.total {
            background-color: #7e57c2;
            color: white;
        }

        .stat-icon.routes {
            background-color: #2196f3;
            color: white;
        }

        .stat-icon.revenue {
            background-color: #ff9800;
            color: white;
        }

        .stat-info {
            flex: 1;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 2px;
        }

        .stat-label {
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

        .trajets-table {
            width: 100%;
            border-collapse: collapse;
        }

        .trajets-table th {
            background-color: var(--secondary-color);
            padding: 15px 12px;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
            font-weight: 600;
            color: var(--text-color);
            font-size: 14px;
        }

        .trajets-table td {
            padding: 15px 12px;
            border-bottom: 1px solid var(--medium-gray);
            vertical-align: middle;
            font-size: 14px;
        }

        .trajets-table tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        .trajets-table tr:hover {
            background-color: #e8f4ff;
        }

        .trajet-id {
            font-weight: 600;
            color: var(--primary-color);
        }

        .gare-info {
            display: flex;
            flex-direction: column;
        }

        .gare-name {
            font-weight: 500;
            margin-bottom: 2px;
        }

        .time-info {
            color: var(--dark-gray);
            font-size: 12px;
        }

        .route-info {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            color: var(--dark-gray);
        }

        .route-arrow {
            margin: 0 8px;
            color: var(--primary-color);
        }

        .price-badge {
            background-color: var(--success-color);
            color: white;
            padding: 4px 8px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 12px;
        }

        .duration-badge {
            background-color: var(--info-color);
            color: white;
            padding: 4px 8px;
            border-radius: 12px;
            font-weight: 500;
            font-size: 12px;
        }

        .date-info {
            font-weight: 500;
            color: var(--text-color);
        }

        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            text-decoration: none;
        }

        .action-btn i {
            margin-right: 4px;
        }

        .btn-edit {
            background-color: var(--warning-color);
            color: #333;
        }

        .btn-edit:hover {
            background-color: #e0a800;
            transform: translateY(-1px);
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-delete:hover {
            background-color: #c82333;
            transform: translateY(-1px);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            padding: 10px 20px;
            background-color: white;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            margin-top: 20px;
        }

        .back-link:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .back-link i {
            margin-right: 8px;
        }

        @media screen and (max-width: 1024px) {
            .sidebar {
                width: 70px;
            }
            
            .sidebar-logo span, 
            .admin-details, 
            .menu-item span {
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
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .stats-summary {
                grid-template-columns: 1fr;
            }
        }

        @media screen and (max-width: 768px) {
            .trajets-table {
                font-size: 12px;
            }
            
            .trajets-table th,
            .trajets-table td {
                padding: 10px 6px;
            }
            
            .trajets-table th:nth-child(1),
            .trajets-table td:nth-child(1),
            .trajets-table th:nth-child(4),
            .trajets-table td:nth-child(4) {
                display: none;
            }
            
            .actions {
                flex-direction: column;
                gap: 4px;
            }
            
            .action-btn {
                font-size: 11px;
                padding: 4px 8px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <i class="fas fa-train"></i>
                <span>RailAdmin</span>
            </div>
        </div>
        
        <div class="admin-info">
            <div class="admin-avatar">
                <i class="fas fa-user-shield"></i>
            </div>
            <div class="admin-details">
                <div class="admin-name"><%= admin.getPrenom() %> <%= admin.getNom() %></div>
                <div class="admin-role">Administrateur</div>
            </div>
        </div>
        
        <div class="sidebar-menu">
            <a href="admin.jsp" class="menu-item">
                <i class="fas fa-tachometer-alt"></i>
                <span>Tableau de bord</span>
            </a>
            <a href="adminUtilisateurs" class="menu-item">
                <i class="fas fa-users"></i>
                <span>Utilisateurs</span>
            </a>
            <a href="trajet" class="menu-item active">
                <i class="fas fa-route"></i>
                <span>Trajets</span>
            </a>
            <a href="adminReservations" class="menu-item">
                <i class="fas fa-ticket-alt"></i>
                <span>Réservations</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">
                    <i class="fas fa-route"></i>
                    Gestion des Trajets
                </h1>
                <p class="page-subtitle">Gérez les itinéraires et horaires des trains</p>
            </div>
            <a href="trajet?action=add" class="add-btn">
                <i class="fas fa-plus"></i>
                Ajouter un Trajet
            </a>
        </div>

        <!-- Statistics Summary -->
        <%
        java.util.List trajets = (java.util.List) request.getAttribute("trajets");
        int totalTrajets = trajets != null ? trajets.size() : 0;
        %>

        <div class="stats-summary">
            <div class="stat-card">
                <div class="stat-icon total">
                    <i class="fas fa-route"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value"><%= totalTrajets %></div>
                    <div class="stat-label">Total trajets</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon routes">
                    <i class="fas fa-map-marked-alt"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">Active</div>
                    <div class="stat-label">Lignes en service</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon revenue">
                    <i class="fas fa-euro-sign"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value">Revenus</div>
                    <div class="stat-label">Chiffre d'affaires</div>
                </div>
            </div>
        </div>

        <!-- Trajets Table -->
        <div class="content-section">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-list"></i>
                    Liste des Trajets
                </h2>
            </div>
            
            <table class="trajets-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Itinéraire</th>
                        <th>Horaires</th>
                        <th>Durée</th>
                        <th>Prix</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="trajet" items="${trajets}">
                        <tr>
                            <td>
                                <span class="trajet-id">#${trajet.id}</span>
                            </td>
                            <td>
                                <div class="gare-info">
                                    <div class="route-info">
                                        <span class="gare-name">${trajet.gareDepart}</span>
                                        <i class="fas fa-arrow-right route-arrow"></i>
                                        <span class="gare-name">${trajet.gareArrivee}</span>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="gare-info">
                                    <div class="time-info">
                                        <i class="fas fa-play"></i> Départ: ${trajet.heureDepart}
                                    </div>
                                    <div class="time-info">
                                        <i class="fas fa-stop"></i> Arrivée: ${trajet.heureArrivee}
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="duration-badge">
                                    <i class="fas fa-clock"></i> ${trajet.duree} min
                                </span>
                            </td>
                            <td>
                                <span class="price-badge">
                                    ${trajet.prix} €
                                </span>
                            </td>
                            <td>
                                <div class="date-info">
                                    <i class="fas fa-calendar"></i> ${trajet.dateDepart}
                                </div>
                            </td>
                            <td>
                                <div class="actions">
                                    <a href="trajet?action=edit&id=${trajet.id}" class="action-btn btn-edit">
                                        <i class="fas fa-edit"></i>
                                        Modifier
                                    </a>
                                    <a href="trajet?action=delete&id=${trajet.id}" 
                                       class="action-btn btn-delete"
                                       onclick="return confirm('Confirmer la suppression ?');">
                                        <i class="fas fa-trash"></i>
                                        Supprimer
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Back Link -->
        <a href="admin.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Retour au tableau de bord
        </a>
    </div>
</body>
</html>