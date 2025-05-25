<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Gares</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .add-btn {
            background-color: var(--success-color);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 4px rgba(40, 167, 69, 0.2);
        }

        .add-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
        }

        .add-btn i {
            margin-right: 8px;
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

        .gares-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        .gares-table th {
            background-color: var(--secondary-color);
            color: var(--text-color);
            padding: 15px 20px;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid var(--primary-color);
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .gares-table td {
            padding: 15px 20px;
            border-bottom: 1px solid var(--light-gray);
            vertical-align: middle;
        }

        .gares-table tr:hover {
            background-color: rgba(0, 120, 215, 0.05);
        }

        .gares-table tr:nth-child(even) {
            background-color: rgba(245, 245, 245, 0.5);
        }

        .gares-table tr:nth-child(even):hover {
            background-color: rgba(0, 120, 215, 0.05);
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn i {
            margin-right: 5px;
            font-size: 12px;
        }

        .btn-edit {
            background-color: var(--warning-color);
            color: #212529;
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

        .gare-id {
            font-weight: 600;
            color: var(--primary-color);
        }

        .gare-name {
            font-weight: 600;
            color: var(--text-color);
        }

        .gare-city {
            color: var(--dark-gray);
            font-weight: 500;
        }

        .gare-address {
            color: var(--dark-gray);
            font-size: 14px;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--dark-gray);
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--medium-gray);
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: var(--text-color);
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

            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .gares-table {
                font-size: 14px;
            }

            .gares-table th,
            .gares-table td {
                padding: 10px 12px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 4px;
            }
        }

        @media screen and (max-width: 768px) {
            .gares-table,
            .gares-table thead,
            .gares-table tbody,
            .gares-table th,
            .gares-table td,
            .gares-table tr {
                display: block;
            }

            .gares-table thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            .gares-table tr {
                border: 1px solid var(--light-gray);
                margin-bottom: 10px;
                padding: 15px;
                border-radius: 8px;
                background-color: white;
            }

            .gares-table td {
                border: none;
                position: relative;
                padding: 8px 0 8px 120px;
                text-align: left;
            }

            .gares-table td:before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 110px;
                padding-right: 10px;
                white-space: nowrap;
                font-weight: 600;
                color: var(--primary-color);
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
                <i class="fas fa-user"></i>
            </div>
            <div class="admin-details">
                <div class="admin-name">Administrateur</div>
                <div class="admin-role">Gestion des Gares</div>
            </div>
        </div>
        
        <div class="sidebar-menu">
            <div class="menu-section-title">Navigation</div>
            <a href="#" class="menu-item active">
                <i class="fas fa-map-marker-alt"></i>
                <span>Gares</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-train"></i>
                <span>Trains</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-route"></i>
                <span>Itinéraires</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-users"></i>
                <span>Utilisateurs</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-chart-bar"></i>
                <span>Statistiques</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">Liste des Gares</h1>
                <p class="page-subtitle">Gérez toutes les gares du réseau ferroviaire</p>
            </div>
            <a href="gare?action=add" class="add-btn">
                <i class="fas fa-plus"></i>
                Ajouter une nouvelle gare
            </a>
        </div>

        <div class="content-section">
            <div class="section-header">
                <div class="section-title">
                    <i class="fas fa-list"></i>
                    Toutes les Gares
                </div>
            </div>
            
            <c:choose>
                <c:when test="${empty gares}">
                    <div class="empty-state">
                        <i class="fas fa-map-marker-alt"></i>
                        <h3>Aucune gare trouvée</h3>
                        <p>Commencez par ajouter votre première gare au système.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="gares-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom de la Gare</th>
                                <th>Ville</th>
                                <th>Adresse</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="gare" items="${gares}">
                                <tr>
                                    <td data-label="ID:" class="gare-id">${gare.id}</td>
                                    <td data-label="Nom:" class="gare-name">${gare.nom}</td>
                                    <td data-label="Ville:" class="gare-city">${gare.ville}</td>
                                    <td data-label="Adresse:" class="gare-address">${gare.adresse}</td>
                                    <td data-label="Actions:" class="action-buttons">
                                        <a href="gare?action=edit&id=${gare.id}" class="btn btn-edit">
                                            <i class="fas fa-edit"></i>
                                            Modifier
                                        </a>
                                        <a href="gare?action=delete&id=${gare.id}" 
                                           class="btn btn-delete" 
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette gare ?')">
                                            <i class="fas fa-trash"></i>
                                            Supprimer
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>