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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demandes d'annulation</title>
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
            margin-right: 15px;
            color: var(--primary-color);
        }

        .page-subtitle {
            color: var(--dark-gray);
            font-size: 16px;
        }

        .content-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            overflow: hidden;
        }

        .section-content {
            padding: 20px;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: var(--dark-gray);
        }

        .empty-state i {
            font-size: 48px;
            color: var(--medium-gray);
            margin-bottom: 15px;
        }

        .requests-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .requests-table th {
            background-color: var(--secondary-color);
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
            font-weight: 600;
            color: var(--text-color);
        }

        .requests-table td {
            padding: 15px;
            border-bottom: 1px solid var(--light-gray);
            vertical-align: middle;
        }

        .requests-table tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        .requests-table tr:hover {
            background-color: #e8f4ff;
        }

        .user-info {
            font-weight: 500;
        }

        .route-info {
            display: flex;
            align-items: center;
            font-weight: 500;
        }

        .route-arrow {
            margin: 0 8px;
            color: var(--primary-color);
        }

        .date-info {
            color: var(--dark-gray);
            font-size: 14px;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .btn-confirm {
            background-color: var(--success-color);
            color: white;
        }

        .btn-confirm:hover {
            background-color: #218838;
            transform: translateY(-1px);
        }

        .btn-reject {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-reject:hover {
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
        }

        .back-link:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .back-link i {
            margin-right: 8px;
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
                <div class="admin-name"><%= admin != null ? admin.getNom() : "Admin" %></div>
                <div class="admin-role">Administrateur</div>
            </div>
        </div>

        <nav class="sidebar-menu">
            <a href="admin.jsp" class="menu-item">
                <i class="fas fa-home"></i>
                <span>Tableau de bord</span>
            </a>
            <a href="adminBillet?action=lister" class="menu-item active">
                <i class="fas fa-clipboard-list"></i>
                <span>Demandes d'annulation</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-train"></i>
                <span>Gestion des trajets</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-users"></i>
                <span>Gestion utilisateurs</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fas fa-chart-bar"></i>
                <span>Statistiques</span>
            </a>
        </nav>

        <a href="loginAdmin.jsp" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span>Déconnexion</span>
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-clipboard-list"></i>
                Demandes d'annulation de billets
            </h1>
            <p class="page-subtitle">Gérer les demandes d'annulation en attente</p>
        </div>

        <div class="content-section">
            <div class="section-content">
                <c:if test="${empty billets}">
                    <div class="empty-state">
                        <i class="fas fa-inbox"></i>
                        <h3>Aucune demande d'annulation</h3>
                        <p>Il n'y a actuellement aucune demande d'annulation en attente.</p>
                    </div>
                </c:if>

                <c:if test="${not empty billets}">
                    <table class="requests-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Utilisateur</th>
                                <th>Trajet</th>
                                <th>Date réservation</th>
                                <th>Date départ</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="billet" items="${billets}">
                                <tr>
                                    <td><strong>#${billet.id}</strong></td>
                                    <td class="user-info">${billet.utilisateur.nom} ${billet.utilisateur.prenom}</td>
                                    <td class="route-info">
                                        ${billet.trajet.gareDepart}
                                        <i class="fas fa-arrow-right route-arrow"></i>
                                        ${billet.trajet.gareArrivee}
                                    </td>
                                    <td class="date-info">${billet.dateReservation}</td>
                                    <td class="date-info">${billet.trajet.dateDepart}</td>
                                    <td>
                                        <div class="actions">
                                            <a href="adminBillet?action=confirmer&id=${billet.id}" class="action-btn btn-confirm">
                                                <i class="fas fa-check"></i>
                                                Confirmer
                                            </a>
                                            <a href="adminBillet?action=refuser&id=${billet.id}" class="action-btn btn-reject">
                                                <i class="fas fa-times"></i>
                                                Refuser
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>

        <a href="admin.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Retour au tableau de bord
        </a>
    </div>
</body>
</html>