<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="auth-container">
        <!-- LADO ESQUERDO: FORMULÁRIO DE LOGIN -->
        <div class="auth-form-side">
            <div class="login-box">
                <h1 class="page-title mb-2">Faça seu login</h1>
                <p class="subtitulo mb-4">Acesse sua conta para gerenciar demandas e projetos.</p>
                
                <% if (request.getParameter("erro") != null) { %>
                    <div class="alert alert-danger p-3 mb-4 rounded-3 small border-0 shadow-sm" role="alert">
                        <strong>Acesso recusado:</strong> Usuário ou senha inválidos.
                    </div>
                <% } %>

                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail ou Usuário</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="seu.nome@ifba.edu.br" required>
                    </div>
                    
                    <div class="mb-2">
                        <label for="senha" class="form-label">Senha</label>
                        <input type="password" id="senha" name="senha" class="form-control" placeholder="Sua senha de acesso" required>
                    </div>
                    
                    <div class="text-end mb-4">
                        <a href="redefinirSenha.jsp" class="text-decoration-none small">Esqueceu a senha?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold mb-4">
                        Entrar no Sistema
                    </button>
                    
                    <div class="text-center text-muted small">
                        Não tem conta ainda? <a href="escolha_perfil.jsp" class="fw-bold text-decoration-none">Crie agora</a>
                    </div>
                </form>
            </div>
        </div>

        <!-- LADO DIREITO: LOGOTIPO -->
        <div class="auth-brand-side">
            <div class="logo-container">
                <img src="${pageContext.request.contextPath}/logo_semlegenda.png" alt="Logo IFBA Transforma" class="logo-img">
            </div>
        </div>
    </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>