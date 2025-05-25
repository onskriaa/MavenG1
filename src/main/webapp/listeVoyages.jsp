<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Voyages</title>
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
            margin-bottom: 30px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
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

        .page-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--medium-gray);
            text-align: center;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 10px;
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

        .section-header {
            padding: 20px;
            border-bottom: 1px solid var(--light-gray);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: var(--secondary-color);
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            display: flex;
            align-items: center;
            color: var(--primary-color);
        }

        .section-title i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #005bb0;
        }

        .btn-success {
            background-color: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-warning {
            background-color: var(--warning-color);
            color: #212529;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .section-content {
            padding: 20px;
        }

        .train-list {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        .train-list th {
            background-color: var(--secondary-color);
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid var(--primary-color);
            font-weight: 600;
            color: var(--text-color);
            font-size: 14px;
        }

        .train-list td {
            padding: 15px;
            border-bottom: 1px solid var(--medium-gray);
            vertical-align: middle;
        }

        .train-list tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        .train-list tr:hover {
            background-color: #e8f4ff;
            transition: background-color 0.3s;
        }

        .id-cell {
            font-weight: 600;
            color: var(--primary-color);
            font-size: 16px;
        }

        .train-name {
            font-weight: 600;
            color: var(--text-color);
        }

        .destination {
            color: var(--accent-color);
            font-weight: 500;
        }

        .date {
            color: var(--success-color);
            font-weight: 500;
        }

        .price {
            font-weight: 600;
            color: var(--warning-color);
            font-size: 16px;
        }

        .places-badge {
            background-color: var(--info-color);
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            font-size: 12px;
            display: inline-block;
        }

        .actions {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: all 0.3s;
        }

        .edit-btn {
            background-color: var(--warning-color);
            color: #212529;
        }

        .edit-btn:hover {
            background-color: #e0a800;
            transform: translateY(-2px);
        }

        .delete-btn {
            background-color: var(--danger-color);
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }

        .no-data {
            text-align: center;
            padding: 40px 20px;
            color: var(--dark-gray);
            font-size: 16px;
        }

        .no-data-icon {
            font-size: 3rem;
            color: var(--medium-gray);
            margin-bottom: 15px;
            display: block;
        }

        .add-voyage-section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        .add-voyage-btn {
            background-color: var(--success-color);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 15px 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(40, 167, 69, 0.2);
        }

        .add-voyage-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
        }

        footer {
            background-color: white;
            padding: 20px 0;
            border-top: 1px solid var(--medium-gray);
            margin-top: 40px;
            text-align: center;
            color: var(--dark-gray);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .train-list th,
            .train-list td {
                padding: 8px;
                font-size: 12px;
            }
            
            .actions {
                flex-direction: column;
                gap: 4px;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .section-header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo">
                <i>🚆</i>
                <span>Système de Réservation</span>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="page-header">
            <h1 class="page-title">Liste des Voyages</h1>
            <p class="page-subtitle">Gérer tous les voyages disponibles</p>
        </div>

        <div class="add-voyage-section">
            <a href="ajouter-voyage.jsp" class="add-voyage-btn">
                ➕ Ajouter un nouveau voyage
            </a>
        </div>

        <div class="content-section">
            <div class="section-header">
                <div class="section-title">
                    <i>📋</i>
                    Voyages Disponibles
                </div>
            </div>
            <div class="section-content">
                <table class="train-list">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom du Train</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Prix</th>
                            <th>Places disponibles</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty voyages}">
                                <c:forEach var="voyage" items="${voyages}">
                                    <tr>
                                        <td class="id-cell">${voyage.id}</td>
                                        <td class="train-name">${voyage.nomTrain}</td>
                                        <td class="destination">${voyage.destination}</td>
                                        <td class="date">${voyage.dateVoyage}</td>
                                        <td class="price">${voyage.prix} €</td>
                                        <td>
                                            <span class="places-badge">
                                                ${voyage.placesDisponibles} Places disponibles
                                            </span>
                                        </td>
                                        <td class="actions">
                                            <a href="modifier-voyage.jsp?id=${voyage.id}" 
                                               class="action-btn edit-btn"
                                               title="Modifier">
                                                ✏️ Modifier
                                            </a>
                                            <button class="action-btn delete-btn" 
                                                    onclick="confirmerSuppression(${voyage.id})"
                                                    title="Supprimer">
                                                🗑️ Supprimer
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="no-data">
                                        <span class="no-data-icon">📭</span>
                                        Aucun voyage disponible pour le moment.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Système de Réservation de Trains. Tous droits réservés.</p>
    </footer>

    <script>
        function confirmerSuppression(id) {
            if (confirm('Êtes-vous sûr de vouloir supprimer ce voyage ?')) {
                // Redirection vers l'action de suppression
                location.href = 'supprimer-voyage?id=' + id;
            }
        }
    </script>
</body>
</html>