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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>👥 Gestion des utilisateurs</title>
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

        .stat-icon.active {
            background-color: #4caf50;
            color: white;
        }

        .stat-icon.blocked {
            background-color: #f44336;
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

        .users-table {
            width: 100%;
            border-collapse: collapse;
        }

        .users-table th {
            background-color: var(--secondary-color);
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
            font-weight: 600;
            color: var(--text-color);
        }

        .users-table td {
            padding: 15px;
            border-bottom: 1px solid var(--medium-gray);
            vertical-align: middle;
        }

        .users-table tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        .users-table tr:hover {
            background-color: #e8f4ff;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-badge.active {
            background-color: #e8f5e8;
            color: #2e7d2e;
        }

        .status-badge.blocked {
            background-color: #ffebee;
            color: #c62828;
        }

        .status-badge i {
            margin-right: 5px;
        }

        .action-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            text-decoration: none;
        }

        .action-btn i {
            margin-right: 6px;
        }

        .btn-unblock {
            background-color: var(--success-color);
            color: white;
        }

        .btn-unblock:hover {
            background-color: #218838;
        }

        .btn-block {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-block:hover {
            background-color: #c82333;
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
        }

        .back-link:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .back-link i {
            margin-right: 8px;
        }

        .user-id {
            font-weight: 600;
            color: var(--primary-color);
        }

        .user-name {
            font-weight: 500;
        }

        .user-email {
            color: var(--dark-gray);
            font-size: 14px;
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
            
            .stats-summary {
                grid-template-columns: 1fr;
            }
            
            .users-table {
                font-size: 14px;
            }
            
            .users-table th,
            .users-table td {
                padding: 10px 8px;
            }
        }

        @media screen and (max-width: 768px) {
            .users-table th:nth-child(1),
            .users-table td:nth-child(1) {
                display: none;
            }
            
            .action-btn {
                padding: 6px 12px;
                font-size: 12px;
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
            <a href="adminUtilisateurs" class="menu-item active">
                <i class="fas fa-users"></i>
                <span>Utilisateurs</span>
            </a>
            <a href="adminTrains" class="menu-item">
                <i class="fas fa-train"></i>
                <span>Trains</span>
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
            <h1 class="page-title">
                <i class="fas fa-users"></i>
                Gestion des utilisateurs
            </h1>
            <p class="page-subtitle">Gérez les comptes utilisateurs et leurs statuts</p>
        </div>

        <!-- Statistics Summary -->
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

        <div class="stats-summary">
            <div class="stat-card">
                <div class="stat-icon total">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value"><%= total %></div>
                    <div class="stat-label">Total utilisateurs</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon active">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value"><%= actifs %></div>
                    <div class="stat-label">Comptes actifs</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon blocked">
                    <i class="fas fa-ban"></i>
                </div>
                <div class="stat-info">
                    <div class="stat-value"><%= bloques %></div>
                    <div class="stat-label">Comptes bloqués</div>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="content-section">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-list"></i>
                    Liste des utilisateurs
                </h2>
            </div>
            
            <table class="users-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Utilisateur</th>
                        <th>Email</th>
                        <th>Statut</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${utilisateurs}">
                        <tr>
                            <td>
                                <span class="user-id">#${u.id}</span>
                            </td>
                            <td>
                                <div class="user-name">${u.prenom} ${u.nom}</div>
                            </td>
                            <td>
                                <div class="user-email">${u.email}</div>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.bloque}">
                                        <span class="status-badge blocked">
                                            <i class="fas fa-ban"></i>
                                            Bloqué
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge active">
                                            <i class="fas fa-check-circle"></i>
                                            Actif
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <form method="post" action="adminUtilisateurs" style="display: inline;">
                                    <input type="hidden" name="id" value="${u.id}" />
                                    <input type="hidden" name="bloque" value="${!u.bloque}" />
                                    <button type="submit" class="action-btn ${u.bloque ? 'btn-unblock' : 'btn-block'}">
                                        <c:choose>
                                            <c:when test="${u.bloque}">
                                                <i class="fas fa-unlock"></i>
                                                Débloquer
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-ban"></i>
                                                Bloquer
                                            </c:otherwise>
                                        </c:choose>
                                    </button>
                                </form>
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