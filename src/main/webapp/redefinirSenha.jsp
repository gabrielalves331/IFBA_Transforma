<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .recovery-container {
            height: 100vh;
            display: flex;
        }
        /* Lado Esquerdo - Formulário de Recuperação */
        .recovery-form-side {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            background-color: #ffffff;
        }
        .recovery-box {
            width: 100%;
            max-width: 380px;
        }
        .recovery-box h2 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #000000;
            margin-bottom: 25px;
        }
        .instruction-text {
            font-size: 0.95rem;
            color: #333333;
            margin-bottom: 20px;
            line-height: 1.4;
        }
        .form-label {
            font-size: 0.85rem;
            color: #666666;
            margin-bottom: 5px;
        }
        .form-control {
            border: 1px solid #cccccc;
            border-radius: 6px;
            padding: 10px;
        }
        .form-control:focus {
            border-color: #195e3d;
            box-shadow: 0 0 0 0.2rem rgba(25, 94, 61, 0.25);
        }
        .btn-redefinir {
            background-color: #195e3d;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px;
            font-weight: 500;
            transition: background-color 0.2s;
        }
        .btn-redefinir:hover {
            background-color: #13472e;
            color: white;
        }
        .links-auxiliares {
            font-size: 0.85rem;
        }
        .links-auxiliares a {
            color: #333333;
            text-decoration: underline;
        }
        .links-auxiliares a:hover {
            color: #195e3d;
        }
        .btn-voltar {
            color: #000000;
            text-decoration: underline;
            font-size: 1rem;
            font-weight: 500;
        }
        .btn-voltar:hover {
            color: #195e3d;
        }
        /* Lado Direito - Painel Verde com a Logo */
        .recovery-logo-side {
            flex: 1;
            background-color: #195e3d;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        @media (max-width: 768px) {
            .recovery-logo-side {
                display: none;
            }
        }
        .logo-img {
            max-width: 65%;
            height: auto;
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <div class="recovery-container">
        
        <!-- LADO ESQUERDO: FORMULÁRIO -->
        <div class="recovery-form-side">
            <div class="recovery-box">
                <h2>Redefinir Senha</h2>
                
                <p class="instruction-text">
                    Informe o e-mail para qual deseja redefinir a sua senha.
                </p>

                <%-- Área pronta para mensagens de feedback futuras (Sucesso/Erro) --%>
                <% if (request.getParameter("enviado") != null) { %>
                    <div class="alert alert-success p-2" style="font-size: 0.85rem;" role="alert">
                        Se o e-mail existir no sistema, as instruções foram enviadas.
                    </div>
                <% } %>

                <form action="RedefinirSenhaServlet" method="POST">
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input 
                            type="email" 
                            id="email"
                            name="email" 
                            class="form-control" 
                            required
                        >
                    </div>
                    
                    <button type="submit" class="btn btn-redefinir w-100 mt-2">Redefinir Senha</button>
                    
                    <div class="text-end mt-2 links-auxiliares">
                        <a href="#">Tentar de outra forma</a>
                    </div>
                    
                    <div class="text-center mt-5">
                        <a href="login.jsp" class="btn-voltar">Voltar ao Login</a>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- LADO DIREITO: BANNER VERDE COM LOGO -->
        <div class="recovery-logo-side">
            <img 
                src="${pageContext.request.contextPath}/logoifbaTransforma.png" 
                alt="Logo IFBA Transforma" 
                class="logo-img"
            >
        </div>

    </div>

</body>
</html>