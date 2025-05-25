<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> -->
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
        
        .auth-container {
            max-width: 500px;
            margin: 60px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        .auth-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .auth-header h2 {
            color: var(--primary-color);
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .auth-header p {
            color: var(--dark-gray);
        }
        
        .auth-form .form-group {
            margin-bottom: 20px;
        }
        
        .auth-form label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
        }
        
        .auth-form input[type="email"],
        .auth-form input[type="password"],
        .auth-form select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .auth-form input:focus,
        .auth-form select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(0, 120, 215, 0.2);
        }
        
        .auth-form .input-with-icon {
            position: relative;
        }
        
        .auth-form .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
        }
        
        .auth-form .input-with-icon input,
        .auth-form .input-with-icon select {
            padding-left: 45px;
        }
        
        .auth-form .submit-btn {
            width: 100%;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .auth-form .submit-btn:hover {
            background-color: #005bb0;
        }
        
        .auth-footer {
            margin-top: 25px;
            text-align: center;
            color: var(--dark-gray);
        }
        
        .auth-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .auth-footer a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            background-color: #ffebee;
            color: #d32f2f;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .error-message i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .back-link {
            display: flex;
            align-items: center;
            color: var(--dark-gray);
            text-decoration: none;
            font-weight: 500;
            margin-top: 15px;
        }
        
        .back-link:hover {
            color: var(--primary-color);
        }
        
        .back-link i {
            margin-right: 8px;
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
<title>Connexion TrainExpress</title>
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
                        <li><a href="index.jsp">Accueil</a></li>
                        <li><a href="horaires.jsp">Horaires</a></li>
                        <li><a href="tarifs.jsp">Tarifs</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="auth-container">
            <div class="auth-header">
                <h2><i class="fas fa-key"></i> Connexion</h2>
                <p>Accédez à votre compte pour réserver et gérer vos voyages</p>
            </div>
            
            <!-- Message d'erreur si connexion invalide -->
            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    ${error}
                </div>
            </c:if>
            
            <form method="post" action="login" class="auth-form">
                <div class="form-group">
                    <label for="email">Adresse email</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="nom@exemple.com" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Votre mot de passe" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="role">Se connecter en tant que</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user-tag"></i>
                        <select id="role" name="role" required>
                            <option value="utilisateur">Utilisateur</option>
                            <option value="admin">Administrateur</option>
                        </select>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">
                    <i class="fas fa-sign-in-alt"></i> Se connecter
                </button>
            </form>
            
            <div class="auth-footer">
                <p>Pas encore inscrit ? <a href="registerUser.jsp">Créer un compte utilisateur</a></p>
                <a href="index.jsp" class="back-link">
                    <i class="fas fa-arrow-left"></i> Retour à l'accueil
                </a>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="container">
            <p>&copy; 2025 TrainExpress - Tous droits réservés</p>
        </div>
    </footer>
</body>
</html>
