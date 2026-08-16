<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">

    <div class="recovery-container min-vh-100 d-flex flex-column flex-md-row">
        
        <!-- LADO ESQUERDO: FORMULÁRIO -->
        <div class="recovery-form-side d-flex align-items-center justify-content-center p-4 p-md-5 w-100 bg-white">
            <div class="w-100" style="max-width: 420px;">
                <h1 class="fw-bold text-dark mb-2" style="font-size: var(--fs-lg, 1.75rem);">Redefinir Senha</h1>
                
                <p class="text-muted mb-4 small">
                    Informe o e-mail para o qual deseja redefinir a sua senha.
                </p>

                <%-- Área de feedback (Sucesso/Erro) --%>
                <% if (request.getParameter("enviado") != null) { %>
                    <div class="alert alert-success p-3 mb-4 rounded-3 small border-0 shadow-sm" role="alert">
                        Se o e-mail existir no sistema, as instruções foram enviadas.
                    </div>
                <% } %>

                <form action="RedefinirSenhaServlet" method="POST">
                    <div class="mb-3">
                        <label for="email" class="form-label text-muted small fw-bold">E-mail</label>
                        <input 
                            type="email" 
                            id="email"
                            name="email" 
                            class="form-control" 
                            placeholder="seu.email@ifba.edu.br"
                            required
                            style="border: 1px solid var(--color-border); border-radius: var(--radius-md);"
                        >
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold mt-2" style="border-radius: var(--radius-md);">
                        Redefinir Senha
                    </button>
                    
                    <div class="d-flex justify-content-between align-items-center mt-3 pt-2">
                        <a href="#" class="small text-decoration-none text-muted">Tentar de outra forma</a>
                        <a href="login.jsp" class="small text-decoration-none fw-bold" style="color: var(--color-primary);">Voltar ao Login</a>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- LADO DIREITO: BANNER VERDE COM LOGO -->
        <div class="recovery-logo-side d-flex align-items-center justify-content-center p-4 p-md-5" style="background-color: var(--color-primary);">
            <img 
                src="${pageContext.request.contextPath}/logoifbaTransforma.png" 
                alt="Logo IFBA Transforma" 
                class="logo-img img-fluid"
                style="max-width: 240px; height: auto;"
            >
        </div>

    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>